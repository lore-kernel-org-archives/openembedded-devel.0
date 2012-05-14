Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxwZ-0002ts-A2
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:16:19 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG6Jsm024464
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:06:19 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6JeF007245
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:06:19 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:06:19 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AHe028612;
	Mon, 14 May 2012 11:06:17 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:09:27 -0500
Message-ID: <1337011834-24879-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 02/69] libtasn1: update LICENSE setting
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
X-List-Received-Date: Mon, 14 May 2012 16:16:19 -0000
Content-Type: text/plain

* Updated the LICENSE field setting based on settings in oe-core
  as well as code inspection.
* Inherit lib_package to separate out the GPLv3 binaries from the
  LGPLv2.1 libraries
* Bump the PR

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/gnutls/libtasn1_1.7.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes/gnutls/libtasn1_1.7.bb b/recipes/gnutls/libtasn1_1.7.bb
index 44da659..0603949 100644
--- a/recipes/gnutls/libtasn1_1.7.bb
+++ b/recipes/gnutls/libtasn1_1.7.bb
@@ -1,11 +1,13 @@
 DESCRIPTION = "Library for ASN.1 and DER manipulation"
-LICENSE = "LGPL"
+LICENSE = "GPLv3+ LGPLv2.1+"
+LICENSE_${PN}-bin = "GPLv3+"
+LICENSE_${PN} = "LGPLv2.1+"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/libtasn1/libtasn1-${PV}.tar.gz"
 
-inherit autotools binconfig
+inherit autotools binconfig lib_package
 
 SRC_URI[md5sum] = "ebfd69b3514d8e8830057f0e9df6a5f9"
 SRC_URI[sha256sum] = "9431f8e41acbeb5b5b89ec87a092b1a1fe9ef0a229a9a90806f4774707ca1f1f"
-- 
1.7.0.4



