Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8B09C7C04E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 05:58:04 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id a14so6277399plm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Feb 2019 21:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Cb3vcZT5x8rtNJYeo7GcHrp7I0N31opCuwoPY8ZXBM8=;
	b=FY7fcTb+cu2ONPfEXjiILusfkEoZH3STb1LXqEwCf0dmO+/CkMz1xDh8h9DeXpV+N9
	1Zxqt8guJgEKbxJG2ToHySChsJbVFNCJ8QSNHmyM9Up9/b2P08t5eE4xgVY5/iP5R028
	Gqx53dl3uRwU3vhE+aQPi9fwtcsgUL4EWpAQJo2Bp2ywZFRDsfXsyxFRFikurYhL/+UF
	peL2XJ6x1ZkfBZf7I7rn3Nk6jd/cSgRwvRI+LCeJCowB8Cfa/ZgNSdMxN0DV2GEMBQdL
	zFjQsyqW7X53kt3b/+7VgXq68F3uNjqnubPuyLiJhv2PEbRMe/xI4vGvA/HIbAZfoXlE
	9j8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Cb3vcZT5x8rtNJYeo7GcHrp7I0N31opCuwoPY8ZXBM8=;
	b=fxE9nKaI4HpRUbupPBSjOk7P9ICo18aWIdG2RBB1IbN28bPVLawgTYPmhGr0j8JBH6
	lKEZmqa9NmheiNou0hBl7mKg8cAu0h7lIoKxxpzNkWsMTdxPr90MIP8rHaFNUwveka7N
	pSk5AU4LV1iA0Rlv1MtNTDPHx/sZmj9onx09kyDANH3d2x5UlpR19qmIUd0kDq5Tvxrt
	Rq+o7EgnHL0SqVe/uFJ5N4wu5BFlz6zrRV4JyBrEE0J8bDasDnAG5/+4ywjLuGKYl6Bk
	AIrU+MXghfEnoZ0JGslFomRT+48Rk9xKXdVz8ygsrxkVyOrA+6aWXR/E6bMKdUiZssRy
	rDcw==
X-Gm-Message-State: AJcUukfE/I01/8/Smnt7/ItE9TtUUdwym/o4dsgG2kas1eAR/TBicM13
	9DyEyP5S2uAdiHDf/eTPU1qsUPae
X-Google-Smtp-Source: ALg8bN5XFT/+HmrHduDF18Va36uYHSIsONlOpQNjzlOO1+Z/VrjzhtsDMMRHsTei3Y6AWLIaMAEUsw==
X-Received: by 2002:a17:902:112c:: with SMTP id
	d41mr48554803pla.144.1549259885001; 
	Sun, 03 Feb 2019 21:58:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1609])
	by smtp.gmail.com with ESMTPSA id
	128sm25464192pfu.129.2019.02.03.21.58.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Feb 2019 21:58:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Feb 2019 21:57:54 -0800
Message-Id: <20190204055754.18328-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH V2] owfs: Inherit systemd
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
X-List-Received-Date: Mon, 04 Feb 2019 05:58:05 -0000
Content-Transfer-Encoding: 8bit

Fix
ERROR: QA Issue: owfs: Files/directories were installed but not shipped in any package:
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/owfs.service
  /lib/systemd/system/owftpd.service
  /lib/systemd/system/owhttpd.service
  /lib/systemd/system/owserver.service
  /lib/systemd/system/owserver.socket

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Package the unit files as well

 .../recipes-filesystems/owfs/owfs_3.2p2.bb      | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p2.bb b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p2.bb
index 50865cccda..857aaf216d 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p2.bb
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p2.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/owfs/owfs \

 S = "${WORKDIR}/git"

-inherit autotools-brokensep update-rc.d pkgconfig
+inherit autotools-brokensep update-rc.d pkgconfig systemd

 EXTRA_OECONF = " \
                  --with-fuseinclude=${STAGING_INCDIR} \
@@ -52,9 +52,12 @@ DESCRIPTION_libownet = "easy C-language 1-wire interface to the owserver protoco
 DESCRIPTION_owmon = "Monitor for owserver settings and statistics"
 DESCRIPTION_owtap = "Packet sniffer for the owserver protocol"

-FILES_owftpd = "${bindir}/owftpd"
-FILES_owhttpd = "${bindir}/owhttpd ${sysconfdir}/init.d/owhttpd"
-FILES_owserver = "${bindir}/owserver ${sysconfdir}/init.d/owserver"
+FILES_owftpd = "${bindir}/owftpd ${systemd_system_unitdir}/owftpd.service"
+FILES_owhttpd = "${bindir}/owhttpd ${sysconfdir}/init.d/owhttpd \
+                 ${systemd_system_unitdir}/owhttpd.service"
+FILES_owserver = "${bindir}/owserver ${sysconfdir}/init.d/owserver \
+                  ${systemd_system_unitdir}/owserver.service \
+                  ${systemd_system_unitdir}/owserver.socket"
 FILES_owshell = "${bindir}/owread ${bindir}/owwrite \
                  ${bindir}/owdir ${bindir}/owpresent \
                  ${bindir}/owget ${bindir}/owside"
@@ -63,9 +66,15 @@ FILES_owtap = "${bindir}/owtap"
 FILES_libowcapi = "${libdir}/libowcapi-*"
 FILES_libow = "${libdir}/libow-*"
 FILES_libownet = "${libdir}/libownet-*"
+FILES_${PN} += "${systemd_system_unitdir}/owfs.service"

 INITSCRIPT_PACKAGES = "owhttpd owserver"
 INITSCRIPT_NAME_owserver = "owserver"
 INITSCRIPT_NAME_owhttpd = "owhttpd"
 INITSCRIPT_PARAMS_owserver = "defaults 20"
 INITSCRIPT_PARAMS_owhttpd = "defaults 21"
+
+SYSTEMD_SERVICE_${PN} = "owfs.service"
+SYSTEMD_SERVICE_${PN}-owftpd = "owftpd.service"
+SYSTEMD_SERVICE_${PN}-owhttpd = "owhttpd.service"
+SYSTEMD_SERVICE_${PN}-owserver = "owserver.service owserver.socket"
--
2.20.1

