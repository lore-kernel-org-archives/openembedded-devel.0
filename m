Return-Path: <lchristina26@hotmail.com>
Received: from BLU004-OMC3S27.hotmail.com (blu004-omc3s27.hotmail.com
	[65.55.116.102])
	by mail.openembedded.org (Postfix) with ESMTP id 95ED3731FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 17:21:06 +0000 (UTC)
Received: from BLU436-SMTP86 ([65.55.116.74]) by BLU004-OMC3S27.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008);
	Thu, 7 Jan 2016 09:21:07 -0800
X-TMN: [mkftD2o+BXB62iiUaO2+AnM58XLkgkVB]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP8654CB430C712153FB89F1D6F50@phx.gbl>
From: LC Mac <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 7 Jan 2016 10:20:51 -0700
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 07 Jan 2016 17:21:06.0625 (UTC)
	FILETIME=[CAFD4B10:01D1496F]
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2] wolfssl: update to version 3.8.0
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
X-List-Received-Date: Thu, 07 Jan 2016 17:21:07 -0000
Content-Type: text/plain

Version 3.8.0 of includes VxWorks example client/server, AESNI use
with AES-GCM, Stunnel compatibility, C# wrapper, and more.

Signed-off-by: lchristina26 <leah@wolfssl.com>
---
 .../wolfssl/{wolfssl_3.6.6.bb => wolfssl_3.8.0.bb}                    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.6.6.bb => wolfssl_3.8.0.bb} (83%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.6.6.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.8.0.bb
similarity index 83%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_3.6.6.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_3.8.0.bb
index 2366fb1..ac5dff0 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.6.6.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.8.0.bb
@@ -14,8 +14,8 @@ RPROVIDES_${PN} = "cyassl"
 
 SRC_URI = "http://www.wolfssl.com/${BP}.zip"
 
-SRC_URI[md5sum] = "ec6ed4c5847454ac928215a46b3e0c33"
-SRC_URI[sha256sum] = "bc49a142c17b1e52a126417e5d7cbadcb7f18f5c81e446c12e214483395159ea"
+SRC_URI[md5sum] = "a73d90c5439adea97a5002a73b46ddeb"
+SRC_URI[sha256sum] = "36369304dd107b2ae1360c91f3d0eea491802dcacb2155562652bf5257117016"
 
 inherit autotools
 
-- 
1.9.1


