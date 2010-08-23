Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OnNTs-0004z3-1g
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 05:14:11 +0200
Received: by pvg6 with SMTP id 6so2160382pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 20:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=3n4/lHnVKf3NQeGBwEjU58Mtnp5EgU5v3z8W3EDpJOA=;
	b=RaotmiSN6KzFk4HdmEG0GTFF/+0Z8SFB0/GtB2HX918Z5GF7yS5aV2ssXeMsBpYYZV
	1HmnZOrdWWjIdU98+jZGVMItvHX83Kf4TxAbuK9Zz+3IB2hmcAIx/sdveWWMGfIr06TG
	UpNzAK2i0Scet1XjIPBEYYCkSPPk0hVoHUyZc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=iZScmY7U6gRokgIuvJrxtxPVx1iTo9czSvAWd0xpVRZtO9W0M7GNSB4Jwk7SkV0s6O
	qnhBbptnVVqii/iB7W1k1wizVYSBcCQHV1afhq4n/hBNn+VhH2HjW3pVv8mCIuaArVrQ
	HnulZlACGNx1+dcO0mGMzLvfFPgntXZem3aO0=
Received: by 10.114.132.17 with SMTP id f17mr5204747wad.223.1282533207247;
	Sun, 22 Aug 2010 20:13:27 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d38sm11586601wam.8.2010.08.22.20.13.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 22 Aug 2010 20:13:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Aug 2010 20:13:11 -0700
Message-Id: <1282533191-11579-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1282533191-11579-1-git-send-email-raj.khem@gmail.com>
References: <1282533191-11579-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, TVD_SPACE_RATIO
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] u-boot-efikamx_1.1.8.bb: Efika MX bootloader
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
X-List-Received-Date: Mon, 23 Aug 2010 03:14:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/u-boot/u-boot-efikamx_1.1.8.bb |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-efikamx_1.1.8.bb

diff --git a/recipes/u-boot/u-boot-efikamx_1.1.8.bb b/recipes/u-boot/u-boot-efikamx_1.1.8.bb
new file mode 100644
index 0000000..2094bf7
--- /dev/null
+++ b/recipes/u-boot/u-boot-efikamx_1.1.8.bb
@@ -0,0 +1,25 @@
+require u-boot.inc
+PR ="r0"
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "http://www.powerdeveloper.org/asset/by-id/89;name=uboot-efikamx \
+          "
+SRC_URI[uboot-efikamx.md5sum] = "072fbd97b293ac96d3f166e261c56131"
+SRC_URI[uboot-efikamx.sha256sum] = "ee813d15e0e699340e5099641e01ac2952d42329d168deb48692a22a66d48965"
+
+S = "${WORKDIR}/uboot-efikamx-${PV}"
+
+python do_fetch () {
+        import os,shutil
+        bb.build.exec_func("base_do_fetch", d)
+        if os.access(bb.data.expand("${DL_DIR}/89", d), os.R_OK):
+                shutil.copy(bb.data.expand("${DL_DIR}/89", d), bb.data.expand("${DL_DIR}/${PN}-${PV}.tar.lzma", d))
+}
+
+python do_unpack () {
+        bb.build.exec_func('efikamx_uboot_do_unpack', d)
+}
+
+efikamx_uboot_do_unpack (){
+       (cd ${WORKDIR}; tar xf ${DL_DIR}/${PN}-${PV}.tar.lzma)
+}
-- 
1.7.1



