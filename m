Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDB5B6A8D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 21:56:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5ILuF5Q008797
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 14:56:16 -0700 (PDT)
Received: from fidler.corp.ad.wrs.com (128.224.22.80) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 14:56:15 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Jun 2013 17:55:53 -0400
Message-ID: <1371592553-6585-2-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1371592553-6585-1-git-send-email-Randy.MacLeod@windriver.com>
References: <1371592553-6585-1-git-send-email-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] nostromo: make SRC_URI work for multilib builds.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Jun 2013 21:56:14 -0000
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
index e66676e..94c32d8 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.nazgul.ch/dev_nostromo.html"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/nhttpd/main.c;beginline=2;endline=14;md5=e5ec3fa723b29b7d59d205afd8d36938"
 
-SRC_URI = "http://www.nazgul.ch/dev/${PN}-${PV}.tar.gz \
+SRC_URI = "http://www.nazgul.ch/dev/${BPN}-${PV}.tar.gz \
            file://0001-GNUmakefile-add-possibility-to-override-variables.patch \
            file://nhttpd.conf \
            file://volatiles \
-- 
1.8.2.1


