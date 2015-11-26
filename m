Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4A44D6057B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2015 04:39:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAQ4dSEe004979
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2015 20:39:29 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 25 Nov 2015 20:39:28 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Nov 2015 12:28:28 +0800
Message-ID: <1448512108-16659-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] ufw: improve RRECOMMENDS
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
X-List-Received-Date: Thu, 26 Nov 2015 04:39:30 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

ufw needs lots of netfilter module to run

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-connectivity/ufw/ufw_0.33.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
index 66e917e..19cfe46 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
@@ -30,6 +30,14 @@ RDEPENDS_${PN} = " \
 
 RRECOMMENDS_${PN} = " \
                      kernel-module-ipv6 \
+                     kernel-module-nf-conntrack-ipv6 \
+                     kernel-module-nf-log-common \
+                     kernel-module-nf-log-ipv4 \
+                     kernel-module-nf-log-ipv6 \
+                     kernel-module-nf-addrtype \
+                     kernel-module-nf-limit \
+                     kernel-module-nf-log \
+                     kernel-module-nf-recent \
 "
 
 # Certain items are explicitly put under /lib, not base_libdir when installed.
-- 
1.9.1


