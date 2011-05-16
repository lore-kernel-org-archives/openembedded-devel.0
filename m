Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QM4gQ-0002Hp-0u
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 22:46:30 +0200
Received: by yxn22 with SMTP id 22so1796931yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 13:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=faipo1c9dzTSbW5w1APr5/EQndnAHW39Yv/hue4mnGM=;
	b=oCLFet3omgFcpc621ktOZxnbUyMLhCf2mT6yWGVGBZBqdSJCIKYW45SM4R1hhhEA/c
	HUSViOt2guu/Xu5rHOAEESsn+RxxzCxT22IvcAeKlcDk6mPHnXSpVMkk3wEGKgPmmb5J
	9+QdYss2kvOxvbSD6LP0/HQuk4eeXzhX7Ztdo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=U1Q+TK0+QV3ovoH56jMWI/BllKGqPy15DsJkJwkvptp/pL4GTm0xBFLJJlPPQH5sKN
	4c06O3g7r8BtEwO5g3n3ZvBl0BpPNhMYhjXFSt91OG2DFnGisU9IIRe+W7KsIjPbHmTb
	hrjzF/Mp4qFMR1hzmI8hgNpAxiGmN+0SB/qW0=
Received: by 10.236.190.137 with SMTP id e9mr4720365yhn.440.1305578617007;
	Mon, 16 May 2011 13:43:37 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id t61sm2564970yhd.21.2011.05.16.13.43.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 13:43:35 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2011 20:43:25 +0000
Message-Id: <1305578605-17041-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v1] freerdp: update to 2011-05-16 snapshot
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
X-List-Received-Date: Mon, 16 May 2011 20:46:30 -0000

This version includes major improvements since last version
packages. It also had the plugins packages redone so they can be
choosen depending on the environment needs.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/freerdp/freerdp.inc    |   40 +++++++++++++++++++----
 meta-oe/recipes-support/freerdp/freerdp_git.bb |    4 +-
 2 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
index f8402c7..71dab97 100644
--- a/meta-oe/recipes-support/freerdp/freerdp.inc
+++ b/meta-oe/recipes-support/freerdp/freerdp.inc
@@ -3,22 +3,48 @@
 
 DESCRIPTION = "FreeRDP RDP client"
 HOMEPAGE = "http://freerdp.sourceforge.net"
-DEPENDS = "virtual/libx11 openssl libxcursor cups alsa-lib"
+DEPENDS = "virtual/libx11 openssl libxcursor libxv cups alsa-lib pulseaudio pcsc-lite"
 SECTION = "x11/network"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 inherit pkgconfig autotools
 
-do_configure_prepend() {
-	# workaround gcc linking bug
-	find ${S} -name 'Makefile.am' | xargs -n 1 sed 's,-pthread,-lpthread -D_REENTRANT,g' -i
-}
+EXTRA_OECONF += "--with-smartcard --with-xvideo"
 
 do_install_append() {
 	rm ${D}${libdir}/freerdp/*.a ${D}${libdir}/freerdp/*.la
 }
 
-RDEPENDS_${PN} += "xprop"
+PACKAGES =+ "libfreerdp"
+
+LEAD_SONAME = "libfreerdp.so"
+FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
+
+PACKAGES_DYNAMIC = "libfreerdp-plugin-*"
+
+python populate_packages_prepend () {
+        freerdp_root = bb.data.expand('${libdir}/freerdp', d)
+
+        do_split_packages(d, freerdp_root, '^(audin_.*)\.so$',
+                output_pattern='libfreerdp-plugin-%s',
+                description='FreeRDP plugin %s',
+                prepend=True, extra_depends='libfreerdp-plugin-audin')
+
+        do_split_packages(d, freerdp_root, '^(rdpsnd_.*)\.so$',
+                output_pattern='libfreerdp-plugin-%s',
+                description='FreeRDP plugin %s',
+                prepend=True, extra_depends='libfreerdp-plugin-rdpsnd')
+
+        do_split_packages(d, freerdp_root, '^(tsmf_.*)\.so$',
+                output_pattern='libfreerdp-plugin-%s',
+                description='FreeRDP plugin %s',
+                prepend=True, extra_depends='libfreerdp-plugin-tsmf')
+
+        do_split_packages(d, freerdp_root, '^([^-]*)\.so$',
+                output_pattern='libfreerdp-plugin-%s',
+                description='FreeRDP plugin %s',
+                prepend=True, extra_depends='')
+}
diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index fa4ba9a..e135902 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -7,9 +7,9 @@ inherit gitpkgv
 
 PV = "gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
-SRCREV = "7bbde4fb3bc3a781364d0a626c49bc165cc507fd"
+SRCREV = "f5aef3be8fac9a02b0c7bbb5424831a7b285e7bb"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



