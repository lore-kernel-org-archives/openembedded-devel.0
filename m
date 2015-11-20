Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 01732601D3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 10:06:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAKA6MP1001566
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 02:06:23 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 20 Nov 2015 02:05:18 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Nov 2015 02:05:13 -0800
Message-ID: <a45598f01fd11c9fee84bfb1055cbf9a220ca765.1448012203.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448012203.git.liezhi.yang@windriver.com>
References: <cover.1448012203.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] ctdb: add PACKAGECONFIG for libtdb
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
X-List-Received-Date: Fri, 20 Nov 2015 10:06:22 -0000
Content-Type: text/plain

Fixed:
WARNING: QA Issue: ctdb rdepends on libtdb, but it isn't a build dependency? [build-deps]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
index 70bdfb1..c19916c 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
@@ -24,6 +24,9 @@ SRC_URI[sha256sum] = "d5bf3f674cae986bb6178b1db215a703ac94adc5f75fadfdcff63dcbb5
 
 inherit autotools-brokensep pkgconfig systemd
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[libtdb] = "--without-included-tdb,--with-included-tdb,libtdb"
+
 PARALLEL_MAKE = ""
 
 DEPENDS += "popt libtevent talloc"
-- 
1.7.9.5


