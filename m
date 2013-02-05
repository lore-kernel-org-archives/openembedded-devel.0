Received: from mail-ia0-f179.google.com ([209.85.210.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <thomas.besemer@gmail.com>) id 1U2Wja-0006Z2-Gt
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 01:50:05 +0100
Received: by mail-ia0-f179.google.com with SMTP id x24so8705194iak.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 16:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=IE8r46aNuW4dEf3rJnzPPH9LhY8vUu4il4u3LTfmQj0=;
	b=S6KLnl4TWA6j4hdy9vIe/4I1Ci3IF6U48DqPWflNyLKB55XpyoqsF6RuMCuWZxsh4Z
	LrNMHE3Tv6r8WD+/39/ONlM0CzimGT+G6s3e2HDEBw5stWw1/WwHZztSd2xdGCuBweiM
	xuEkb553N9tR/9lzcRYqoe3mTThdLlSlmwSOF2yz5kzSgTSj7MOHruz6HOs//6Z3xYpI
	Xn0/Ijs8VfHMuuCsQ06r0qe4l4vsobvTkxLFi08v7nJ64HDcs+QodgtJ+AnnLd5nmOSw
	M9mbG1Rg2qqdCjiYHcJilvLLmqkI5ZtExEDo32I4uTGrPrc79nQeLx7OS92YeaI9FJ96
	VQpw==
MIME-Version: 1.0
X-Received: by 10.50.185.229 with SMTP id ff5mr10170406igc.82.1360024453201;
	Mon, 04 Feb 2013 16:34:13 -0800 (PST)
Received: by 10.50.87.5 with HTTP; Mon, 4 Feb 2013 16:34:12 -0800 (PST)
Date: Mon, 4 Feb 2013 16:34:12 -0800
Message-ID: <CAO7m3AmfONKCwbwrduXVtxQdfxOAduZVG8EnKJQgCa8RN5V7Ww@mail.gmail.com>
From: Thomas Besemer <thomas.besemer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: User Application with Shared Library - do_rootfs fails
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
X-List-Received-Date: Tue, 05 Feb 2013 00:50:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am generating some source code in the OE/Yocto world.  This work requires
that a shared library exist.  I am able to to build the shared library, and
maybe install it, and then build the test code against it.  Both these
builds work.  Final assembly of Root FS fails.

Below are my two recipes.  Appears that the <libgcpy_gc6016sa.so> does not
get installed correctly (does build).  The recipe for <gcpytest> does work,
but it does find the library during build.

If I build each indepdent of the other, it's fine.  But, once I try to
build <core-image-minimal> it complains that the library is not there.


| error: Failed dependencies:

| libgcpy_gc6016.so.1 is needed by gcpytest-1-r0.armv7a_vfp_neon

---

<gcpy-dev.bb>

DESCRIPTION = "GCPY Server application"

SECTION = "gcsim"

LICENSE = "MIT"

LIC_FILES_CHKSUM =
"file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

PR = "r0"

SRC_URI = "file://gcpy-dev.tar"

S = "${WORKDIR}"

do_compile() {

oe_runmake

}

do_install() {

oe_libinstall -so libgcpy_gc6016 ${STAGING_LIBDIR}

install -m 0644 ${S}/gcpy_target_lib.h ${STAGING_INCDIR}

oe_libinstall -so libgcpy_gc6016.so ${D}${libdir}

}

 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH}
GC5330_TOOL_PREFIX=${TARGET_PREFIX} SKIP_STRIP=y"

FILES_${PN}-dev = "${D}${libdir}/libgcpy_gc6016.so"

---

<gcpytest.bb>

DESCRIPTION = "Simple GCPY Test application"

SECTION = "gcsim"

LICENSE = "MIT"

LIC_FILES_CHKSUM =
"file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

PR = "r0"

SRC_URI = "file://gcpytest.c"

S = "${WORKDIR}"

do_compile() {

${CC} gcpytest.c -o gcpytest -lgcpy_gc6016 -lrt

}

do_install() {

install -d ${D}${bindir}

install -m 0755 gcpytest ${D}${bindir}

}

REQUIRES = " gcpy-dev"

