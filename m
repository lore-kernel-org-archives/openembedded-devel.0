Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTft-0000R7-Dj
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:33:29 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LENLFj009559
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:21 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENLgQ029686
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:21 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:23:21 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENAoZ008382;
	Mon, 21 May 2012 09:23:19 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:02 -0500
Message-ID: <1337610609-1173-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 03/70] libtasn1: inherit lib_package to split GPLv3 packages
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
X-List-Received-Date: Mon, 21 May 2012 14:33:29 -0000
Content-Type: text/plain

* Inherit lib_package to separate out the GPLv3 binaries from the
  LGPLv2.1 libraries
* Bump the PR

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/gnutls/libtasn1_1.7.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gnutls/libtasn1_1.7.bb b/recipes/gnutls/libtasn1_1.7.bb
index 65b6321..0603949 100644
--- a/recipes/gnutls/libtasn1_1.7.bb
+++ b/recipes/gnutls/libtasn1_1.7.bb
@@ -3,11 +3,11 @@ LICENSE = "GPLv3+ LGPLv2.1+"
 LICENSE_${PN}-bin = "GPLv3+"
 LICENSE_${PN} = "LGPLv2.1+"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/libtasn1/libtasn1-${PV}.tar.gz"
 
-inherit autotools binconfig
+inherit autotools binconfig lib_package
 
 SRC_URI[md5sum] = "ebfd69b3514d8e8830057f0e9df6a5f9"
 SRC_URI[sha256sum] = "9431f8e41acbeb5b5b89ec87a092b1a1fe9ef0a229a9a90806f4774707ca1f1f"
-- 
1.7.0.4



