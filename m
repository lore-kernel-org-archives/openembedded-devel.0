Return-Path: <M.Vovard@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAD7EE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 07:58:38 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web10.6195.1692604707692269855
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Aug 2023 00:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=W4TlAT9S;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: m.vovard@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1692604703; x=1695196703;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Kryuasg6wxmkYWGs+62GrzvR+GdSii0TLPx2vFUDCV0=;
	b=W4TlAT9S1CRwTNwLEcGMWud9zYotMXj7BVxY8/DK67dAhehvQy2229xcougghNyN
	E7sD9MNnsSMQ9cCgt4/6W40eFXN4Ax0ENKQL1TrIVBFxOKFW8MPubYGnt2MtJS9z
	SbBT8vqTf5tadBZk42QXCIn5CXz8aM7DQ2J1R1MfbYM=;
X-AuditID: ac14000a-917fe70000007ecb-32-64e3191ffba5
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id E1.48.32459.F1913E46; Mon, 21 Aug 2023 09:58:23 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 21 Aug
 2023 09:58:23 +0200
From: Marine Vovard <m.vovard@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-python][PATCH] python3-kivy: Require X11 or Wayland in DISTRO_FEATURES
Date: Mon, 21 Aug 2023 09:57:58 +0200
Message-ID: <20230821075758.234890-1-m.vovard@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplluLIzCtJLcpLzFFi42JZI8nAqysv+TjFYN9lTYuLh5cyOzB6nNu4
	gjGAMYrLJiU1J7MstUjfLoErY/PXLawFc9krelo3MDUwLmbrYuTkkBAwkXi/qhfI5uIQEljC
	JPF64gNGCOcJo8TW5lNAGQ4ONgENiXVHHUEaRAT0JZbO3sMMYgsLJEi0z1/MCmKzCKhKNLyc
	ygJi8wpYSFz8P48ZYoG8xMxL39kh4oISJ2c+AathBoo3b53NDGFLSBx88QLMFgKKL3h/hQ2m
	d9q511BzQiXmr/nOPoGRfxaSUbOQjJqFZNQCRuZVjEK5mcnZqUWZ2XoFGZUlqcl6KambGEFB
	JsLAtYOxb47HIUYmDsZDjBIczEoivNLfH6YI8aYkVlalFuXHF5XmpBYfYpTmYFES573fw5Qo
	JJCeWJKanZpakFoEk2Xi4JRqYAy/cn+G4X/ncx4yZ6fWVEfoZ91Z6+uycmXAY/uf/JdarRy/
	7C5mYa//ePXidKX/D7Z5vhXRZ2Lt7PXrUDc//XZGiu/G46wK1+dVnN/mmuG32VxWZlXNoe+P
	hGf2pWb/yFrE59853bv+0fx1exT5ov0iFuS67pPWde//07hRfOrDW/wJpuaee5VYijMSDbWY
	i4oTARvsImcgAgAA
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 07:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104505

At least one of the following DISTRO_FEATURES needs to be present: X11
or Wayland. The recipe now work with pure Wayland.

Signed-off-by: Marine Vovard <m.vovard@phytec.de>
---
 meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb b/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
index 684bca03e..b02c55a85 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
@@ -43,7 +43,9 @@ export KIVY_GRAPHICS
 KIVY_CROSS_SYSROOT="${RECIPE_SYSROOT}"
 export KIVY_CROSS_SYSROOT
 
-REQUIRED_DISTRO_FEATURES += "x11 opengl"
+REQUIRED_DISTRO_FEATURES += "opengl gobject-introspection-data"
+
+ANY_OF_DISTRO_FEATURES = "x11 wayland"
 
 DEPENDS += " \
     gstreamer1.0 \
-- 
2.25.1


