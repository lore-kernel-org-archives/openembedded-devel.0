Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E474C782FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 03:01:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7N31VWb011902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Aug 2017 20:01:31 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 Aug 2017 20:01:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Aug 2017 23:01:24 -0400
Message-ID: <5d037638e1b1f191bc02346af0511ee1264deee3.1503457180.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1503457180.git.hongxu.jia@windriver.com>
References: <cover.1503457180.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] collectd: 5.7.1 -> 5.7.2
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
X-List-Received-Date: Wed, 23 Aug 2017 03:01:35 -0000
Content-Type: text/plain

The 5.7.2 fixed CVE-2017-7401.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../collectd/{collectd_5.7.1.bb => collectd_5.7.2.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/collectd/{collectd_5.7.1.bb => collectd_5.7.2.bb} (96%)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.7.1.bb b/meta-oe/recipes-extended/collectd/collectd_5.7.2.bb
similarity index 96%
rename from meta-oe/recipes-extended/collectd/collectd_5.7.1.bb
rename to meta-oe/recipes-extended/collectd/collectd_5.7.2.bb
index b7789c7..c156ea1 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.7.1.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.7.2.bb
@@ -13,8 +13,8 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://0001-fix-to-build-with-glibc-2.25.patch \
            file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
 "
-SRC_URI[md5sum] = "dc36141ed3058c4919bbd54b87c07873"
-SRC_URI[sha256sum] = "7edd3643c0842215553b2421d5456f4e9a8a58b07e216b40a7e8e91026d8e501"
+SRC_URI[md5sum] = "5da2b69c286a064db35c6cc1e758b039"
+SRC_URI[sha256sum] = "9d20a0221569a8d6b80bbc52b86e5e84965f5bafdbf5dfc3790e0fed0763e592"
 
 inherit autotools pythonnative update-rc.d pkgconfig systemd
 
-- 
2.8.1


