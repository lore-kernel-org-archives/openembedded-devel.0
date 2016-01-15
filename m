Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 33FF0731A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 09:24:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0F9ODjF021584
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Jan 2016 01:24:13 -0800 (PST)
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Fri, 15 Jan 2016 01:24:13 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jan 2016 17:23:54 +0800
Message-ID: <a03d6c3a2653fb4d977016c3120498f3ed3331c9.1452848802.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452848802.git.yi.zhao@windriver.com>
References: <cover.1452848802.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [meta-oe][PATCH 4/4 v2] logwatch: fix host-user-contaminated
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
X-List-Received-Date: Fri, 15 Jan 2016 09:24:13 -0000
Content-Type: text/plain

Fix QA warning:
WARNING: QA Issue: logwatch: /logwatch/usr/share/logwatch/scripts/services/resolver is owned by uid 1000,
which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-extended/logwatch/logwatch_7.4.1.bb    |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb
index 001b3de..b121522 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb
@@ -23,6 +23,7 @@ do_install() {
     mv conf/ ${D}${datadir}/logwatch/default.conf
     mv scripts/ ${D}${datadir}/logwatch/scripts
     mv lib ${D}${datadir}/logwatch/lib
+    chown -R root:root ${D}${datadir}/logwatch
 
     install -m 0755 -d ${D}${mandir}/man1
     install -m 0755 -d ${D}${mandir}/man5
-- 
1.7.9.5


