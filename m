Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F25C978289
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 06:05:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5F65fec015630
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jun 2017 23:05:41 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Jun 2017 23:05:40 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Jun 2017 14:05:02 +0800
Message-ID: <1497506702-180724-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mercurial: CVE-2017-9462
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Jun 2017 06:05:44 -0000
Content-Type: text/plain

Backport the CVE patch from
https://www.mercurial-scm.org/repo/hg/rev/77eaf9539499

"hg serve --stdio" allows remote authenticated users to launch the
Python debugger, and consequently execute arbitrary code, by using
 --debugger as a repository name.

CVE: CVE-2017-9462

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../mercurial/files/mercurial-CVE-2017-9462.patch  | 135 +++++++++++++++++++++
 .../mercurial/mercurial-native_4.0.1.bb            |   4 +-
 2 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/mercurial/files/mercurial-CVE-2017-9462.patch

diff --git a/meta-oe/recipes-devtools/mercurial/files/mercurial-CVE-2017-9462.patch b/meta-oe/recipes-devtools/mercurial/files/mercurial-CVE-2017-9462.patch
new file mode 100644
index 0000000..3564661
--- /dev/null
+++ b/meta-oe/recipes-devtools/mercurial/files/mercurial-CVE-2017-9462.patch
@@ -0,0 +1,135 @@
+# HG changeset patch
+# User Augie Fackler <augie@google.com>
+# Date 1492021435 25200
+#      Wed Apr 12 11:23:55 2017 -0700
+# Branch stable
+# Node ID 77eaf9539499a1b8be259ffe7ada787d07857f80
+# Parent  68f263f52d2e3e2798b4f1e55cb665c6b043f93b
+dispatch: protect against malicious 'hg serve --stdio' invocations (sec)
+
+Some shared-ssh installations assume that 'hg serve --stdio' is a safe
+command to run for minimally trusted users. Unfortunately, the messy
+implementation of argument parsing here meant that trying to access a
+repo named '--debugger' would give the user a pdb prompt, thereby
+sidestepping any hoped-for sandboxing. Serving repositories over HTTP(S)
+is unaffected.
+
+We're not currently hardening any subcommands other than 'serve'. If
+your service exposes other commands to users with arbitrary repository
+names, it is imperative that you defend against repository names of
+'--debugger' and anything starting with '--config'.
+
+The read-only mode of hg-ssh stopped working because it provided its hook
+configuration to "hg serve --stdio" via --config parameter. This is banned for
+security reasons now. This patch switches it to directly call ui.setconfig().
+If your custom hosting infrastructure relies on passing --config to
+"hg serve --stdio", you'll need to find a different way to get that configuration
+into Mercurial, either by using ui.setconfig() as hg-ssh does in this patch,
+or by placing an hgrc file someplace where Mercurial will read it.
+
+mitrandir@fb.com provided some extra fixes for the dispatch code and
+for hg-ssh in places that I overlooked.
+
+CVE: CVE-2017-9462
+
+Upstream-Status: Backport
+
+diff --git a/contrib/hg-ssh b/contrib/hg-ssh
+--- a/contrib/hg-ssh
++++ b/contrib/hg-ssh
+@@ -32,7 +32,7 @@
+ # enable importing on demand to reduce startup time
+ from mercurial import demandimport; demandimport.enable()
+ 
+-from mercurial import dispatch
++from mercurial import dispatch, ui as uimod
+ 
+ import sys, os, shlex
+ 
+@@ -61,14 +61,15 @@
+         repo = os.path.normpath(os.path.join(cwd, os.path.expanduser(path)))
+         if repo in allowed_paths:
+             cmd = ['-R', repo, 'serve', '--stdio']
++            req = dispatch.request(cmd)
+             if readonly:
+-                cmd += [
+-                    '--config',
+-                    'hooks.pretxnopen.hg-ssh=python:__main__.rejectpush',
+-                    '--config',
+-                    'hooks.prepushkey.hg-ssh=python:__main__.rejectpush'
+-                    ]
+-            dispatch.dispatch(dispatch.request(cmd))
++                if not req.ui:
++                    req.ui = uimod.ui.load()
++                req.ui.setconfig('hooks', 'pretxnopen.hg-ssh',
++                                 'python:__main__.rejectpush', 'hg-ssh')
++                req.ui.setconfig('hooks', 'prepushkey.hg-ssh',
++                                 'python:__main__.rejectpush', 'hg-ssh')
++            dispatch.dispatch(req)
+         else:
+             sys.stderr.write('Illegal repository "%s"\n' % repo)
+             sys.exit(255)
+diff --git a/mercurial/dispatch.py b/mercurial/dispatch.py
+--- a/mercurial/dispatch.py
++++ b/mercurial/dispatch.py
+@@ -155,6 +155,37 @@
+         pass # happens if called in a thread
+ 
+     def _runcatchfunc():
++        realcmd = None
++        try:
++            cmdargs = fancyopts.fancyopts(req.args[:], commands.globalopts, {})
++            cmd = cmdargs[0]
++            aliases, entry = cmdutil.findcmd(cmd, commands.table, False)
++            realcmd = aliases[0]
++        except (error.UnknownCommand, error.AmbiguousCommand,
++                IndexError, getopt.GetoptError):
++            # Don't handle this here. We know the command is
++            # invalid, but all we're worried about for now is that
++            # it's not a command that server operators expect to
++            # be safe to offer to users in a sandbox.
++            pass
++        if realcmd == 'serve' and '--stdio' in cmdargs:
++            # We want to constrain 'hg serve --stdio' instances pretty
++            # closely, as many shared-ssh access tools want to grant
++            # access to run *only* 'hg -R $repo serve --stdio'. We
++            # restrict to exactly that set of arguments, and prohibit
++            # any repo name that starts with '--' to prevent
++            # shenanigans wherein a user does something like pass
++            # --debugger or --config=ui.debugger=1 as a repo
++            # name. This used to actually run the debugger.
++            if (len(req.args) != 4 or
++                req.args[0] != '-R' or
++                req.args[1].startswith('--') or
++                req.args[2] != 'serve' or
++                req.args[3] != '--stdio'):
++                raise error.Abort(
++                    _('potentially unsafe serve --stdio invocation: %r') %
++                    (req.args,))
++
+         try:
+             debugger = 'pdb'
+             debugtrace = {
+diff --git a/tests/test-ssh.t b/tests/test-ssh.t
+--- a/tests/test-ssh.t
++++ b/tests/test-ssh.t
+@@ -357,6 +357,19 @@
+   abort: destination 'a repo' is not empty
+   [255]
+ 
++Make sure hg is really paranoid in serve --stdio mode. It used to be
++possible to get a debugger REPL by specifying a repo named --debugger.
++  $ hg -R --debugger serve --stdio
++  abort: potentially unsafe serve --stdio invocation: ['-R', '--debugger', 'serve', '--stdio']
++  [255]
++  $ hg -R --config=ui.debugger=yes serve --stdio
++  abort: potentially unsafe serve --stdio invocation: ['-R', '--config=ui.debugger=yes', 'serve', '--stdio']
++  [255]
++Abbreviations of 'serve' also don't work, to avoid shenanigans.
++  $ hg -R narf serv --stdio
++  abort: potentially unsafe serve --stdio invocation: ['-R', 'narf', 'serv', '--stdio']
++  [255]
++
+ Test hg-ssh using a helper script that will restore PYTHONPATH (which might
+ have been cleared by a hg.exe wrapper) and invoke hg-ssh with the right
+ parameters:
diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_4.0.1.bb b/meta-oe/recipes-devtools/mercurial/mercurial-native_4.0.1.bb
index 028bb42..a08acd9 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial-native_4.0.1.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial-native_4.0.1.bb
@@ -5,7 +5,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "python-native"
 
-SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
+SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz \
+           file://mercurial-CVE-2017-9462.patch \
+"
 SRC_URI[md5sum] = "22a9b1d7c0c06a53f0ae5b386d536d08"
 SRC_URI[sha256sum] = "6aa4ade93c1b5e11937820880a466ebf1c824086d443cd799fc46e2617250d40"
 
-- 
1.9.1


