Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BED8171B4F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Dec 2016 01:46:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uB71l1Cc011167
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 6 Dec 2016 17:47:01 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 6 Dec 2016 17:47:00 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 Dec 2016 09:47:54 +0800
Message-ID: <1481075276-9315-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/3] inetutils: fix alternative priority to avoid conflict
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
X-List-Received-Date: Wed, 07 Dec 2016 01:47:01 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Fix ALTERNATIVE_PRIORITY for the logger utility to avoid the same priority
with that from util-linux.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index 8db6b74..94a6a6f 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -98,6 +98,7 @@ ALTERNATIVE_${PN} = "talk whois"
 ALTERNATIVE_LINK_NAME[talkd]  = "${sbindir}/in.talkd"
 ALTERNATIVE_LINK_NAME[uucpd]  = "${sbindir}/in.uucpd"
 
+ALTERNATIVE_PRIORITY_${PN}-logger = "60"
 ALTERNATIVE_${PN}-logger = "logger"
 ALTERNATIVE_${PN}-syslogd = "syslogd"
 ALTERNATIVE_LINK_NAME[syslogd]  = "${base_sbindir}/syslogd"
-- 
2.1.0


