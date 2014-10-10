Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C5976AC7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 11:45:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9ABj3OJ010382
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 10 Oct 2014 04:45:03 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 10 Oct 2014 04:45:02 -0700
Message-ID: <5437C6BD.7080308@windriver.com>
Date: Fri, 10 Oct 2014 19:45:01 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, <ting.liu@freescale.com>
References: <1411455848-21704-1-git-send-email-ting.liu@freescale.com>
In-Reply-To: <1411455848-21704-1-git-send-email-ting.liu@freescale.com>
Subject: Re: [meta-oe][PATCH] libunwind: Fix test case link failure on PowerPC systems with Altivec
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Oct 2014 11:45:09 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Ting,

Would you please send it to oe-core, or I can help ? It had conficts, I
updated it:

 From 719aa29b604df59538eea6e9b9a8595389dc79f3 Mon Sep 17 00:00:00 2001
From: Ting Liu <ting.liu@freescale.com>
Date: Tue, 23 Sep 2014 15:04:08 +0800
Subject: [PATCH] libunwind: Fix test case link failure on PowerPC systems
  with Altivec

Fixed:
ppc64-test-altivec.o: In function `vec_stack':
tests/ppc64-test-altivec.c:54: undefined reference to `_Uppc64_init_local'
tests/ppc64-test-altivec.c:67: undefined reference to `_Uppc64_get_reg'
tests/ppc64-test-altivec.c:72: undefined reference to `_Uppc64_get_fpreg'
tests/ppc64-test-altivec.c:82: undefined reference to `_Uppc64_regname'
tests/ppc64-test-altivec.c:94: undefined reference to `_Uppc64_get_proc_name'
tests/ppc64-test-altivec.c:109: undefined reference to `_Uppc64_step'
tests/ppc64-test-altivec.c:62: undefined reference to `_Uppc64_get_reg'
tests/ppc64-test-altivec.c:112: undefined reference to `_Uppc64_get_reg'

Signed-off-by: Ting Liu <ting.liu@freescale.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
  ...k-failure-on-PowerPC-systems-with-Altivec.patch |   31 ++++++++++++++++++++
  meta/recipes-support/libunwind/libunwind_1.1.bb    |    1 +
  2 files changed, 32 insertions(+)
  create mode 100644 
meta/recipes-support/libunwind/libunwind/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch

diff --git 
a/meta/recipes-support/libunwind/libunwind/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch 
b/meta/recipes-support/libunwind/libunwind/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch
new file mode 100644
index 0000000..e8f4382
--- /dev/null
+++ 
b/meta/recipes-support/libunwind/libunwind/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch
@@ -0,0 +1,31 @@
+From 4c62c4a9556f92495d93eddc7641497e1ce1e35c Mon Sep 17 00:00:00 2001
+From: Ulrich Weigand <uweigand@de.ibm.com>
+Date: Tue, 17 Dec 2013 15:00:54 +0100
+Subject: [PATCH] Fix test case link failure on PowerPC systems with Altivec
+
+Upstream-Status:backport
+
+On systems where the system compiler supports Altivec by default,
+the libunwind Makefile will attempt to build an extra test case
+ppc64-test-altivec.  Unfortunately, the link step will fail since
+the Makefile does not actually link against the libunwind library.
+
+Fixed by adding the appropriate LDADD macro.
+
+Signed-off-by: Ulrich Weigand <uweigand@de.ibm.com>
+---
+ tests/Makefile.am |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 0e30536..9c76628 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -201,3 +201,4 @@ Lia64_test_rbs_LDADD = $(LIBUNWIND_local)
+ Lia64_test_readonly_LDADD = $(LIBUNWIND_local)
+ ia64_test_dyn1_LDADD = $(LIBUNWIND)
+ ia64_test_sig_LDADD = $(LIBUNWIND)
++ppc64_test_altivec_LDADD = $(LIBUNWIND)
+--
+1.7.2.5
+
diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb 
b/meta/recipes-support/libunwind/libunwind_1.1.bb
index 2e52430..5b54dcb 100644
--- a/meta/recipes-support/libunwind/libunwind_1.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -3,6 +3,7 @@ require libunwind.inc
  SRC_URI += "\
      file://Support-building-with-older-compilers.patch \
      file://AArch64-port.patch \
+    file://Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch \
  "

  SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
-- 
1.7.9.5


// Robert

On 09/23/2014 03:04 PM, ting.liu@freescale.com wrote:
> From: Ting Liu <ting.liu@freescale.com>
>
> Signed-off-by: Ting Liu <ting.liu@freescale.com>
> ---
>   ...k-failure-on-PowerPC-systems-with-Altivec.patch | 31 ++++++++++++++++++++++
>   meta-oe/recipes-support/libunwind/libunwind_1.1.bb |  1 +
>   2 files changed, 32 insertions(+)
>   create mode 100644 meta-oe/recipes-support/libunwind/libunwind/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch
>
> diff --git a/meta-oe/recipes-support/libunwind/libunwind/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch b/meta-oe/recipes-support/libunwind/libunwind/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch
> new file mode 100644
> index 0000000..e8f4382
> --- /dev/null
> +++ b/meta-oe/recipes-support/libunwind/libunwind/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch
> @@ -0,0 +1,31 @@
> +From 4c62c4a9556f92495d93eddc7641497e1ce1e35c Mon Sep 17 00:00:00 2001
> +From: Ulrich Weigand <uweigand@de.ibm.com>
> +Date: Tue, 17 Dec 2013 15:00:54 +0100
> +Subject: [PATCH] Fix test case link failure on PowerPC systems with Altivec
> +
> +Upstream-Status:backport
> +
> +On systems where the system compiler supports Altivec by default,
> +the libunwind Makefile will attempt to build an extra test case
> +ppc64-test-altivec.  Unfortunately, the link step will fail since
> +the Makefile does not actually link against the libunwind library.
> +
> +Fixed by adding the appropriate LDADD macro.
> +
> +Signed-off-by: Ulrich Weigand <uweigand@de.ibm.com>
> +---
> + tests/Makefile.am |    1 +
> + 1 files changed, 1 insertions(+), 0 deletions(-)
> +
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index 0e30536..9c76628 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -201,3 +201,4 @@ Lia64_test_rbs_LDADD = $(LIBUNWIND_local)
> + Lia64_test_readonly_LDADD = $(LIBUNWIND_local)
> + ia64_test_dyn1_LDADD = $(LIBUNWIND)
> + ia64_test_sig_LDADD = $(LIBUNWIND)
> ++ppc64_test_altivec_LDADD = $(LIBUNWIND)
> +--
> +1.7.2.5
> +
> diff --git a/meta-oe/recipes-support/libunwind/libunwind_1.1.bb b/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
> index bc38e36..18bca0e 100644
> --- a/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
> +++ b/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
> @@ -1,4 +1,5 @@
>   require libunwind.inc
>
> +SRC_URI += "file://Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch"
>   SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
>   SRC_URI[sha256sum] = "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a"
>

