Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE12577E7A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 08:05:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v52857jA009155
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Jun 2017 01:05:07 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 2 Jun 2017 01:05:07 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Jun 2017 16:04:58 +0800
Message-ID: <47d941314b3699f5a9488cf4e267f068b7c8b694.1496390474.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496390474.git.jackie.huang@windriver.com>
References: <cover.1496390474.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] umip: fix EXTRA_OECONF and add RRECOMMENDS
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
X-List-Received-Date: Fri, 02 Jun 2017 08:05:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* fix EXTRA_OE_CONF -> EXTRA_OECONF
* add RRECOMMENDS on kernel modules

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-connectivity/umip/umip_1.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
index b8b90eb81..a25056645 100644
--- a/meta-oe/recipes-connectivity/umip/umip_1.0.bb
+++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
@@ -17,7 +17,8 @@ SRC_URI = "git://git.umip.org/umip.git \
 SRCREV = "428974c2d0d8e75a2750a3ab0488708c5dfdd8e3"
 
 S = "${WORKDIR}/git"
-EXTRA_OE_CONF = "--enable-vt"
+
+EXTRA_OECONF = "--enable-vt"
 
 inherit autotools-brokensep systemd update-rc.d
 
@@ -34,3 +35,5 @@ do_install_append() {
 	    -e 's,@SBINDIR@,${sbindir},g' \
 	    ${D}${systemd_system_unitdir}/mip6d.service
 }
+
+RRECOMMENDS_${PN} = "kernel-module-mip6 kernel-module-ipv6"
-- 
2.11.0


