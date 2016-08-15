Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C8D476E4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 06:00:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7F603xX013299
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Aug 2016 23:00:03 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 14 Aug 2016 23:00:02 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Aug 2016 13:45:12 +0800
Message-ID: <ad2660f1ab3247a228a859b62bee1e0e7d3c783c.1471240191.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1471240191.git.jackie.huang@windriver.com>
References: <cover.1471240191.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/6] ctdb: upgrade to 2.5.6
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
X-List-Received-Date: Mon, 15 Aug 2016 06:00:03 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-support/ctdb/{ctdb_2.5.1.bb => ctdb_2.5.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ctdb/{ctdb_2.5.1.bb => ctdb_2.5.6.bb} (93%)

diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
similarity index 93%
rename from meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
rename to meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
index 5d75784..d58e572 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
@@ -16,8 +16,8 @@ SRC_URI = "https://ftp.samba.org/pub/${PN}/${BP}.tar.gz \
            file://service-ensure-the-PID-directory-is-created.patch \
           "
 
-SRC_URI[md5sum] = "d0cd91726ff4ca2229e1b21859c94717"
-SRC_URI[sha256sum] = "d5bf3f674cae986bb6178b1db215a703ac94adc5f75fadfdcff63dcbb5e98ab5"
+SRC_URI[md5sum] = "efc50109f90a4c790124c35e4ba234ad"
+SRC_URI[sha256sum] = "fc1cdd7efcc91afc629f21408281bba5da107b9c17e74bdee2f28a532d14f874"
 
 inherit autotools-brokensep pkgconfig systemd
 
-- 
1.9.1


