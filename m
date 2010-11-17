Received: from smtpq4.tb.mail.iss.as9143.net ([212.54.42.167])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <waltergoossens@home.nl>) id 1PIiuR-00074G-JW
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 15:22:54 +0100
Received: from [212.54.42.146] (helo=smtp15.tb.mail.iss.as9143.net)
	by smtpq4.tb.mail.iss.as9143.net with esmtp (Exim 4.69)
	(envelope-from <waltergoossens@home.nl>) id 1PIitN-0006Z1-Hx
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 15:21:45 +0100
Received: from 541fdd4a.cm-5-8d.dynamic.ziggo.nl ([84.31.221.74]
	helo=[192.168.2.195])
	by smtp15.tb.mail.iss.as9143.net with esmtp (Exim 4.69)
	(envelope-from <waltergoossens@home.nl>) id 1PIitL-0007q0-37
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 15:21:43 +0100
Message-ID: <4CE3E4F6.9000602@home.nl>
Date: Wed, 17 Nov 2010 15:21:42 +0100
From: Walter Goossens <waltergoossens@home.nl>
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290002290-9233-1-git-send-email-fransmeulenbroeks@gmail.com>
In-Reply-To: <1290002290-9233-1-git-send-email-fransmeulenbroeks@gmail.com>
X-ZiggoSMTP-MailScanner-Information: Please contact the ISP for more
	information
X-ZiggoSMTP-MailScanner-ID: 1PIitL-0007q0-37
X-ZiggoSMTP-MailScanner: Found to be clean
X-ZiggoSMTP-MailScanner-SpamCheck: geen spam, SpamAssassin (niet cached,
	score=-2.333, vereist 5, ALL_TRUSTED -1.80, BAYES_05 -1.11,
	CM_META_TB_NOARR 0.50, TW_XC 0.08)
X-ZiggoSMTP-MailScanner-From: waltergoossens@home.nl
X-SA-Exim-Connect-IP: 212.54.42.167
X-SA-Exim-Mail-From: waltergoossens@home.nl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] libX11: patch configure.ac so a nios2 system is not	seen as an os2 system.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Nov 2010 14:22:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I just noticed my test build halted on that exact error...
I'll ack this one :)
On 11/17/10 2:58 PM, Frans Meulenbroeks wrote:
> The OS/2 platform requires some utility functions as well as having a non-32 bit wchar_t. Fix the configure check so that it doesn't also affect the nios2 cpu, which wouldn't influence these operating system issues.
>
> This is already accepted upstream and will be in 1.4
> http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=affc2488a7f2660a74dc8354fc3e0bff2c4f879c
>
> Signed-off-by: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>
> ---
>   .../xorg-lib/libx11-1.1.5/configure.ac-nios2.patch |   33 ++++++++++++++++++++
>   .../xorg-lib/libx11-1.3.2/configure.ac-nios2.patch |   33 ++++++++++++++++++++
>   .../xorg-lib/libx11-1.3.6/configure.ac-nios2.patch |   33 ++++++++++++++++++++
>   .../libx11-1.3.99.903/configure.ac-nios2.patch     |   33 ++++++++++++++++++++
>   recipes/xorg-lib/libx11_1.1.5.bb                   |    3 +-
>   recipes/xorg-lib/libx11_1.3.2.bb                   |    3 +-
>   recipes/xorg-lib/libx11_1.3.6.bb                   |    3 +-
>   recipes/xorg-lib/libx11_1.3.99.903.bb              |    3 +-
>   8 files changed, 140 insertions(+), 4 deletions(-)
>   create mode 100644 recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch
>   create mode 100644 recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch
>   create mode 100644 recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch
>   create mode 100644 recipes/xorg-lib/libx11-1.3.99.903/configure.ac-nios2.patch
>
> diff --git a/recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch b/recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch
> new file mode 100644
> index 0000000..2e2d475
> --- /dev/null
> +++ b/recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch
> @@ -0,0 +1,33 @@
> +From affc2488a7f2660a74dc8354fc3e0bff2c4f879c Mon Sep 17 00:00:00 2001
> +From: Dan Nicholson<dbn.lists@gmail.com>
> +Date: Sat, 06 Nov 2010 21:58:09 +0000
> +Subject: config: Fix architecture check for OS/2 to skip nios2 cpu
> +
> +The OS/2 platform requires some utility functions as well as having a
> +non-32 bit wchar_t. Fix the configure check so that it doesn't also
> +affect the nios2 cpu, which wouldn't influence these operating system
> +issues.
> +
> +Signed-off-by: Dan Nicholson<dbn.lists@gmail.com>
> +Tested-by: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>
> +Reviewed-by: Alan Coopersmith<alan.coopersmith@oracle.com>
> +Reviewed-by: Julien Cristau<jcristau@debian.org>
> +Signed-off-by: Alan Coopersmith<alan.coopersmith@oracle.com>
> +---
> +diff --git a/configure.ac b/configure.ac
> +index 1b4a8b7..01f43fb 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -246,8 +246,8 @@ dnl AC_PATH_XTRA
> +
> + # arch specific things
> + WCHAR32="1"
> +-case $target_alias in
> +-  *os2*) os2="true" ; WCHAR32="0" ;;
> ++case $target_os in
> ++  os2*) os2="true" ; WCHAR32="0" ;;
> +   *) ;;
> + esac
> + AC_SUBST(WCHAR32)
> +--
> +cgit v0.8.3-6-g21f6
> diff --git a/recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch b/recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch
> new file mode 100644
> index 0000000..2e2d475
> --- /dev/null
> +++ b/recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch
> @@ -0,0 +1,33 @@
> +From affc2488a7f2660a74dc8354fc3e0bff2c4f879c Mon Sep 17 00:00:00 2001
> +From: Dan Nicholson<dbn.lists@gmail.com>
> +Date: Sat, 06 Nov 2010 21:58:09 +0000
> +Subject: config: Fix architecture check for OS/2 to skip nios2 cpu
> +
> +The OS/2 platform requires some utility functions as well as having a
> +non-32 bit wchar_t. Fix the configure check so that it doesn't also
> +affect the nios2 cpu, which wouldn't influence these operating system
> +issues.
> +
> +Signed-off-by: Dan Nicholson<dbn.lists@gmail.com>
> +Tested-by: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>
> +Reviewed-by: Alan Coopersmith<alan.coopersmith@oracle.com>
> +Reviewed-by: Julien Cristau<jcristau@debian.org>
> +Signed-off-by: Alan Coopersmith<alan.coopersmith@oracle.com>
> +---
> +diff --git a/configure.ac b/configure.ac
> +index 1b4a8b7..01f43fb 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -246,8 +246,8 @@ dnl AC_PATH_XTRA
> +
> + # arch specific things
> + WCHAR32="1"
> +-case $target_alias in
> +-  *os2*) os2="true" ; WCHAR32="0" ;;
> ++case $target_os in
> ++  os2*) os2="true" ; WCHAR32="0" ;;
> +   *) ;;
> + esac
> + AC_SUBST(WCHAR32)
> +--
> +cgit v0.8.3-6-g21f6
> diff --git a/recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch b/recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch
> new file mode 100644
> index 0000000..2e2d475
> --- /dev/null
> +++ b/recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch
> @@ -0,0 +1,33 @@
> +From affc2488a7f2660a74dc8354fc3e0bff2c4f879c Mon Sep 17 00:00:00 2001
> +From: Dan Nicholson<dbn.lists@gmail.com>
> +Date: Sat, 06 Nov 2010 21:58:09 +0000
> +Subject: config: Fix architecture check for OS/2 to skip nios2 cpu
> +
> +The OS/2 platform requires some utility functions as well as having a
> +non-32 bit wchar_t. Fix the configure check so that it doesn't also
> +affect the nios2 cpu, which wouldn't influence these operating system
> +issues.
> +
> +Signed-off-by: Dan Nicholson<dbn.lists@gmail.com>
> +Tested-by: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>
> +Reviewed-by: Alan Coopersmith<alan.coopersmith@oracle.com>
> +Reviewed-by: Julien Cristau<jcristau@debian.org>
> +Signed-off-by: Alan Coopersmith<alan.coopersmith@oracle.com>
> +---
> +diff --git a/configure.ac b/configure.ac
> +index 1b4a8b7..01f43fb 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -246,8 +246,8 @@ dnl AC_PATH_XTRA
> +
> + # arch specific things
> + WCHAR32="1"
> +-case $target_alias in
> +-  *os2*) os2="true" ; WCHAR32="0" ;;
> ++case $target_os in
> ++  os2*) os2="true" ; WCHAR32="0" ;;
> +   *) ;;
> + esac
> + AC_SUBST(WCHAR32)
> +--
> +cgit v0.8.3-6-g21f6
> diff --git a/recipes/xorg-lib/libx11-1.3.99.903/configure.ac-nios2.patch b/recipes/xorg-lib/libx11-1.3.99.903/configure.ac-nios2.patch
> new file mode 100644
> index 0000000..2e2d475
> --- /dev/null
> +++ b/recipes/xorg-lib/libx11-1.3.99.903/configure.ac-nios2.patch
> @@ -0,0 +1,33 @@
> +From affc2488a7f2660a74dc8354fc3e0bff2c4f879c Mon Sep 17 00:00:00 2001
> +From: Dan Nicholson<dbn.lists@gmail.com>
> +Date: Sat, 06 Nov 2010 21:58:09 +0000
> +Subject: config: Fix architecture check for OS/2 to skip nios2 cpu
> +
> +The OS/2 platform requires some utility functions as well as having a
> +non-32 bit wchar_t. Fix the configure check so that it doesn't also
> +affect the nios2 cpu, which wouldn't influence these operating system
> +issues.
> +
> +Signed-off-by: Dan Nicholson<dbn.lists@gmail.com>
> +Tested-by: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>
> +Reviewed-by: Alan Coopersmith<alan.coopersmith@oracle.com>
> +Reviewed-by: Julien Cristau<jcristau@debian.org>
> +Signed-off-by: Alan Coopersmith<alan.coopersmith@oracle.com>
> +---
> +diff --git a/configure.ac b/configure.ac
> +index 1b4a8b7..01f43fb 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -246,8 +246,8 @@ dnl AC_PATH_XTRA
> +
> + # arch specific things
> + WCHAR32="1"
> +-case $target_alias in
> +-  *os2*) os2="true" ; WCHAR32="0" ;;
> ++case $target_os in
> ++  os2*) os2="true" ; WCHAR32="0" ;;
> +   *) ;;
> + esac
> + AC_SUBST(WCHAR32)
> +--
> +cgit v0.8.3-6-g21f6
> diff --git a/recipes/xorg-lib/libx11_1.1.5.bb b/recipes/xorg-lib/libx11_1.1.5.bb
> index e775585..b44dcc8 100644
> --- a/recipes/xorg-lib/libx11_1.1.5.bb
> +++ b/recipes/xorg-lib/libx11_1.1.5.bb
> @@ -1,7 +1,8 @@
>   require libx11.inc
>   DEPENDS = "${COMMON_DEPENDS}"
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>
> +SRC_URI += " file://configure.ac-nios2.patch"
>   SRC_URI[archive.md5sum] = "d1512d65dadd4f48c779d4749e7753a8"
>   SRC_URI[archive.sha256sum] = "da9272900e41615e9c5dc25d84730b8966da6f5c8f4c40418dca2ad040fc8b82"
>
> diff --git a/recipes/xorg-lib/libx11_1.3.2.bb b/recipes/xorg-lib/libx11_1.3.2.bb
> index b3d48ab..189d1ff 100644
> --- a/recipes/xorg-lib/libx11_1.3.2.bb
> +++ b/recipes/xorg-lib/libx11_1.3.2.bb
> @@ -1,10 +1,11 @@
>   require libx11.inc
> -PR = "${INC_PR}.2"
> +PR = "${INC_PR}.3"
>   # gcc 4.5 ends up ICEing with thumb and -O1 with -fno-omit-framepointer
>   # therefore if we are in thumb mode then we use -Os instead of -O1 for
>   # DEBUG_OPTIMIZATION
>
>   DEBUG_OPTIMIZATION_thumb_append = " -Os"
>   SRC_URI += " file://dolt-fix.patch"
> +SRC_URI += " file://configure.ac-nios2.patch"
>   SRC_URI[archive.md5sum] = "001d780829f936e34851ef7cd37b4dfd"
>   SRC_URI[archive.sha256sum] = "4def4d5c9fce85d690f1f29d675154594acdea3d3fe792d0cb513732c7b4bcb2"
> diff --git a/recipes/xorg-lib/libx11_1.3.6.bb b/recipes/xorg-lib/libx11_1.3.6.bb
> index 625f906..8d9f343 100644
> --- a/recipes/xorg-lib/libx11_1.3.6.bb
> +++ b/recipes/xorg-lib/libx11_1.3.6.bb
> @@ -1,6 +1,7 @@
>   require libx11.inc
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>
>   SRC_URI += " file://dolt-fix.patch"
> +SRC_URI += " file://configure.ac-nios2.patch"
>   SRC_URI[archive.md5sum] = "8e0a8a466aa78f66e09fe06cb395319f"
>   SRC_URI[archive.sha256sum] = "599826765c59a98b1e58b4f6c4ad50dca69eeb0e7bd78aea736ca815f45bea40"
> diff --git a/recipes/xorg-lib/libx11_1.3.99.903.bb b/recipes/xorg-lib/libx11_1.3.99.903.bb
> index 65ff63c..5ea3291 100644
> --- a/recipes/xorg-lib/libx11_1.3.99.903.bb
> +++ b/recipes/xorg-lib/libx11_1.3.99.903.bb
> @@ -2,7 +2,8 @@ require libx11.inc
>   #--without-xcb is not an option anymore
>   #http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=15e5eaf62897b3179d1fbe457cb19f886f0449f8
>   DEPENDS_virtclass-native = "libxcb-native ${COMMON_DEPENDS}"
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>
> +SRC_URI += " file://configure.ac-nios2.patch"
>   SRC_URI[archive.md5sum] = "3e8ed7a91f70bb819b5dab9c124a7062"
>   SRC_URI[archive.sha256sum] = "50205aad0646c0ab13aff8e8eaec7c5cddff416d3a012f83c5661ad98e49736f"



