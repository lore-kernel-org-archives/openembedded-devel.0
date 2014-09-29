Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1402C6017E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 08:38:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8T8cYtG009693
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 01:38:34 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 29 Sep 2014 01:38:34 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Sep 2014 16:37:31 +0800
Message-ID: <1411979852-32425-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH V2 1/2] quagga: add subpkgs to RRECOMMENDS
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
X-List-Received-Date: Mon, 29 Sep 2014 08:38:36 -0000
Content-Type: text/plain

We need subpkgs to start quagga, so add them to RRECOMMENDS.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 7d4211a..b1c8b5b 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -115,6 +115,8 @@ PACKAGE_BEFORE_PN = "${PN}-ospfd ${PN}-ospf6d ${PN}-babeld ${PN}-bgpd \
                      ${PN}-ripd ${PN}-ripngd ${PN}-isisd \
                      ${PN}-ospfclient ${PN}-watchquagga"
 
+RRECOMMENDS_${PN} += "${PN}-babeld ${PN}-bgpd ${PN}-isisd ${PN}-ospf6d ${PN}-ospfd ${PN}-ripd ${PN}-ripngd"
+
 FILES_${PN}-ospfd       = "${sbindir}/ospfd ${libdir}/libospf.so.*"
 FILES_${PN}-ospf6d      = "${sbindir}/ospf6d"
 FILES_${PN}-babeld      = "${sbindir}/babeld"
-- 
1.9.1


