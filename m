Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id AAD857D6A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 18:16:30 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id 44so18739269qtg.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2019 11:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WJ3AmyWi8muztol3xTXRknOzUojV3ori3aSmHhdeuC8=;
	b=S6/3i8bKSJ/s/zdGTQN+tvmtCJEEdeJaNAdTo9380USHIPkAxcdhtuxKh0luHOabxV
	n5AjglCFk1ytCUj+ks4Ik9QmNFsMVOpm39NP/X71V7US49D8OTHflZF3u3ICcNZz0VNn
	82eEWup4L2PcIUyjKBnjtmq0B+RkNj5KqJIIVLmi6h/YgiUsb24xSuR4RJjG2hLIkGuY
	M50lWsUhw3Y6lFDeyZekEcOuL9mhs8lUkMjSr0AxZHzQLvcOpnbY00L4LPqLxvnv8nCk
	B8mAoMI0393pfuiEA7MvMjNLdcYU3WuTT+6ClwxN4Z3+xe0YtkpUN/sCVrsoSWJqWjyR
	TZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WJ3AmyWi8muztol3xTXRknOzUojV3ori3aSmHhdeuC8=;
	b=XxKFAFhy+lVqg+q2td4/MGXmicJfPstJHvSLAk7RinFjiIR0RTxzX/Qhi245NN0mPP
	VmG4gMrm7D47+mVbPS/rqTklbP1B1e8tHm5Rm8aGdtlMWkPd2Tb6EYreMCBjWH665QWY
	PokJPQPaJCjNweh+gua6UWVc7egIBYXtLXMt6/5xhuynOvjgW7fmD3hbK/Ek2L8g+KNs
	DcXR3FKDigy8XStvEJSeB/zEYHw/HkoA4ZSfA5VKd9HvSwlBimW35Ab0gimCEJTBQPVx
	hX1JPM5Xirt7iIW4DsALxo58JbbUDSyzU6aAnQzteDjS3cr0p+LLJ+LxUlS6zYY8g7gZ
	6g5A==
X-Gm-Message-State: APjAAAUPwQXPryO4sK4/sqlhPy06K4E6PNagVU+HxNItMD6F2ESlh2Tq
	GJ2hko5w71V9Vw9n0vyPqkhz5yb6jmKPVVpSk48Hn+cv
X-Google-Smtp-Source: APXvYqz9H88/3VMbIrlPlWZa2AEcaaZ3WCVVHWWLTxuk8BRk0PZogJKNIT7O4HhKHxRlFnDbtykNw+329qzotkIrQLY=
X-Received: by 2002:a0c:d2da:: with SMTP id x26mr12855641qvh.51.1562696191131; 
	Tue, 09 Jul 2019 11:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <1562032691-128301-1-git-send-email-changqing.li@windriver.com>
	<1562032691-128301-3-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1562032691-128301-3-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 11:16:04 -0700
Message-ID: <CAMKF1sosi=qQyKEk6uHJKAWibFwpF7G2eTCwPrVEEe2zLubjzg@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/6 V2] libldb: upgrade 1.4.1 -> 1.5.4
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
X-List-Received-Date: Tue, 09 Jul 2019 18:16:31 -0000
Content-Type: text/plain; charset="UTF-8"

there is another patch to upgrade to 1.6.3 I will take that

On Mon, Jul 1, 2019 at 6:58 PM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> 1. switch to python3
> 2. add cross-answer for lmdb check, so remove patch 0001-libldb-fix-config-error
> 3. fix cross-compile problem caused by waf
> 4. refresh patch
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../waf-cross-answers/cross-answers-aarch64.txt    |  1 +
>  .../waf-cross-answers/cross-answers-aarch64_be.txt |  1 +
>  .../files/waf-cross-answers/cross-answers-arm.txt  |  1 +
>  .../waf-cross-answers/cross-answers-armeb.txt      |  1 +
>  .../files/waf-cross-answers/cross-answers-i586.txt |  1 +
>  .../files/waf-cross-answers/cross-answers-i686.txt |  1 +
>  .../files/waf-cross-answers/cross-answers-mips.txt |  1 +
>  .../waf-cross-answers/cross-answers-mips64.txt     |  1 +
>  .../waf-cross-answers/cross-answers-mips64el.txt   |  1 +
>  .../waf-cross-answers/cross-answers-mipsel.txt     |  1 +
>  .../waf-cross-answers/cross-answers-powerpc.txt    |  1 +
>  .../waf-cross-answers/cross-answers-powerpc64.txt  |  1 +
>  .../waf-cross-answers/cross-answers-riscv64.txt    |  1 +
>  .../waf-cross-answers/cross-answers-x86_64.txt     |  1 +
>  .../libldb/0001-libldb-fix-config-error.patch      | 87 ----------------------
>  .../0001-waf-add-support-of-cross_compile.patch    | 62 +++++++++++++++
>  ...-import-target-module-while-cross-compile.patch | 56 +++++++-------
>  .../{options-1.4.1.patch => options-1.5.4.patch}   | 67 +++++++----------
>  .../libldb/{libldb_1.4.1.bb => libldb_1.5.4.bb}    | 24 +++---
>  19 files changed, 144 insertions(+), 166 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/libldb/libldb/0001-libldb-fix-config-error.patch
>  create mode 100644 meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
>  rename meta-networking/recipes-support/libldb/libldb/{options-1.4.1.patch => options-1.5.4.patch} (79%)
>  rename meta-networking/recipes-support/libldb/{libldb_1.4.1.bb => libldb_1.5.4.bb} (79%)
>
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
> index 1023f6a..fc0400d 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
> @@ -37,3 +37,4 @@ Checking for small off_t: NO
>  Checking whether blkcnt_t is 32 bit: NO
>  Checking whether blkcnt_t is 64 bit: OK
>  Checking whether fcntl lock supports open file description locks: OK
> +Checking for a 64-bit host to support lmdb: OK
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
> index 1023f6a..fc0400d 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
> @@ -37,3 +37,4 @@ Checking for small off_t: NO
>  Checking whether blkcnt_t is 32 bit: NO
>  Checking whether blkcnt_t is 64 bit: OK
>  Checking whether fcntl lock supports open file description locks: OK
> +Checking for a 64-bit host to support lmdb: OK
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
> index a5cd998..759afe8 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
> @@ -38,3 +38,4 @@ Checking for small off_t: NO
>  Checking whether blkcnt_t is 32 bit: NO
>  Checking whether blkcnt_t is 64 bit: OK
>  Checking whether fcntl lock supports open file description locks: OK
> +Checking for a 64-bit host to support lmdb: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
> index a5cd998..759afe8 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
> @@ -38,3 +38,4 @@ Checking for small off_t: NO
>  Checking whether blkcnt_t is 32 bit: NO
>  Checking whether blkcnt_t is 64 bit: OK
>  Checking whether fcntl lock supports open file description locks: OK
> +Checking for a 64-bit host to support lmdb: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
> index a5cd998..759afe8 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
> @@ -38,3 +38,4 @@ Checking for small off_t: NO
>  Checking whether blkcnt_t is 32 bit: NO
>  Checking whether blkcnt_t is 64 bit: OK
>  Checking whether fcntl lock supports open file description locks: OK
> +Checking for a 64-bit host to support lmdb: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
> index a5cd998..759afe8 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
> @@ -38,3 +38,4 @@ Checking for small off_t: NO
>  Checking whether blkcnt_t is 32 bit: NO
>  Checking whether blkcnt_t is 64 bit: OK
>  Checking whether fcntl lock supports open file description locks: OK
> +Checking for a 64-bit host to support lmdb: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
> index 3e239e7..c989f27 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
> @@ -38,3 +38,4 @@ Checking for small off_t: NO
>  Checking whether blkcnt_t is 32 bit: NO
>  Checking whether blkcnt_t is 64 bit: OK
>  Checking whether fcntl lock supports open file description locks: OK
> +Checking for a 64-bit host to support lmdb: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
> index 82e694f..215f574 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
> @@ -37,3 +37,4 @@ Checking for small off_t: NO
>  Checking whether blkcnt_t is 32 bit: NO
>  Checking whether blkcnt_t is 64 bit: OK
>  Checking whether fcntl lock supports open file description locks: OK
> +Checking for a 64-bit host to support lmdb: OK
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
> index 82e694f..215f574 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
> @@ -37,3 +37,4 @@ Checking for small off_t: NO
>  Checking whether blkcnt_t is 32 bit: NO
>  Checking whether blkcnt_t is 64 bit: OK
>  Checking whether fcntl lock supports open file description locks: OK
> +Checking for a 64-bit host to support lmdb: OK
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> index 3e239e7..c989f27 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> @@ -38,3 +38,4 @@ Checking for small off_t: NO
>  Checking whether blkcnt_t is 32 bit: NO
>  Checking whether blkcnt_t is 64 bit: OK
>  Checking whether fcntl lock supports open file description locks: OK
> +Checking for a 64-bit host to support lmdb: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
> index 27b9378..f107974 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
> @@ -38,3 +38,4 @@ Checking for small off_t: NO
>  Checking whether blkcnt_t is 32 bit: NO
>  Checking whether blkcnt_t is 64 bit: OK
>  Checking whether fcntl lock supports open file description locks: OK
> +Checking for a 64-bit host to support lmdb: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
> index 7fd3092..7a443cc 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
> @@ -38,3 +38,4 @@ Checking for small off_t: NO
>  Checking whether blkcnt_t is 32 bit: NO
>  Checking whether blkcnt_t is 64 bit: OK
>  Checking whether fcntl lock supports open file description locks: OK
> +Checking for a 64-bit host to support lmdb: OK
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
> index 1023f6a..fc0400d 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
> @@ -37,3 +37,4 @@ Checking for small off_t: NO
>  Checking whether blkcnt_t is 32 bit: NO
>  Checking whether blkcnt_t is 64 bit: OK
>  Checking whether fcntl lock supports open file description locks: OK
> +Checking for a 64-bit host to support lmdb: OK
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
> index 1023f6a..fc0400d 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
> @@ -37,3 +37,4 @@ Checking for small off_t: NO
>  Checking whether blkcnt_t is 32 bit: NO
>  Checking whether blkcnt_t is 64 bit: OK
>  Checking whether fcntl lock supports open file description locks: OK
> +Checking for a 64-bit host to support lmdb: OK
> diff --git a/meta-networking/recipes-support/libldb/libldb/0001-libldb-fix-config-error.patch b/meta-networking/recipes-support/libldb/libldb/0001-libldb-fix-config-error.patch
> deleted file mode 100644
> index 5818d57..0000000
> --- a/meta-networking/recipes-support/libldb/libldb/0001-libldb-fix-config-error.patch
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -From bc4ff7e37ce120c257e52a81fe3475499dfd2573 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Tue, 24 Jul 2018 10:10:24 +0800
> -Subject: [PATCH] libldb: fix config error
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - wscript | 58 +++++++++++++++++++++++++++++-----------------------------
> - 1 file changed, 29 insertions(+), 29 deletions(-)
> -
> -diff --git a/wscript b/wscript
> -index b0af7b6..8ad9f96 100644
> ---- a/wscript
> -+++ b/wscript
> -@@ -115,40 +115,40 @@ def configure(conf):
> -                                              onlyif='talloc tdb tevent pyldb-util',
> -                                              implied_deps='replace talloc tdb tevent'):
> -                 conf.define('USING_SYSTEM_LDB', 1)
> -+    if not Options.options.without_ldb_lmdb:
> -+        if not conf.CHECK_CODE('return !(sizeof(size_t) >= 8)',
> -+                               "HAVE_64_BIT_SIZE_T_FOR_LMDB",
> -+                               execute=True,
> -+                               msg='Checking for a 64-bit host to '
> -+                               'support lmdb'):
> -+            Logs.warn("--without-ldb-lmdb implied as this "
> -+                      "host is not 64-bit")
> -+
> -+            if not conf.env.standalone_ldb and \
> -+               not Options.options.without_ad_dc and \
> -+               conf.CONFIG_GET('ENABLE_SELFTEST'):
> -+                Logs.warn("NOTE: Some AD DC parts of selftest will fail")
> -
> --    if not conf.CHECK_CODE('return !(sizeof(size_t) >= 8)',
> --                           "HAVE_64_BIT_SIZE_T_FOR_LMDB",
> --                           execute=True,
> --                           msg='Checking for a 64-bit host to '
> --                           'support lmdb'):
> --        Logs.warn("--without-ldb-lmdb implied as this "
> --                  "host is not 64-bit")
> --
> --        if not conf.env.standalone_ldb and \
> --           not Options.options.without_ad_dc and \
> --           conf.CONFIG_GET('ENABLE_SELFTEST'):
> --            Logs.warn("NOTE: Some AD DC parts of selftest will fail")
> --
> --        conf.env.REQUIRE_LMDB = False
> --    else:
> --        if conf.env.standalone_ldb:
> --            if Options.options.without_ldb_lmdb:
> --                conf.env.REQUIRE_LMDB = False
> --            else:
> --                conf.env.REQUIRE_LMDB = True
> --        elif Options.options.without_ad_dc:
> -             conf.env.REQUIRE_LMDB = False
> -         else:
> --            if Options.options.without_ldb_lmdb:
> --                if not Options.options.without_ad_dc and \
> --                   conf.CONFIG_GET('ENABLE_SELFTEST'):
> --                    raise Utils.WafError('--without-ldb-lmdb conflicts '
> --                                         'with --enable-selftest while '
> --                                         'building the AD DC')
> --
> -+            if conf.env.standalone_ldb:
> -+                if Options.options.without_ldb_lmdb:
> -+                    conf.env.REQUIRE_LMDB = False
> -+                else:
> -+                    conf.env.REQUIRE_LMDB = True
> -+            elif Options.options.without_ad_dc:
> -                 conf.env.REQUIRE_LMDB = False
> -             else:
> --                conf.env.REQUIRE_LMDB = True
> -+                if Options.options.without_ldb_lmdb:
> -+                    if not Options.options.without_ad_dc and \
> -+                       conf.CONFIG_GET('ENABLE_SELFTEST'):
> -+                        raise Utils.WafError('--without-ldb-lmdb conflicts '
> -+                                             'with --enable-selftest while '
> -+                                             'building the AD DC')
> -+
> -+                    conf.env.REQUIRE_LMDB = False
> -+                else:
> -+                    conf.env.REQUIRE_LMDB = True
> -
> -
> -     if conf.CONFIG_SET('USING_SYSTEM_LDB'):
> ---
> -2.7.4
> -
> diff --git a/meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch b/meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
> new file mode 100644
> index 0000000..45c5aca
> --- /dev/null
> +++ b/meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
> @@ -0,0 +1,62 @@
> +From 4b8463ff43f8983a706b181c5292491f9f954be1 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Fri, 25 Jan 2019 15:00:59 +0800
> +Subject: [PATCH] waf: add support of cross_compile
> +
> +After upgrade, waf build system also upgraded.
> +
> +on 1.5.19, for cross_compile, subprocess.Popen is set to be
> +samba_cross.cross_Popen, which will not execute testprog on
> +host, but only read result from cross-answers.txt which is
> +passed by option --cross-answer
> +
> +part of old code:
> +    args = Utils.to_list(kw.get('exec_args', []))
> +    proc = Utils.pproc.Popen([lastprog] + args, stdout=Utils.pproc.PIPE, stderr=Utils.pproc.PIPE)
> +
> +but on new version, exec_args is not used and cause do_configure
> +failed with Exec format error
> +
> +fixed by append cross anser related args to cmd
> +
> +Upstream-Status: Submitted [https://gitlab.com/samba-team/samba/merge_requests/211]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + third_party/waf/waflib/Tools/c_config.py | 11 ++++++-----
> + 1 file changed, 6 insertions(+), 5 deletions(-)
> +
> +diff --git a/third_party/waf/waflib/Tools/c_config.py b/third_party/waf/waflib/Tools/c_config.py
> +index 7608215..767cf33 100644
> +--- a/third_party/waf/waflib/Tools/c_config.py
> ++++ b/third_party/waf/waflib/Tools/c_config.py
> +@@ -660,20 +660,21 @@ class test_exec(Task.Task):
> +       """
> +       color = 'PINK'
> +       def run(self):
> ++              args = self.generator.bld.kw.get('exec_args', [])
> +               if getattr(self.generator, 'rpath', None):
> +                       if getattr(self.generator, 'define_ret', False):
> +-                              self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()])
> +-                      else:
> +-                              self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()])
> ++                              self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()] + args)
> ++                      else:
> ++                              self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()] + args)
> +               else:
> +                       env = self.env.env or {}
> +                       env.update(dict(os.environ))
> +                       for var in ('LD_LIBRARY_PATH', 'DYLD_LIBRARY_PATH', 'PATH'):
> +                               env[var] = self.inputs[0].parent.abspath() + os.path.pathsep + env.get(var, '')
> +                       if getattr(self.generator, 'define_ret', False):
> +-                              self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()], env=env)
> ++                              self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()] + args, env=env)
> +                       else:
> +-                              self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()], env=env)
> ++                              self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()] + args, env=env)
> +
> + @feature('test_exec')
> + @after_method('apply_link')
> +--
> +2.7.4
> +
> diff --git a/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
> index ee4936a..3f2921e 100644
> --- a/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
> +++ b/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
> @@ -1,30 +1,32 @@
> -From f4cda3a71311e4496b725bc5f46af93413ec7a1c Mon Sep 17 00:00:00 2001
> -From: Bian Naimeng <biannm@cn.fujitsu.com>
> -Date: Fri, 17 Jul 2015 11:58:49 +0800
> -Subject: [PATCH] libldb: add new recipe
> +From cc0576405803bcae45ee353c4333c449cead9207 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 25 Jun 2019 14:25:08 +0800
> +Subject: [PATCH] do not import target module while cross compile
>
> -Some modules such as dynamic library maybe cann't be imported while cross compile,
> -we just check whether does the module exist.
> +Some modules such as dynamic library maybe cann't be imported
> +while cross compile, we just check whether does the module exist.
>
>  Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
>
> +update to version 4.10.5, and switch to python3
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>  ---
> - buildtools/wafsamba/samba_bundled.py | 32 ++++++++++++++++++++++++--------
> - 1 file changed, 24 insertions(+), 8 deletions(-)
> + buildtools/wafsamba/samba_bundled.py | 27 +++++++++++++++++++--------
> + 1 file changed, 18 insertions(+), 8 deletions(-)
>
>  diff --git a/buildtools/wafsamba/samba_bundled.py b/buildtools/wafsamba/samba_bundled.py
> -index 253d604..398cc6a 100644
> +index 60ce7da..5468a36 100644
>  --- a/buildtools/wafsamba/samba_bundled.py
>  +++ b/buildtools/wafsamba/samba_bundled.py
> -@@ -2,6 +2,7 @@
> +@@ -4,6 +4,7 @@ import sys
> + from waflib import Build, Options, Logs
> + from waflib.Configure import conf
> + from wafsamba import samba_utils
> ++import importlib.util, os
>
> - import sys
> - import Build, Options, Logs
> -+import imp, os
> - from Configure import conf
> - from samba_utils import TO_LIST
> -
> -@@ -249,17 +250,32 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, libname, modulename, minversion='0.0.0'):
> + def PRIVATE_NAME(bld, name, private_extension, private_library):
> +     '''possibly rename a library to include a bundled extension'''
> +@@ -249,17 +250,27 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, libname, modulename, minversion='0.0.0'):
>       # versions
>       minversion = minimum_library_version(conf, libname, minversion)
>
> @@ -34,34 +36,32 @@ index 253d604..398cc6a 100644
>  -        found = False
>  -    else:
>  +    # Find module in PYTHONPATH
> -+    stuff = imp.find_module(modulename, [os.environ["PYTHONPATH"]])
> -+    if stuff:
> ++    spec = importlib.util._find_spec_from_path(modulename, [os.environ["PYTHONPATH"]])
> ++    if spec:
>           try:
>  -            version = m.__version__
>  -        except AttributeError:
> -+            m = imp.load_module(modulename, stuff[0], stuff[1], stuff[2])
> ++            module = importlib.util.module_from_spec(spec)
> ++            spec.loader.load_module(module)
>  +        except ImportError:
>               found = False
>  +
>  +            if conf.env.CROSS_COMPILE:
>  +                # Some modules such as dynamic library maybe cann't be imported
>  +                # while cross compile, we just check whether the module exist
> -+                Logs.warn('Cross module[%s] has been found, but can not be loaded.' % (stuff[1]))
> ++                Logs.warn('Cross module[%s] has been found, but can not be loaded.' % (spec.name))
>  +                found = True
>           else:
>  -            found = tuplize_version(version) >= tuplize_version(minversion)
>  +            try:
> -+                version = m.__version__
> ++                version = module.__version__
>  +            except AttributeError:
>  +                found = False
>  +            else:
>  +                found = tuplize_version(version) >= tuplize_version(minversion)
> -+        finally:
> -+            if stuff[0]:
> -+                stuff[0].close()
> -+    else:
> -+        found = False
> -+
>       if not found and not conf.LIB_MAY_BE_BUNDLED(libname):
>           Logs.error('ERROR: Python module %s of version %s not found, and bundling disabled' % (libname, minversion))
>           sys.exit(1)
> +--
> +2.7.4
> +
> diff --git a/meta-networking/recipes-support/libldb/libldb/options-1.4.1.patch b/meta-networking/recipes-support/libldb/libldb/options-1.5.4.patch
> similarity index 79%
> rename from meta-networking/recipes-support/libldb/libldb/options-1.4.1.patch
> rename to meta-networking/recipes-support/libldb/libldb/options-1.5.4.patch
> index 357afbe..bffd065 100644
> --- a/meta-networking/recipes-support/libldb/libldb/options-1.4.1.patch
> +++ b/meta-networking/recipes-support/libldb/libldb/options-1.5.4.patch
> @@ -1,6 +1,6 @@
> -From ffffd29bc6303d60b3d77048fbbf6776f6fbbe01 Mon Sep 17 00:00:00 2001
> +From 0841c3ed69c388251c1aeae63f2c3813555a54f6 Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
> -Date: Thu, 19 Jul 2018 16:40:31 +0800
> +Date: Mon, 1 Jul 2019 16:14:16 +0800
>  Subject: [PATCH] ldb: Add configure options for packages
>
>  Add configure options for the following packages:
> @@ -15,27 +15,22 @@ Upstream-Status: Inappropriate [oe deterministic build specific]
>
>  Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>
> -Update to version 1.4.1, and fix one configure error
> -
> -Cross answers file cross-answers-i586.txt is incomplete with
> -"Checking for a 64-bit host to support lmdb: UNKNOWN"
> -
> -we don't support lmdb, so only check when lmdb is support
> -
> +upgrade to version 1.5.4
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
>  ---
> - lib/replace/wscript | 94 ++++++++++++++++++++++++++++++++++++++++-------------
> - wscript             |  6 ++++
> - 2 files changed, 77 insertions(+), 23 deletions(-)
> + lib/replace/wscript | 92 +++++++++++++++++++++++++++++++++++++++++------------
> + wscript             |  8 +++++
> + 2 files changed, 79 insertions(+), 21 deletions(-)
>
>  diff --git a/lib/replace/wscript b/lib/replace/wscript
> -index fd00a42..434192e 100644
> +index a7fd25d..ad26041 100644
>  --- a/lib/replace/wscript
>  +++ b/lib/replace/wscript
> -@@ -23,6 +23,41 @@ def set_options(opt):
> +@@ -24,6 +24,41 @@ def options(opt):
> +     opt.BUILTIN_DEFAULT('NONE')
>       opt.PRIVATE_EXTENSION_DEFAULT('')
>       opt.RECURSE('buildtools/wafsamba')
> -
> ++
>  +    opt.add_option('--with-acl',
>  +                   help=("Enable use of acl"),
>  +                   action="store_true", dest='enable_acl')
> @@ -70,11 +65,10 @@ index fd00a42..434192e 100644
>  +    opt.add_option('--without-libcap',
>  +                   help=("Disable use of libcap"),
>  +                   action="store_false", dest='enable_libcap', default=False)
> -+
> +
>   @Utils.run_once
>   def configure(conf):
> -     conf.RECURSE('buildtools/wafsamba')
> -@@ -32,12 +67,25 @@ def configure(conf):
> +@@ -34,12 +69,25 @@ def configure(conf):
>       conf.DEFINE('HAVE_LIBREPLACE', 1)
>       conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
>
> @@ -105,23 +99,22 @@ index fd00a42..434192e 100644
>       conf.CHECK_HEADERS('port.h')
>       conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h sys/fs/vx/quota.h')
>       conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
> -@@ -108,7 +156,9 @@ def configure(conf):
> +@@ -110,8 +158,9 @@ def configure(conf):
>       conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
>       conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
>
> --    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
> +-    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
> +-    conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
>  +    if Options.options.enable_valgrind:
> -+        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
> -+
> ++        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
> ++        conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
>       conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
>       conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
>       conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
> -@@ -340,22 +390,20 @@ def configure(conf):
> +@@ -380,20 +429,21 @@ def configure(conf):
>
> -     conf.CHECK_FUNCS('prctl dirname basename')
> +     strlcpy_in_bsd = False
>
> --    strlcpy_in_bsd = False
> --
>  -    # libbsd on some platforms provides strlcpy and strlcat
>  -    if not conf.CHECK_FUNCS('strlcpy strlcat'):
>  -        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
> @@ -136,11 +129,12 @@ index fd00a42..434192e 100644
>  -
>  -    if not conf.CHECK_FUNCS('closefrom'):
>  -        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
> -+    if Options.options.enable_libbsd:
> ++    if Options.options.enable_libbsd:
>  +        # libbsd on some platforms provides strlcpy and strlcat
>  +        if not conf.CHECK_FUNCS('strlcpy strlcat'):
> -+            conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
> -+                    checklibc=True)
> ++            if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
> ++                                   checklibc=True):
> ++                strlcpy_in_bsd = True
>  +        if not conf.CHECK_FUNCS('getpeereid'):
>  +            conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
>  +        if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
> @@ -153,20 +147,11 @@ index fd00a42..434192e 100644
>
>       conf.CHECK_CODE('''
>                   struct ucred cred;
> -@@ -699,7 +747,7 @@ def configure(conf):
> -     # look for a method of finding the list of network interfaces
> -     for method in ['HAVE_IFACE_GETIFADDRS', 'HAVE_IFACE_AIX', 'HAVE_IFACE_IFCONF', 'HAVE_IFACE_IFREQ']:
> -         bsd_for_strlcpy = ''
> --        if strlcpy_in_bsd:
> -+        if Options.options.enable_libbsd:
> -             bsd_for_strlcpy = ' bsd'
> -         if conf.CHECK_CODE('''
> -                            #define %s 1
>  diff --git a/wscript b/wscript
> -index ad91bc6..2d20fee 100644
> +index d3402a7..d4e0ce1 100644
>  --- a/wscript
>  +++ b/wscript
> -@@ -36,6 +36,12 @@ def set_options(opt):
> +@@ -38,6 +38,14 @@ def options(opt):
>                      help='disable new LMDB backend for LDB',
>                      action='store_true', dest='without_ldb_lmdb', default=False)
>
> @@ -176,6 +161,8 @@ index ad91bc6..2d20fee 100644
>  +    opt.add_option('--without-valgrind',
>  +                   help=("disable use of valgrind"),
>  +                   action="store_false", dest='enable_valgrind', default=False)
> ++
> ++
>
>   def configure(conf):
>       conf.RECURSE('lib/tdb')
> diff --git a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb b/meta-networking/recipes-support/libldb/libldb_1.5.4.bb
> similarity index 79%
> rename from meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> rename to meta-networking/recipes-support/libldb/libldb_1.5.4.bb
> index f3608c6..65a6431 100644
> --- a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> +++ b/meta-networking/recipes-support/libldb/libldb_1.5.4.bb
> @@ -4,16 +4,14 @@ SECTION = "libs"
>  LICENSE = "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
>
>  DEPENDS += "libtdb libtalloc libtevent popt"
> -RDEPENDS_pyldb += "python samba"
> -RCONFLICTS_${PN} = "samba"
> -RCONFLICTS_pyldb = "samba-python"
> +RDEPENDS_pyldb += "python3"
>
>  SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
>             file://do-not-import-target-module-while-cross-compile.patch \
> -           file://options-1.4.1.patch \
> -           file://0001-libldb-fix-config-error.patch \
>             file://libldb-fix-musl-libc-unkown-type-error.patch \
>             file://libldb-fix-musl-libc-conflict-type-error.patch \
> +           file://0001-waf-add-support-of-cross_compile.patch \
> +           file://options-1.5.4.patch \
>            "
>
>  PACKAGECONFIG ??= "\
> @@ -27,6 +25,7 @@ PACKAGECONFIG[libaio] = "--with-libaio,--without-libaio,libaio"
>  PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
>  PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
>  PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
> +PACKAGECONFIG[lmdb] = ",--without-ldb-lmdb,lmdb,"
>
>  SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://avoid-openldap-unless-wanted.patch', d)}"
>
> @@ -34,14 +33,18 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
>                      file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
>                      file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
>
> -SRC_URI[md5sum] = "159a1b1a56dcccf410d1bba911be6076"
> -SRC_URI[sha256sum] = "2df13aa25b376b314ce24182c37691959019523de3cc5356c40c1a333b0890a2"
> +SRC_URI[md5sum] = "24d9f18b085ba27f96d4dec643abea39"
> +SRC_URI[sha256sum] = "db5beea64e305ef002a28fc6b6ca8e42b5fbee268bd713ff41e76c56a0a071d3"
>
>  inherit waf-samba distro_features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
>
>  S = "${WORKDIR}/ldb-${PV}"
>
> +#cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
> +#to cross Popen
> +export WAF_NO_PREFORK="yes"
> +
>  EXTRA_OECONF += "--disable-rpath \
>                   --disable-rpath-install \
>                   --bundled-libraries=cmocka \
> @@ -49,7 +52,6 @@ EXTRA_OECONF += "--disable-rpath \
>                   --with-modulesdir=${libdir}/ldb/modules \
>                   --with-privatelibdir=${libdir}/ldb \
>                   --with-libiconv=${STAGING_DIR_HOST}${prefix}\
> -                 --without-ldb-lmdb \
>                  "
>
>  PACKAGES =+ "pyldb pyldb-dbg pyldb-dev"
> @@ -63,8 +65,8 @@ FILES_${PN}-dbg += "${bindir}/.debug/* \
>                      ${libdir}/ldb/modules/ldb/.debug/*"
>
>  FILES_pyldb = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
> -               ${libdir}/libpyldb-util.so.* \
> +               ${libdir}/libpyldb-util.*.so.* \
>                "
>  FILES_pyldb-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
> -                   ${libdir}/.debug/libpyldb-util.so.*"
> -FILES_pyldb-dev = "${libdir}/libpyldb-util.so"
> +                   ${libdir}/.debug/libpyldb-util.*.so.*"
> +FILES_pyldb-dev = "${libdir}/libpyldb-util.*.so"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

