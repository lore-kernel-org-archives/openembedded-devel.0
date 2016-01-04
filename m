Return-Path: <prvs=804d6a37d=Richard.Leitner@skidata.com>
X-Greylist: delayed 698 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Jan 2016 13:15:41 UTC
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 3653760132
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 13:15:41 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AhYVAINtilasEApK/2dsb2JhbABEGoQMbQaIU6EYizOJHBgMhWuBZwEBAQEBAYELhQYBLSiBFg4FiD07tFgBiy0BAQEBBgIhgi+EJ4w4DEGBNgWHXo8ohUCJbUqHGIU9hViIYoJ2G4FecQGEB4EIAQEB
X-IPAS-Result: AhYVAINtilasEApK/2dsb2JhbABEGoQMbQaIU6EYizOJHBgMhWuBZwEBAQEBAYELhQYBLSiBFg4FiD07tFgBiy0BAQEBBgIhgi+EJ4w4DEGBNgWHXo8ohUCJbUqHGIU9hViIYoJ2G4FecQGEB4EIAQEB
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Jan 2016 14:03:13 +0100
Message-ID: <1451912593-17168-1-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
Subject: [meta-java][PATCH] openjdk-7: update to IcedTea 2.6.3 OpenJDK 7u91b02
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jan 2016 13:15:42 -0000
Content-Type: text/plain

This release updates our OpenJDK 7 support in the 2.6.x series with an
additional October 2015 security fix from OpenJDK 7 u91. For more
details see [1].

[1] http://blog.fuseyism.com/index.php/2015/11/17/security-icedtea-2-6-3-for-openjdk-7-released/

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 ...k-7_91b01-2.6.2.bb => openjdk-7_91b02-2.6.3.bb} | 33 +++++++++++-----------
 1 file changed, 16 insertions(+), 17 deletions(-)
 rename recipes-core/openjdk/{openjdk-7_91b01-2.6.2.bb => openjdk-7_91b02-2.6.3.bb} (50%)

diff --git a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb b/recipes-core/openjdk/openjdk-7_91b02-2.6.3.bb
similarity index 50%
rename from recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
rename to recipes-core/openjdk/openjdk-7_91b02-2.6.3.bb
index b2b01c7..d2cf1ab 100644
--- a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
+++ b/recipes-core/openjdk/openjdk-7_91b02-2.6.3.bb
@@ -10,30 +10,29 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 PR = "${INC_PR}.1"
 
-SRC_URI[iced.md5sum] = "a16b3e800030db9d9b35f80dfd11883a"
-SRC_URI[iced.sha256sum] = "c19eafacd23c81179934acab123511c424cd07c094739fa33778bf7cc80e14d0"
+SRC_URI[iced.md5sum] = "7bbc8dc603bf5abc87fe8c7ffcafeabe"
+SRC_URI[iced.sha256sum] = "89183993d3dd794b4e2a428a8a0a35f1ce77c4ae64563e53f3a08c058ea134cc"
 
-SRC_URI[corba.md5sum] = "500547dc50acde20fad18d0645be89c4"
-SRC_URI[corba.sha256sum] = "92fa1e73dc0eb463bccd9ce3636643f492b8935cb7a23b91c5d855f4641382af"
+SRC_URI[openjdk.md5sum] = "be68af0132b4d6ff4faa089dbd92d840"
+SRC_URI[openjdk.sha256sum] = "9e5d26bb1888a8a1378e078953aa04314d4fb4f263ebbaf7f459110c21f8d46d"
 
-SRC_URI[jaxp.md5sum] = "793fb78b5f51323e31785bb89292182f"
-SRC_URI[jaxp.sha256sum] = "94cda3ba29ab3cd36d50f2e6c98a5e250eb6372379e171288b3022b978136fc0"
+SRC_URI[hotspot.md5sum] = "5303095889c786b679c13d2331461f86"
+SRC_URI[hotspot.sha256sum] = "dd8f3771439b4d51fa84e3f9b384b80e6656cf1a19ee3492b4f2fe09b37eef0e"
 
-SRC_URI[jaxws.md5sum] = "131e2f619455e37cea74ca710e6ada6d"
-SRC_URI[jaxws.sha256sum] = "14467736097197a199b483f24f8111e9c76252a2ad2a5f166c97585c0a3930d4"
+SRC_URI[corba.md5sum] = "a637ba113153688c3f1d04abd2062f3b"
+SRC_URI[corba.sha256sum] = "1052ae3c70908aa3374818ada320685cb7abdc7bd7bbd3cfb4f26fbbe7435ec6"
 
-SRC_URI[jdk.md5sum] = "6e8061b2b7c22163ab149fb66553eda8"
-SRC_URI[jdk.sha256sum] = "7ad801d5f6b61818c78f2f39931df24d8c6f6a1c821180c998975ac884eb8af1"
+SRC_URI[jaxp.md5sum] = "0ecc6d3156432e7a682f66d55c749d37"
+SRC_URI[jaxp.sha256sum] = "a0e978bc07371901560a746cae492edf0bcb22ddbb9e47b77319ffda1351806b"
 
-SRC_URI[langtools.md5sum] = "1cebffc6b56e9efdbe08eff018801cb1"
-SRC_URI[langtools.sha256sum] = "a53fe8912b8190d82615778cf8bfb77202a55adcdc5bacc56ce7738b6a654335"
+SRC_URI[jaxws.md5sum] = "78b8a041cdc667598a2917ff951447a0"
+SRC_URI[jaxws.sha256sum] = "55897d92e368ac7df3e04d4f235e9dba12ea8264e20d4bd6b68e8c13e5addc1e"
 
-SRC_URI[openjdk.md5sum] = "d63c5b401aaa9ef76d1dbd87943aa387"
-SRC_URI[openjdk.sha256sum] = "4911adb6d7877b014777b6db6d90f1d1626314bd0c6a2c9cf9911d1e11eb4b49"
+SRC_URI[jdk.md5sum] = "a4502a9220ae2f392fda6b95e138aec1"
+SRC_URI[jdk.sha256sum] = "583898549b52e958521474db34f2ce535b6a0926c7df1fa99a3f0321b3a109f5"
 
-# hotspot changeset taken from hotspot/tags
-SRC_URI[hotspot.md5sum] = "5ffb731931226fbff870b80a377f6258"
-SRC_URI[hotspot.sha256sum] = "984918bcb571fecebd490160935bb282c60eb9e17b4fc8fc77733d8da164c33a"
+SRC_URI[langtools.md5sum] = "ea84e3944cda222a213362ff06af6e58"
+SRC_URI[langtools.sha256sum] = "f14716df84e047b19884ac5b0830e87b6cdf1925d0951195255c9124e89df27e"
 
 ###############################################################################
 # PATCHES - split up to allow overriding them separately
-- 
2.1.4


