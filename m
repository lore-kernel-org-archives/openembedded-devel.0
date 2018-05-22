Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 4211A748DD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 07:23:12 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 6730E28042E; Tue, 22 May 2018 00:27:12 -0700 (PDT)
Date: Tue, 22 May 2018 00:27:12 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20180522072712.GE31886@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-oe] [PATCH V2] libev: correct source path
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
X-List-Received-Date: Tue, 22 May 2018 07:23:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Let S default to "${WORKDIR}/${BPN}-${PV}" rather than replacing PN
with BPN, since source always unpacks to the same place including when
building for multilib (or native, though that's not enabled here)
in which case PN != BPN

Signed-off-by: S.Lockwood-Childs <sjl@vctlabs.com>
---
 meta-oe/recipes-connectivity/libev/libev_4.24.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libev/libev_4.24.bb b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
index 5e0f3a5..a5838d3 100644
--- a/meta-oe/recipes-connectivity/libev/libev_4.24.bb
+++ b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
@@ -9,8 +9,6 @@ SRC_URI = "http://dist.schmorp.de/libev/Attic/${BP}.tar.gz"
 SRC_URI[md5sum] = "94459a5a22db041dec6f98424d6efe54"
 SRC_URI[sha256sum] = "973593d3479abdf657674a55afe5f78624b0e440614e2b8cb3a07f16d4d7f821"
 
-S = "${WORKDIR}/${PN}-${PV}"
-
 inherit autotools
 
 EXTRA_OECONF += "--with-pic"
-- 
1.9.4


