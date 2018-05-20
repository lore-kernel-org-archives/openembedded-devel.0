Return-Path: <sjl@vctlabs.com>
X-Greylist: delayed 329 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 20 May 2018 02:31:00 UTC
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id A473774EC1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 02:31:00 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 896AC2804CF; Sat, 19 May 2018 19:29:31 -0700 (PDT)
Date: Sat, 19 May 2018 19:29:31 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20180520022931.GY31886@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-oe] [PATCH] libev: correct source path
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
X-List-Received-Date: Sun, 20 May 2018 02:31:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace PN with BPN, since source unpacks to the same place
regardless of building for multilib (or native, though that's
not enabled here) where PN != BPN

Signed-off-by: S.Lockwood-Childs <sjl@vctlabs.com>
---
 meta-oe/recipes-connectivity/libev/libev_4.24.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libev/libev_4.24.bb b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
index 5e0f3a5..399fdd9 100644
--- a/meta-oe/recipes-connectivity/libev/libev_4.24.bb
+++ b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://dist.schmorp.de/libev/Attic/${BP}.tar.gz"
 SRC_URI[md5sum] = "94459a5a22db041dec6f98424d6efe54"
 SRC_URI[sha256sum] = "973593d3479abdf657674a55afe5f78624b0e440614e2b8cb3a07f16d4d7f821"
 
-S = "${WORKDIR}/${PN}-${PV}"
+S = "${WORKDIR}/${BPN}-${PV}"
 
 inherit autotools
 
-- 
1.9.4


