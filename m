Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 556AF60939
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Dec 2017 13:15:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBCDFEJM023427
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Dec 2017 05:15:14 -0800
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 12 Dec 2017 05:15:14 -0800
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Dec 2017 15:15:12 +0200
Message-ID: <20171212131512.32352-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] net-snmp: fix invalid paths in target net-snmp-config
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
X-List-Received-Date: Tue, 12 Dec 2017 13:15:14 -0000
Content-Type: text/plain

Remove build host paths form target net-snmp-config.

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index af6fd1b..9401c7e 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -116,6 +116,10 @@ do_install_append() {
     sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
         -i ${D}${bindir}/net-snmp-create-v3-user
     sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
+           -e "s@${STAGING_DIR_NATIVE}[=]*@@g" \
+           -e "s@${STAGING_DIR_HOST}[=]*@@g" \
+           -e "s@${WORKDIR}[=]*@@g" \
+           -e "s@${D}@@g" \
         -i ${D}${bindir}/net-snmp-config
 
     if [ "${HAS_PERL}" = "1" ]; then
-- 
2.10.2


