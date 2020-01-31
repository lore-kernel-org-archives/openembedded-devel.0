Return-Path: <robert.joslyn@redrectangle.org>
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id 5345260043
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2020 21:47:42 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id 318F03A8CD0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2020 21:21:41 +0000 (UTC)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com
	[173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 986511BF203;
	Fri, 31 Jan 2020 21:21:38 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Jan 2020 13:20:55 -0800
Message-Id: <20200131212057.1856967-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] iwd: Update to 1.4
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
X-List-Received-Date: Fri, 31 Jan 2020 21:47:43 -0000
Content-Transfer-Encoding: 8bit

dbus is not required to compile, but is expected at run time. Move it to
RDEPENDS.

From upstream changelog:

ver 1.4:
	Fix issue with handling Crypto-Binding and invalid MACs.
	Fix issue with handling change station error results.
	Fix issue with handling DNS resolving installations.

ver 1.3:
	Fix issue with handling EAP-GTC and password requests.
	Fix issue with handling Crypto-Binding TLV for PEAPv0.
	Fix issue with handling key installation and PEAP Phase 2.
	Fix issue with handling externally triggered scan requests.
	Fix issue with handling RCPI calculation for RRM requests.

ver 1.2:
	Fix issue with handling scan requests while connecting.
	Fix issue with handling scan duration for RRM requests.
	Fix issue with handling parent TSF value for RRM requests.

ver 1.1:
	Fix issue with simple configuration support checks.
	Fix issue with handling TLS tunnel and PEAPv0.
	Add support for radio resource management.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 ...am-Avoid-redirection-of-input-and-output-fi.patch | 12 +++++-------
 .../iwd/{iwd_1.0.bb => iwd_1.4.bb}                   |  6 ++++--
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.0.bb => iwd_1.4.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch b/meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch
index 93ef007f8..80126a870 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch
+++ b/meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch
@@ -1,4 +1,4 @@
-From f2a2b9f445ab1e31fbb27a74744e9a2ededfce17 Mon Sep 17 00:00:00 2001
+From 46fc0e197598579dc05e42f137e84f86a9b926e9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 4 Nov 2019 16:38:04 -0800
 Subject: [PATCH] Makefile.am: Avoid redirection of input and output files
@@ -15,26 +15,24 @@ make[1]: *** [Makefile:3544: monitor/iwmon.1] Error 1
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  Makefile.am | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 823b7d02..1bd0005c 100644
+index 8c69d9f4..35a25fc0 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -626,8 +626,9 @@ SED_PROCESS = $(AM_V_GEN)$(MKDIR_P) $(dir $@) && $(SED) \
+@@ -629,8 +629,9 @@ SED_PROCESS = $(AM_V_GEN)$(MKDIR_P) $(dir $@) && $(SED) \
  		< $< > $@
  
  if RUN_RST2MAN
 -RST2MAN_PROCESS = $(AM_V_GEN)$(RST2MAN) --strict --no-raw --no-generator \
--			--no-datestamp < $< > $@
+-			--no-datestamp $< $@
 +RST2MAN_PROCESS = $(AM_V_GEN)$(MKDIR_P) $(dir $@) && \
 +			$(AM_V_GEN)$(RST2MAN) --strict --no-raw \
 +			--no-generator --no-datestamp $< $@
  else
  RST2MAN_PROCESS = $(AM_V_GEN)test -f $@ || \
  		{ echo "Generated manual page $@ does not exist"; false; }
--- 
-2.24.0
-
diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.0.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
index cc34ca221..49fc45a74 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
@@ -4,12 +4,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 
 inherit autotools pkgconfig systemd python3native
 
-DEPENDS = "ell readline dbus python3-docutils-native"
+DEPENDS = "ell readline python3-docutils-native"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
            file://0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch \
           "
-SRCREV = "971e1d2038a203ad43bd2278a811a9e5ec8d52db"
+SRCREV = "860fa4697f349da7791ecf22ca76f9ac0e5de261"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
@@ -32,6 +32,8 @@ FILES_${PN} += "${datadir}/dbus-1 ${nonarch_libdir}/modules-load.d ${systemd_uni
 
 SYSTEMD_SERVICE_${PN} = "iwd.service ${@bb.utils.contains('PACKAGECONFIG', 'wired', 'ead.service', '', d)}"
 
+RDEPENDS_${PN} = "dbus"
+
 RRECOMMENDS_${PN} = "\
     kernel-module-pkcs7-message \
     kernel-module-pkcs8-key-parser \
-- 
2.24.1


