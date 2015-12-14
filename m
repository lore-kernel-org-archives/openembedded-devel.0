Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 85936700FD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:34:33 +0000 (UTC)
Received: by pff63 with SMTP id 63so12867339pff.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=09P3STMjzvFfHq82YOu3yWuSEvV9WDNIQw+M+pEl4eg=;
	b=aN5LlEXZMek9H/v0CRchnp8gShM5onmsKBKTmoAu8TgchMUe9fvRGmOxspGCM2QT9R
	JindQnAdh/lx40Bddo4D9z8LUyV+JKoEvbU7BupcpM5p/WxawT+Jc3jrcftDyUvAVTjG
	fmK77l5rO52s/nhDKiZQ+FSfRQoZeIj+YXkR/QlIfZNRxTXC5nx527U6ZG5w4dP7tUXO
	Etqm7zOlX8VdlXD3EvE9CyEHl2yv21LQ1QwmwAID35N3Ldw4a2rsASHcg/3TC3fyLC/q
	Ak9HIGm3kU8BmCoCUT2DwUHpAzhvnlyWnGIDI84nSrSMAUc5f/C9cg1qu2Gp47DWEuTn
	IfxA==
X-Received: by 10.98.11.90 with SMTP id t87mr8271321pfi.97.1450107274361;
	Mon, 14 Dec 2015 07:34:34 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	f67sm43273202pfd.9.2015.12.14.07.34.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 07:34:26 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 3D357FCC844; Mon, 14 Dec 2015 07:34:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 07:34:03 -0800
Message-Id: <5ab2dff1c8a9860f0745b6f8e9651138ad891b21.1450027640.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
Subject: [PATCH 10/14] netmap-modules: Modules may not have the same arch as userspace
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
X-List-Received-Date: Mon, 14 Dec 2015 15:34:34 -0000

From: Jackie Huang <jackie.huang@windriver.com>

Kernel modules may not have the same architecture as user space.  So we
tell INSANE_SKIP to skip checking the arch for the modules.  This is
consistent with other kernel modules and the kernel recipe.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-kernel/netmap/netmap-modules_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index 23f3094..6e6f02c 100644
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -39,6 +39,11 @@ python __anonymous () {
 
     extra_oeconf_drivers = bb.utils.contains_any('NETMAP_DRIVERS', all_drivers_list, config_drivers, '--no-drivers', d)
     d.appendVar("EXTRA_OECONF", extra_oeconf_drivers)
+
+    # skip the arch test for kernel modules
+    if drivers_list:
+        for driver in drivers_list:
+            d.setVar("INSANE_SKIP_kernel-module-%s-netmap" % bb.utils.prune_suffix(driver, ['.c'], d), "arch")
 }
 
 LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
-- 
1.9.1


