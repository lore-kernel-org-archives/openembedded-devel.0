Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id C577B607F8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 17:06:59 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AEAgDVNC9Y/5tjdVteHQEFAQsBgzcBAQEBAR9YgQCNP6cvgjiCDoIHJIV9AoILPxQBAgEBAQEBAQFiKIRpAgQjDwFGECUCJgICVxmIcAGsCoIpi0sBAQEBBgEBAQEjgQmFM4lvggALLYJdBZpLhkCKMgKQJUmRHR43hko9NAEBiEEBAQE
X-IPAS-Result: A2AEAgDVNC9Y/5tjdVteHQEFAQsBgzcBAQEBAR9YgQCNP6cvgjiCDoIHJIV9AoILPxQBAgEBAQEBAQFiKIRpAgQjDwFGECUCJgICVxmIcAGsCoIpi0sBAQEBBgEBAQEjgQmFM4lvggALLYJdBZpLhkCKMgKQJUmRHR43hko9NAEBiEEBAQE
X-IronPort-AV: E=Sophos;i="5.31,510,1473112800"; d="scan'208";a="196079093"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 18 Nov 2016 18:06:18 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1c7mcE-0005iF-4H; Fri, 18 Nov 2016 18:06:18 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162]
	helo=goomba.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1c7mcB-0006Es-N8; Fri, 18 Nov 2016 18:06:15 +0100
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Nov 2016 18:06:09 +0100
Message-Id: <1479488770-11390-2-git-send-email-jaragunde@igalia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479488770-11390-1-git-send-email-jaragunde@igalia.com>
References: <1479488770-11390-1-git-send-email-jaragunde@igalia.com>
MIME-Version: 1.0
Cc: otavio@ossystems.com.br, eric@eukrea.com
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
X-List-Received-Date: Fri, 18 Nov 2016 17:07:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The chromium x11 recipe crashed when run with CHROMIUM_ENABLE_WAYLAND
enabled, because it missed some steps that are performed in the
chromium-wayland recipe. Doing this change, we eliminate one possible
failure point.

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


