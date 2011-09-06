Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1R0tBV-0000Re-Pp
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 12:47:17 +0200
Received: by fxg11 with SMTP id 11so4410939fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2011 03:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=95sLWHUp4W6TIqse9zrxfbnQVlX8yYuVfA/xFD4kRdE=;
	b=Tsc1y+ro4Luh/MhG1cYGRBulIiy6ozBYn438pOm0dhxVMFUj387dmaHsCaXRU3238g
	poG5L0/FOoNuvfCdWbOSWlkxvZ9DVUKlau1TmhlhcN95BP5EmGX7RevMHmBsroF13BJx
	WWzJlbjhRgvKM98dHTZJLiOVA4TOJRyFeETnU=
Received: by 10.223.39.10 with SMTP id d10mr531467fae.136.1315305730555;
	Tue, 06 Sep 2011 03:42:10 -0700 (PDT)
Received: from Hellboy (qrc29-1-82-245-206-103.fbx.proxad.net [82.245.206.103])
	by mx.google.com with ESMTPS id h5sm5014057fae.13.2011.09.06.03.42.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Sep 2011 03:42:09 -0700 (PDT)
Received: by Hellboy (sSMTP sendmail emulation);
	Tue, 06 Sep 2011 12:42:05 +0200
From: =?UTF-8?q?Sylvain=20=27GarthPS=27=20Par=C3=A9?= <sylvain.pare@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Sep 2011 12:41:20 +0200
Message-Id: <1315305680-18903-1-git-send-email-sylvain.pare@gmail.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] binutils*: recipes updates to new version 2.21.1
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
X-List-Received-Date: Tue, 06 Sep 2011 10:47:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Sylvain 'GarthPS' Paré <sylvain.pare@gmail.com>
---
 ...ss-sdk_2.21.bb => binutils-cross-sdk_2.21.1.bb} |    0
 ...tils-cross_2.21.bb => binutils-cross_2.21.1.bb} |    0
 .../{binutils_2.21.bb => binutils_2.21.1.bb}       |    4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes/binutils/{binutils-cross-sdk_2.21.bb => binutils-cross-sdk_2.21.1.bb} (100%)
 rename recipes/binutils/{binutils-cross_2.21.bb => binutils-cross_2.21.1.bb} (100%)
 rename recipes/binutils/{binutils_2.21.bb => binutils_2.21.1.bb} (84%)

diff --git a/recipes/binutils/binutils-cross-sdk_2.21.bb b/recipes/binutils/binutils-cross-sdk_2.21.1.bb
similarity index 100%
rename from recipes/binutils/binutils-cross-sdk_2.21.bb
rename to recipes/binutils/binutils-cross-sdk_2.21.1.bb
diff --git a/recipes/binutils/binutils-cross_2.21.bb b/recipes/binutils/binutils-cross_2.21.1.bb
similarity index 100%
rename from recipes/binutils/binutils-cross_2.21.bb
rename to recipes/binutils/binutils-cross_2.21.1.bb
diff --git a/recipes/binutils/binutils_2.21.bb b/recipes/binutils/binutils_2.21.1.bb
similarity index 84%
rename from recipes/binutils/binutils_2.21.bb
rename to recipes/binutils/binutils_2.21.1.bb
index df044aa..88c33d1 100644
--- a/recipes/binutils/binutils_2.21.bb
+++ b/recipes/binutils/binutils_2.21.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
      ${@['','file://libtool-2.4-update.patch'][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == 'yes']} \
      file://binutils-2.19.1-ld-sysroot.patch \
      "
-SRC_URI[md5sum] = "c84c5acc9d266f1a7044b51c85a823f5"
-SRC_URI[sha256sum] = "60abec5bf448eb930a5a15acb8712612377dc8bcfb13dfd5131228f70561d0c7"
+SRC_URI[md5sum] = "bde820eac53fa3a8d8696667418557ad"
+SRC_URI[sha256sum] = "cdecfa69f02aa7b05fbcdf678e33137151f361313b2f3e48aba925f64eabf654"
 
 FILES_${PN}-symlinks += "${bindir}/elfedit"
 # When we enable gold this might need to be make conditional
-- 
1.7.4.1



