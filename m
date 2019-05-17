Return-Path: <scottellis.developer@gmail.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB9A7DEB1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 10:38:54 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id k202so2465174ybk.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 03:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iX8+FndoYvEGztJcmumnj/DNmcohCdEgGoA9MSVxHBw=;
	b=O50VCZS21LXjOnk8OwDjRoPslE85cUNimMBDq83F5Ui+J1LA72ZrmcsU1kmOFJYVtb
	OS6BOdMSxPqsh0QIQMewafkvYsCssaCLn3p/pbnaP+I1uzNMRKWU1fpXrPwW0Ajg9DDc
	qiU+Pq3/AweVvv7lipekirG4hI1GR8+ZxSaWmD5KM9tokiS8PdyS+O8+uNj0sXHvsQ/w
	w5dhGU9Mn8B/qpcEyUsEkQcZWpF4THd14wIwSdKG/5ST/SyEuQ14jAX3BJbYjMoys5Dv
	rJ+WS6GTWgTQs3KdgGPaPUAUa+UoBxG7X5SqGOgGQ7UX0iJjTOfJYKsOFhD6ANzKNRIQ
	meIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iX8+FndoYvEGztJcmumnj/DNmcohCdEgGoA9MSVxHBw=;
	b=sKb3fUJEjtnNhdY5yCSmrfrK7svclvEhmfGB/TIvC1F5vvldleIovjzZ+cq6rpDB2d
	kyYUt5JW/ZOSoOYzE83PxRkouY72m51HzEAs65pycqSr10bECa1J3TopsXjuJeQphEVJ
	RHeTkyPJv2z3C8rhAABtIqyyM5pyilPIyAsaEW2Yz/6Z0J4vrirJCv2P+3CIYvy13ST0
	TvPYtpqyF68nOH820Q3DhrOcpXiVR0JLMnB8a4o30+DZ+rRMMwSXYBoWdoejpBHMvuo8
	vN9pYgV41abi0dPA5wglqMG2DwGIJfT4n9rGiebAOaDbKqjWFpju0f7irWOfhIcxdikF
	7S2g==
X-Gm-Message-State: APjAAAX1CzQM7ngXyD7r1SBp4nDKoJaHCDW0D/LLe2WDOE8SgTQr3LNP
	TgNTtugxiErxAN6iMHMMs+/svhEc
X-Google-Smtp-Source: APXvYqyDM/BW8V9JDoCNsVGFVwrW9D/MBDJ+KrR1yrlaNNnWxq+YXFF0SnNaD3m6yU3YPIzUc66psw==
X-Received: by 2002:a25:20d7:: with SMTP id g206mr15095659ybg.49.1558089535297;
	Fri, 17 May 2019 03:38:55 -0700 (PDT)
Received: from fractal.jumpnow (c-73-234-253-132.hsd1.me.comcast.net.
	[73.234.253.132]) by smtp.gmail.com with ESMTPSA id
	z141sm2386613ywa.108.2019.05.17.03.38.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 May 2019 03:38:54 -0700 (PDT)
From: Scott Ellis <scottellis.developer@gmail.com>
X-Google-Original-From: Scott Ellis <scott@jumpnowtek.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 May 2019 06:38:51 -0400
Message-Id: <1558089531-6756-1-git-send-email-scott@jumpnowtek.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireguard: Upgrade 20190123 -> 20190406
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
X-List-Received-Date: Fri, 17 May 2019 10:38:54 -0000

Fixes issues with kernels 5.1 and greater.

Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
---
 ...eguard-module_0.0.20190123.bb => wireguard-module_0.0.20190406.bb} | 0
 ...ireguard-tools_0.0.20190123.bb => wireguard-tools_0.0.20190406.bb} | 0
 meta-networking/recipes-kernel/wireguard/wireguard.inc                | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20190123.bb => wireguard-module_0.0.20190406.bb} (100%)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20190123.bb => wireguard-tools_0.0.20190406.bb} (100%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190123.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190406.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190123.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190406.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190406.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190406.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
index 8314e79..5cf745e 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
-SRC_URI[md5sum] = "8a0a232f65d5d86dd408efd9ac30bcf9"
-SRC_URI[sha256sum] = "edd13c7631af169e3838621b1a1bff3ef73cf7bc778eec2bd55f7c1089ffdf9b"
+SRC_URI[md5sum] = "c11254fe48695e61c145a7e82756ecba"
+SRC_URI[sha256sum] = "2f06f3adf70b95e74a7736a22dcf6e9ef623b311a15b7d55b5474e57c3d0415b"
 
 S = "${WORKDIR}/WireGuard-${PV}/src/"
-- 
2.7.4


