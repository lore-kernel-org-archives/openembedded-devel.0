Return-Path: <lchristina26@hotmail.com>
X-Greylist: delayed 301 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 22 Mar 2016 19:02:37 UTC
Received: from BLU004-OMC3S6.hotmail.com (blu004-omc3s6.hotmail.com
	[65.55.116.81])
	by mail.openembedded.org (Postfix) with ESMTP id 81AC760767
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2016 19:02:37 +0000 (UTC)
Received: from BLU436-SMTP132 ([65.55.116.73]) by BLU004-OMC3S6.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008);
	Tue, 22 Mar 2016 11:57:37 -0700
X-TMN: [8Vl8zflKoWemITR8ziheHhRgkWjEU7Pq]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP1320EDBAE60DB653467A962D6800@phx.gbl>
From: LC Mac <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2016 12:57:28 -0600
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 22 Mar 2016 18:57:36.0796 (UTC)
	FILETIME=[B32E85C0:01D1846C]
MIME-Version: 1.0
Subject: [meta-networking][PATCH] wolfssl: update to version 3.9.0
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
X-List-Received-Date: Tue, 22 Mar 2016 19:02:37 -0000
Content-Type: text/plain

Update includes new leantls configuration, RSA OAEP padding support,
Arduino example client, and more.

Signed-off-by: lchristina26 <leah@wolfssl.com>
---
 .../wolfssl/{wolfssl_3.4.0.bb => wolfssl_3.9.0.bb}                    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.4.0.bb => wolfssl_3.9.0.bb} (82%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.9.0.bb
similarity index 82%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_3.9.0.bb
index 591ff32..d086cef 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.9.0.bb
@@ -14,8 +14,8 @@ RPROVIDES_${PN} = "cyassl"
 
 SRC_URI = "http://www.wolfssl.com/${BP}.zip"
 
-SRC_URI[md5sum] = "ec6ed4c5847454ac928215a46b3e0c33"
-SRC_URI[sha256sum] = "bc49a142c17b1e52a126417e5d7cbadcb7f18f5c81e446c12e214483395159ea"
+SRC_URI[md5sum] = "f3396726a9befd61443c2cce216e39ba"
+SRC_URI[sha256sum] = "98f50244f7b43f8683bd0cf5c599849d330e75e6cf077e96f14e83bda8b03ca3"
 
 inherit autotools
 
-- 
1.9.1


