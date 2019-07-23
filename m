Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B7F687F044
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 00:54:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6N0s3WP017064
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 17:54:03 -0700 (PDT)
Received: from localhost (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 22 Jul 2019 17:54:02 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Jul 2019 08:54:00 +0800
Message-ID: <1563843240-6038-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.136]
Subject: [meta-networking][PATCH] snort: upgrade 2.9.13 -> 2.9.14
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
X-List-Received-Date: Tue, 23 Jul 2019 00:54:02 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/snort/{snort_2.9.13.bb => snort_2.9.14.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.13.bb => snort_2.9.14.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.13.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.14.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.13.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.14.bb
index c7e47e1..b11890c 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.13.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.14.bb
@@ -14,8 +14,8 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://configure.in-disable-tirpc-checking-for-fedora.patch \
 "
 
-SRC_URI[md5sum] = "b61ae846af022018b05511076baad60c"
-SRC_URI[sha256sum] = "31447393d15286b848810dd78ab2cb3ad231fcd1f1663f959587690eeea75413"
+SRC_URI[md5sum] = "d1689c7ccaaa7bfcfa83b5bff6b8f9b8"
+SRC_URI[sha256sum] = "c0306db9ce64f45cc7c64c9afc70abe9689daa860020345ec3ba099928b7464b"
 
 UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
 UPSTREAM_CHECK_REGEX = "snort-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.7.4


