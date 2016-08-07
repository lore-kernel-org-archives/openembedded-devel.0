Return-Path: <iwamatsu@nigauri.org>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B4105738AE
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Aug 2016 15:02:46 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h186so23302780pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Aug 2016 08:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nigauri-org.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=jiTtqOQ2X6Om4F82VeUrDGyMZXxftusgN2Y+bxNlPZo=;
	b=04akkMnjTx5zdSHlDSfGi/z2RDiXu0heNA90rhivuHMDfM5p1VCR5tV7yZHAmUrozJ
	2S4cmdnzJZ/UT5rMwi7XtwsJHBEjWHOBonq/qVcSr1bSaGfMLD1MI6/49yB+2PjpdZxl
	Bti7nojooZpxZKqOxrbzSlQ0vzULNg31tVgLDxoAUzEcGuD0DkqZ/3Ax+F1JiTHFGdmG
	Nag8fCMDqspeawFWdIKS0W8jAXPSr333gJ8SkmvrhDIiANbDGfag/UBVd2K1QnLUElf0
	Dhcvs5ittp/xLw8luKMqwTDHgz5pz3NrUNktgPl2JRqdIgJYQBIIqrb+FrEtP0EtQEq6
	hl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=jiTtqOQ2X6Om4F82VeUrDGyMZXxftusgN2Y+bxNlPZo=;
	b=DTSCjqIML0XBmi1EmXQPt+s/xs8XRdoyAhjDzqYKaIpojzby6dZUpZ6HH+JgvmC6Kb
	fvWHEyCA+mrDj64gWbMLJTZOynWkfM3ZTc0Lw54M+obAr6iNJl81CkcW2OHC/10LnVNe
	zF6qZISBHCPMATRwq6RmSDTiKESzyGO+XDXVJhPDV4StbZa+8qwEoi40LNsO168BbefX
	4qshOIVp3NkVd+Q81lrJMPvEt2PASQxFDAEQW9rC0KjiizpOuEobWFiFzQeRQIlZGsx2
	OM98kmGOo+1AQqZ/7sKmiV7FRf3J9CS7reCv5iiSbTHeCZvhQZP84yExSCA/2SGAE8vg
	huOQ==
X-Gm-Message-State: AEkoousI63Bn5IYjIV6m+z7hFwK9SVE1zuRRI8YqOZr0DiDp7w19+wvH2V/ot8NQYXf2Cg==
X-Received: by 10.98.26.133 with SMTP id a127mr152021127pfa.46.1470582167782; 
	Sun, 07 Aug 2016 08:02:47 -0700 (PDT)
Received: from guhya (w203126.dynamic.ppp.asahi-net.or.jp. [121.1.203.126])
	by smtp.gmail.com with ESMTPSA id
	i137sm41322410pfe.64.2016.08.07.08.02.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 07 Aug 2016 08:02:47 -0700 (PDT)
Sender: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Received: from iwamatsu by guhya with local (Exim 4.87)
	(envelope-from <iwamatsu@localhost>)
	id 1bWPbA-0008pI-T6; Mon, 08 Aug 2016 00:02:44 +0900
From: Nobuhiro Iwamatsu <iwamatsu@debian.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Aug 2016 00:02:41 +0900
Message-Id: <1470582161-33891-1-git-send-email-iwamatsu@debian.org>
X-Mailer: git-send-email 2.8.1
Cc: Joe Slater <jslater@windriver.com>
Subject: [PATCH] libmodbus: update to upstream develop version 3.1.4
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
X-List-Received-Date: Sun, 07 Aug 2016 15:02:48 -0000

From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

Rename recipe then change md5sum and sha256sum.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 meta-oe/recipes-extended/libmodbus/libmodbus_3.1.2.bb | 7 -------
 meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.1.2.bb
 create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.2.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.2.bb
deleted file mode 100644
index 6fcfc3a..0000000
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require libmodbus.inc
-
-# Use the stable branch by default
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI[md5sum] = "dd4262f87ed835c4d1e560f8321a222c"
-SRC_URI[sha256sum] = "661e14f9dc904f3f1b034464ddaa5fd4b8472f8f5d1ea10a1148af85591b7ee9"
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb
new file mode 100644
index 0000000..d438a0a
--- /dev/null
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb
@@ -0,0 +1,7 @@
+require libmodbus.inc
+
+# Use the stable branch by default
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI[md5sum] = "b1a8fd3a40d2db4de51fb0cbcb201806"
+SRC_URI[sha256sum] = "c8c862b0e9a7ba699a49bc98f62bdffdfafd53a5716c0e162696b4bf108d3637"
-- 
2.8.1


