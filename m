Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9400E73D97
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 20:20:06 +0000 (UTC)
Received: by lbbuc2 with SMTP id uc2so35960508lbb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 13:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=7rWR1p3Qtp9dlWBSGRPKyF4CoezGSiTIv6rOfBVxIxc=;
	b=yK4ny/r0+kRGSfeywA3h9jIFWUtkAfunp1iiicEsLLVdjOLIpqLCulOOp39rmC3YYd
	U/2VuDyrZMm0HuZHjDNz8kZ/s++CAuyWQ4fd2zJD0+nFQHh8yIAkMrW44W8bDRRPvhnK
	Ln0OJvsV9TEyXgHOXvtsbPSJGV6Qv75XkzijGbseLfpP7vMYS4EKsCjNXhhSsloavF2O
	xV9xtzV8wiak3PUl95Ns7GZ+X6CWsb+bEjqKKXbsvZ4xT6uI4sILm4QQD5uYOzW/Hd8c
	wuTdkO3RAzeCJUqsr2N+r++f00GANB3xjZtCHbO8SH6z21sfEY90MH8OL2XgFEtf6qmI
	Rxzw==
X-Received: by 10.112.171.68 with SMTP id as4mr4589089lbc.64.1432844406244;
	Thu, 28 May 2015 13:20:06 -0700 (PDT)
Received: from angmar.lumag.rup.mentorg.com
	(ppp89-110-9-6.pppoe.avangarddsl.ru. [89.110.9.6])
	by mx.google.com with ESMTPSA id h3sm818730lbj.19.2015.05.28.13.20.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 May 2015 13:20:05 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 May 2015 23:20:00 +0300
Message-Id: <1432844401-4284-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-opie][PATCH 1/2] opie-securityplugin-blueping: fix bluez dependencies
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
X-List-Received-Date: Thu, 28 May 2015 20:20:08 -0000

Make it runtime depend on either bluez4 or bluez5 depending on DISTRO_FEATURES.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/opie-securityplugins/opie-securityplugin-blueping.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-opie/opie-securityplugins/opie-securityplugin-blueping.inc b/recipes-opie/opie-securityplugins/opie-securityplugin-blueping.inc
index aba3305..4a8ef12 100644
--- a/recipes-opie/opie-securityplugins/opie-securityplugin-blueping.inc
+++ b/recipes-opie/opie-securityplugins/opie-securityplugin-blueping.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Blueping plugin for opie-security authentication. \
 This is a bluetooth-based authentication plugin (you need \
 to have another Bluetooth device around to use it)."
-RDEPENDS_${PN} += "bluez4"
+RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
 APPNAME = "multiauthbluepingplugin"
 
 include opie-securityplugin.inc
-- 
2.1.4


