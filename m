Return-Path: <pbarker@toganlabs.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5F0A8782D3
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Nov 2017 22:08:19 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id o44so6890442wrf.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Nov 2017 14:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=16n1YschIqbOElRiXlvomxQcFpdIyDa5l5eCV9HEFHQ=;
	b=mE7DG5OeUjsjqwsvwtnOVCXws4sz2x0Ghh/74uZWmbmn/rSMNTQ8YGLjnFAhoBIHT0
	R3LUycyc5MvbK+HyD8QnFld87qF7U/IIUS7j7wIUxhGVKdgAMZiobCe78dBAmwyuqF3C
	5KESgXhzBUw3LphHmX5po5Kz5B+ZofuUCHGlVxuiNJPSQ/WdeL5koL9PMUjej0Xhy2rv
	IPDHDmBj7SA26purxbH8o0uII4yqcU1U8YtVsig67ZGP37vZ5sysuTTJTiMUFceQhkj0
	b1F6TdRdAQlPTgYkUgfWFFIzEQCgmf/On2rEBAD1MoseXPG7LyY7aGtteINmVYFzOfVO
	vAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=16n1YschIqbOElRiXlvomxQcFpdIyDa5l5eCV9HEFHQ=;
	b=NDQ3ehqeYUhAlB+yvjiiJQEWFhgQvsNG9xHXIGW8F7oZaHK1OFe7MAAzIKFWcScPSa
	2lhKdoqNSQH24jP7ePUV5QZ9FRJe7eesbTYZCHIPI4pEGCsGSQlpRQwQ2ZwT7pN5Pb1k
	tbMxrXwLYNkBFvcCwna0bqgnrzKd83X3i+mmsV0Xbh//e4EDQE1Vb/XxyFnaTJBPH7Iz
	90iPMVTmQSkQHxODlF5d+lc21LiYoE5PMiFMpvNsT5BtQi57PbblE8GHQSva1cxn3m/E
	obsHCqQOVAqcXmOICNT5IlmuOlmUDaoaGjRcHeeM1cWT8lh1Cu1gmAluFuvcfsYbrAt+
	v7DA==
X-Gm-Message-State: AMCzsaV2CoVWEJbZEvL70t2aXCUrOLoiDUy4hfU26U4LmFDw/lX/ylKs
	2oUk5CMksWzk6ueS0NLyGqKdJi0A
X-Google-Smtp-Source: ABhQp+TxMRJ+i+RHeQSid1prIPtLVclCQaqnt1R+8r/PhhoqUEuDHiL97S4XYZBJOcSeDuh7T9sFpQ==
X-Received: by 10.223.158.145 with SMTP id a17mr11975182wrf.47.1509919699977; 
	Sun, 05 Nov 2017 14:08:19 -0800 (PST)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	q124sm13845688wmg.18.2017.11.05.14.08.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Nov 2017 14:08:19 -0800 (PST)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Nov 2017 22:07:26 +0000
Message-Id: <1509919652-31388-3-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
References: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
Subject: [meta-oe][PATCH 2/8] mercurial: Update to v4.4
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
X-List-Received-Date: Sun, 05 Nov 2017 22:08:20 -0000

This update addresses the following CVEs:
- CVE-2017-1000116
- CVE-2017-1000115

We can also drop the patch for CVE-2017-9462 as it's incorporated into this
release.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 .../mercurial/files/mercurial-CVE-2017-9462.patch  | 135 ---------------------
 ...ial-native_4.0.1.bb => mercurial-native_4.4.bb} |   8 +-
 2 files changed, 3 insertions(+), 140 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/mercurial/files/mercurial-CVE-2017-9462.patch
 rename meta-oe/recipes-devtools/mercurial/{mercurial-native_4.0.1.bb => mercurial-native_4.4.bb} (69%)

diff --git a/meta-oe/recipes-devtools/mercurial/files/mercurial-CVE-2017-9462.patch b/meta-oe/recipes-devtools/mercurial/files/mercurial-CVE-2017-9462.patch
deleted file mode 100644
index 3564661..0000000
--- a/meta-oe/recipes-devtools/mercurial/files/mercurial-CVE-2017-9462.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-# HG changeset patch
-# User Augie Fackler <augie@google.com>
-# Date 1492021435 25200
-#      Wed Apr 12 11:23:55 2017 -0700
-# Branch stable
-# Node ID 77eaf9539499a1b8be259ffe7ada787d07857f80
-# Parent  68f263f52d2e3e2798b4f1e55cb665c6b043f93b
-dispatch: protect against malicious 'hg serve --stdio' invocations (sec)
-
-Some shared-ssh installations assume that 'hg serve --stdio' is a safe
-command to run for minimally trusted users. Unfortunately, the messy
-implementation of argument parsing here meant that trying to access a
-repo named '--debugger' would give the user a pdb prompt, thereby
-sidestepping any hoped-for sandboxing. Serving repositories over HTTP(S)
-is unaffected.
-
-We're not currently hardening any subcommands other than 'serve'. If
-your service exposes other commands to users with arbitrary repository
-names, it is imperative that you defend against repository names of
-'--debugger' and anything starting with '--config'.
-
-The read-only mode of hg-ssh stopped working because it provided its hook
-configuration to "hg serve --stdio" via --config parameter. This is banned for
-security reasons now. This patch switches it to directly call ui.setconfig().
-If your custom hosting infrastructure relies on passing --config to
-"hg serve --stdio", you'll need to find a different way to get that configuration
-into Mercurial, either by using ui.setconfig() as hg-ssh does in this patch,
-or by placing an hgrc file someplace where Mercurial will read it.
-
-mitrandir@fb.com provided some extra fixes for the dispatch code and
-for hg-ssh in places that I overlooked.
-
-CVE: CVE-2017-9462
-
-Upstream-Status: Backport
-
-diff --git a/contrib/hg-ssh b/contrib/hg-ssh
---- a/contrib/hg-ssh
-+++ b/contrib/hg-ssh
-@@ -32,7 +32,7 @@
- # enable importing on demand to reduce startup time
- from mercurial import demandimport; demandimport.enable()
- 
--from mercurial import dispatch
-+from mercurial import dispatch, ui as uimod
- 
- import sys, os, shlex
- 
-@@ -61,14 +61,15 @@
-         repo = os.path.normpath(os.path.join(cwd, os.path.expanduser(path)))
-         if repo in allowed_paths:
-             cmd = ['-R', repo, 'serve', '--stdio']
-+            req = dispatch.request(cmd)
-             if readonly:
--                cmd += [
--                    '--config',
--                    'hooks.pretxnopen.hg-ssh=python:__main__.rejectpush',
--                    '--config',
--                    'hooks.prepushkey.hg-ssh=python:__main__.rejectpush'
--                    ]
--            dispatch.dispatch(dispatch.request(cmd))
-+                if not req.ui:
-+                    req.ui = uimod.ui.load()
-+                req.ui.setconfig('hooks', 'pretxnopen.hg-ssh',
-+                                 'python:__main__.rejectpush', 'hg-ssh')
-+                req.ui.setconfig('hooks', 'prepushkey.hg-ssh',
-+                                 'python:__main__.rejectpush', 'hg-ssh')
-+            dispatch.dispatch(req)
-         else:
-             sys.stderr.write('Illegal repository "%s"\n' % repo)
-             sys.exit(255)
-diff --git a/mercurial/dispatch.py b/mercurial/dispatch.py
---- a/mercurial/dispatch.py
-+++ b/mercurial/dispatch.py
-@@ -155,6 +155,37 @@
-         pass # happens if called in a thread
- 
-     def _runcatchfunc():
-+        realcmd = None
-+        try:
-+            cmdargs = fancyopts.fancyopts(req.args[:], commands.globalopts, {})
-+            cmd = cmdargs[0]
-+            aliases, entry = cmdutil.findcmd(cmd, commands.table, False)
-+            realcmd = aliases[0]
-+        except (error.UnknownCommand, error.AmbiguousCommand,
-+                IndexError, getopt.GetoptError):
-+            # Don't handle this here. We know the command is
-+            # invalid, but all we're worried about for now is that
-+            # it's not a command that server operators expect to
-+            # be safe to offer to users in a sandbox.
-+            pass
-+        if realcmd == 'serve' and '--stdio' in cmdargs:
-+            # We want to constrain 'hg serve --stdio' instances pretty
-+            # closely, as many shared-ssh access tools want to grant
-+            # access to run *only* 'hg -R $repo serve --stdio'. We
-+            # restrict to exactly that set of arguments, and prohibit
-+            # any repo name that starts with '--' to prevent
-+            # shenanigans wherein a user does something like pass
-+            # --debugger or --config=ui.debugger=1 as a repo
-+            # name. This used to actually run the debugger.
-+            if (len(req.args) != 4 or
-+                req.args[0] != '-R' or
-+                req.args[1].startswith('--') or
-+                req.args[2] != 'serve' or
-+                req.args[3] != '--stdio'):
-+                raise error.Abort(
-+                    _('potentially unsafe serve --stdio invocation: %r') %
-+                    (req.args,))
-+
-         try:
-             debugger = 'pdb'
-             debugtrace = {
-diff --git a/tests/test-ssh.t b/tests/test-ssh.t
---- a/tests/test-ssh.t
-+++ b/tests/test-ssh.t
-@@ -357,6 +357,19 @@
-   abort: destination 'a repo' is not empty
-   [255]
- 
-+Make sure hg is really paranoid in serve --stdio mode. It used to be
-+possible to get a debugger REPL by specifying a repo named --debugger.
-+  $ hg -R --debugger serve --stdio
-+  abort: potentially unsafe serve --stdio invocation: ['-R', '--debugger', 'serve', '--stdio']
-+  [255]
-+  $ hg -R --config=ui.debugger=yes serve --stdio
-+  abort: potentially unsafe serve --stdio invocation: ['-R', '--config=ui.debugger=yes', 'serve', '--stdio']
-+  [255]
-+Abbreviations of 'serve' also don't work, to avoid shenanigans.
-+  $ hg -R narf serv --stdio
-+  abort: potentially unsafe serve --stdio invocation: ['-R', 'narf', 'serv', '--stdio']
-+  [255]
-+
- Test hg-ssh using a helper script that will restore PYTHONPATH (which might
- have been cleared by a hg.exe wrapper) and invoke hg-ssh with the right
- parameters:
diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_4.0.1.bb b/meta-oe/recipes-devtools/mercurial/mercurial-native_4.4.bb
similarity index 69%
rename from meta-oe/recipes-devtools/mercurial/mercurial-native_4.0.1.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial-native_4.4.bb
index a08acd9..693d4e4 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial-native_4.0.1.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial-native_4.4.bb
@@ -5,11 +5,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "python-native"
 
-SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz \
-           file://mercurial-CVE-2017-9462.patch \
-"
-SRC_URI[md5sum] = "22a9b1d7c0c06a53f0ae5b386d536d08"
-SRC_URI[sha256sum] = "6aa4ade93c1b5e11937820880a466ebf1c824086d443cd799fc46e2617250d40"
+SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
+SRC_URI[md5sum] = "c1d9fad1b7ed7077b0d4ae82e71154db"
+SRC_URI[sha256sum] = "234af4a67565c85923b0a1910c704ab44bcf12f69b85532687208776563d87de"
 
 S = "${WORKDIR}/mercurial-${PV}"
 
-- 
2.7.4


