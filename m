Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B210F6D561
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:36:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8P9aMw4019815
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 02:36:42 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Sep 2019 02:36:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Sep 2019 17:35:40 +0800
Message-ID: <5c902759d2f8a8be23bffe5c5c0ad709938f54a7.1569403988.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569403988.git.liezhi.yang@windriver.com>
References: <cover.1569403988.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] iperf3: Drop broken native
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
X-List-Received-Date: Wed, 25 Sep 2019 09:36:51 -0000
Content-Type: text/plain

$ bitbake iperf3-native
configure: error: --with-openssl was given, but test for OpenSSL failed

It's a broken native recipe which means no ones need it any more, so remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
index 6686a81..d5296d7 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
@@ -28,5 +28,3 @@ PACKAGECONFIG[lksctp] = "ac_cv_header_netinet_sctp_h=yes,ac_cv_header_netinet_sc
 CFLAGS += "-D_GNU_SOURCE"
 
 EXTRA_OECONF = "--with-openssl=${RECIPE_SYSROOT}${prefix}"
-
-BBCLASSEXTEND = "native"
-- 
2.7.4


