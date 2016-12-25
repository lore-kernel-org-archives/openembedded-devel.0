Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8019971A05
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Dec 2016 23:57:05 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l2so25590189wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Dec 2016 15:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ASKJUAplC0OAbvWiqF+z04bhZmefgBotkPnngavBeUs=;
	b=vMtRYtxBGsLfutn1kLGQpkEiR1kO9MWFTax5EOyjvgBF9bcbySFwKTC0DnWGEH4fzR
	fYxeqJb96ubcfcdqSHvsISTSYXUmfPk9fA1c9Pt2YSufxlK4ypbZYeNVbHcforV7Y40d
	6NnckUHr9+wws6pxFOTtV/PyEizDmLomXGLczGNdQF4BfupGkXErfeHu60PQDfhsdzDl
	QKlV7GbOi4wVa6wYkZafSX+SnygpcGHmUUtsG25KpDbRSRaCdAaDPP+BOFT9OqH0IfuR
	a2pf19wLk8z9F2cwXUX2eT386ta3d7lIVU6SziX6xQgw2cHxxuxRGByWsz35GPc3UuIH
	98Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ASKJUAplC0OAbvWiqF+z04bhZmefgBotkPnngavBeUs=;
	b=nbO+DjJlBr8cSqQgVv2JpJZNYIyYU2PoosAWlosVxdTBSiNoiFp86KoB37PTBRFWNh
	zGj11VMVwEVHoxejxjhrEheEKS0j4fQdkzLh+c4ePlGqweiC19BK/tqjAVq1f7rTTQX9
	C0vaIaqEsuSMNidqkzVVXIpcoLxP2t/EYersGcANhDn8zS06oaRsZYmtIsoTGzJP3Kmu
	W6jbDO1iwwv+D/sujSWELkD4PcOSDpBEN3Io+OKv0HpweLa+6eqcoswlb76NeTlC5zIF
	pgFtmmjjZTnriQu0ieXTpdzJYGirpXl0faC9MFtij/v/YZ3nGo60oRFZD6AEL22etqBb
	bAWQ==
X-Gm-Message-State: AIkVDXILsPsrnoem24FRz69D9lvQvSMxHkQDt9PsAqrnu9VsR7zwUI7kGE1STUDUlwrlbwNonkxH9cQm5gl1wA==
X-Received: by 10.28.0.210 with SMTP id 201mr22439691wma.49.1482710226057;
	Sun, 25 Dec 2016 15:57:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Sun, 25 Dec 2016 15:57:05 -0800 (PST)
In-Reply-To: <1482552258-852-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1482552258-852-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Dec 2016 00:57:05 +0100
Message-ID: <CA+chaQeh1FrBsAUPuoKkZYX+VrjAtaEw0rccBMs14kbPjNa3Lg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe] [PATCH v3] add php 7.1.0
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
X-List-Received-Date: Sun, 25 Dec 2016 23:57:05 -0000
Content-Type: text/plain; charset=UTF-8

php-7.1.0: php: configure was passed unrecognised options:
--with-mysql [unknown-configure-option]


On Sat, Dec 24, 2016 at 5:04 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> 1)add php_7.1.0.bb
> 2)Delete php_5.5.38.bb,since it is Replaced by php_5.6.26.bb.
> 3)Delete pthread-check-threads-m4.patch, since it is integrated upstream.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../change-AC_TRY_RUN-to-AC_TRY_LINK.patch         | 56
> ++++++++++++++++++++++
>  meta-oe/recipes-devtools/php/php.inc               |  3 +-
>  .../php/php/pthread-check-threads-m4.patch         | 30 ------------
>  meta-oe/recipes-devtools/php/php_5.5.38.bb         |  6 ---
>  meta-oe/recipes-devtools/php/php_7.1.0.bb          |  8 ++++
>  5 files changed, 65 insertions(+), 38 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/php/
> php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
>  delete mode 100644 meta-oe/recipes-devtools/php/
> php/pthread-check-threads-m4.patch
>  delete mode 100644 meta-oe/recipes-devtools/php/php_5.5.38.bb
>  create mode 100644 meta-oe/recipes-devtools/php/php_7.1.0.bb
>
> diff --git a/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
> b/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_
> RUN-to-AC_TRY_LINK.patch
> new file mode 100644
> index 0000000..39c334f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_
> RUN-to-AC_TRY_LINK.patch
> @@ -0,0 +1,56 @@
> +[PATCH] config.m4: change AC_TRY_RUN to AC_TRY_LINK
> +
> +Upstream-Status: Pending
> +
> +AC_TRY_RUN is not suitable for cross-compile
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + ext/fileinfo/config.m4 | 31 ++++++-------------------------
> + 1 file changed, 6 insertions(+), 25 deletions(-)
> +
> +diff --git a/ext/fileinfo/config.m4 b/ext/fileinfo/config.m4
> +index 7e98d62..8a8ea0e 100644
> +--- a/ext/fileinfo/config.m4
> ++++ b/ext/fileinfo/config.m4
> +@@ -14,31 +14,12 @@ if test "$PHP_FILEINFO" != "no"; then
> +     libmagic/readcdf.c libmagic/softmagic.c"
> +
> +   AC_MSG_CHECKING([for strcasestr])
> +-  AC_TRY_RUN([
> +-#include <string.h>
> +-#include <strings.h>
> +-#include <stdlib.h>
> +-
> +-int main(void)
> +-{
> +-        char *s0, *s1, *ret;
> +-
> +-        s0 = (char *) malloc(42);
> +-        s1 = (char *) malloc(8);
> +-
> +-        memset(s0, 'X', 42);
> +-        s0[24] = 'Y';
> +-        s0[26] = 'Z';
> +-        s0[41] = '\0';
> +-        memset(s1, 'x', 8);
> +-        s1[0] = 'y';
> +-        s1[2] = 'Z';
> +-        s1[7] = '\0';
> +-
> +-        ret = strcasestr(s0, s1);
> +-
> +-        return !(NULL != ret);
> +-}
> ++  AC_TRY_COMPILE([
> ++     #include <string.h>
> ++     #include <strings.h>
> ++     #include <stdlib.h>
> ++  ],[
> ++     strcasestr(NULL, NULL);
> +   ],[
> +     dnl using the platform implementation
> +     AC_MSG_RESULT(yes)
> +--
> +1.9.1
> +
> diff --git a/meta-oe/recipes-devtools/php/php.inc
> b/meta-oe/recipes-devtools/php/php.inc
> index cd91940..5e6b16a 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -24,7 +24,6 @@ SRC_URI_append_class-target = " \
>              file://php-fpm.conf \
>              file://php-fpm-apache.conf \
>              file://configure.patch \
> -            file://pthread-check-threads-m4.patch \
>              file://70_mod_php5.conf \
>              file://php-fpm.service \
>            "
> @@ -218,7 +217,7 @@ FILES_${PN}-doc += "${PHP_LIBDIR}/php/doc"
>  FILES_${PN}-cli = "${bindir}/php"
>  FILES_${PN}-phar = "${bindir}/phar*"
>  FILES_${PN}-cgi = "${bindir}/php-cgi"
> -FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf
> ${datadir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-
> fpm.service"
> +FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf
> ${datadir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fpm.service
> ${sysconfdir}/php-fpm.d ${sysconfdir}/php-fpm.d/www.conf.default"
>

The second added entry is already included by the first one, isn't it?


>  FILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
>  CONFFILES_${PN}-fpm = "${sysconfdir}/php-fpm.conf"
>  CONFFILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
> diff --git a/meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.patch
> b/meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.patch
> deleted file mode 100644
> index 0c564cd..0000000
> --- a/meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From d8067ceacbf54e79c9c6b68675332c09eaa0b55d Mon Sep 17 00:00:00 2001
> -From: Jackie Huang <jackie.huang@windriver.com>
> -Date: Mon, 8 Apr 2013 14:29:51 +0800
> -Subject: [PATCH] pthread-check
> -
> -Enable pthreads support when cross-compiling
> -
> -Upstream-Status: Inapproprate [config]
> -
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - TSRM/threads.m4 |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/TSRM/threads.m4 b/TSRM/threads.m4
> -index 38494ce..15d9454 100644
> ---- a/TSRM/threads.m4
> -+++ b/TSRM/threads.m4
> -@@ -86,7 +86,7 @@ int main() {
> -   pthreads_working=no
> -   ], [
> -   dnl For cross compiling running this test is of no use. NetWare
> supports pthreads
> --  pthreads_working=no
> -+  pthreads_working=yes
> -   case $host_alias in
> -   *netware*)
> -     pthreads_working=yes
> ---
> -1.7.4.1
> -
> diff --git a/meta-oe/recipes-devtools/php/php_5.5.38.bb
> b/meta-oe/recipes-devtools/php/php_5.5.38.bb
> deleted file mode 100644
> index 26f35b1..0000000
> --- a/meta-oe/recipes-devtools/php/php_5.5.38.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require php.inc
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=464ca70af214d2407f6b7d4458158afd"
> -
> -SRC_URI[md5sum] = "312244a0eecad602a1555ed2434e223f"
> -SRC_URI[sha256sum] = "473c81ebb2e48ca468caee03176226
> 6651843d7227c18a824add9b07b9393e38"
> diff --git a/meta-oe/recipes-devtools/php/php_7.1.0.bb
> b/meta-oe/recipes-devtools/php/php_7.1.0.bb
> new file mode 100644
> index 0000000..899acf9
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php_7.1.0.bb
> @@ -0,0 +1,8 @@
> +require php.inc
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b602636d46a61c0ac0432bbf5c078fe4"
> +
> +SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
> +SRC_URI[md5sum] = "54e364b60a88db77adb96aacb10f10a4"
> +SRC_URI[sha256sum] = "68bcfd7deed5b3474d81dec9f74d12
> 2058327e2bed0ac25bbc9ec70995228e61"
> +
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

