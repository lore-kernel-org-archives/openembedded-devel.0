Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9802574A01
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 07:56:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4P7uJcn023818
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 May 2018 00:56:19 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 25 May 2018 00:56:18 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Fri, 25 May 2018 15:54:47 +0800
Message-ID: <1527234893-8733-7-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527234893-8733-1-git-send-email-yi.zhao@windriver.com>
References: <1527234893-8733-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 06/12] ebtables: add RECIPE_UPSTREAM_VERSION
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
X-List-Received-Date: Fri, 25 May 2018 07:56:18 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index b9dce69..f05bd61 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -36,6 +36,15 @@ SRC_URI_append_libc-musl = " file://0010-Adjust-header-include-sequence.patch"
 SRC_URI[md5sum] = "506742a3d44b9925955425a659c1a8d0"
 SRC_URI[sha256sum] = "dc6f7b484f207dc712bfca81645f45120cb6aee3380e77a1771e9c34a9a4455d"
 
+# It is using '-' but not '.' as delimiter for the version in the releases page,
+# which causes the version comparison unmatched.
+#UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/ebtables/files/ebtables/"
+#UPSTREAM_CHECK_REGEX = "ebtables-(?P<pver>\d+(\-\d+)+)"
+
+RECIPE_UPSTREAM_VERSION = "2.0.10-4"
+RECIPE_UPSTREAM_DATE = "Dec 15, 2011"
+CHECK_DATE = "May 25, 2018"
+
 S = "${WORKDIR}/ebtables-v${PV}"
 
 inherit update-rc.d systemd
-- 
2.7.4


