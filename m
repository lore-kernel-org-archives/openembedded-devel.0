Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 50A166D750
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 13:21:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rACDLhpT002329
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 05:21:43 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 12 Nov 2013 05:21:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Nov 2013 05:24:24 +0800
Message-ID: <1384291464-12185-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-networking] [PATCH] quagga: use /bin/false as the login shell
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
X-List-Received-Date: Tue, 12 Nov 2013 13:21:41 -0000
Content-Type: text/plain

Use /bin/false as the login shell, just like what Ubuntu does,
otherwise there might be secure issue.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 2106c9b..677b1c5 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -148,7 +148,7 @@ INITSCRIPT_PARAMS_${PN}-watchquagga     = "defaults 90 10"
 # Add quagga's user and group
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system quagga ; --system quaggavty"
-USERADD_PARAM_${PN} = "--system --home ${localstatedir}/run/quagga/ -M -g quagga quagga"
+USERADD_PARAM_${PN} = "--system --home ${localstatedir}/run/quagga/ -M -g quagga --shell /bin/false quagga"
 
 pkg_postinst_${PN} () {
     if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
-- 
1.8.3.1


