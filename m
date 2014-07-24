Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBA6F706D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 06:42:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6O6gtdZ025750
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 23:42:55 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 23 Jul 2014 23:42:54 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Jul 2014 14:43:01 +0800
Message-ID: <1406184181-23969-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] openvpn: not use the hardcoded libdir
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
X-List-Received-Date: Thu, 24 Jul 2014 06:43:03 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

it will lead to QA failure, since .debug dir can not be installed into dbg package

    ERROR: QA Issue: non debug package contains .debug directory: openvpn path
    /work/core2-64-wrs-linux/openvpn/2.3.4-r0/packages-split/openvpn/usr/lib64i
    /openvpn/plugins/.debug/openvpn-plugin-down-root.so [debug-files]

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
index a3322a0..48e04b7 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
@@ -28,4 +28,4 @@ do_install_append() {
 
 RRECOMMENDS_${PN} = "kernel-module-tun"
 
-FILES_${PN}-dbg += "/usr/lib/openvpn/plugins/.debug"
+FILES_${PN}-dbg += "${libdir}/openvpn/plugins/.debug"
-- 
1.7.10.4


