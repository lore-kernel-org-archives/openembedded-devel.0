Return-Path: <koen@dominion.thruhere.net>
X-Greylist: delayed 449 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 May 2014 10:42:55 UTC
Received: from mail-ee0-f49.google.com (unknown [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8E3B8660F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 10:42:54 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id e53so512442eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 03:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LvzQ8K8Aw/jrVI0BUokZ0+aUAQPWNnnNkg9lyju7HnU=;
	b=CqZ4KWzEpgJl+6ohB/bj2Aiujd4dZ8P/0FZ65xDlvGyO/MlrLGWUehvhgdCV/hUExq
	zhEUQl4uhCxRZdvyhjhKKF7YYzCgCphaYM38tufqxaq/IqfjsKMfEwa7mj+Qr45jU+P2
	+oMsTt0RZruuh91tjkD96CnU9NPtvBt2YQY/cwThBwnZld/NKg49Px4+kQRMvm2T7xCp
	kGQtvztaQ8lHUhela5CwlQbqzWdWbINsbqEOP8q/EoYRTgwDUofnKiRmJmHImGCarmuN
	rduPWZsvcpl28wP7OFJkpPGcLXZDEdM+htM/2yeR4GcMRrTmm2BTSiP9VOmW9JSYbFu8
	m0tA==
X-Gm-Message-State: ALoCoQlAugPmF6wVc3bozrHNFwQ2kOlh1+KqVlau5TMHKFm4fGzAHXU8yrvqZxHAyJjbF3hGHqCg
X-Received: by 10.14.2.131 with SMTP id 3mr13344506eef.45.1400150126630;
	Thu, 15 May 2014 03:35:26 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id a4sm11686131eep.12.2014.05.15.03.35.24
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 15 May 2014 03:35:25 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 May 2014 12:33:22 +0200
Message-Id: <1400150002-21326-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] libssh: update to 0.6.3
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
X-List-Received-Date: Thu, 15 May 2014 10:42:55 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/libssh/{libssh_git.bb => libssh_0.6.3.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_git.bb => libssh_0.6.3.bb} (79%)

diff --git a/meta-oe/recipes-support/libssh/libssh_git.bb b/meta-oe/recipes-support/libssh/libssh_0.6.3.bb
similarity index 79%
rename from meta-oe/recipes-support/libssh/libssh_git.bb
rename to meta-oe/recipes-support/libssh/libssh_0.6.3.bb
index 3f118a0..771a47a 100644
--- a/meta-oe/recipes-support/libssh/libssh_git.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.6.3.bb
@@ -7,9 +7,8 @@ DEPENDS = "zlib openssl libgcrypt"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=388a4fb1dea8ceae0be78ba9b01fc139"
 
-PV = "0.5.5+gitr${SRCPV}"
-SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=v0-5"
-SRCREV = "43914a5f07702fe292a968322d5ff2627e0431db"
+SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=v0-6"
+SRCREV = "87145387aa12b720b52d6bc75b4dd6cd058c868a"
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = " \
@@ -26,3 +25,5 @@ do_configure_prepend () {
     sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/' ${S}/CMakeLists.txt \
         || bbfatal "Failed to disable examples"
 }
+
+FILES_${PN}-dev += "${libdir}/cmake"
-- 
1.9.0


