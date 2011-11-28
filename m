Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RV87k-0008W3-Ha
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 21:48:25 +0100
Received: by faar15 with SMTP id r15so503387faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 12:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type;
	bh=k4+h6J7zP6OReh70Kcr7M+FxWl5yb2F7PUoxnkoYxqg=;
	b=dqc3ZXALPs8DKbgbkD8+kW51dwnlAqSYdJgW0BC0nRlgld3tuILDHshlPbIiRo2nfr
	XMCTsXBFf7rBYvvCrKoWT3uG+IFX916yYpEdzvHiTgBoXr+8Np+DzOw3ft6RQmD12A/Z
	URM4JUvcL4kJ6FczXkS0bfvoBdkCYmeKVHTfU=
Received: by 10.204.147.75 with SMTP id k11mr47417819bkv.102.1322512906031;
	Mon, 28 Nov 2011 12:41:46 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id fa8sm23907990bkc.14.2011.11.28.12.41.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 12:41:43 -0800 (PST)
Message-ID: <4ED3F1FD.3040501@googlemail.com>
Date: Mon, 28 Nov 2011 20:41:33 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EC81A85.8050704@googlemail.com>
	<CAMKF1srcWq1mD4wNZEi2Eff2iMCVcwvjL_swTJ7z1Y6=qjZA1Q@mail.gmail.com>
	<4ECE4B0D.6030401@googlemail.com> <4ECE5422.3070504@googlemail.com>
	<20111124174936.GA28767@sakrah.homelinux.org>
	<4ECE87A9.8040109@googlemail.com>
	<20111124182713.GH28767@sakrah.homelinux.org>
	<4ECEE6D8.7080802@googlemail.com>
	<20111125050922.GA30623@sakrah.homelinux.org>
	<4ECF2887.2040400@googlemail.com>
	<CAMKF1srBccnok0GsuwZxsRCpUNwT7nLz=iJi9vhNZSykxhztfA@mail.gmail.com>
In-Reply-To: <CAMKF1srBccnok0GsuwZxsRCpUNwT7nLz=iJi9vhNZSykxhztfA@mail.gmail.com>
Subject: Re: "cannot find -lppl_c" link error
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
X-List-Received-Date: Mon, 28 Nov 2011 20:48:25 -0000
X-Groupsio-MsgNum: 35710
Content-Type: multipart/mixed; boundary="------------070405040507090203070708"

--------------070405040507090203070708
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> I have just finished my built - the whole lot and with a lot of warnings, mainly from unpackaged files - don't know whether these are important though.
>>     
>
> they should be looked into sometimes there might be important files that
> go unpackaged
>   
I am attaching (or trying to - I don't know whether the mailing list 
daemon would accept it) this list where all my errors and warnings are 
shown. Most of the warnings are "unpackaged files", but there are quite 
a few QA-related ones as well.

>> I'll probably spend the weekend fine-tuning this as my build went over 25G in size - massive! Thanks for your help Raj, much appreciated!
>>     
>
> yes its big since a lot of software is built you could use rm_work
> feature where it will try to delete the work dirs after they are
> successfully built but I would suggest not to do that unless you
> really need it.
>   
I did need it, but it wasn't enough - I ended up moving files away to a 
different partition on the network because I ended up needing 54G (yes, 
that's right - fifty four gigabytes!) - this came down significantly 
once the build has finished. My build failed a couple of times because 
of two general errors:

1) all matchbox-related + libfakekey recipes use an outdated url 
(svn.o-hand.com no longer hosts anything as they were taken over by 
intel), so I found a separate site (git.yoctoproject.org)  which hosted 
all this, though they use git, not svn, so I needed to (learn and) 
adjust these recipes to function properly. As a result of using the new 
(and updated!) repository one of the matchbox patches is no longer 
needed. I am willing to submit patches for these recipes, though I do 
not know what sort of policy is in place for these and how the 
submission process works - help and advice on that front is appreciated. 
I am attaching an "example" of the alterations I've done to the 
libfakekey recipe to make it work (at least for my build).

2) fsogsmd doesn't compile properly - I had to disable the 
"modem-nokia-isi" and "modem-qualcomm-palm" configure options 
(qualcomm-palm build is where it all falls apart - see the attached 
errors log) and make further adjustments to that recipe to disable all 
"irrelevant" packaging (at least in my case - I was building for 
"htcdream"), otherwise that won't work as there were no files produced 
as a result of me altering the configure options. I have no idea how to 
correct this - I was lucky in a way that I was building for htcdream and 
not for qualcomm-palm device for example. I also attach an "example" of 
the altered fsogsmd recipe - this is how I've made it to work.

I am also attaching my local.conf file as well for anyone interested, 
because even though I've indicated my locales, they were all built 
regardless of my selection. Maybe I misunderstood the meaning of that 
option - I did not want to build any other locale-related packages 
except for the locales I indicated in my local.conf file, is that how 
this option works?

I have another query though - is there a way to build a package (.ipk) 
to be included in the final image and not having to build it separately 
into .ipk file and then install it from the embedded device?

As the htcdream/shr build was completed just to see how OE works, I am 
now going to get a proper image built (which I will use) and see where 
that takes me.
DL_DIR = "${HOME}/oe/sources"
BBFILES = "${HOME}/oe/openembedded/recipes/*/*.bb"
MACHINE = "htcdream"
DISTRO = "shr"
BBMASK = "/(nonworking|obsolete|cacao)/"

PARALLEL_MAKE = "-j 5"
BB_NUMBER_THREADS = "3"
BB_SCHEDULER = "speed"
PACKAGE_STRIP = "full"

ASSUME_PROVIDED += "help2man-native"
GLIBC_GENERATE_LOCALES = "en_US.UTF-8 en_GB.UTF-8"
IMAGE_LINGUAS = "en-us en-gb"

PREFERRED_PROVIDER_gpsd = "fso-gpsd"
PREFERRED_PROVIDERS = "virtual/gpsd:fso-gpsd"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"

IMAGE_FSTYPES = "jffs2 tar squashfs squashfs-lzma"
INHERIT += "rm_work"

require cornucopia.inc
inherit fso-plugin
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
PR = "${INC_PR}.3"
PV = "0.5.0+gitr${SRCPV}"
PE = "1"

DEPENDS += "libfsoresource libgsm0710mux libgisi ppp connman msmcomm-specs"

EXTRA_OECONF_append = "\
  --enable-libgsm0710mux \
  --disable-modem-nokia-isi \
  --disable-modem-qualcomm-palm \
"
#!  --enable-modem-nokia-isi \
#!  --enable-modem-qualcomm-palm \


# package modules with extra dependencies in extra packages RDEPENDed by config package

PACKAGES =+ "${PN}-config"
FILES_${PN}-config = "${sysconfdir}/freesmartphone/"
PACKAGE_ARCH_${PN}-config = "${MACHINE_ARCH}"
CONFFILES_${PN}-config = " \
  ${sysconfdir}/freesmartphone/conf/htc_qualcomm_dream/fsogsmd.conf \
  ${sysconfdir}/freesmartphone/conf/htc_qualcomm_msm/fsogsmd.conf \
"
#!  ${sysconfdir}/freesmartphone/conf/openmoko_gta/fsogsmd.conf \
#!  ${sysconfdir}/freesmartphone/conf/palm_pre/fsogsmd.conf \

RDEPENDS_${PN} += "${PN}-config"

PACKAGES =+ "${PN}-connman ${PN}-connman-dev ${PN}-connman-dbg"
FILES_${PN}-connman = "${libdir}/connman/plugins/fsogsm.so"
FILES_${PN}-connman-dev = "${libdir}/connman/plugins/fsogsm.la"
FILES_${PN}-connman-dbg = "${libdir}/connman/plugins/.debug/fsogsm*"
RDEPENDS_${PN} += "${PN}-connman"

# On the palmpre we need the msmcomm daemon to talk to the modem
#!RDEPENDS_${PN}-config_palmpre += "msmcommd"

#PACKAGES =+ "${PN}-module-lowlevel-palmpre ${PN}-module-lowlevel-palmpre-dev ${PN}-module-lowlevel-palmpre-dbg"
#FILES_${PN}-module-lowlevel-palmpre = "${CORNUCOPIA_MODULE_DIR}/lowlevel_palmpre.so"
#FILES_${PN}-module-lowlevel-palmpre-dev = "${CORNUCOPIA_MODULE_DIR}/lowlevel_palmpre.la"
#FILES_${PN}-module-lowlevel-palmpre-dbg = "${CORNUCOPIA_MODULE_DIR}/.debug/lowlevel_palmpre*"
#RDEPENDS_${PN}-config_palmpre += "${PN}-module-lowlevel-palmpre"

#!PACKAGES =+ "${PN}-module-modem-qualcomm-palm ${PN}-module-modem-qualcomm-palm-dev ${PN}-module-modem-qualcomm-palm-dbg"
#!FILES_${PN}-module-modem-qualcomm-palm = "${CORNUCOPIA_MODULE_DIR}/modem_qualcomm_palm.so"
#!FILES_${PN}-module-modem-qualcomm-palm-dev = "${CORNUCOPIA_MODULE_DIR}/modem_qualcomm_palm.la"
#!FILES_${PN}-module-modem-qualcomm-palm-dbg = "${CORNUCOPIA_MODULE_DIR}/.debug/modem_qualcomm_palm*"
#!RDEPENDS_${PN}-config_palmpre += "${PN}-module-modem-qualcomm-palm"

PACKAGES =+ "${PN}-module-modem-qualcomm-htc ${PN}-module-modem-qualcomm-htc-dev ${PN}-module-modem-qualcomm-htc-dbg"
FILES_${PN}-module-modem-qualcomm-htc = "${CORNUCOPIA_MODULE_DIR}/modem_qualcomm_htc.so"
FILES_${PN}-module-modem-qualcomm-htc-dev = "${CORNUCOPIA_MODULE_DIR}/modem_qualcomm_htc.la"
FILES_${PN}-module-modem-qualcomm-htc-dbg = "${CORNUCOPIA_MODULE_DIR}/.debug/modem_qualcomm_htc*"
RDEPENDS_${PN}-config_htcdream += "${PN}-module-modem-qualcomm-htc"

#!PACKAGES =+ "${PN}-module-modem-nokia-isi ${PN}-module-modem-nokia-isi-dev ${PN}-module-modem-nokia-isi-dbg"
#!FILES_${PN}-module-modem-nokia-isi = "${CORNUCOPIA_MODULE_DIR}/modem_nokia_isi.so"
#!FILES_${PN}-module-modem-nokia-isi-dev = "${CORNUCOPIA_MODULE_DIR}/modem_nokia_isi.la"
#!FILES_${PN}-module-modem-nokia-isi-dbg = "${CORNUCOPIA_MODULE_DIR}/.debug/modem_nokia_isi*"
#!RDEPENDS_${PN}-config_nokia900 += "${PN}-module-modem-nokia-isi"

#!PACKAGES =+ "${PN}-module-lowlevel-openmoko ${PN}-module-lowlevel-openmoko-dev ${PN}-module-lowlevel-openmoko-dbg"
#!FILES_${PN}-module-lowlevel-openmoko = "${CORNUCOPIA_MODULE_DIR}/lowlevel_openmoko.so"
#!FILES_${PN}-module-lowlevel-openmoko-dev = "${CORNUCOPIA_MODULE_DIR}/lowlevel_openmoko.la"
#!FILES_${PN}-module-lowlevel-openmoko-dbg = "${CORNUCOPIA_MODULE_DIR}/.debug/lowlevel_openmoko*"
#!RDEPENDS_${PN}-config_om-gta01 += "${PN}-module-lowlevel-openmoko"
#!RDEPENDS_${PN}-config_om-gta02 += "${PN}-module-lowlevel-openmoko"

#!PACKAGES =+ "${PN}-module-modem-ti-calypso ${PN}-module-modem-ti-calypso-dev ${PN}-module-modem-ti-calypso-dbg"
#!FILES_${PN}-module-modem-ti-calypso = "${CORNUCOPIA_MODULE_DIR}/modem_ti_calypso.so"
#!FILES_${PN}-module-modem-ti-calypso-dev = "${CORNUCOPIA_MODULE_DIR}/modem_ti_calypso.la"
#!FILES_${PN}-module-modem-ti-calypso-dbg = "${CORNUCOPIA_MODULE_DIR}/.debug/modem_ti_calypso*"
#!RDEPENDS_${PN}-config_om-gta01 += "${PN}-module-modem-ti-calypso"
#!RDEPENDS_${PN}-config_om-gta02 += "${PN}-module-modem-ti-calypso"

#!PACKAGES =+ "${PN}-module-modem-freescale-neptune ${PN}-module-modem-freescale-neptune-dev ${PN}-module-modem-freescale-neptune-dbg"
#!FILES_${PN}-module-modem-freescale-neptune = "${CORNUCOPIA_MODULE_DIR}/modem_freescale_neptune.so"
#!FILES_${PN}-module-modem-freescale-neptune-dev = "${CORNUCOPIA_MODULE_DIR}/modem_freescale_neptune.la"
#!FILES_${PN}-module-modem-freescale-neptune-dbg = "${CORNUCOPIA_MODULE_DIR}/.debug/modem_freescale_neptune*"
#!RDEPENDS_${PN}-config_motorola-ezx += "${PN}-module-modem-freescale-neptune"

#!PACKAGES =+ "${PN}-module-lowlevel-motorola-ezx ${PN}-module-lowlevel-motorola-ezx-dev ${PN}-module-lowlevel-motorola-ezx-dbg"
#!FILES_${PN}-module-lowlevel-motorola-ezx = "${CORNUCOPIA_MODULE_DIR}/lowlevel_motorola_ezx.so"
#!FILES_${PN}-module-lowlevel-motorola-ezx-dev = "${CORNUCOPIA_MODULE_DIR}/lowlevel_motorola_ezx.la"
#!FILES_${PN}-module-lowlevel-motorola-ezx-dbg = "${CORNUCOPIA_MODULE_DIR}/.debug/lowlevel_motorola_ezx*"
#!RDEPENDS_${PN}-config_motorola-ezx += "${PN}-module-lowlevel-motorola-ezx"


## shared modules or modules without known OE machine to RDEPEND on them (so kept in main module for now)
#  dbus_service.so
#  modem_dummy.so
#  modem_cinterion_mc75.so
#  modem_singleline.so
#  pdp_ppp.so
#  pdp_ppp_internal.so
#  pdp_ppp_mux.so
#  pdp_qmi.so
#  ppp2fsogsmd.so

## motorola-ezx
#  modem_freescale_neptune.so
#  lowlevel_motorola_ezx.so

## nokia900
#  lowlevel_nokia900.so
#  modem_nokia_isi.so

## openmoko
#  lowlevel_openmoko.so
#  modem_ti_calypso.so

## palmpre
#  modem_qualcomm_pre.so
#  lowlevel_palmpre.so

## htcdream
#  modem_qualcomm_htc.so

DESCRIPTION = "Matchbox keyboard"
LICENSE = "GPL"
DEPENDS = "libxtst"
SECTION = "x11/wm"
SRCREV = "1455"
#PV = "0.2+svnr${SRCPV}"
PR = "r2"

#SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk;module=${PN};proto=http \
#SRC_URI = "git://git.yoctoproject.org/libfakekey;protocol=git;tag=e8c2e412ea4a417afc1f30e32cb7bdc508b1dccc
# http://git.yoctoproject.org/cgit/cgit.cgi/libfakekey/snapshot/libfakekey-master.tar.bz2
SRC_URI = "file://libfakekey.tar.bz2 \
	   file://configure-fix.patch"

S = "${WORKDIR}/${PN}"

inherit autotools pkgconfig gettext

--------------070405040507090203070708
Content-Type: application/gzip;
 name="e_and_w.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="e_and_w.tar.gz"

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

--------------070405040507090203070708--
