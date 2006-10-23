Received: from [213.4.149.66] (helo=ctsmtpout1.frontal.correo)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <joaquinduran@adtelecom.es>) id 1Gc15Q-0006D5-V7
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Oct 2006 16:47:33 +0200
Received: from [194.179.62.31] (217.126.70.245) by ctsmtpout1.frontal.correo
	(7.2.056.6) (authenticated as joaquinduran$adtelecom.es)
	id 4538BB6F00063EC0 for openembedded-devel@lists.openembedded.org;
	Mon, 23 Oct 2006 18:37:40 +0200
Message-ID: <453CE1E2.3090808@adtelecom.es>
Date: Mon, 23 Oct 2006 16:38:10 +0100
From: Joaquim Duran <joaquinduran@adtelecom.es>
User-Agent: Mozilla Thunderbird 1.5.0.7 (X11/20060926)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Error installing fltk package.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Oct 2006 14:47:33 -0000
Content-Type: multipart/mixed; boundary="------------080704050406090504090701"

--------------080704050406090504090701
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Dear all,

I've found the following problem each time that I build and image with 
FLTK package while creating the image:

Configuring update-rc.d
Configuring zlib
(offline root mode: not running zlib.postinst)
An error ocurred, return value: 1.
Collected errors:
ERROR: Cannot satisfy the following dependencies for task-xterminal:
          fltk

The problem could come from these lines:

   extracting control.tar.gz from 
/home/qduran/oe/oebuild/deploy/ipk/dropbear_0.48.1-r0_arm.ipk
   extracting control.tar.gz from 
/home/qduran/oe/oebuild/deploy/ipk/fixesproto-dev_X11R7.1-4.0-r0_arm.ipk
   extracting control.tar.gz from 
/home/qduran/oe/oebuild/deploy/ipk/fltk-dev_1.1.7-r1_arm.ipk
   extracting control.tar.gz from 
/home/qduran/oe/oebuild/deploy/ipk/fontcacheproto-dev_X11R7.0-0.1.2-r0_a
rm.ipk
   extracting control.tar.gz from 
/home/qduran/oe/oebuild/deploy/ipk/fontsproto-dev_X11R7.0-2.0.2-r0_arm.i

The control file form fltk package has not been extracted, but from 
fltk-dev.

Could someone explain me which is the reason of the error and how could 
it be fixed? I've added the last .bb file used.

Thanks in advance.

Thanks and Best Regards,
Joaquim Duran
DESCRIPTION = "FLTK is a cross-platform C++ GUI toolkit"
HOMEPAGE = "http://www.fltk.org"
SECTION = "libs"
PRIORITY = "optional"
LICENSE = "GPL"
PROVIDES = "fltk"
PR= "r1"

DEPENDS = "jpeg libpng zlib"

SRC_URI = "ftp://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/fltk/${PV}/fltk-${PV}-source.tar.bz2"

S = "${WORKDIR}/fltk-${PV}"

inherit autotools binconfig

EXTRA_OECONF = "--enable-shared --enable-xdbe --enable-xft --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR}"

do_configure() {
        oe_runconf
}

do_stage() {
        make install prefix=${STAGING_DIR} \
               bindir=${STAGING_BINDIR} \
               includedir=${STAGING_INCDIR} \
               libdir=${STAGING_LIBDIR} \
               datadir=${STAGING_DATADIR}
}

do_install () {
        make install prefix=${D}${prefix} \
                bindir=${D}${bindir} \
                libdir=${D}${libdir} \
                includedir=${D}${includedir}
}

python populate_packages_prepend () {
        if (bb.data.getVar('DEBIAN_NAMES', d, 1)):
                bb.data.setVar('PKG_${PN}', 'libfltk${PV}', d)
}

#LEAD_SONAME = "libfltk.so"
#FILES_${PN} = "${libdir}/lib*.so.*"
#FILES_${PN}-dev += " ${bindir}/fltk-config"


--------------080704050406090504090701--
