Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B40290@freescale.com>) id 1TWkUT-0005MJ-4I
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Nov 2012 10:03:05 +0100
Received: from mail78-va3-R.bigfish.com (10.7.14.252) by
	VA3EHSOBE009.bigfish.com (10.7.40.29) with Microsoft SMTP Server id
	14.1.225.23; Fri, 9 Nov 2012 07:49:01 +0000
Received: from mail78-va3 (localhost [127.0.0.1])	by mail78-va3-R.bigfish.com
	(Postfix) with ESMTP id EBDBC2005C	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  9 Nov 2012 07:49:00 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zz98dI9371I936eI1432I4015Izz1de0h1202h1d1ah1d2ah10d2mzz8275bh8275dhz2dh2a8h668h839hd25he5bhf0ah1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh1155h)
Received: from mail78-va3 (localhost.localdomain [127.0.0.1]) by mail78-va3
	(MessageSwitch) id 1352447339588711_25004;
	Fri,  9 Nov 2012 07:48:59 +0000 (UTC)
Received: from VA3EHSMHS040.bigfish.com (unknown [10.7.14.236])	by
	mail78-va3.bigfish.com (Postfix) with ESMTP id 8C61B26003F	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  9 Nov 2012 07:48:59 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS040.bigfish.com
	(10.7.99.50) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 9 Nov 2012 07:48:59 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Fri, 9 Nov 2012 07:48:58 +0000
Received: from [10.192.208.249] (guo-desktop.ap.freescale.net
	[10.192.208.249])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id qA97msp7031703;	Fri, 9 Nov 2012 00:48:56 -0700
Message-ID: <509CB65F.6070808@freescale.com>
Date: Fri, 9 Nov 2012 15:53:03 +0800
From: chunrongguo <b40290@freescale.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1351755464-13839-1-git-send-email-b40290@freescale.com>
In-Reply-To: <1351755464-13839-1-git-send-email-b40290@freescale.com>
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>, Liu,
	Ting-B28495 <B28495@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [meta-oe] inetutils: fix configure error under automake 1.12
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
X-List-Received-Date: Fri, 09 Nov 2012 09:03:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Ping!


Thanks,

Chunrong

On Thursday, November 01, 2012 03:37 PM, Chunrong Guo wrote:
> From: chunrong <b40290@freescale.com>
>
>      * fix the following error :
>      configure.ac:572: error: automatic de-ANSI-fication support has been removed
>      | /tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12/protos.m4:10: AM_C_PROTOTYPES is expanded from...
>      | configure.ac:572: the top level
>      | autom4te: m4 failed with exit status: 1
>      | aclocal: error: tmp/sysroots/x86_64-linux/usr/bin/autom4te failed with exit status: 1
>      | autoreconf: aclocal failed with exit status: 1
>      | ERROR: autoreconf execution failed.
>      | ERROR: Function failed: do_configure (see inetutils-1.8-+fsl/temp/log.do_configure.23693 for further information)
>       ERROR: meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb, do_configure) failed with exit code '1'
>      *  automake 1.12 removes support for AM_C_PROTOTYPES.
>
> Signed-off-by: chunrong <b40290@freescale.com>
> ---
>   .../inetutils-1.8/disable-pre-ANSI-compilers.patch |   11 +++++++++++
>   .../inetutils/inetutils-1.8/remove_gets.patch      |   13 +++++++++++++
>   .../inetutils/inetutils_1.8.bb                     |    4 ++++
>   3 files changed, 28 insertions(+), 0 deletions(-)
>   create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/disable-pre-ANSI-compilers.patch
>   create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/remove_gets.patch
>
> diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/disable-pre-ANSI-compilers.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/disable-pre-ANSI-compilers.patch
> new file mode 100644
> index 0000000..b945f3a
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/disable-pre-ANSI-compilers.patch
> @@ -0,0 +1,11 @@
> +--- inetutils-1.8.org/configure.ac	2012-10-23 02:05:20.516386701 -0500
> ++++ inetutils-1.8/configure.ac	2012-10-25 21:31:10.602591484 -0500
> +@@ -569,7 +569,7 @@
> + IU_CHECK_MEMBERS([struct stat.st_blksize])
> +
> + ### Checks for compiler characteristics.
> +-AM_C_PROTOTYPES dnl FIXME: Does inetutils even compile on pre-ANSI compilers?
> ++#AM_C_PROTOTYPES dnl FIXME: Does inetutils even compile on pre-ANSI compilers?
> + AC_C_CONST
> +
> + dnl See if `weak refs' are possible; these make it possible (with shared
> diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/remove_gets.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/remove_gets.patch
> new file mode 100644
> index 0000000..f8081a2
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/remove_gets.patch
> @@ -0,0 +1,13 @@
> +--- inetutils-1.8.org/lib/stdio.in.h	2010-05-15 06:35:16.000000000 -0500
> ++++ inetutils-1.8/lib/stdio.in.h	2012-10-25 22:56:43.198607472 -0500
> +@@ -138,8 +138,10 @@
> + /* It is very rare that the developer ever has full control of stdin,
> +    so any use of gets warrants an unconditional warning.  Assume it is
> +    always declared, since it is required by C89.  */
> ++#if defined gets
> + #undef gets
> + _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
> ++#endif
> +
> + #if @GNULIB_FOPEN@
> + # if @REPLACE_FOPEN@
> diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb b/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
> index ce0df82..761b2e6 100644
> --- a/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
> +++ b/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
> @@ -8,6 +8,8 @@ LICENSE = "GPLv3"
>   
>   LIC_FILES_CHKSUM = "file://COPYING;md5=adefda309052235aa5d1e99ce7557010"
>   
> +PR = "r1"
> +
>   SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
>              file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
>              file://inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch \
> @@ -18,6 +20,8 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
>              file://inetutils-1.8-1004-detect-fork-support.patch \
>              file://inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch \
>              file://fix-disable-ipv6.patch \
> +           file://disable-pre-ANSI-compilers.patch \
> +           file://remove_gets.patch \
>   "
>   SRC_URI[md5sum] = "ad8fdcdf1797b9ca258264a6b04e48fd"
>   SRC_URI[sha256sum] = "c8500baee04b9ea408c9e65e24ad7f5b41e7d96d42fb1d29abf25b52b68311c7"




