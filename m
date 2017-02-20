Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0E2AF71D87
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:36 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c85so15748867wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RA4pcnurdD4xMMgjtwtaX82E9m0UHBZCQkgVLkd+Z+w=;
	b=THEDCKyAIDQlxL1UfDbUaf8zUBfxMGGLCSxvxFUHOvZsW/VtiShqLpv+1kT6GTs8a2
	y05kKy+AbM0JxqBAQss4F6zOPInCLvE4jtKR97ERcRvfxF9sktKhCqVx8mVDuEyxMfm+
	FoY0cFqx+tuKHUCt90yZWuzr+1GeXi75lTLN+Y25pcKjEL+sYCL7a9eUJXKSN4TVc6ac
	xWIY5xY/NkAiOv3dcDlKXFmXiVk3nyZCz+NsiMXE5Zs6CVbjN18J38zxH8hR+0dsa8L/
	5p1rg1bnMbClbLN2yL5leb6YQQxSFBTuTHSG+ifZlWw/kyHivsb7Z0+WEEKYgpUYtLbW
	k1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RA4pcnurdD4xMMgjtwtaX82E9m0UHBZCQkgVLkd+Z+w=;
	b=Abf9HjhRu6NwR4nPD3fXqeiH8TxpPmhRolglsRm5UC7WQStoSukgqRfmFGZcHO5bxN
	hI33Wpds7mTusqBljLk7AQ77CWGYQ4r/76le8+YxEx+nvDwH1T+VsOE1/EacK687Dixc
	uNrCBlHm3wtHbhks2edNxbpBKN7CJIPlWbWf9Q8/R3o2+nPP3FZVYAiiyaKXp4CzHW3P
	SUXIxc1ULyogt4uNAKyR1R7qrLfik8zZ0n/vZm/f8pxDuZZoxxQ8ViKE2sh9ZkTKQgrW
	HqBtHfJW1zAgAPNTVw+l3v73fyWKOzI/WKqO9UkcuPL9pxY9po3k6gI08k2rcPio4R5t
	oltQ==
X-Gm-Message-State: AMke39ktUSkXu/TFasR/GNz87zx6NspegBS950jFTj2x2s5diDtEgAIxUEDCqp95n1jR+g==
X-Received: by 10.28.50.135 with SMTP id y129mr11322093wmy.2.1487614056162;
	Mon, 20 Feb 2017 10:07:36 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:36 +0100
Message-Id: <20170220180700.29836-21-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 20/44] xfce4-whiskermenu-plugin: unblacklist - menulibre should be back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.3.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.3.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.3.bb
index b68ecdb..9feb864 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.3.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.3.bb
@@ -9,5 +9,3 @@ SRC_URI[md5sum] = "3cbbe6f233089b6923113f47d311f875"
 SRC_URI[sha256sum] = "1b7afb233c74c33f0ee26de6514c4168497f4aa584dc2f6778dff15d8d47b165"
 
 RRECOMMENDS_${PN} += "menulibre"
-
-PNBLACKLIST[xfce4-whiskermenu-plugin] ?= "Runtime depends on blacklisted menulibre"
-- 
2.9.3


