Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 717C5746BB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 07:20:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4T7KGrt032479
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 00:20:31 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 00:20:05 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 May 2018 15:17:46 +0800
Message-ID: <1527578277-26494-14-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
References: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-oe][PATCH 13/24] libreport: add UPSTREAM_CHECK_GITTAGREGEX
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
X-List-Received-Date: Tue, 29 May 2018 07:20:40 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/libreport/libreport_2.9.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb b/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
index f2c661c..edcccd1 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
@@ -19,6 +19,9 @@ SRC_URI += "file://0001-Makefile.am-remove-doc-and-apidoc.patch \
             file://0005-remove-python2-support.patch \
 "
 SRCREV = "cfff49f06d9d17e269d463ee71b3d94c8bfb0c58"
+
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
+
 S = "${WORKDIR}/git"
 
 inherit distro_features_check
-- 
2.7.4


