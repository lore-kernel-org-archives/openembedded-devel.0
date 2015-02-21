Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 54DED606E8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2015 09:52:53 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id x12so17175940wgg.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2015 01:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1nwpR8T5ZMlE8sxd2nzFSKS5zpbOX/flGOAY0JNPtNY=;
	b=InOIqQfjdIudtA5bqmk9CRhDjjVfKGCgO6R21aVFphNPExqg4OZEfs/6D0zF4G/TpV
	NQsC9Gjmb5rVieA3msmTUJSMl16zJlzsdcUxzEg7NOB3BYc+9Z9I+lDGjQ2GmJj7CD42
	899p0FS4Dj9It4i7koRdiHayH9faG1jPf7vhdEW0TOvE88yiueJfOTmsV1IG6Mn/FaTJ
	4Ev73v0AS+96QvZVlR427glstdNzNY9O6h7CQajBrwsxwvQ5J6AcAbmon6wETRo+cxU5
	R9mcz1WunTaHrWn/4kC6jLKGNAjqwXqe2msd/zP3zEdjv4+H//AbVwL7Hbgu+gQCYQQt
	/5MQ==
X-Received: by 10.180.107.201 with SMTP id he9mr2749909wib.46.1424512374250;
	Sat, 21 Feb 2015 01:52:54 -0800 (PST)
Received: from localhost.localdomain (ip-84-119-96-251.unity-media.net.
	[84.119.96.251])
	by mx.google.com with ESMTPSA id dm6sm6232120wib.22.2015.02.21.01.52.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Feb 2015 01:52:53 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Feb 2015 10:52:12 +0100
Message-Id: <1424512336-47007-5-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-oe][PATCH 4/7] serial-utils: Fix SRC_URI
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
X-List-Received-Date: Sat, 21 Feb 2015 09:52:53 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-oe/recipes-support/serial-utils/pty-forward-native.bb | 4 ++--
 meta-oe/recipes-support/serial-utils/serial-forward_git.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
index b2b878d..7f59b3e 100644
--- a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
+++ b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
@@ -6,7 +6,7 @@ SECTION = "console/network"
 SRCREV = "00dbec2636ae0385ad028587e20e446272ff97ec"
 PV = "1.1+gitr${SRCPV}"
 
-SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia"
+SRC_URI = "git://github.com/freesmartphone/cornucopia.git;protocol=https"
 S = "${WORKDIR}/git/tools/serial_forward"
 
 inherit autotools native
@@ -14,7 +14,7 @@ inherit autotools native
 do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_deploy() {
     install -d ${DEPLOY_DIR_IMAGE}
-    install -m 0755 ${S}/src/pty_forward ${DEPLOY_DIR_IMAGE}/pty-forward
+    install -m 0755 ${B}/src/pty_forward ${DEPLOY_DIR_IMAGE}/pty-forward
 }
 
 addtask deploy before do_package after do_install
diff --git a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
index 129a3be..ad1e1ed 100644
--- a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
+++ b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
@@ -6,7 +6,7 @@ SECTION = "console/devel"
 SRCREV = "00dbec2636ae0385ad028587e20e446272ff97ec"
 PV = "1.1+gitr${SRCPV}"
 
-SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia"
+SRC_URI = "git://github.com/freesmartphone/cornucopia.git;protocol=https"
 S = "${WORKDIR}/git/tools/serial_forward"
 
 inherit autotools
-- 
1.9.3


