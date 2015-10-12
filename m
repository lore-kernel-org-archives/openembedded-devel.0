Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0F82676E3F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 10:45:06 +0000 (UTC)
Received: by wijq8 with SMTP id q8so51468981wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 03:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=HQSOW9mLkWsRKTrBq/XR4Fh0zsD//AZItZXwJ9RHanM=;
	b=Yp/DrhSKhZ51ISPlfpQcTiDKMSzDKrfUPz3aNq4NdmX70unrWyWb5KBzxrdO+UZ0Fc
	VdE/EVYkKgsSiPtlJnhoTKbRkUYvOyGU82cMC9bbxi0v2yCN+DwQ9tjeJiV5njWhIxVU
	+G5wFAOQMbkXlPeVksUaBhqw++AtMAo12bkgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=HQSOW9mLkWsRKTrBq/XR4Fh0zsD//AZItZXwJ9RHanM=;
	b=I6CNuz9G/ZglKjmtf10YU4PTQEx4yB4N1rNFFXWOFGD3yErZjQTAEhqVf3uFLcZZb+
	4C7bhBznTr7VMD8OKH1T7WXbQBVVuHgouU2AKZgRed3BYSX427sRVbVr0lTv/T3MwFeA
	GPym8WL/MlJRG0VyuGyKlKcaq+S54SQchyuXDslzseA52mjXQfqpRMJwcElUSPqkuv4K
	znlvtdBOBQVcn/s/4XxV51uGJjb7bYKo+xIy0b/ujqxm+WASVnfNqxjWYvZdyPrko3cI
	7i9dJy91NPQsVu2k1UN3vjYWe0r9bYpcN6WIc6622mbmr0dZgTGF0ScCKbHqIM91mgCq
	598g==
X-Gm-Message-State: ALoCoQkswpK9tgYaMVIYs7/GrlV0Dau8qrXWqcpI2ryuAKaAijNPnybUIl3AEBx+hCisGgrewNxI
X-Received: by 10.194.2.243 with SMTP id 19mr28453515wjx.140.1444646706342;
	Mon, 12 Oct 2015 03:45:06 -0700 (PDT)
Received: from centos7.vannes.iot ([46.18.96.42])
	by smtp.gmail.com with ESMTPSA id
	bf8sm19068851wjc.22.2015.10.12.03.45.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Oct 2015 03:45:05 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Oct 2015 12:44:33 +0200
Message-Id: <1444646673-14400-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v4][meta-multimedia] mkvtoolnix: fix Boost build, update to 8.4.0, allow Qt5 GUI
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
X-List-Received-Date: Mon, 12 Oct 2015 10:45:09 -0000

mkvtoolnix does not compile with newest Boost 1.58, mostly
due to the following bugs :
https://github.com/mbunkus/mkvtoolnix/issues/1172
https://github.com/mbunkus/mkvtoolnix/issues/1176

Update to the latest version, allow to use Qt5 if present,
and adapt configure steps accordingly.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 .../recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb       | 24 +++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
index dd613b3..eda7359 100644
--- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
+++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
@@ -6,9 +6,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "curl boost expat zlib libebml libmatroska libogg libvorbis bzip2 lzo file ruby-native"
 
-PV = "7.1.0+git${SRCPV}"
-SRCREV = "0c89ff941bfdd9f3378312f293a84f13cf3e2a96"
-SRC_URI = "git://github.com/mbunkus/mkvtoolnix.git"
+PV = "8.4.0+git${SRCPV}"
+SRCREV_mkvtoolnix = "7f63ea48ee474754a95838f37aba8f6118c94a65"
+SRCREV_libebml = "04b34b0dbded40e0cec93cafa6a4f4c8e90c3206"
+SRCREV_libmatroska = "db5d627b5bf48516c9e0b540254c0d36595760c3"
+SRCREV_FORMAT = "mkvtoolnix"
+SRC_URI = " \
+           git://github.com/mbunkus/mkvtoolnix.git;name=mkvtoolnix \
+           git://github.com/Matroska-Org/libebml.git;name=libebml;destsuffix=git/lib/libebml \
+           git://github.com/Matroska-Org/libmatroska.git;name=libmatroska;destsuffix=git/lib/libmatroska \
+          "
 
 S = "${WORKDIR}/git"
 
@@ -20,22 +27,25 @@ inherit autotools-brokensep gettext
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "flac ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"
 PACKAGECONFIG[flac] = "--with-flac,--without-flac,flac"
+PACKAGECONFIG[qt5] = "--enable-qt --with-moc=${STAGING_BINDIR_NATIVE}/qt5/moc --with-uic=${STAGING_BINDIR_NATIVE}/qt5/uic --with-rcc=${STAGING_BINDIR_NATIVE}/qt5/rcc,--disable-qt,qtbase"
 
 EXTRA_OECONF = " --with-boost-libdir=${STAGING_LIBDIR} \
 "
 
+FILES_${PN} += "${datadir}"
+
 # remove some hardcoded searchpaths
 do_configure_prepend() {
-    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/ebml.m4
+    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/qt5.m4
 }
 
 # Yeah, no makefile
 do_compile() {
-    ${S}/drake ${PARALLEL_MAKE}
+    LC_ALL="en_US.UTF-8" ${S}/drake ${PARALLEL_MAKE}
 }
 
 do_install() {
-    ${S}/drake install DESTDIR=${D}
+    LC_ALL="en_US.UTF-8" ${S}/drake install DESTDIR=${D}
 }
-- 
1.8.3.1


