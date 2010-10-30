Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PBz5m-0001fO-QR
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 02:14:45 +0200
Received: by pwi3 with SMTP id 3so721459pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 17:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=mCaVxu8ucmfjUq9uA9QWBAKYBT8JrU1rNDo2yxLKQpA=;
	b=UMxGBtU27OYSZQeSXdqU507GPRevNCX9tYcl8lMC8pCm3AQ4Nvk+kENVOfltg8IMfS
	tBxQxCd2chuk8w+LnKRZbXZ9irsYIh7yypBTECb7ozafGNVDJgApS/E/VbqPPJu43X8J
	MQDgnddVodceKsN50tmZ3o6HS3wkAdBu3nfMc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=Hv5SU7UPRX3fzpWsXWexdZXhraqI5TJiBhs8ofBPaSVZFxeqEvcrR3JCi+IMlsl9FT
	btKPLgYcHubxGptWylLPO8DUgYiiNOJCpqIQye+JCBppLIEEoSGuE1GV5nlwJ++QRqiB
	HH78lxxIBJUFTRm88SWPI9xcV54JSPYU09ldA=
Received: by 10.142.136.3 with SMTP id j3mr1839812wfd.101.1288397635396;
	Fri, 29 Oct 2010 17:13:55 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w42sm2735851wfh.3.2010.10.29.17.13.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 29 Oct 2010 17:13:54 -0700 (PDT)
Date: Fri, 29 Oct 2010 17:13:48 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101030001348.GA2437@gmail.com>
References: <1288387543-1277-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1288387543-1277-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/7] busybox: factorize recipes
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
X-List-Received-Date: Sat, 30 Oct 2010 00:14:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (29/10/10 23:25), Eric Bénard wrote:
> Signed-off-by: Eric Bénard <eric@eukrea.com>

For patch 1 - 5

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/busybox/busybox_1.13.2.bb |   45 ++-------------------------
>  recipes/busybox/busybox_1.14.3.bb |   47 ++---------------------------
>  recipes/busybox/busybox_1.15.3.bb |   48 +++---------------------------
>  recipes/busybox/busybox_1.16.2.bb |   59 ++-----------------------------------
>  recipes/busybox/busybox_1.17.1.bb |   55 +---------------------------------
>  recipes/busybox/busybox_1.1x.inc  |   53 +++++++++++++++++++++++++++++++++
>  6 files changed, 69 insertions(+), 238 deletions(-)
>  create mode 100644 recipes/busybox/busybox_1.1x.inc
> 
> diff --git a/recipes/busybox/busybox_1.13.2.bb b/recipes/busybox/busybox_1.13.2.bb
> index a3acceb..0ffcb7f 100644
> --- a/recipes/busybox/busybox_1.13.2.bb
> +++ b/recipes/busybox/busybox_1.13.2.bb
> @@ -1,8 +1,8 @@
>  require busybox.inc
> +require busybox_1.1x.inc
>  PR = "${INC_PR}.3"
>  
> -SRC_URI = "\
> -  http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
> +SRC_URI += "\
>    file://busybox-1.13.2-awk.patch \
>    file://busybox-1.13.2-depmod.patch \
>    file://busybox-1.13.2-init.patch \
> @@ -16,45 +16,8 @@ SRC_URI = "\
>    file://busybox-1.13.2-unzip.patch \
>    file://busybox-1.13.2-wget.patch \
>    file://busybox-1.13.2-make382.patch \
> -  file://fdisk_nios2.patch \
> -  \
> -  file://udhcpscript.patch \
> -  file://udhcpc-fix-nfsroot.patch \
>    file://udhcpc-background.patch \
> -  file://B921600.patch \
> -  file://get_header_tar.patch \
> -  file://busybox-appletlib-dependency.patch \
> -  file://find-touchscreen.sh \
> -  file://busybox-cron \
> -  file://busybox-httpd \
> -  file://busybox-udhcpd \
> -  file://default.script file://simple.script \
> -  file://hwclock.sh \
> -  file://hwclock-default \
> -  file://mount.busybox \
> -  file://mountall \
> -  file://syslog \
> -  file://syslog.conf \
> -  file://umount.busybox \
> -  file://defconfig \
> -  file://mdev \
> -  file://mdev.conf \
>  "
> -SRC_URI[tarball.md5sum] = "9e2a604d18bef219a5a6bf3acf78b9e1"
> -SRC_URI[tarball.sha256sum] = "927774408bd982dd246fb716bb2e646ab0708ce321b42c5e271dc98c1f5d1dc8"
>  
> -EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
> -
> -do_configure_prepend () {
> -	if [ "${TARGET_ARCH}" = "avr32" ] ; then
> -		sed -i s:CONFIG_FEATURE_OSF_LABEL=y:CONFIG_FEATURE_OSF_LABEL=n: ${WORKDIR}/defconfig
> -	fi
> -}
> -
> -do_install_append() {
> -    install -m 0644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/
> -    install -d ${D}${sysconfdir}/init.d/
> -    install -d ${D}${sysconfdir}/mdev
> -    install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev/
> -    install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/
> -}
> +SRC_URI[md5sum] = "9e2a604d18bef219a5a6bf3acf78b9e1"
> +SRC_URI[sha256sum] = "927774408bd982dd246fb716bb2e646ab0708ce321b42c5e271dc98c1f5d1dc8"
> diff --git a/recipes/busybox/busybox_1.14.3.bb b/recipes/busybox/busybox_1.14.3.bb
> index ff706f4..2fac528 100644
> --- a/recipes/busybox/busybox_1.14.3.bb
> +++ b/recipes/busybox/busybox_1.14.3.bb
> @@ -1,49 +1,8 @@
>  require busybox.inc
> +require busybox_1.1x.inc
>  PR = "${INC_PR}.1"
>  
>  DEFAULT_PREFERENCE = "-1"
>  
> -SRC_URI = "\
> -  http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
> -  file://fdisk_nios2.patch \
> -\
> -  file://udhcpscript.patch \
> -  file://udhcpc-fix-nfsroot.patch \
> -  file://B921600.patch \
> -  file://get_header_tar.patch \
> -  file://busybox-appletlib-dependency.patch \
> -  file://find-touchscreen.sh \
> -  file://busybox-cron \
> -  file://busybox-httpd \
> -  file://busybox-udhcpd \
> -  file://default.script file://simple.script \
> -  file://hwclock.sh \
> -  file://hwclock-default \
> -  file://mount.busybox \
> -  file://mountall \
> -  file://syslog \
> -  file://syslog.conf \
> -  file://umount.busybox \
> -  file://defconfig \
> -  file://mdev \
> -  file://mdev.conf \
> -"
> -
> -SRC_URI[tarball.md5sum] = "d170bf5f97a41aec3a505eab690d5699"
> -SRC_URI[tarball.sha256sum] = "e94df4f9063a1951b4e94e76148ed80e921737a89d97bc2c310a2a8927982e90"
> -
> -EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
> -
> -do_configure_prepend () {
> -	if [ "${TARGET_ARCH}" = "avr32" ] ; then
> -		sed -i s:CONFIG_FEATURE_OSF_LABEL=y:CONFIG_FEATURE_OSF_LABEL=n: ${WORKDIR}/defconfig
> -	fi
> -}
> -
> -do_install_append() {
> -    install -m 0644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/
> -    install -d ${D}${sysconfdir}/init.d/
> -    install -d ${D}${sysconfdir}/mdev
> -    install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev/
> -    install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/
> -}
> +SRC_URI[md5sum] = "d170bf5f97a41aec3a505eab690d5699"
> +SRC_URI[sha256sum] = "e94df4f9063a1951b4e94e76148ed80e921737a89d97bc2c310a2a8927982e90"
> diff --git a/recipes/busybox/busybox_1.15.3.bb b/recipes/busybox/busybox_1.15.3.bb
> index 0924d3d..5106a58 100644
> --- a/recipes/busybox/busybox_1.15.3.bb
> +++ b/recipes/busybox/busybox_1.15.3.bb
> @@ -1,55 +1,17 @@
>  require busybox.inc
> +require busybox_1.1x.inc
>  PR = "${INC_PR}.4"
>  
> -SRC_URI = "\
> -  http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
> -  file://fdisk_nios2.patch \
> -  \
> -  file://udhcpscript.patch \
> -  file://udhcpc-fix-nfsroot.patch \
> -  file://B921600.patch \
> -  file://get_header_tar.patch \
> -  file://busybox-appletlib-dependency.patch \
> +SRC_URI += "\
>    file://0000-wget-no-check-certificate.patch \
> -  file://find-touchscreen.sh \
> -  file://busybox-cron \
> -  file://busybox-httpd \
> -  file://busybox-udhcpd \
> -  file://default.script file://simple.script \
> -  file://hwclock.sh \
> -  file://hwclock-default \
> -  file://mount.busybox \
> -  file://mountall \
> -  file://syslog \
> -  file://syslog.conf \
> -  file://umount.busybox \
> -  file://defconfig \
> -  file://mdev \
> -  file://mdev.conf \
>  "
> -SRC_URI[tarball.md5sum] = "6059ac9456de6fb18dc8ee4cd0ec9240"
> -SRC_URI[tarball.sha256sum] = "d74020ad2cc5a4dcc5109c44dbd0e22582d6ce42954b0f1ff29763c8c0ff03cb"
> +
> +SRC_URI[md5sum] = "6059ac9456de6fb18dc8ee4cd0ec9240"
> +SRC_URI[sha256sum] = "d74020ad2cc5a4dcc5109c44dbd0e22582d6ce42954b0f1ff29763c8c0ff03cb"
>  
>  # gcc 4.5 has this bug on thumb
>  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44557
>  # so add -fomit-frame-pointer
>  # this will be removed once the above bug is fixed.
>  
> -
>  CFLAGS_append = " -fomit-frame-pointer"
> -
> -EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
> -
> -do_configure_prepend () {
> -	if [ "${TARGET_ARCH}" = "avr32" ] ; then
> -		sed -i s:CONFIG_FEATURE_OSF_LABEL=y:CONFIG_FEATURE_OSF_LABEL=n: ${WORKDIR}/defconfig
> -	fi
> -}
> -
> -do_install_append() {
> -    install -m 0644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/
> -    install -d ${D}${sysconfdir}/init.d/
> -    install -d ${D}${sysconfdir}/mdev
> -    install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev/
> -    install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/
> -}
> diff --git a/recipes/busybox/busybox_1.16.2.bb b/recipes/busybox/busybox_1.16.2.bb
> index b3fee02..b4aaa74 100644
> --- a/recipes/busybox/busybox_1.16.2.bb
> +++ b/recipes/busybox/busybox_1.16.2.bb
> @@ -1,62 +1,9 @@
>  require busybox.inc
> +require busybox_1.1x.inc
>  PR = "${INC_PR}.3"
>  
>  DEFAULT_PREFERENCE = "-1"
>  DEFAULT_PREFERENCE_shr = "1"
>  
> -SRC_URI = "\
> -  http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
> -  file://fdisk_nios2.patch \
> -  \
> -  file://udhcpscript.patch \
> -  file://udhcpc-fix-nfsroot.patch \
> -  file://B921600.patch \
> -  file://get_header_tar.patch \
> -  file://busybox-appletlib-dependency.patch \
> -#  file://0000-wget-no-check-certificate.patch \
> -  file://find-touchscreen.sh \
> -  file://busybox-cron \
> -  file://busybox-httpd \
> -  file://busybox-udhcpd \
> -  file://default.script file://simple.script \
> -  file://hwclock.sh \
> -  file://hwclock-default \
> -  file://mount.busybox \
> -  file://mountall \
> -  file://syslog \
> -  file://syslog.conf \
> -  file://umount.busybox \
> -  file://defconfig \
> -  file://mdev \
> -  file://mdev.conf \
> -"
> -
> -SRC_URI[tarball.md5sum] = "2ba980f720a5bdce4ec05423519acc35"
> -SRC_URI[tarball.sha256sum] = "3bf1b1a41294d25335abdd10c65cffdb01c36337ca011f1b38c6ad89590115ba"
> -
> -EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
> -
> -do_configure_prepend () {
> -	if [ "${TARGET_ARCH}" = "avr32" ] ; then
> -		sed -i s:CONFIG_FEATURE_OSF_LABEL=y:CONFIG_FEATURE_OSF_LABEL=n: ${WORKDIR}/defconfig
> -	fi
> -}
> -
> -do_install_append() {
> -    install -m 0644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/
> -    install -d ${D}${sysconfdir}/init.d/
> -    install -d ${D}${sysconfdir}/mdev
> -    install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev/
> -    install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/
> -
> -    if grep "CONFIG_UDHCPD=y" ${WORKDIR}/defconfig; then
> -          install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
> -    fi
> -
> -    if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
> -          install -d ${D}${sysconfdir}/udhcpc.d
> -          install -d ${D}${datadir}/udhcpc
> -          install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
> -          install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
> -    fi
> -}
> +SRC_URI[md5sum] = "2ba980f720a5bdce4ec05423519acc35"
> +SRC_URI[sha256sum] = "3bf1b1a41294d25335abdd10c65cffdb01c36337ca011f1b38c6ad89590115ba"
> diff --git a/recipes/busybox/busybox_1.17.1.bb b/recipes/busybox/busybox_1.17.1.bb
> index 5a475b2..c16251c 100644
> --- a/recipes/busybox/busybox_1.17.1.bb
> +++ b/recipes/busybox/busybox_1.17.1.bb
> @@ -1,61 +1,8 @@
>  require busybox.inc
> +require busybox_1.1x.inc
>  PR = "${INC_PR}"
>  
>  DEFAULT_PREFERENCE = "-1"
>  
> -SRC_URI = "\
> -  http://www.busybox.net/downloads/busybox-${PV}.tar.bz2 \
> -  file://fdisk_nios2.patch \
> -  \
> -  file://udhcpscript.patch \
> -  file://udhcpc-fix-nfsroot.patch \
> -  file://B921600.patch \
> -  file://get_header_tar.patch \
> -  file://busybox-appletlib-dependency.patch \
> -#  file://0000-wget-no-check-certificate.patch \
> -  file://find-touchscreen.sh \
> -  file://busybox-cron \
> -  file://busybox-httpd \
> -  file://busybox-udhcpd \
> -  file://default.script file://simple.script \
> -  file://hwclock.sh \
> -  file://hwclock-default \
> -  file://mount.busybox \
> -  file://mountall \
> -  file://syslog \
> -  file://syslog.conf \
> -  file://umount.busybox \
> -  file://defconfig \
> -  file://mdev \
> -  file://mdev.conf \
> -"
> -
>  SRC_URI[md5sum] = "c7fe7533b7fc4018b0b49a05ee0ee601"
>  SRC_URI[sha256sum] = "bf9177810d7e151b0e662477c33b9afd062570e6298ec46f2a8397a6a839d164"
> -
> -EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
> -
> -do_configure_prepend () {
> -	if [ "${TARGET_ARCH}" = "avr32" ] ; then
> -		sed -i s:CONFIG_FEATURE_OSF_LABEL=y:CONFIG_FEATURE_OSF_LABEL=n: ${WORKDIR}/defconfig
> -	fi
> -}
> -
> -do_install_append() {
> -    install -m 0644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/
> -    install -d ${D}${sysconfdir}/init.d/
> -    install -d ${D}${sysconfdir}/mdev
> -    install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev/
> -    install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/
> -
> -    if grep "CONFIG_UDHCPD=y" ${WORKDIR}/defconfig; then
> -          install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
> -    fi
> -
> -    if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
> -          install -d ${D}${sysconfdir}/udhcpc.d
> -          install -d ${D}${datadir}/udhcpc
> -          install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
> -          install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
> -    fi
> -}
> diff --git a/recipes/busybox/busybox_1.1x.inc b/recipes/busybox/busybox_1.1x.inc
> new file mode 100644
> index 0000000..df536f6
> --- /dev/null
> +++ b/recipes/busybox/busybox_1.1x.inc
> @@ -0,0 +1,53 @@
> +require busybox.inc
> +
> +SRC_URI = "\
> +  http://www.busybox.net/downloads/busybox-${PV}.tar.bz2 \
> +  file://fdisk_nios2.patch \
> +  file://udhcpscript.patch \
> +  file://udhcpc-fix-nfsroot.patch \
> +  file://B921600.patch \
> +  file://get_header_tar.patch \
> +  file://busybox-appletlib-dependency.patch \
> +  file://find-touchscreen.sh \
> +  file://busybox-cron \
> +  file://busybox-httpd \
> +  file://busybox-udhcpd \
> +  file://default.script file://simple.script \
> +  file://hwclock.sh \
> +  file://hwclock-default \
> +  file://mount.busybox \
> +  file://mountall \
> +  file://syslog \
> +  file://syslog.conf \
> +  file://umount.busybox \
> +  file://defconfig \
> +  file://mdev \
> +  file://mdev.conf \
> +"
> +
> +EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
> +
> +do_configure_prepend () {
> +	if [ "${TARGET_ARCH}" = "avr32" ] ; then
> +		sed -i s:CONFIG_FEATURE_OSF_LABEL=y:CONFIG_FEATURE_OSF_LABEL=n: ${WORKDIR}/defconfig
> +	fi
> +}
> +
> +do_install_append() {
> +    install -m 0644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/
> +    install -d ${D}${sysconfdir}/init.d/
> +    install -d ${D}${sysconfdir}/mdev
> +    install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev/
> +    install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/
> +
> +    if grep "CONFIG_UDHCPD=y" ${WORKDIR}/defconfig; then
> +          install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
> +    fi
> +
> +    if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
> +          install -d ${D}${sysconfdir}/udhcpc.d
> +          install -d ${D}${datadir}/udhcpc
> +          install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
> +          install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
> +    fi
> +}
> -- 
> 1.6.3.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


