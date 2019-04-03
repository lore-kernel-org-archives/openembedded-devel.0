Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 03B447C603
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 03:19:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x333JQVl013509
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Apr 2019 20:19:26 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 2 Apr 2019 20:19:25 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 3 Apr 2019 11:10:21 +0800
Message-ID: <1554261021-29102-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] ipsec-tools: add missing CVE tags to patches
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
X-List-Received-Date: Wed, 03 Apr 2019 03:19:25 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2015-4047.patch     | 2 ++
 .../recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch    | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2015-4047.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2015-4047.patch
index 5286376..7e033af 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2015-4047.patch
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2015-4047.patch
@@ -2,6 +2,8 @@
 
 Upstream-Status: Backport
 
+CVE: CVE-2015-4047
+
 http://www.openwall.com/lists/oss-security/2015/05/20/1
 
 racoon/gssapi.c in IPsec-Tools 0.8.2 allows remote attackers to cause
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch
index bd07965..19220c4 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch
@@ -1,6 +1,6 @@
 Upstream-Status: Backport [https://anonscm.debian.org/cgit/pkg-ipsec-tools/pkg-ipsec-tools.git/plain/debian/patches/CVE-2016-10396.patch?id=62ac12648a4eb7c5ba5dba0f81998d1acf310d8b]
 
-Fix CVE-2016-10396.
+CVE: CVE-2016-10396.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
-- 
2.7.4


