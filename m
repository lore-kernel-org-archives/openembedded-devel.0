Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 548B16D07D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 08:23:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9I8N5Nw025106
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 01:23:05 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 18 Oct 2013 01:23:05 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Oct 2013 04:22:59 -0400
Message-ID: <1382084579-341-2-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382084579-341-1-git-send-email-liezhi.yang@windriver.com>
References: <1382084579-341-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [meta-virtualization] [PATCH 2/2] conf/layer.conf: add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Fri, 18 Oct 2013 08:23:03 -0000
Content-Type: text/plain

Add LAYERVERSION and LAYERDEPENDS, it needs depend on oe-core and
meta-networking layer.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 conf/layer.conf |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 15ed1df..3d21667 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -10,3 +10,9 @@ BBFILE_PRIORITY_virtualization-layer = "7"
 
 # Custom licenses used by some packages in this layer
 LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
+
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_virtualization-layer = "1"
+
+LAYERDEPENDS_virtualization-layer = "core networking-layer"
-- 
1.7.10.4


