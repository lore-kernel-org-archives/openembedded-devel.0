Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OJXaQ-0007Yk-MN
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 21:57:24 +0200
Received: by fxm9 with SMTP id 9so440016fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jun 2010 12:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=YXwPMSIoBLYldB7u21e9BrA3i7Um7LidVs1qAKq7S4M=;
	b=jVtyxJcciPNqY4/yTbpBUT/bgMdadTev+wdwaO0l3cEdergbbbeFQPYVSfbzXXcVL8
	87hLAfEnFG1zEgyzofJ0W8/aeT0NlBxpt8CWCA28G7ELfXIwT0vx2RDd9yobOuZ5BB/F
	D7gZJPt/rLeOiBbbqTbw7oc5TLmRCtdpsppIQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=L+XplO8Yb/KLtnRHK1ZEYf1CJ3TT4x091BzEHyTDn+Rjm6PIz0AgH52I2Tt628ULDs
	XBiFNPH/VaIn2lZqsODjjlGPkayjumlBJXqK8UShqJ0MYBmLZEMOEXy2BtQm8ilcZ/xs
	a0S/ivYtVMSfOyJ6tKQ/6Y/PxRgepRKmYyXQs=
Received: by 10.223.143.20 with SMTP id s20mr7619652fau.38.1275421984538;
	Tue, 01 Jun 2010 12:53:04 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id g10sm48582485fai.0.2010.06.01.12.53.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 01 Jun 2010 12:53:03 -0700 (PDT)
Date: Tue, 1 Jun 2010 21:52:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100601195258.GF5446@jama>
References: <E1OJVCz-0003yI-GC@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1OJVCz-0003yI-GC@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Andrea Adami : klibc: fix packaging
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
X-List-Received-Date: Tue, 01 Jun 2010 19:57:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 01, 2010 at 05:24:57PM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: e020cd9b2c61fd19bb55ec3fd38abcfdbd3f651c
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=e020cd9b2c61fd19bb55ec3fd38abcfdbd3f651c
> 
> Author: Andrea Adami <andrea.adami@gmail.com>
> Date:   Tue Jun  1 19:20:59 2010 +0200
> 
> klibc: fix packaging
> 
> * insmod was removed after klibc_1.5
> * dmesg, sync and ls have been added with 1.5.15
> * wc and losetup are provided by OpenEmbedded patches
> * bump INC_PR and recipe's PR to propagate the changes to klibc-utils

Why this change?

definition of extra PACKAGES and corresponding FILES_ won't harm, except
showing NOTE about not creating empty package ie klibc-utils-ls.

That's why I moved all definitions to one place (klibc-utils.inc) and
only do_install for utils not available in _all_ versions were in
do_install_append for particular version as described in that comment
now removed, and described in cleaning commit
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=7f2c3321e5eb78d70d9ab0a38caccb4fb3911eeb
* reuse as much .inc as possible
* added klibc-utils.inc with common do_install_append for installing all
* utils added PACKAGES + FILES variables for them (union for all klibc versions).

I won't NACK this, but I'm not happy about this change (needs to copy
duplicite stuff _again_ for all versions newer then 1.5.18 which I would
expect will have ls/sync/dmesg..

Regards,

> 
> ---
> 
>  recipes/klibc/klibc-common.inc |    2 +-
>  recipes/klibc/klibc-utils.inc  |   18 +-----------------
>  recipes/klibc/klibc.inc        |    4 ++--
>  recipes/klibc/klibc_1.5.18.bb  |    2 +-
>  recipes/klibc/klibc_1.5.18.inc |    8 ++++++++
>  recipes/klibc/klibc_1.5.bb     |    2 +-
>  recipes/klibc/klibc_1.5.inc    |    3 +++
>  7 files changed, 17 insertions(+), 22 deletions(-)
> 
> diff --git a/recipes/klibc/klibc-common.inc b/recipes/klibc/klibc-common.inc
> index 7b7a3cb..1f3aab1 100644
> --- a/recipes/klibc/klibc-common.inc
> +++ b/recipes/klibc/klibc-common.inc
> @@ -9,7 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/libs/klibc/${KLIBC_FETCHDIR}/klibc-${PV
>  
>  S = "${WORKDIR}/klibc-${PV}"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -INC_PR = "r14"
> +INC_PR = "r15"
>  
>  KLIBC_ARCH = '${TARGET_ARCH}'
>  KLIBC_ARCH_armeb = 'arm'
> diff --git a/recipes/klibc/klibc-utils.inc b/recipes/klibc/klibc-utils.inc
> index 7bbcee3..930eb60 100644
> --- a/recipes/klibc/klibc-utils.inc
> +++ b/recipes/klibc/klibc-utils.inc
> @@ -40,16 +40,6 @@ do_install_append() {
>          ln -s gzip ${D}${base_bindir}/zcat
>  }
>  
> -# only in 1.5
> -# install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/insmod ${D}${base_bindir}
> -
> -# only in >= 1.5.15
> -# install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/dmesg ${D}${base_bindir}
> -# install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/sync ${D}${base_bindir}
> -
> -# only in >= 1.5.15+1.5.16
> -# install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/ls ${D}${base_bindir}
> -
>  PACKAGES += "${KLIBC_UTILS_PKGNAME}-sh \
>               ${KLIBC_UTILS_PKGNAME}-gzip \
>               ${KLIBC_UTILS_PKGNAME}-kinit \
> @@ -62,7 +52,6 @@ PACKAGES += "${KLIBC_UTILS_PKGNAME}-sh \
>               ${KLIBC_UTILS_PKGNAME}-chroot \
>               ${KLIBC_UTILS_PKGNAME}-cpio \
>               ${KLIBC_UTILS_PKGNAME}-dd \
> -             ${KLIBC_UTILS_PKGNAME}-dmesg \
>               ${KLIBC_UTILS_PKGNAME}-false \
>               ${KLIBC_UTILS_PKGNAME}-halt \
>               ${KLIBC_UTILS_PKGNAME}-kill \
> @@ -78,14 +67,12 @@ PACKAGES += "${KLIBC_UTILS_PKGNAME}-sh \
>               ${KLIBC_UTILS_PKGNAME}-readlink \
>               ${KLIBC_UTILS_PKGNAME}-reboot \
>               ${KLIBC_UTILS_PKGNAME}-sleep \
> -             ${KLIBC_UTILS_PKGNAME}-sync \
>               ${KLIBC_UTILS_PKGNAME}-true \
>               ${KLIBC_UTILS_PKGNAME}-umount \
>               ${KLIBC_UTILS_PKGNAME}-uname \
>               ${KLIBC_UTILS_PKGNAME}-modprobe \
>               ${KLIBC_UTILS_PKGNAME}-losetup \
> -             ${KLIBC_UTILS_PKGNAME}-wc \
> -             ${KLIBC_UTILS_PKGNAME}-ls"
> +             ${KLIBC_UTILS_PKGNAME}-wc"
>  
>  FILES_${KLIBC_UTILS_PKGNAME}-sh = "${base_bindir}/sh"
>  FILES_${KLIBC_UTILS_PKGNAME}-gzip = "${base_bindir}/gzip ${base_bindir}/gunzip ${base_bindir}/zcat"
> @@ -99,7 +86,6 @@ FILES_${KLIBC_UTILS_PKGNAME}-cat = "${base_bindir}/cat"
>  FILES_${KLIBC_UTILS_PKGNAME}-chroot = "${base_bindir}/chroot"
>  FILES_${KLIBC_UTILS_PKGNAME}-cpio = "${base_bindir}/cpio"
>  FILES_${KLIBC_UTILS_PKGNAME}-dd = "${base_bindir}/dd"
> -FILES_${KLIBC_UTILS_PKGNAME}-dmesg = "${base_bindir}/dmesg"
>  FILES_${KLIBC_UTILS_PKGNAME}-false = "${base_bindir}/false"
>  FILES_${KLIBC_UTILS_PKGNAME}-halt = "${base_bindir}/halt"
>  FILES_${KLIBC_UTILS_PKGNAME}-kill = "${base_bindir}/kill"
> @@ -115,11 +101,9 @@ FILES_${KLIBC_UTILS_PKGNAME}-poweroff = "${base_bindir}/poweroff"
>  FILES_${KLIBC_UTILS_PKGNAME}-readlink = "${base_bindir}/readlink"
>  FILES_${KLIBC_UTILS_PKGNAME}-reboot = "${base_bindir}/reboot"
>  FILES_${KLIBC_UTILS_PKGNAME}-sleep = "${base_bindir}/sleep"
> -FILES_${KLIBC_UTILS_PKGNAME}-sync = "${base_bindir}/sync"
>  FILES_${KLIBC_UTILS_PKGNAME}-true = "${base_bindir}/true"
>  FILES_${KLIBC_UTILS_PKGNAME}-umount = "${base_bindir}/umount"
>  FILES_${KLIBC_UTILS_PKGNAME}-uname = "${base_bindir}/uname"
>  FILES_${KLIBC_UTILS_PKGNAME}-modprobe = "${base_sbindir}/modprobe"
>  FILES_${KLIBC_UTILS_PKGNAME}-losetup = "${base_bindir}/losetup"
>  FILES_${KLIBC_UTILS_PKGNAME}-wc = "${base_bindir}/wc"
> -FILES_${KLIBC_UTILS_PKGNAME}-ls = "${base_bindir}/ls"
> diff --git a/recipes/klibc/klibc.inc b/recipes/klibc/klibc.inc
> index 9ae6c5b..8ed976a 100644
> --- a/recipes/klibc/klibc.inc
> +++ b/recipes/klibc/klibc.inc
> @@ -37,9 +37,10 @@ RDEPENDS_${KLIBC_UTILS_PKGNAME}-dd = "${PN} (=${PV}-${PR})"
>  RDEPENDS_${KLIBC_UTILS_PKGNAME}-dmesg = "${PN} (=${PV}-${PR})"
>  RDEPENDS_${KLIBC_UTILS_PKGNAME}-false = "${PN} (=${PV}-${PR})"
>  RDEPENDS_${KLIBC_UTILS_PKGNAME}-halt = "${PN} (=${PV}-${PR})"
> -RDEPENDS_${KLIBC_UTILS_PKGNAME}-insmod = "${PN} (=${PV}-${PR})"
>  RDEPENDS_${KLIBC_UTILS_PKGNAME}-kill = "${PN} (=${PV}-${PR})"
> +RDEPENDS_${KLIBC_UTILS_PKGNAME}-insmod = "${PN} (=${PV}-${PR})"
>  RDEPENDS_${KLIBC_UTILS_PKGNAME}-ln = "${PN} (=${PV}-${PR})"
> +RDEPENDS_${KLIBC_UTILS_PKGNAME}-ls = "${PN} (=${PV}-${PR})"
>  RDEPENDS_${KLIBC_UTILS_PKGNAME}-minips = "${PN} (=${PV}-${PR})"
>  RDEPENDS_${KLIBC_UTILS_PKGNAME}-mkdir = "${PN} (=${PV}-${PR})"
>  RDEPENDS_${KLIBC_UTILS_PKGNAME}-mkfifo = "${PN} (=${PV}-${PR})"
> @@ -58,4 +59,3 @@ RDEPENDS_${KLIBC_UTILS_PKGNAME}-uname = "${PN} (=${PV}-${PR})"
>  RDEPENDS_${KLIBC_UTILS_PKGNAME}-modprobe = "${PN} (=${PV}-${PR})"
>  RDEPENDS_${KLIBC_UTILS_PKGNAME}-losetup = "${PN} (=${PV}-${PR})"
>  RDEPENDS_${KLIBC_UTILS_PKGNAME}-wc = "${PN} (=${PV}-${PR})"
> -RDEPENDS_${KLIBC_UTILS_PKGNAME}-ls = "${PN} (=${PV}-${PR})"
> diff --git a/recipes/klibc/klibc_1.5.18.bb b/recipes/klibc/klibc_1.5.18.bb
> index 694bf58..7520cad 100644
> --- a/recipes/klibc/klibc_1.5.18.bb
> +++ b/recipes/klibc/klibc_1.5.18.bb
> @@ -1,3 +1,3 @@
>  require klibc.inc
>  require klibc_${PV}.inc
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
> diff --git a/recipes/klibc/klibc_1.5.18.inc b/recipes/klibc/klibc_1.5.18.inc
> index 2175643..cad3bdb 100644
> --- a/recipes/klibc/klibc_1.5.18.inc
> +++ b/recipes/klibc/klibc_1.5.18.inc
> @@ -42,3 +42,11 @@ do_install_append() {
>          install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/sync ${D}${base_bindir}
>          install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/ls ${D}${base_bindir}
>  }
> +
> +PACKAGES += "${KLIBC_UTILS_PKGNAME}-dmesg \
> +             ${KLIBC_UTILS_PKGNAME}-sync \
> +             ${KLIBC_UTILS_PKGNAME}-ls"
> +
> +FILES_${KLIBC_UTILS_PKGNAME}-dmesg = "${base_bindir}/dmesg"
> +FILES_${KLIBC_UTILS_PKGNAME}-sync = "${base_bindir}/sync"
> +FILES_${KLIBC_UTILS_PKGNAME}-ls = "${base_bindir}/ls"
> diff --git a/recipes/klibc/klibc_1.5.bb b/recipes/klibc/klibc_1.5.bb
> index 4b299f2..694bf58 100644
> --- a/recipes/klibc/klibc_1.5.bb
> +++ b/recipes/klibc/klibc_1.5.bb
> @@ -1,3 +1,3 @@
>  require klibc.inc
>  require klibc_${PV}.inc
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
> diff --git a/recipes/klibc/klibc_1.5.inc b/recipes/klibc/klibc_1.5.inc
> index b00f02c..c8ed5f6 100644
> --- a/recipes/klibc/klibc_1.5.inc
> +++ b/recipes/klibc/klibc_1.5.inc
> @@ -17,3 +17,6 @@ SRC_URI[sha256sum] = "27000ba4bc73a5977502b27d7036df24dd6ab94a1c33b8f5d6d54ba627
>  do_install_append() {
>          install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/insmod ${D}${base_bindir}
>  }
> +
> +PACKAGES += "${KLIBC_UTILS_PKGNAME}-insmod"
> +FILES_${KLIBC_UTILS_PKGNAME}-insmod = "${base_bindir}/insmod"
> 
> 
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


