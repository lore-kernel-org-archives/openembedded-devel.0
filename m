Return-Path: <cshored@thecshore.com>
Received: from mail.thecshore.com (mail.thecshore.com [144.217.14.6])
	by mail.openembedded.org (Postfix) with ESMTP id 524C1788C9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 11:37:47 +0000 (UTC)
Received: from workhobbyl.thecshore.com (135-23-247-100.cpe.pppoe.ca
	[135.23.247.100])
	by mail.thecshore.com (Postfix) with ESMTPSA id CA75F2657;
	Tue, 30 Jan 2018 06:37:48 -0500 (EST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.thecshore.com CA75F2657
Authentication-Results: mail.thecshore.com;
	dmarc=none (p=none dis=none) header.from=thecshore.com
Authentication-Results: mail.thecshore.com;
	spf=fail smtp.mailfrom=cshored@thecshore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.thecshore.com CA75F2657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thecshore.com;
	s=default; t=1517312268;
	bh=6+j+vNIT8hz5Ajt1eqP99I89RAtYVsXddiex7G5GzKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wlIYINbjxvhjlwMj2foMQfAZBBwFBl+KJD6aZKz1cX1xdepdRmisuwlZ4nJNZx3Tx
	xBTx54vCejz03eCs7Lk1lJiZ1KyqgMRu2bFrL7tx86nXa/DfL4DeVc6euXL6P80Iqh
	n418G8fV5JL7avHW78a64k0eO3dg4kJ3+rBh/MBw=
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99.2 at mail.thecshore.com
From: cshored@thecshore.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jan 2018 06:37:08 -0500
Message-Id: <20180130113708.14018-3-cshored@thecshore.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180130113708.14018-1-cshored@thecshore.com>
References: <20180130113708.14018-1-cshored@thecshore.com>
Subject: [PATCH 2/2] relayd: Move to meta-openwrt repo
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
X-List-Received-Date: Tue, 30 Jan 2018 11:37:48 -0000

From: "Daniel F. Dickinson" <cshored@thecshore.com>

Because this package is primarily useful in the context
of other opewnrt packages such as netifd, and not widely
deployed outside openwrt, move to the meta-openwrt layer's
repo.

Signed-off-by: Daniel F. Dickinson <cshored@thecshore.com>
---
 .../0001-rtnl_flush-Error-on-failed-write.patch    | 34 ----------------------
 .../recipes-connectivity/relayd/relayd_git.bb      | 17 -----------
 2 files changed, 51 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/relayd/relayd/0001-rtnl_flush-Error-on-failed-write.patch
 delete mode 100644 meta-networking/recipes-connectivity/relayd/relayd_git.bb

diff --git a/meta-networking/recipes-connectivity/relayd/relayd/0001-rtnl_flush-Error-on-failed-write.patch b/meta-networking/recipes-connectivity/relayd/relayd/0001-rtnl_flush-Error-on-failed-write.patch
deleted file mode 100644
index eaaf30460..000000000
--- a/meta-networking/recipes-connectivity/relayd/relayd/0001-rtnl_flush-Error-on-failed-write.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 2fa326b26dc479942367dc4283e2f87372403988 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 17 Jun 2017 09:32:04 -0700
-Subject: [PATCH] rtnl_flush: Error on failed write()
-
-Fixes
-route.c:45:2: error: ignoring return value of 'write', declared with attribute warn_unused_result [-Werror=unused-result]
-|   write(fd, "-1", 2);
-|   ^~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- route.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/route.c b/route.c
-index c552d1f..fc5c31e 100644
---- a/route.c
-+++ b/route.c
-@@ -42,7 +42,8 @@ static void rtnl_flush(void)
- 	if (fd < 0)
- 		return;
- 
--	write(fd, "-1", 2);
-+	if (write(fd, "-1", 2) < 0 )
-+		perror("write");
- 	close(fd);
- }
- 
--- 
-2.13.1
-
diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
deleted file mode 100644
index 98dc41a09..000000000
--- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Layer 3 relay daemon"
-SECTION = "console/network"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://main.c;endline=17;md5=86aad799085683e0a2e1c2684a20bab2"
-
-DEPENDS = "libubox"
-
-SRC_URI = "git://git.openwrt.org/project/relayd.git \
-           file://0001-rtnl_flush-Error-on-failed-write.patch \
-"
-
-SRCREV = "ad0b25ad74345d367c62311e14b279f5ccb8ef13"
-PV = "0.0.1+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-inherit cmake
-- 
2.11.0


