Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1A9D7470D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 07:18:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4T7IFhx032439
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 00:18:31 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 00:18:05 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 May 2018 15:17:34 +0800
Message-ID: <1527578277-26494-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
References: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-oe][PATCH 01/24] iozone3: add UPSTREAM_CHECK_REGEX
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
X-List-Received-Date: Tue, 29 May 2018 07:18:40 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-benchmark/iozone3/iozone3_465.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
index 2864a4d..191b934 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
@@ -13,6 +13,8 @@ SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
 SRC_URI[md5sum] = "c924e5e46fb1cf8145f420e8e57eb954"
 SRC_URI[sha256sum] = "2e3d72916e7d7340a7c505fc0c3d28553fcc5ff2daf41d811368e55bd4e6a293"
 
+UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
+
 S = "${WORKDIR}/${BPN}_${PV}/src/current/"
 
 #
-- 
2.7.4


