Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D008C71B4F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Dec 2016 01:47:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uB71l2ho013151
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Dec 2016 17:47:03 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 6 Dec 2016 17:47:02 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 Dec 2016 09:47:55 +0800
Message-ID: <1481075276-9315-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481075276-9315-1-git-send-email-Qi.Chen@windriver.com>
References: <1481075276-9315-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/3] netcat-openbsd: fix ALTERNATIVE_PRIORITY to avoid conflict
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
X-List-Received-Date: Wed, 07 Dec 2016 01:47:02 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Fix ALTERNATIVE_PRIORITY to avoid the same priority of the 'nc' utility
with that from busybox.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
index 3311d24..0afe10c 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
@@ -41,4 +41,4 @@ do_install() {
     install -d ${D}${bindir}
     install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
 }
-ALTERNATIVE_PRIORITY = "50"
+ALTERNATIVE_PRIORITY = "60"
-- 
2.1.0


