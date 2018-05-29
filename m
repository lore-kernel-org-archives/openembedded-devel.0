Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A34BD745A3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 07:19:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4T7JZgP032462
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 00:19:50 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 00:19:25 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 May 2018 15:17:42 +0800
Message-ID: <1527578277-26494-10-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
References: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-oe][PATCH 09/24] haveged: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Tue, 29 May 2018 07:19:59 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/haveged/haveged_1.9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.2.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.2.bb
index 05ee842..bf13673 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.2.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.2.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://www.issihosts.com/haveged/haveged-${PV}.tar.gz \
 SRC_URI[md5sum] = "fb1d8b3dcbb9d06b30eccd8aa500fd31"
 SRC_URI[sha256sum] = "f77d9adbdf421b61601fa29faa9ce3b479d910f73c66b9e364ba8642ccbfbe70"
 
+UPSTREAM_CHECK_URI = "http://www.issihosts.com/haveged/downloads.html"
+
 inherit autotools update-rc.d systemd
 
 EXTRA_OECONF = "\
-- 
2.7.4


