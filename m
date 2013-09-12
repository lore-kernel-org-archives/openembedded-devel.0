Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id DF7266BD66
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2013 15:27:43 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r8CFRW9G022993; 
	Thu, 12 Sep 2013 10:27:44 -0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2013 20:28:54 +0500
Message-Id: <9c8d3a26d593894194b2727ec817805c5eb39d91.1378998806.git.muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <2833ee588a108d99fb999bb8b21b297ec4af97fa.1378998806.git.muhammad_shakeel@mentor.com>
References: <2833ee588a108d99fb999bb8b21b297ec4af97fa.1378998806.git.muhammad_shakeel@mentor.com>
In-Reply-To: <cover.1378998806.git.muhammad_shakeel@mentor.com>
References: <cover.1378998806.git.muhammad_shakeel@mentor.com>
Subject: [meta-oe][meta-systemd][PATCH 3/3] rpcbind: Remove systemd support which is merged in oe-core
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
X-List-Received-Date: Thu, 12 Sep 2013 15:27:44 -0000

OE-Core has been updated to support rpcbind with systemd. Stuff here is
not required anymore.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../rpcbind/rpcbind/rpcbind.service                |   13 -------------
 .../rpcbind/rpcbind_0.2.0.bbappend                 |   16 ----------------
 2 files changed, 29 deletions(-)
 delete mode 100644 meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind/rpcbind.service

diff --git a/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind/rpcbind.service b/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind/rpcbind.service
deleted file mode 100644
index a028ace..0000000
--- a/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind/rpcbind.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=RPC Bind
-After=network.target
-Wants=rpcbind.target
-Before=rpcbind.target
-
-[Service]
-Type=forking
-ExecStart=/usr/sbin/rpcbind
-Restart=always
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend b/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
index 9f83f65..f006b3f 100644
--- a/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
@@ -1,19 +1,3 @@
-inherit systemd
-
-PRINC := "${@int(PRINC) + 2}"
-
-# look for files in the layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://rpcbind.service"
-
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "rpcbind.service"
-
-do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/rpcbind.service ${D}${systemd_unitdir}/system
-}
-
-- 
1.7.9.5


