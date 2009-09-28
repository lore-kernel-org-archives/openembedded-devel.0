Received: from [72.14.220.155] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MsMjj-0000qb-Bf
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Sep 2009 22:22:22 +0200
Received: by fg-out-1718.google.com with SMTP id d23so1431956fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2009 13:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=H+s9YVWgCgyFliF3BJ9GU+8QeOIDqJR/O84fGyJH6RM=;
	b=rkm+wS4Kdq6S/CMP4ZFf7IJ3ECvUjKZB9gfdsbMiRowfqDm1nrbMPViCrjlESMBgjK
	MHQVPh8nNZL6Q02heJRfwoM33VUmcC/jBFha6XyFZwh/69CLTdHV6ts2LpCR8CIarCoL
	Wh+MdxhFd/cjhXiFJ1SBsfOwC7fzlGp0IQo3c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=qcgANxneacPRXrldrGHmQS45GVe30WUnzi4O/aK6WTN4BqFh/Ot1ffXAsmMbjo6jOZ
	fgHlNh5gL3KoaW8fFuQONiI4bkoOcOtwAqla3n+0b28qK8kNpTEjivV3XpD3TTwynwat
	WY0oYBcmG3fpMBAsm/Y8agJIVogauXONKlMJ0=
MIME-Version: 1.0
Received: by 10.239.138.25 with SMTP id n25mr311948hbn.8.1254169298728; Mon, 
	28 Sep 2009 13:21:38 -0700 (PDT)
Date: Mon, 28 Sep 2009 22:21:38 +0200
Message-ID: <c384c5ea0909281321k660c9ad5s154817574b54157@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: x86->x86 GRUB bootable image in OE?
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
X-List-Received-Date: Mon, 28 Sep 2009 20:22:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,


on x86 target support, I have some ideas how to create bootable disk
images from OE using GRUB (not using the post image command approach).

However, I suspect this will only work if we have GRUB on the host,
i.e. assume a x86 host, and have grub-native.

grub-native would be step one, but I am having a hard time getting the
staging to work.

In general, for staging host-native tools, do we use the "make
install" approach?


Regards,

Leon.



DESCRIPTION = "GRand Unified Bootloader"
HOMEPAGE = "http://www.gnu.org/software/grub"
SECTION = "bootloaders"
PRIORITY = "optional"
RDEPENDS_${PN}-install = "diffutils"
PR = "r5"

SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://automake-1.10.patch;patch=1 \
           file://menu.lst"

inherit autotools_stage native

CFLAGS += "-fno-stack-protector"

#do_install() {
#       oenote do_install
#       oenote DESTDIR=${D}
#       oe_runmake 'DESTDIR=${D}' install
#}

do_stage() {
        oenote do_stage
        oenote DESTDIR=${STAGING_DIR_HOST}
        oe_runmake 'DESTDIR=${STAGING_DIR_HOST}' install
}

#do_stage() {
#        oe_runmake 'DESTDIR=${STAGING_DIR_HOST}' install
#        install -m 0644 -D ${WORKDIR}/menu.lst ${}/boot/grub/menu.lst
#
#        # Copy stage1/1_5/2 files to /boot/grub
#        GRUB_TARGET_ARCH=$(echo ${TARGET_ARCH} | sed -e 's/.86/386/')
#        install -m 0744 -d ${STAGING_DIR_HOST}/boot/grub/
#        install -m 0644 \
#                ${D}/${libdir}/grub/${GRUB_TARGET_ARCH}${TARGET_VENDOR}/* \
#                ${STAGING_DIR_HOST}/boot/grub/
#}

PACKAGES =+ "${PN}-install ${PN}-eltorito"

FILES_${PN}-install = " \
        ${sbindir}/grub-install \
        ${sbindir}/grub-terminfo \
        ${sbindir}/grub-md5-crypt \
        ${bindir}/mbchk \
        ${libdir}/grub \
"
FILES_${PN}-eltorito = "/boot/grub/stage2_eltorito"
FILES_${PN} += "/boot"

COMPATIBLE_HOST = "i.86.*-linux"


-- 
Leon


