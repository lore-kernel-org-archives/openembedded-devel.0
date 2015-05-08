Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE4C96081A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 07:42:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t487gwr0021179
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 8 May 2015 00:42:58 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 8 May 2015 00:42:57 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 May 2015 15:42:22 +0800
Message-ID: <1431070955-7100-7-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 07/20] gpsd: fix PN -> BPN for multilib
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
X-List-Received-Date: Fri, 08 May 2015 07:42:56 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
index 93cf1ae..b37fc15 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
@@ -85,8 +85,8 @@ do_install_append() {
 
     #support for systemd
     install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
-    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
+    install -m 0644 ${WORKDIR}/${BPN}.service ${D}${systemd_unitdir}/system/${BPN}.service
+    install -m 0644 ${S}/systemd/${BPN}.socket ${D}${systemd_unitdir}/system/${BPN}.socket
 }
 
 pkg_postinst_${PN}-conf() {
-- 
1.7.9.5


