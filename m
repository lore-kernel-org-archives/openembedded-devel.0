Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 81D98601D6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 09:35:31 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Sep 2013 10:35:25 +0100
Message-Id: <1380015325-28852-2-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <1380015325-28852-1-git-send-email-ml@communistcode.co.uk>
References: <1380015325-28852-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-oe][PATCH 2/2] lmsensors: split out cgi into seperate package
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

Split the CGI files out of sensord package into there own package. This
is in order to split out the lighttpd dependancy.

Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
---
 meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb | 8 +++++++-
 meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb      | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
index 4b859cd..ffec22e 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
@@ -42,11 +42,17 @@ PACKAGES =+ "${PN}-sensord"
 # fancontrol script configuration
 PACKAGES =+ "${PN}-fancontrol"
 
+# sensord web cgi support
+PACKAGES =+ "${PN}-cgi"
+RRECOMMENDS_${PN}-cgi = "lighttpd lighttpd-module-cgi"
+RDEPENDS_${PN}-cgi = "${PN}-sensord"
+FILES_${PN}-cgi = "/www/*" 
+
 # libsensors configuration file
 FILES_${PN}-libsensors = "${sysconfdir}/sensors.d/sensors.conf"
 
 # sensord logging daemon configuration files
-FILES_${PN}-sensord = "${sysconfdir}/sensord.conf /www/*"
+FILES_${PN}-sensord = "${sysconfdir}/sensord.conf"
 
 # fancontrol script configuration file
 FILES_${PN}-fancontrol = "${sysconfdir}/fancontrol"
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
index b5c2921..ab58e2d 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
@@ -93,7 +93,7 @@ RDEPENDS_${PN}-sensors = "${PN}-libsensors"
 FILES_${PN}-sensord = "${bindir}/sensord ${sysconfdir}/init.d/sensord"
 FILES_${PN}-sensord-dbg = "${bindir}/.debug/sensord"
 FILES_${PN}-sensord-doc = "${mandir}/man8/sensord.8"
-RDEPENDS_${PN}-sensord = "${PN}-sensors rrdtool lighttpd lighttpd-module-cgi"
+RDEPENDS_${PN}-sensord = "${PN}-sensors rrdtool"
 RRECOMMENDS_${PN}-sensord = "lmsensors-config-sensord"
 
 # fancontrol script files
-- 
1.8.4


