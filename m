Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mok@mnet-online.de>) id 1PqC5c-0004sC-S1
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 23:12:44 +0100
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 82902188A193
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 23:11:33 +0100 (CET)
Received: from gonzales.localnet (ppp-188-174-64-167.dynamic.mnet-online.de
	[188.174.64.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS id A8EE91C0009B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 23:11:33 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
From: Klaus Kurzmann <mok@mnet-online.de>
Date: Thu, 17 Feb 2011 23:11:51 +0100
MIME-Version: 1.0
Message-Id: <201102172311.51801.mok@mnet-online.de>
Subject: [PATCH] udev_151/162/165.bb: add missing PACKAGE_ARCH for nokia900
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Feb 2011 22:12:44 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Klaus Kurzmann <mok@fluxnetz.de>

Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
---
 recipes/udev/udev_151.bb |    5 +++--
 recipes/udev/udev_162.bb |    5 +++--
 recipes/udev/udev_165.bb |    5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
index 393fcc7..d31d99a 100644
--- a/recipes/udev/udev_151.bb
+++ b/recipes/udev/udev_151.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and 
removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r24"
+PR = "r25"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
@@ -40,6 +40,7 @@ SRC_URI_append_bug = " \
        file://30-BUG.rules \
        file://10-mx31.rules \
        file://bmi_eventpipe.sh "
+PACKAGE_ARCH_bug = "bug"
 
 SRC_URI_append_nokia900 = " \
        file://10-cmt_speech.rules \
@@ -48,8 +49,8 @@ SRC_URI_append_nokia900 = " \
        file://udev-rules-nokia-n900-snd.rules \
        file://nokia-n900-mac-hack.sh \
 "
+PACKAGE_ARCH_nokia900 = "nokia900"
 
-PACKAGE_ARCH_bug = "bug"
 
 inherit update-rc.d autotools
 
diff --git a/recipes/udev/udev_162.bb b/recipes/udev/udev_162.bb
index 8f23f08..2991b28 100644
--- a/recipes/udev/udev_162.bb
+++ b/recipes/udev/udev_162.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and 
removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r11"
+PR = "r12"
 
 # Untested
 #DEFAULT_PREFERENCE = "-1"
@@ -41,6 +41,7 @@ SRC_URI_append_bug = " \
        file://30-BUG.rules \
        file://10-mx31.rules \
        file://bmi_eventpipe.sh "
+PACKAGE_ARCH_bug = "bug"
 
 SRC_URI_append_nokia900 = " \
        file://10-cmt_speech.rules \
@@ -49,8 +50,8 @@ SRC_URI_append_nokia900 = " \
        file://udev-rules-nokia-n900-snd.rules \
        file://nokia-n900-mac-hack.sh \
 "
+PACKAGE_ARCH_nokia900 = "nokia900"
 
-PACKAGE_ARCH_bug = "bug"
 
 inherit update-rc.d autotools
 
diff --git a/recipes/udev/udev_165.bb b/recipes/udev/udev_165.bb
index 1f57a46..63e62f1 100644
--- a/recipes/udev/udev_165.bb
+++ b/recipes/udev/udev_165.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and 
removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r2"
+PR = "r3"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
@@ -42,6 +42,7 @@ SRC_URI_append_bug = " \
        file://30-BUG.rules \
        file://10-mx31.rules \
        file://bmi_eventpipe.sh "
+PACKAGE_ARCH_bug = "bug"
 
 SRC_URI_append_nokia900 = " \
        file://10-cmt_speech.rules \
@@ -50,8 +51,8 @@ SRC_URI_append_nokia900 = " \
        file://udev-rules-nokia-n900-snd.rules \
        file://nokia-n900-mac-hack.sh \
 "
+PACKAGE_ARCH_nokia900 = "nokia900"
 
-PACKAGE_ARCH_bug = "bug"
 
 inherit update-rc.d autotools
 
-- 
1.7.4.1


-- 
Klaus 'mrmoku' Kurzmann


