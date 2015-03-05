Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 108D971637
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 16:08:09 +0000 (UTC)
Received: by wggx13 with SMTP id x13so14232812wgg.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 08:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uSZ7/kDeF3MApYV0b0tLqQCn7oNeZUwytn4Kx/Y4XRA=;
	b=yK0MePPSR1DkE4jAEUCSLO6FtwSU40yuSoxq1uyX013K9mfz56fFlA1x7FxCr7YLiC
	9QwGRZr68pk53ROOgD/dguG9/hPfqmHrHQEGsKhcBuR2TmhbTkHS2e6JwMlafvQ50mMY
	LplCYnh1q/UtdOj7mHiRisKlksOtthb78xRBVdPdDl8ZWGxs1iN69DV0ArTk2d7cEqyH
	AVhKsH8n5BznaXJz0pKoDh+lQwqoUw2AClmWHFi/fXZEyhNd4I7qQ+/CizX4VpYtRWA1
	vqzS8RFP5hOl8WifoB030B11Sbe2oNXFpSCfPmuKflVLSpDKRNqBQERWuf3W6fEok2zj
	SW1A==
X-Received: by 10.194.104.99 with SMTP id gd3mr19421963wjb.114.1425571690599; 
	Thu, 05 Mar 2015 08:08:10 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hi6sm11109273wjc.34.2015.03.05.08.08.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 08:08:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2015 17:08:13 +0100
Message-Id: <1425571693-25241-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [meta-oe][PATCH] DO-NOT-MERGE: start-stop-daemon: upgrade to 1.17.21
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
X-List-Received-Date: Thu, 05 Mar 2015 16:08:10 -0000

* dselect fails to build with:
  *** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.18 but the autoconf macros are from gettext version 0.19
* upgrade to dpkg version used by oe-core

* shouldn't be merged, because new dpkg doesn't recognize couple
  options:
  WARNING: QA Issue: start-stop-daemon: configure was passed
  unrecognised options: --without-update-alternatives
  --without-install-info --with-start-stop-daemon
  [unknown-configure-option]
  and then it will still fail with:
  | ./curkeys.h:9:21: warning: missing terminating " character
  |    { 34,             "\"                   },
  |                      ^
  | ./curkeys.h:9:3: error: missing terminating " character
  |    { 34,             "\"                   },
  |    ^
  I'll leave finishing this change to someone actually using start-stop-deamon and
  will blacklist it instead.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...start-stop-daemon_1.16.0.2.bb => start-stop-daemon_1.17.21.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/start-stop-daemon/{start-stop-daemon_1.16.0.2.bb => start-stop-daemon_1.17.21.bb} (69%)

diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.21.bb
similarity index 69%
rename from meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
rename to meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.21.bb
index c232474..8277f6a 100644
--- a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.21.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Debian's start-stop-daemon utility extracted from the dpkg \
 package"
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://utils/start-stop-daemon.c;md5=a963623e4588f70122865aaa7a370ce4"
+LIC_FILES_CHKSUM = "file://utils/start-stop-daemon.c;endline=21;md5=535e211f008cd495dfcc55944be5a706"
 # start-stop-daemon is usually shipped by dpkg
 DEPENDS = "ncurses"
 RCONFLICS_${PN} = "dpkg" 
 
-SRC_URI = "http://sources.openembedded.org/dpkg_${PV}.tar.bz2"
-SRC_URI[md5sum] = "d211a84f38987771a49ad1c0f144334a"
-SRC_URI[sha256sum] = "2a3d4ba83c743b3f004533fdd52372cb7b22f5c1da2042d0a31bbcc2b54c0ea5"
+SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz"
+SRC_URI[md5sum] = "765a96fd0180196613bbfa3c4aef0775"
+SRC_URI[sha256sum] = "3ed776627181cb9c1c9ba33f94a6319084be2e9ec9c23dd61ce784c4f602cf05"
 
 inherit autotools gettext pkgconfig
 
-- 
2.3.1


