Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4EE71D9C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:27 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id q39so12810352wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=n9FoVXxciG0RFa/DXesEhzzM2ewAPlxJ8YPN7rnZhx4=;
	b=NWw4uc3W7ApuWafVmZv/fGcNiL3XxU0govGdbgDqVttLpoZaKF6WSEGfUc/ZLEwEUO
	ZacC04er8w+8/WhF86W7F8IQUPaM52PBEFmnul/qtHzWdeMGiVLHjCSd2kru+KpSX5LI
	KUWrSZ/sXqYbVo2k2F6H3KZTBbB9XXcVmoyBC0fGt+NoVxb+j8YyTI7J14yCc2sLD6h+
	uw1Dd9Dbpg79XhUDZvELD2k4iJ1iZDRF0WE2PYC55xeVKKt3vdPUdYCtT07Yk4FcRve7
	ldFZP2hPjlI25nYwicBc9ppy1bh+4sHRo2QKOgiV6YBh4bh4Z4PzrXh/ntEbtANKDeN9
	jTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=n9FoVXxciG0RFa/DXesEhzzM2ewAPlxJ8YPN7rnZhx4=;
	b=Y3Tu+7tbwOnKwSn+H6FTNma4y9W5dM70GyeEkHAuBdkexj1s+9Of/1AfgMFk8AtFfG
	/MqDX+/1hWioIiVzA2C+IEb17Wo4EkSsalHATc3Y69NUZ3VkJ94M3zAgVZ8m1okQDcKp
	bOrchSb3KUQYEQUoOTY0CW1vo/UyYaMr0KpaMDbAJqns16UkWNrfVvmayv3frdHcfiyE
	MQgBregHx3U6wppstunCVO19lyswXrPkGrap0Rqwm/4sANQ7FlflcrCq+sh5b9ubc273
	zClw7XGj/r7amm9ix86GPL5Ehg79lnv+Kl4DdEVj0231ZR9s9iP6t/jde8FFNyktErPy
	wXOA==
X-Gm-Message-State: AMke39mouQxjrsI2W32q8dofwoTvAO81RwHysusu71cF/oPFU014GQqZXGW1AEs37hLseA==
X-Received: by 10.223.145.163 with SMTP id 32mr18521761wri.198.1487614047924; 
	Mon, 20 Feb 2017 10:07:27 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:28 +0100
Message-Id: <20170220180700.29836-13-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 12/44] xfmpc: unblacklist - all dependencies are back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb
index 19166f5..3d902a1 100644
--- a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb
+++ b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb
@@ -11,9 +11,3 @@ inherit xfce-app
 
 SRC_URI[md5sum] = "e2d2faeb7a6f62813e287f3d12522b71"
 SRC_URI[sha256sum] = "4189c0c82b66b758a6d5bc651493b675d3d46329e5f1a76ff26c448125f4fcb0"
-
-PNBLACKLIST[xfmpc] ?= "Runtime depends on blacklisted mpd"
-
-PNBLACKLIST[xfmpc] ?= "Runtime depends on blacklisted xfmpc-dev"
-
-PNBLACKLIST[xfmpc] ?= "Runtime depends on blacklisted xfmpc"
-- 
2.9.3


