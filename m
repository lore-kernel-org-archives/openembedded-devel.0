Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1OqKOq-0000Ml-Ni
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 08:32:54 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 8FA31275D101; Tue, 31 Aug 2010 08:32:21 +0200 (CEST)
Received: from localhost (unknown [89.204.137.96])
	by gravedo.de (Postfix) with ESMTPSA id A3B48275CCC2;
	Tue, 31 Aug 2010 08:32:19 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Aug 2010 08:31:58 +0200
Message-Id: <1283236322-5116-2-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1283236322-5116-1-git-send-email-morphis@gravedo.de>
References: <1283236322-5116-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,RCVD_IN_SORBS_WEB
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/5] msmcomm: split msmcommd recipe into three parts as upstream layout has changed
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
X-List-Received-Date: Tue, 31 Aug 2010 06:32:54 -0000

We have now three parts for the msmcomm daemon:
 * libmsmcomm: the actual protocol implementation of the msmcomm protocol
 * msmcommd: the daemon which manages the link layer + takes command from the clients and
   submits them to the modem
 * msmcommd-specs: provides the dbus API definition for the msmcomm daemon which lets the
   client talk to the daemon

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/freesmartphone/libmsmcomm_git.bb     |    9 +++++++
 recipes/freesmartphone/msmcomm.inc           |   11 +++++++++
 recipes/freesmartphone/msmcommd-specs_git.bb |   17 ++++++++++++++
 recipes/freesmartphone/msmcommd_git.bb       |   31 +++++++++++++------------
 4 files changed, 53 insertions(+), 15 deletions(-)
 create mode 100644 recipes/freesmartphone/libmsmcomm_git.bb
 create mode 100644 recipes/freesmartphone/msmcomm.inc
 create mode 100644 recipes/freesmartphone/msmcommd-specs_git.bb

diff --git a/recipes/freesmartphone/libmsmcomm_git.bb b/recipes/freesmartphone/libmsmcomm_git.bb
new file mode 100644
index 0000000..5df9e41
--- /dev/null
+++ b/recipes/freesmartphone/libmsmcomm_git.bb
@@ -0,0 +1,9 @@
+require msmcomm.inc
+
+PR = "${INC_PR}.0"
+PV = "0.5.0+gitr${SRCPV}"
+PE = "1"
+
+S = "${WORKDIR}/git/libmsmcomm"
+
+inherit autotools
diff --git a/recipes/freesmartphone/msmcomm.inc b/recipes/freesmartphone/msmcomm.inc
new file mode 100644
index 0000000..bf01a12
--- /dev/null
+++ b/recipes/freesmartphone/msmcomm.inc
@@ -0,0 +1,11 @@
+DESCRIPTION = "Low level protocol implementation for binary protocol spoken by some Qualcomm modems"
+HOMEPAGE = "http://www.freesmartphone.org"
+AUTHOR = "Simon Busch <morphis@gravedo.de>"
+SECTION = "console/network"
+LICENSE = "GPL"
+INC_PR = "r4"
+PV = "Please override!"
+
+SRC_REV = "d631d009c791085faf0ebaac4601da905bc5c0ed"
+SRC_URI = "${FREESMARTPHONE_GIT}/msmcomm.git;protocol=git;branch=master"
+
diff --git a/recipes/freesmartphone/msmcommd-specs_git.bb b/recipes/freesmartphone/msmcommd-specs_git.bb
new file mode 100644
index 0000000..f756312
--- /dev/null
+++ b/recipes/freesmartphone/msmcommd-specs_git.bb
@@ -0,0 +1,17 @@
+require msmcomm.inc
+
+PR = "${INC_PR}.0"
+PV = "0.5.0+gitr${SRCPV}"
+PE = "1"
+
+DEPENDS = " \
+ vala-native \
+ glib-2.0 \
+ dbus \
+ dbus-glib \
+"
+
+S = "${WORKDIR}/git/msmcommd-specs"
+
+inherit autotools vala
+
diff --git a/recipes/freesmartphone/msmcommd_git.bb b/recipes/freesmartphone/msmcommd_git.bb
index bd74dc0..d123501 100644
--- a/recipes/freesmartphone/msmcommd_git.bb
+++ b/recipes/freesmartphone/msmcommd_git.bb
@@ -1,20 +1,21 @@
-DESCRIPTION = "Low level protocol implementation for binary protocol spoken by some Qualcomm modems"
-HOMEPAGE = "http://www.freesmartphone.org"
-AUTHOR = "Simon Busch <morphis@gravedo.de>"
-SECTION = "console/network"
-LICENSE = "GPL"
-DEPENDS = "libgee libfsotransport gtk+"
-SRCREV = "91ea329fd3be68d031c61a587c6c0036b94cf2cd"
-PV = "0.1.0+gitr${SRCPV}"
-PR = "r2"
+require msmcomm.inc
+
+PR = "${INC_PR}.0"
+PV = "0.5.0+gitr${SRCPV}"
 PE = "1"
 
-SRC_URI = "${FREESMARTPHONE_GIT}/msmcomm.git;protocol=git;branch=master"
-S = "${WORKDIR}/git"
+DEPENDS = " \
+ vala-native \
+ glib-2.0 \
+ dbus \
+ dbus-glib \
+ libfso-glib \
+ libgee \
+ libmsmcomm \
+ msmcommd-specs \
+"
 
-inherit autotools vala
+S = "${WORKDIR}/git/msmcommd"
 
-PACKAGES =+ "${PN}-lib ${PN}-term"
-FILES_${PN}-lib = "${libdir}/lib*.so.*"
-FILES_${PN}-term = "${sbindir}/msmvterm"
+inherit autotools vala
 
-- 
1.7.0.4



