Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E5285601A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 03:52:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAJ3qAuH018019
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 19:52:11 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 18 Nov 2015 19:52:10 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Nov 2015 11:37:40 +0800
Message-ID: <1447904260-22748-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1447904260-22748-1-git-send-email-Qi.Chen@windriver.com>
References: <1447904260-22748-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] tipcutils: fix host-user-comtaminated QA issue
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
X-List-Received-Date: Thu, 19 Nov 2015 03:52:11 -0000
Content-Type: text/plain

Fix the 'host-user-comtaminated' QA issue by using chown in do_install.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
index fe0e484..046fb2c 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
@@ -32,6 +32,7 @@ do_install_append() {
 
     install -d ${D}${sysconfdir}
     cp -a ${S}/scripts/etc/* ${D}${sysconfdir}/
+    chown -R root:root ${D}${sysconfdir}
 }
 
 PACKAGES += "${PN}-demos"
-- 
1.9.1


