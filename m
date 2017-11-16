Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 04D757877C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 02:19:19 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id 4so10557269pge.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 18:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=rMvOwiPglWDNQYeHFo67aL7mzHq5U60Sku7XaGrRqpM=;
	b=q+XRjOgJmj4TqRpETbehoYnpgser87NEQ/TF4/RMZ8h/Ut6WJsJJHC8axWqzKGZJjH
	sBIm/WTu27EnqkaoEThWR/Smh/CuSgHSecIfhT71YkNSGJl4gNiVJGtdfMU2bhKaJdUU
	mQKN1LDAtxrxyv8p5D+BeU4/m/iT0oXgElO9pgH6kLwGsSoOPUkXbscC6y78qGQI222L
	xru0AmN6Sr4JQjaK/iRd0QCBy6u0F2mwYeHIWoQNnR6LswfdS9dvASuYTrnWbewUab5s
	9aPCuA/Mq6qvrKsU1KcRV5SLh2rfDbY5D0hErLTVS9L6C4Aic5HI8AKC2S5jv4Cbw2zf
	cPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=rMvOwiPglWDNQYeHFo67aL7mzHq5U60Sku7XaGrRqpM=;
	b=EDX5IcwiKZ7H3v1ZEDR5ytolL0TMrngSlvfpVQ+NtAPOkxQJM3fHhq1jkQ2E+5/3QA
	/F3vQjWgbNWe2FP3eCez5J4xw3NPH6C3Cs2QDuJbuQAZe+QI6ohhZWt8EIgfwm4E7Ifl
	9TvmuPyATwbEn3f9FwZDGOlUUkyPaItUUtMKVwFZc2GQOsrKstq12UCdFxenLtxK0OSO
	CI+Ioww1yFJuAaDog4woJ7AC04Md7cUFMI3ulvV8OVDDuGNytVxLYmOZ1Z38hhkOm2XA
	DSA1PdEFX79n23AUDxfdtx5onbWJTr8ZKXsTaoH88jZyGOcg9ajaRNHbw/BcJqSE3Vmv
	IUXA==
X-Gm-Message-State: AJaThX4JJPOrMEucxGSzZ8Lq7i8ZRNzhtsp8PWw6xWYr6xFT7BNvPx7Q
	7f5OIaboX3d1DrjLFCclYZStAQ==
X-Google-Smtp-Source: AGs4zMZImSHQlX+3n3nyHOC52yoM/1ro4Gf2ZujHNckUHpxkWegaQNqp3lFtybJabuym749xoyGdYw==
X-Received: by 10.99.6.23 with SMTP id 23mr128950pgg.276.1510798760222;
	Wed, 15 Nov 2017 18:19:20 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:a90f:c0e3:b57a:b8e0?
	([2601:202:4001:9ea0:a90f:c0e3:b57a:b8e0])
	by smtp.gmail.com with ESMTPSA id w15sm33691pgc.77.2017.11.15.18.19.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Nov 2017 18:19:19 -0800 (PST)
To: Zhixiong Chi <zhixiong.chi@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <1510208423-222002-1-git-send-email-zhixiong.chi@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <9569cc40-d759-ed8f-09f7-61a07a433359@gmail.com>
Date: Wed, 15 Nov 2017 18:19:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510208423-222002-1-git-send-email-zhixiong.chi@windriver.com>
Subject: Re: [meta-oe][PATCH] mercurial: Upgrade to 4.4.1
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
X-List-Received-Date: Thu, 16 Nov 2017 02:19:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/08/2017 10:20 PM, Zhixiong Chi wrote:
> * Upgrade to the latest release to fix some CVEs:
>  - CVE-2017-1000115: missing symlink check that can malicious repositories
>                      to modify files outside the repository
>  - CVE-2017-1000116: did not adequately sanitize hostnames passed to ssh,
>                      leading to possible shell-injection attacks.
>
> * For other changes please see: https://www.mercurial-scm.org/wiki/WhatsNew
>
> * Update SRC_URI with the new download link
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  .../mercurial/files/mercurial-CVE-2017-9462.patch  | 135 ---------------------
>  .../mercurial/mercurial-native_4.0.1.bb            |  28 -----
>  .../mercurial/mercurial-native_4.4.1.bb            |  27 +++++
4.4 was already in the pipe line and is in master. If you still want
4.4.1, please rebase and resend

- armin
>  3 files changed, 27 insertions(+), 163 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/mercurial/files/mercurial-CVE-2017-9462.patch
>  delete mode 100644 meta-oe/recipes-devtools/mercurial/mercurial-native_4.0.1.bb
>  create mode 100644 meta-oe/recipes-devtools/mercurial/mercurial-native_4.4.1.bb
>
> diff --git a/meta-oe/recipes-devtools/mercurial/files/mercurial-CVE-2017-9462.patch b/meta-oe/recipes-devtools/mercurial/files/mercurial-CVE-2017-9462.patch
> deleted file mode 100644
> index 3564661..0000000
> --- a/meta-oe/recipes-devtools/mercurial/files/mercurial-CVE-2017-9462.patch
> +++ /dev/null
> @@ -1,135 +0,0 @@
> -# HG changeset patch
> -# User Augie Fackler <augie@google.com>
> -# Date 1492021435 25200
> -#      Wed Apr 12 11:23:55 2017 -0700
> -# Branch stable
> -# Node ID 77eaf9539499a1b8be259ffe7ada787d07857f80
> -# Parent  68f263f52d2e3e2798b4f1e55cb665c6b043f93b
> -dispatch: protect against malicious 'hg serve --stdio' invocations (sec)
> -
> -Some shared-ssh installations assume that 'hg serve --stdio' is a safe
> -command to run for minimally trusted users. Unfortunately, the messy
> -implementation of argument parsing here meant that trying to access a
> -repo named '--debugger' would give the user a pdb prompt, thereby
> -sidestepping any hoped-for sandboxing. Serving repositories over HTTP(S)
> -is unaffected.
> -
> -We're not currently hardening any subcommands other than 'serve'. If
> -your service exposes other commands to users with arbitrary repository
> -names, it is imperative that you defend against repository names of
> -'--debugger' and anything starting with '--config'.
> -
> -The read-only mode of hg-ssh stopped working because it provided its hook
> -configuration to "hg serve --stdio" via --config parameter. This is banned for
> -security reasons now. This patch switches it to directly call ui.setconfig().
> -If your custom hosting infrastructure relies on passing --config to
> -"hg serve --stdio", you'll need to find a different way to get that configuration
> -into Mercurial, either by using ui.setconfig() as hg-ssh does in this patch,
> -or by placing an hgrc file someplace where Mercurial will read it.
> -
> -mitrandir@fb.com provided some extra fixes for the dispatch code and
> -for hg-ssh in places that I overlooked.
> -
> -CVE: CVE-2017-9462
> -
> -Upstream-Status: Backport
> -
> -diff --git a/contrib/hg-ssh b/contrib/hg-ssh
> ---- a/contrib/hg-ssh
> -+++ b/contrib/hg-ssh
> -@@ -32,7 +32,7 @@
> - # enable importing on demand to reduce startup time
> - from mercurial import demandimport; demandimport.enable()
> - 
> --from mercurial import dispatch
> -+from mercurial import dispatch, ui as uimod
> - 
> - import sys, os, shlex
> - 
> -@@ -61,14 +61,15 @@
> -         repo = os.path.normpath(os.path.join(cwd, os.path.expanduser(path)))
> -         if repo in allowed_paths:
> -             cmd = ['-R', repo, 'serve', '--stdio']
> -+            req = dispatch.request(cmd)
> -             if readonly:
> --                cmd += [
> --                    '--config',
> --                    'hooks.pretxnopen.hg-ssh=python:__main__.rejectpush',
> --                    '--config',
> --                    'hooks.prepushkey.hg-ssh=python:__main__.rejectpush'
> --                    ]
> --            dispatch.dispatch(dispatch.request(cmd))
> -+                if not req.ui:
> -+                    req.ui = uimod.ui.load()
> -+                req.ui.setconfig('hooks', 'pretxnopen.hg-ssh',
> -+                                 'python:__main__.rejectpush', 'hg-ssh')
> -+                req.ui.setconfig('hooks', 'prepushkey.hg-ssh',
> -+                                 'python:__main__.rejectpush', 'hg-ssh')
> -+            dispatch.dispatch(req)
> -         else:
> -             sys.stderr.write('Illegal repository "%s"\n' % repo)
> -             sys.exit(255)
> -diff --git a/mercurial/dispatch.py b/mercurial/dispatch.py
> ---- a/mercurial/dispatch.py
> -+++ b/mercurial/dispatch.py
> -@@ -155,6 +155,37 @@
> -         pass # happens if called in a thread
> - 
> -     def _runcatchfunc():
> -+        realcmd = None
> -+        try:
> -+            cmdargs = fancyopts.fancyopts(req.args[:], commands.globalopts, {})
> -+            cmd = cmdargs[0]
> -+            aliases, entry = cmdutil.findcmd(cmd, commands.table, False)
> -+            realcmd = aliases[0]
> -+        except (error.UnknownCommand, error.AmbiguousCommand,
> -+                IndexError, getopt.GetoptError):
> -+            # Don't handle this here. We know the command is
> -+            # invalid, but all we're worried about for now is that
> -+            # it's not a command that server operators expect to
> -+            # be safe to offer to users in a sandbox.
> -+            pass
> -+        if realcmd == 'serve' and '--stdio' in cmdargs:
> -+            # We want to constrain 'hg serve --stdio' instances pretty
> -+            # closely, as many shared-ssh access tools want to grant
> -+            # access to run *only* 'hg -R $repo serve --stdio'. We
> -+            # restrict to exactly that set of arguments, and prohibit
> -+            # any repo name that starts with '--' to prevent
> -+            # shenanigans wherein a user does something like pass
> -+            # --debugger or --config=ui.debugger=1 as a repo
> -+            # name. This used to actually run the debugger.
> -+            if (len(req.args) != 4 or
> -+                req.args[0] != '-R' or
> -+                req.args[1].startswith('--') or
> -+                req.args[2] != 'serve' or
> -+                req.args[3] != '--stdio'):
> -+                raise error.Abort(
> -+                    _('potentially unsafe serve --stdio invocation: %r') %
> -+                    (req.args,))
> -+
> -         try:
> -             debugger = 'pdb'
> -             debugtrace = {
> -diff --git a/tests/test-ssh.t b/tests/test-ssh.t
> ---- a/tests/test-ssh.t
> -+++ b/tests/test-ssh.t
> -@@ -357,6 +357,19 @@
> -   abort: destination 'a repo' is not empty
> -   [255]
> - 
> -+Make sure hg is really paranoid in serve --stdio mode. It used to be
> -+possible to get a debugger REPL by specifying a repo named --debugger.
> -+  $ hg -R --debugger serve --stdio
> -+  abort: potentially unsafe serve --stdio invocation: ['-R', '--debugger', 'serve', '--stdio']
> -+  [255]
> -+  $ hg -R --config=ui.debugger=yes serve --stdio
> -+  abort: potentially unsafe serve --stdio invocation: ['-R', '--config=ui.debugger=yes', 'serve', '--stdio']
> -+  [255]
> -+Abbreviations of 'serve' also don't work, to avoid shenanigans.
> -+  $ hg -R narf serv --stdio
> -+  abort: potentially unsafe serve --stdio invocation: ['-R', 'narf', 'serv', '--stdio']
> -+  [255]
> -+
> - Test hg-ssh using a helper script that will restore PYTHONPATH (which might
> - have been cleared by a hg.exe wrapper) and invoke hg-ssh with the right
> - parameters:
> diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_4.0.1.bb b/meta-oe/recipes-devtools/mercurial/mercurial-native_4.0.1.bb
> deleted file mode 100644
> index a08acd9..0000000
> --- a/meta-oe/recipes-devtools/mercurial/mercurial-native_4.0.1.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -SUMMARY = "The Mercurial distributed SCM"
> -HOMEPAGE = "http://mercurial.selenic.com/"
> -SECTION = "console/utils"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -DEPENDS = "python-native"
> -
> -SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz \
> -           file://mercurial-CVE-2017-9462.patch \
> -"
> -SRC_URI[md5sum] = "22a9b1d7c0c06a53f0ae5b386d536d08"
> -SRC_URI[sha256sum] = "6aa4ade93c1b5e11937820880a466ebf1c824086d443cd799fc46e2617250d40"
> -
> -S = "${WORKDIR}/mercurial-${PV}"
> -
> -inherit native
> -
> -EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
> -    PREFIX=${prefix}"
> -
> -do_configure_append () {
> -    sed -i -e 's:PYTHON=python:PYTHON=${STAGING_BINDIR_NATIVE}/python-native/python:g' ${S}/Makefile
> -}
> -
> -do_install () {
> -    oe_runmake -e install-bin DESTDIR=${D} PREFIX=${prefix}
> -}
> -
> diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_4.4.1.bb b/meta-oe/recipes-devtools/mercurial/mercurial-native_4.4.1.bb
> new file mode 100644
> index 0000000..db2f3c4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/mercurial/mercurial-native_4.4.1.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "The Mercurial distributed SCM"
> +HOMEPAGE = "http://mercurial.selenic.com/"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +DEPENDS = "python-native"
> +
> +SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz \
> +"
> +SRC_URI[md5sum] = "37974a416d1d9525e1375c92025b16d9"
> +SRC_URI[sha256sum] = "8f2a5512d6cc2ffb08988aef639330a2f0378e4ac3ee0e1fbbdb64d9fff56246"
> +
> +S = "${WORKDIR}/mercurial-${PV}"
> +
> +inherit native
> +
> +EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
> +    PREFIX=${prefix}"
> +
> +do_configure_append () {
> +    sed -i -e 's:PYTHON=python:PYTHON=${STAGING_BINDIR_NATIVE}/python-native/python:g' ${S}/Makefile
> +}
> +
> +do_install () {
> +    oe_runmake -e install-bin DESTDIR=${D} PREFIX=${prefix}
> +}
> +


