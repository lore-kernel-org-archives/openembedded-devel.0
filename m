Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E57E273199
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:06:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7I96KBu020419
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 18 Aug 2016 02:06:20 -0700
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 18 Aug 2016 02:06:19 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Thu, 18 Aug 2016 17:06:17 +0800
Message-ID: <1471511177-12589-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [meta-networking][PATCH] squid: add missing patch header
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
X-List-Received-Date: Thu, 18 Aug 2016 09:06:22 -0000
Content-Type: text/plain

Add upstream-status and signed-off-by line to the patch to obey the
recommendations:
http://openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-daemons/squid/files/set_sysroot_patch.patch            | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch b/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch
index 68733f9..fdcd174 100644
--- a/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch
+++ b/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch
@@ -1,3 +1,10 @@
+Set the SYSROOT for libxml2 header file to avoid host contamination.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
 diff --git a/configure.ac.old b/configure.ac
 index 54eda73..874f48e 100644
 --- a/configure.ac.old
-- 
2.7.4


