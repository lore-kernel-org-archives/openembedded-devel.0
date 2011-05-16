Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QLwp4-0005BC-08
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 14:22:54 +0200
Received: by yia13 with SMTP id 13so1490624yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 05:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=Otf5fJncLHIo0vXGAc2pkMQhgoF/QL6t0ek+BEWV19M=;
	b=sg0a5wCV6L91JrMmwsj5JtQ4Un5TNV/Hak+t6/jzYyFtl92/Yo68WoZGD89bdtYy2v
	r24RDyA76Z0s6D7C7JsxzH7XLKjS7E04J7nNVkCfU8aDcU1aMKnjX0iLM+23w+2iN9iG
	PDkTmsRbEjjgJFP/lkyaoMk5ZHkdN+rcRsjhA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=U1Brnm0AX7gUYkjGKu7XhE7N4acWfX1OY+x3IjB5rxUhVQvBlxzKjRY++me0/U9/N9
	W1L0NIXlDVDF1JlyXT36v8V3wE4OWNRaLVb82ouM3s/hU4I/PkguW2Mbjo2APdEf1uDI
	vbF08/aGJIwHh+/benk2Mxe7YRW4wlPzUu1TM=
Received: by 10.236.75.230 with SMTP id z66mr4134129yhd.386.1305548400617;
	Mon, 16 May 2011 05:20:00 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id z9sm1882350yhh.80.2011.05.16.05.19.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 05:19:59 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2011 12:19:45 +0000
Message-Id: <1305548385-10942-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1305548385-10942-1-git-send-email-otavio@ossystems.com.br>
References: <1305548385-10942-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v1 2/2] freerdp: update to 2011-05-14 snapshot
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
X-List-Received-Date: Mon, 16 May 2011 12:22:54 -0000

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



