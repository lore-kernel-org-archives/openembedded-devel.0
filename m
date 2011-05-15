Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QLjAx-0007BS-CJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 23:48:35 +0200
Received: by ywg8 with SMTP id 8so1464755ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 14:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=Otf5fJncLHIo0vXGAc2pkMQhgoF/QL6t0ek+BEWV19M=;
	b=brkQHwy7vA3FDE8mL64KFwjIP9/RCeMMxpK1EHfxUD9M23vpuqJ7zCNikFfsND+wEC
	3KEIfTQETK/nM44Hc1dNaVxz5lw93W2XUTnjV2yzQnqveS2Sajsi73A9CtjstsS77goA
	UvlPbS/tJLMzSvvII5wHx49bXHVQ41XdwtiZw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=oQKEshbaU+yJt4E1O+XUl6c5FQ3pzsJhzSySdISIDhcipJMNS6S5pLPXEIJsUdOjCM
	gnaDPnIUuQYtso2Mrh51oD0j/AkVk2X0XjGmC1qXQySlBIC9qlM0Y4gCvU3KSxPY/Ukk
	499/2sJUjXmUowsOTXvWREXvY1NSSXuaj6Cp0=
Received: by 10.236.157.1 with SMTP id n1mr3562025yhk.180.1305495942811;
	Sun, 15 May 2011 14:45:42 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l30sm2110499yhn.6.2011.05.15.14.45.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 May 2011 14:45:41 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 21:45:26 +0000
Message-Id: <1305495926-21490-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1305495926-21490-1-git-send-email-otavio@ossystems.com.br>
References: <1305495926-21490-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v1 3/3] freerdp: update to 2011-05-14 snapshot
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
X-List-Received-Date: Sun, 15 May 2011 21:48:35 -0000

This version includes major improvements since last version
packages. It also had the plugins packages redone so they can be
choosen depending on the environment needs.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/freerdp/freerdp.inc    |   40 +++++++++++++++++++----
 meta-oe/recipes-support/freerdp/freerdp_git.bb |    4 +-
 2 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
index f8402c7..15ceadd 100644
--- a/meta-oe/recipes-support/freerdp/freerdp.inc
+++ b/meta-oe/recipes-support/freerdp/freerdp.inc
@@ -3,22 +3,48 @@
 
 DESCRIPTION = "FreeRDP RDP client"
 HOMEPAGE = "http://freerdp.sourceforge.net"
-DEPENDS = "virtual/libx11 openssl libxcursor cups alsa-lib"
+DEPENDS = "virtual/libx11 openssl libxcursor libxv cups alsa-lib pulseaudio libpcsclite"
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
index fa4ba9a..5bdb0af 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -7,9 +7,9 @@ inherit gitpkgv
 
 PV = "gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
-SRCREV = "7bbde4fb3bc3a781364d0a626c49bc165cc507fd"
+SRCREV = "18e9d76c1936b6efc4ab6d91d127be20173ec903"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



