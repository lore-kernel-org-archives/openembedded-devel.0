Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 82E6360F54
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 09:35:31 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Sep 2013 10:35:24 +0100
Message-Id: <1380015325-28852-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.4
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-oe][PATCH 1/2] lm_sensors: add ALLOW_EMPTY to lmsensors and lmsensors-config
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
X-List-Received-Date: Tue, 24 Sep 2013 09:35:31 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

When building with dev-pkgs enabled I was hitting an error lmsensors-dev
not available. Adding ALLOW_EMPTY allowed the empty package to be created
and therefore satisfy the dependancy.

Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
---
 meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb | 2 ++
 meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
index 058ae1b..4b859cd 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
@@ -12,6 +12,8 @@ SRC_URI = "file://fancontrol \
            file://sensors.conf \
 "
 
+ALLOW_EMPTY_${PN} = "1"
+
 do_install() {
     # Install fancontrol configuration file
     install -d ${D}${sysconfdir}
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
index 60df0c6..b5c2921 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "ecc91ba3d918e96fb7d5eb9acce978af803b130e0b33b08d5ea05b2bfc
 
 inherit update-rc.d
 
+ALLOW_EMPTY_${PN} = "1"
+
 INITSCRIPT_PACKAGES = "${PN}-fancontrol ${PN}-sensord"
 INITSCRIPT_NAME_${PN}-fancontrol = "fancontrol"
 INITSCRIPT_NAME_${PN}-sensord = "sensord"
-- 
1.8.4


