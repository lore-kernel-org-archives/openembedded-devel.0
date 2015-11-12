Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE26771B9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 14:22:54 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so156347457wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Bd7Qsg/+vUJuea+Ejh75q/zo7puQeBPzb0ETog6wYjQ=;
	b=RXQEa/O/K2TBqAbARodiFKOJybIRHFNnCtWkj1bTzKhsa5BnrdawuLiCSeaFD+CAIv
	xtqLfeVIkJi2Sa63FbPWBWPREoMFMBZm026W8nxOnnoa3bTdZmBHjbGmU9CLS+dP78La
	uzMCCRjOXVb/eHjsm6wS52vplXWJ5KDcCrGxDFE1IndDeWuzMz0Ds8HPuKE/gOiL2Ubz
	QrkZb/mYUrHoDP/0yHoIEiaeuq5PRRb4/sgj6sRL+4Hw2PogO2+7MBBu5W5AEyqex4Jg
	umhKeHWSYGpGs7NGhg0dKzj9BX0d9VGKM2nniKFM5FeWTBfVkxjW/vfvFB7l9B8zOUEi
	MUCw==
X-Received: by 10.28.143.1 with SMTP id r1mr47899149wmd.80.1447338174686;
	Thu, 12 Nov 2015 06:22:54 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	he3sm14691922wjc.48.2015.11.12.06.22.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 06:22:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 15:22:59 +0100
Message-Id: <1447338183-9675-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 5/9] zabbix: set MACHINE_ARCH, because it depends on MACHINE specific KERNEL_VERSION
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
X-List-Received-Date: Thu, 12 Nov 2015 14:22:55 -0000

* see:
  http://lists.openembedded.org/pipermail/openembedded-devel/2015-September/103271.html
* fixes:
ERROR: zabbix different signature for task do_configure.sigdata between qemux86copy and qemux86
basehash changed from 2b2cdeb8b36ed130bf28374a5b6d2e4d to 624cc1888e50c4509679c829a906af03
Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/zabbix/zabbix_2.4.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.5.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.5.bb
index 35c7d64..f8314c6 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.5.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.5.bb
@@ -21,6 +21,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=300e938ad303147fede2294ed78fe02e"
 DEPENDS  = "openldap virtual/libiconv"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-Fix-configure.ac.patch \
            file://zabbix-agent.service"
-- 
2.6.3


