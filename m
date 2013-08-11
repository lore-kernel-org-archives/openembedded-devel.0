Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 2804460780
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2013 02:10:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7B2AKtK026947
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2013 22:10:21 -0400 (EDT)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Sat, 10 Aug 2013 19:10:26 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <joe.macdonald@windriver.com>, <openembedded-devel@lists.openembedded.org>
Date: Sat, 10 Aug 2013 22:10:25 -0400
Message-ID: <1376187025-22368-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Subject: [meta-networking][PATCH] dnsmasq: don't expect systemd support to be set
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
X-List-Received-Date: Sun, 11 Aug 2013 02:10:21 -0000
Content-Type: text/plain

If you don't have 'systemd' set in your DISTRO_FEATURES 'dnsmasq' will
fail to package due to a QA error;

ERROR: QA Issue: dnsmasq: Files/directories were installed but not shipped
  /lib

Check for systemd in DISTRO_FEATURES before performing installation
instructions related to systemd.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 0f5b273..b9e7ff6 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -31,8 +31,10 @@ do_install () {
     install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
 
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system
+    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system
+    fi
 
     if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" != "" ]; then
         install -d ${D}${sysconfdir}/dbus-1/system.d
-- 
1.8.1.2


