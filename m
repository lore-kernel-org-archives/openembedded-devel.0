Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STy1k-00084S-DV
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:21:41 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG6Hm7025847
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:06:17 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6Gm3007204
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:06:17 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:06:16 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AHd028612;
	Mon, 14 May 2012 11:06:14 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:09:26 -0500
Message-ID: <1337011834-24879-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 01/69] gnutls: update LICENSE setting
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
X-List-Received-Date: Mon, 14 May 2012 16:22:35 -0000
Content-Type: text/plain

* Updated the LICENSE field setting based on settings in oe-core
  as well as code inspection.
* Gave specific LICENSE versions instead of generic GPL LGPL
* Bump the INC_PR

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/gnutls/gnutls.inc |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/recipes/gnutls/gnutls.inc b/recipes/gnutls/gnutls.inc
index 6fb712f..a8e1e0d 100644
--- a/recipes/gnutls/gnutls.inc
+++ b/recipes/gnutls/gnutls.inc
@@ -1,14 +1,18 @@
 DESCRIPTION = "GNU Transport Layer Security Library"
 HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 DEPENDS = "zlib libgcrypt lzo guile-native gtk-doc"
-LICENSE = "LGPL"
-LICENSE_${PN}-extra = "GPLv3"
+LICENSE = "GPLv3+ LGPLv2.1+"
+LICENSE_${PN} = "LGPLv2.1+"
+LICENSE_${PN}-xx = "LGPLv2.1+"
+LICENSE_${PN}-bin = "GPLv3+"
+LICENSE_${PN}-extra = "GPLv3+"
+LICENSE_${PN}-openssl = "GPLv3+"
 
 SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2;name=gnutls"
 
 inherit autotools binconfig pkgconfig gettext
 
-INC_PR = "r11"
+INC_PR = "r12"
 
 EXTRA_OECONF = "--with-included-opencdk --with-included-libtasn1 --disable-rpath"
 
-- 
1.7.0.4



