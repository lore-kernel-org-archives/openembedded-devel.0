Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2858B605B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 13:03:02 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so205521628wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2015 05:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=tZKNYRbju22UWlMfDf/sYFJs3EdbnICFfLFzw0KA7rY=;
	b=gsvmJSV+wuRtz33RB2byyiWVmucZsL4mBnFwG4VOkjiB8kyX78qBAdPTdqBIRg+w67
	1IO8EZD18gau5ZxwhwbMJDt/5aYULGoWk9DILWx/fsLPLDrKzJS6/4K+WMGBr5J5j8/c
	py56zaStivAUgH/8KiS2IWMVHsU6EMNzDula99hc5NcU8jhbWxv+RtWc5Yx04TM8dchC
	C3MqpMoq716I9ktSJXj7U1F9BlB3vp14B8W2nnZcBoKDV1C8k5n0FrL/DRwSe4VnLdU/
	MkwxMypiGCyFRp97RIs/B3HcoDWCEcoeZG5krX/TtRPfwf4X0MLF8TTdhNSKWSuiCJ7k
	aJwg==
X-Received: by 10.28.182.134 with SMTP id g128mr36967596wmf.95.1448974983428; 
	Tue, 01 Dec 2015 05:03:03 -0800 (PST)
Received: from localhost.localdomain ([81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	s189sm26114119wmf.16.2015.12.01.05.03.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Dec 2015 05:03:02 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Dec 2015 14:02:55 +0100
Message-Id: <1448974975-31352-1-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
Subject: [meta-networking][PATCH] net-snmp: apply patch for cross-compilation
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
X-List-Received-Date: Tue, 01 Dec 2015 13:03:03 -0000

7fb5479 added the patch but did not apply it
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index b32d842..d6c7bbb 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -20,6 +20,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
         file://run-ptest \
         file://dont-return-incompletely-parsed-varbinds.patch \
         file://0001-config_os_headers-Error-Fix.patch \
+        file://0002-config_os_headers-Error-Fix.patch \
         file://0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch \
 "
 SRC_URI[md5sum] = "9f682bd70c717efdd9f15b686d07baee"
-- 
2.5.0


