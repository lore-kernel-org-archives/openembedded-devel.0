Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DB72160107
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:54:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAJ9ssVv019546
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 01:54:55 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 19 Nov 2015 01:54:53 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Nov 2015 17:54:58 +0800
Message-ID: <1447926898-10688-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lmsensors-config: fix the packaging for sensord
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
X-List-Received-Date: Thu, 19 Nov 2015 09:54:56 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

/etc/sysconfig/sensord is needed by sensord.service
so it should be packaged in lmsensors-config-sensord.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
index 4f632cb..3638019 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
@@ -54,7 +54,10 @@ FILES_${PN}-cgi = "/www/*"
 FILES_${PN}-libsensors = "${sysconfdir}/sensors.d/sensors.conf"
 
 # sensord logging daemon configuration files
-FILES_${PN}-sensord = "${sysconfdir}/sensord.conf"
+FILES_${PN}-sensord = "\
+    ${sysconfdir}/sensord.conf \
+    ${sysconfdir}/sysconfig/sensord \
+"
 
 # fancontrol script configuration file
 FILES_${PN}-fancontrol = "${sysconfdir}/fancontrol"
-- 
1.9.1


