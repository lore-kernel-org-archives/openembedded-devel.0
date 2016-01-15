Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A5EA9731A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 09:24:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0F9O9D9022940
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Jan 2016 01:24:10 -0800 (PST)
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Fri, 15 Jan 2016 01:24:09 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jan 2016 17:23:53 +0800
Message-ID: <3ce8458c7c8a81ccff262b2a176a18cef65ef89e.1452848802.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452848802.git.yi.zhao@windriver.com>
References: <cover.1452848802.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [meta-oe][PATCH 3/4 v2] orrery: fix host-user-contaminated
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
X-List-Received-Date: Fri, 15 Jan 2016 09:24:09 -0000
Content-Type: text/plain

Fix QA warning:
WARNING: QA Issue: orrery: /orrery/usr/share/orrery/deepSky/messier is owned by uid 1000,
which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
index b3372b1..4785f69 100644
--- a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
+++ b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
@@ -21,9 +21,10 @@ do_configure_prepend() {
     # fix DSO issue with binutils-2.22
     sed -i 's/ -lrt/ -lrt -lm/g' ${S}/Makefile.am
 }
+
 do_install_append() {
     install -d ${D}${datadir}/orrery
-    cp -a ${S}/data/* ${D}${datadir}/orrery
+    cp -R --no-dereference --preserve=mode,links ${S}/data/* ${D}${datadir}/orrery
     install -d ${D}${datadir}/icons
     install -m 0755 ${WORKDIR}/orrery.png ${D}${datadir}/icons
 }
-- 
1.7.9.5


