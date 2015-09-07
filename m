Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E148E65C8A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Sep 2015 03:20:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t873Kbrp028331
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 6 Sep 2015 20:20:37 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 6 Sep 2015 20:20:36 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1440060202-17953-1-git-send-email-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <55ED028C.9000008@windriver.com>
Date: Mon, 7 Sep 2015 11:20:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1440060202-17953-1-git-send-email-kai.kang@windriver.com>
Subject: Re: [PATCH] inetutils: add package config pam
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
X-List-Received-Date: Mon, 07 Sep 2015 03:20:38 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年08月20日 16:43, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Add package config pam for inetutils. And only check pam_appl.h when pam
> is enabled.

Ping.


>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   ...ls-only-check-pam_appl.h-when-pam-enabled.patch | 40 ++++++++++++++++++++++
>   .../inetutils/inetutils_1.9.4.bb                   |  6 +++-
>   2 files changed, 45 insertions(+), 1 deletion(-)
>   create mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
>
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
> new file mode 100644
> index 0000000..ff3abd8
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
> @@ -0,0 +1,40 @@
> +Only check security/pam_appl.h which is provided by package libpam when pam is
> +enabled.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> +diff --git a/configure.ac b/configure.ac
> +index b35e672..e78a751 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -195,6 +195,19 @@ fi
> +
> + # See if we have libpam.a.  Investigate PAM versus Linux-PAM.
> + if test "$with_pam" = yes ; then
> ++  AC_CHECK_HEADERS([security/pam_appl.h], [], [], [
> ++#include <sys/types.h>
> ++#ifdef HAVE_NETINET_IN_SYSTM_H
> ++# include <netinet/in_systm.h>
> ++#endif
> ++#include <netinet/in.h>
> ++#ifdef HAVE_NETINET_IP_H
> ++# include <netinet/ip.h>
> ++#endif
> ++#ifdef HAVE_SYS_PARAM_H
> ++# include <sys/param.h>
> ++#endif
> ++])
> +   AC_CHECK_LIB(dl, dlopen, LIBDL=-ldl)
> +   AC_CHECK_LIB(pam, pam_authenticate, LIBPAM=-lpam)
> +   if test "$ac_cv_lib_pam_pam_authenticate" = yes ; then
> +@@ -587,7 +600,7 @@ AC_HEADER_DIRENT
> + AC_CHECK_HEADERS([arpa/nameser.h errno.h fcntl.h features.h \
> + 		  glob.h memory.h netinet/ether.h netinet/in_systm.h \
> + 		  netinet/ip.h netinet/ip_icmp.h netinet/ip_var.h \
> +-		  security/pam_appl.h shadow.h \
> ++		  shadow.h \
> + 		  stdarg.h stdlib.h string.h stropts.h sys/tty.h \
> + 		  sys/utsname.h sys/ptyvar.h sys/msgbuf.h sys/filio.h \
> + 		  sys/ioctl_compat.h sys/cdefs.h sys/stream.h sys/mkdev.h \
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> index db07cd6..adfc940 100644
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> @@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
>              file://telnet.xinetd.inetutils \
>              file://tftpd.xinetd.inetutils \
>              file://inetutils-1.9-PATH_PROCNET_DEV.patch \
> +           file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
>   "
>   
>   SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
> @@ -29,9 +30,12 @@ inherit autotools gettext update-alternatives texinfo
>   SRC_URI += "${@base_contains('DISTRO_FEATURES', 'ipv6', '', 'file://fix-disable-ipv6.patch', d)}"
>   noipv6="${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6 gl_cv_socket_ipv6=no', d)}"
>   
> -PACKAGECONFIG ??= "ftp uucpd"
> +PACKAGECONFIG ??= "ftp uucpd \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
> +                  "
>   PACKAGECONFIG[ftp] = "--enable-ftp,--disable-ftp,readline"
>   PACKAGECONFIG[uucpd] = "--enable-uucpd,--disable-uucpd,readline"
> +PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
>   
>   EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
>           ${noipv6} \


-- 
Regards,
Neil | Kai Kang


