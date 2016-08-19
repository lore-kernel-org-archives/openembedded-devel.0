Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8B3DC77081
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 10:04:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7JA4O74026421
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 03:04:25 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Fri, 19 Aug 2016 03:04:23 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Aug 2016 18:04:15 +0800
Message-ID: <0159b82ac947ad69460adcec9d79ee83b76d2a7b.1471600808.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1471600808.git.yi.zhao@windriver.com>
References: <cover.1471600808.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [meta-networking][PATCH 1/3] ifenslave: fix QA warning for GNU_HASH
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
X-List-Received-Date: Fri, 19 Aug 2016 10:04:25 -0000
Content-Type: text/plain

Set LDFLAGS explicitly for do_compile

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
index acc0864..385bc80 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
@@ -10,7 +10,7 @@ SRC_URI[md5sum] = "56126cd1013cefe0ce6f81613e677bdd"
 SRC_URI[sha256sum] = "7917bf34de80a2492eb225adf9168c83a4854ac8a008ed0fd5b3fd147ccd3041"
 
 do_compile() {
-    ${CC} ifenslave.c -o ifenslave
+    ${CC} ${LDFLAGS} ifenslave.c -o ifenslave
 }
 do_install() {
     install -d "${D}${sbindir}"
-- 
2.7.4


