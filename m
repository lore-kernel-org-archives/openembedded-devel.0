Return-Path: <prvs=02916f861=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 61DD97326D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 14:51:34 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2DgAgBwJ7NX/0oKEKxEGoQbfAekfooYgjeFZIIPgX0mhXeCDRQCAQEBAQEBAYEFhTABLSiBFg4FiD8tsxQBimYBAQEBBieCJYQFi1YLgwcFiCqRF4FihDyIfYFpToc0hViGZYVTg3gegkkbgU5sAYYXfwEBAQ
X-IPAS-Result: A2DgAgBwJ7NX/0oKEKxEGoQbfAekfooYgjeFZIIPgX0mhXeCDRQCAQEBAQEBAYEFhTABLSiBFg4FiD8tsxQBimYBAQEBBieCJYQFi1YLgwcFiCqRF4FihDyIfYFpToc0hViGZYVTg3gegkkbgU5sAYYXfwEBAQ
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Aug 2016 16:51:28 +0200
Message-ID: <1471359088-5183-1-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
X-ClientProxiedBy: sdex1srv.skidata.net (172.16.10.92) To sdex2srv.skidata.net
	(172.16.10.93)
Subject: [meta-java][PATCH] openjdk-7: update to IcedTea 2.6.5 OpenJDK 7u99b00
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
X-List-Received-Date: Tue, 16 Aug 2016 14:51:36 -0000
Content-Type: text/plain

OpenJDK 7 is updated from from 91b01 (IcedTea 2.6.2) to 99b00 (IcedTea
2.6.5). This update introduces following security updates:
 * Mar 2016 (IcedTea 2.6.5, OpenJDK 7 u99)  [1]
 * Jan 2016 (IcedTea 2.6.4, OpenJDK 7 u95)  [2]
 * Oct 2015 (IcedTea 2.6.3, OpenJDK 7 u91)  [3]

Due to the fact some "byte behavior improvements" were not ported to
the ARM32-JIT in IcedTea 2.6.6 yet [6], [7]  we need to stick IcedTea
2.6.5 for now.

[1]http://blog.fuseyism.com/index.php/2016/03/25/security-icedtea-2-6-5-for-openjdk-7-released/
[2]http://blog.fuseyism.com/index.php/2016/01/21/security-icedtea-2-6-4-for-openjdk-7-released/
[3]http://blog.fuseyism.com/index.php/2015/11/17/security-icedtea-2-6-3-for-openjdk-7-released/
[6]http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=2942
[7]http://icedtea.classpath.org/hg/release/icedtea7-forest-2.6/hotspot/rev/1c5c4564204e

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 ...k-7_91b01-2.6.2.bb => openjdk-7_99b00-2.6.5.bb} | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)
 rename recipes-core/openjdk/{openjdk-7_91b01-2.6.2.bb => openjdk-7_99b00-2.6.5.bb} (51%)

diff --git a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
similarity index 51%
rename from recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
rename to recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
index b2b01c7..711f572 100644
--- a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
+++ b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
@@ -10,30 +10,30 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 PR = "${INC_PR}.1"
 
-SRC_URI[iced.md5sum] = "a16b3e800030db9d9b35f80dfd11883a"
-SRC_URI[iced.sha256sum] = "c19eafacd23c81179934acab123511c424cd07c094739fa33778bf7cc80e14d0"
+SRC_URI[iced.md5sum] = "cb66b595860c3d99a87c3a853667c145"
+SRC_URI[iced.sha256sum] = "d8bce93bd33b299a52236f03fb57d42ae9de808c8337e6185930799dbfc78795"
 
-SRC_URI[corba.md5sum] = "500547dc50acde20fad18d0645be89c4"
-SRC_URI[corba.sha256sum] = "92fa1e73dc0eb463bccd9ce3636643f492b8935cb7a23b91c5d855f4641382af"
+SRC_URI[corba.md5sum] = "3345d1939663d1ef94459cf215b76b3f"
+SRC_URI[corba.sha256sum] = "427969fdd78513a11ddd9d5131a068e0b26ca2c8f14951bf8b161fecd07fe77f"
 
-SRC_URI[jaxp.md5sum] = "793fb78b5f51323e31785bb89292182f"
-SRC_URI[jaxp.sha256sum] = "94cda3ba29ab3cd36d50f2e6c98a5e250eb6372379e171288b3022b978136fc0"
+SRC_URI[jaxp.md5sum] = "872a458cde954124eee9913e6ea906b0"
+SRC_URI[jaxp.sha256sum] = "7bb5e1bc9f0807061e157aeb356dd0e3b9fa019fb316beee3aa0181a335ba37a"
 
-SRC_URI[jaxws.md5sum] = "131e2f619455e37cea74ca710e6ada6d"
-SRC_URI[jaxws.sha256sum] = "14467736097197a199b483f24f8111e9c76252a2ad2a5f166c97585c0a3930d4"
+SRC_URI[jaxws.md5sum] = "d0d559ca0d797c5dc9640bfa277a23c5"
+SRC_URI[jaxws.sha256sum] = "4e759ade7e47713f6f26afc1ffcd02f2edf967582fae2ec6b4d73dc81be926d0"
 
-SRC_URI[jdk.md5sum] = "6e8061b2b7c22163ab149fb66553eda8"
-SRC_URI[jdk.sha256sum] = "7ad801d5f6b61818c78f2f39931df24d8c6f6a1c821180c998975ac884eb8af1"
+SRC_URI[jdk.md5sum] = "13fa99cc310f27818867e8a9d0841892"
+SRC_URI[jdk.sha256sum] = "cd3810553b1066c21f2fe08a73de72e38ba7e72295cd32dec70db481a24421ba"
 
-SRC_URI[langtools.md5sum] = "1cebffc6b56e9efdbe08eff018801cb1"
-SRC_URI[langtools.sha256sum] = "a53fe8912b8190d82615778cf8bfb77202a55adcdc5bacc56ce7738b6a654335"
+SRC_URI[langtools.md5sum] = "2e951b311d0cfbd7ebc6e9fbb75de891"
+SRC_URI[langtools.sha256sum] = "6c6c676c60af61638a0c3176f0312fcc0abad16d1d3cdbe11aeefcc3357a78d9"
 
-SRC_URI[openjdk.md5sum] = "d63c5b401aaa9ef76d1dbd87943aa387"
-SRC_URI[openjdk.sha256sum] = "4911adb6d7877b014777b6db6d90f1d1626314bd0c6a2c9cf9911d1e11eb4b49"
+SRC_URI[openjdk.md5sum] = "48d9f0e76f92d18aff1b9379b052b0cb"
+SRC_URI[openjdk.sha256sum] = "c66f56a91a6fa9e3c889bbbc5432a4e082b7d3735188fb508fa7ec70c142abdb"
 
 # hotspot changeset taken from hotspot/tags
-SRC_URI[hotspot.md5sum] = "5ffb731931226fbff870b80a377f6258"
-SRC_URI[hotspot.sha256sum] = "984918bcb571fecebd490160935bb282c60eb9e17b4fc8fc77733d8da164c33a"
+SRC_URI[hotspot.md5sum] = "7e1bdaf4385c3b7e77d3599c52151485"
+SRC_URI[hotspot.sha256sum] = "43983232fb10abeac99478e7045c04a93fef86185e2b9ee9c7b46f2903441cfc"
 
 ###############################################################################
 # PATCHES - split up to allow overriding them separately
-- 
2.1.4


