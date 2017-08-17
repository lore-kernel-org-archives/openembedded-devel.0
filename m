Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B512E78441
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 06:39:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7H6ddL9006666
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 23:39:39 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 16 Aug 2017 23:39:38 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Aug 2017 14:40:14 +0800
Message-ID: <1502952015-23737-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502952015-23737-1-git-send-email-yi.zhao@windriver.com>
References: <1502952015-23737-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-oe][PATCH 1/2] iproute2: add bbappend for supporting tipc tool
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
X-List-Received-Date: Thu, 17 Aug 2017 06:39:37 -0000
Content-Type: text/plain

The tipcutils 2.2 removed the tipc-config tool and recommended to use
the new configuration tool named "tipc" in iproute2 package for
configuring the tipc, which utilizes the new tipc netlink kernel API.

We supported tipc in iproute2 with PACKAGECONFIG in oe-core commit
944ef0de241de77429ab0e5cb1dd4a7f355cf3fd

Add iproute2 bbappend to enable tipc for tipcutils.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend

diff --git a/meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend b/meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend
new file mode 100644
index 0000000..0869f7f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend
@@ -0,0 +1,2 @@
+# For tipcutils
+PACKAGECONFIG_append = " tipc"
-- 
2.7.4


