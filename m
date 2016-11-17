Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id AE0F0719C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 17:34:23 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AcBQCi6S1Y/5tjdVteHQEFAQsBgzcBAQEBAR9YgQC0boI4hBUkhX0CghlCEQECAQEBAQEBAWIohGkCBCMPAUYQJQImAgJXGYhwAa0GgimLXgEBAQEGAQEBASOBCYUziW+CAAstgl0FmkOGQIotApAkSZESNCGGRz00AQGHdwEBAQ
X-IPAS-Result: A2AcBQCi6S1Y/5tjdVteHQEFAQsBgzcBAQEBAR9YgQC0boI4hBUkhX0CghlCEQECAQEBAQEBAWIohGkCBCMPAUYQJQImAgJXGYhwAa0GgimLXgEBAQEGAQEBASOBCYUziW+CAAstgl0FmkOGQIotApAkSZESNCGGRz00AQGHdwEBAQ
X-IronPort-AV: E=Sophos;i="5.31,506,1473112800"; d="scan'208";a="79860796"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 17 Nov 2016 18:34:24 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1c7QZs-0004Jj-1y; Thu, 17 Nov 2016 18:34:24 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162]
	helo=goomba.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1c7QZq-0006Qg-3K; Thu, 17 Nov 2016 18:34:22 +0100
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Nov 2016 18:34:14 +0100
Message-Id: <1479404055-12584-2-git-send-email-jaragunde@igalia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479404055-12584-1-git-send-email-jaragunde@igalia.com>
References: <1479404055-12584-1-git-send-email-jaragunde@igalia.com>
MIME-Version: 1.0
Cc: denis@eukrea.com, otavio@ossystems.com.br, eric@eukrea.com
Subject: [meta-browser][PATCH 2/3] Disable CHROMIUM_ENABLE_WAYLAND in the x11 recipe
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
X-List-Received-Date: Thu, 17 Nov 2016 17:34:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Running the chromium_*.bb recipe with CHROMIUM_ENABLE_WAYLAND on
was crashing because it missed some steps that are performed in the
chromium-wayland recipe. We remove one possible failure point.

Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
---
 recipes-browser/chromium/chromium_52.0.2743.76.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-browser/chromium/chromium_52.0.2743.76.bb b/recipes-browser/chromium/chromium_52.0.2743.76.bb
index 14b519c..ea23a6b 100644
--- a/recipes-browser/chromium/chromium_52.0.2743.76.bb
+++ b/recipes-browser/chromium/chromium_52.0.2743.76.bb
@@ -1,3 +1,5 @@
+CHROMIUM_ENABLE_WAYLAND = "0"
+
 include chromium-browser.inc
 
 DEPENDS += "xextproto gtk+ libxi libxss"
-- 
2.1.4


