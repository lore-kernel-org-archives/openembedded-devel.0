Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7C81B746F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:32 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l16so16875914wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=O9Wigfe12Rc5XRAWKLL3/pTaglJJispaVSYjwetAbRU=;
	b=uQyItwZDNJHLyX0jDir4/Ip+Trtg6Bbi7HyA3Ku+8zYHHj7x+/llYDyI3IzuCsyK+q
	MNgDsNXWtmADZqr9kWZcxD4vTwu5+Sd/RjYC8UfwSHqVWDPf/y0vwq+3f2mga8U/B5WR
	MrhshGgeKu5EWrDOKUPEV6tCburpkwQkX8JZEi9hnEVVMX0EwgmbV0EQYgCvyKxj4pS/
	SIZrlJzmWcxvDNP9+CmmsxsQ3+ClxIj0nMmeAdyyO5l9qw+ZITNm54zJ6qykOMUJALow
	XNBuOFbefrVccRjQrMr0ogSsZ4U4IaftNf9ahO3hNYS1IBnvoWKOWtQ/rOFpp/LIKims
	fPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O9Wigfe12Rc5XRAWKLL3/pTaglJJispaVSYjwetAbRU=;
	b=SRSQFQ8SDCBHMJsTH5nL8prqbfwKm1pg2oXJ3b3LJGzNpAanAWNQjioPrXwpH1h+d9
	e1rJOUAU7QwxPQ+R8z6hvLXbSX5XuILiDg5KugIZ6pnY77LkXQ4PGzojlrKtVk/Qdgxf
	aDKnfOHrkqk+OO9Z8mv9NdN62KCgJ1XF+wsyVEjaLXKxti5q2dv4nZJ/3ODpFGz2Xcmc
	gRBwPRdgql2+8+gsxp2ITJK1dD0Ahe16ScsdgyOpDMqhZcAf68WGRvXbpYNV00p/vVk/
	ESW5G0vaBG2NEZThasLRvZnQQrGJ3MnEtrwd4wI+s+btRqGn8fyhvoZefpzQpyJZjbWM
	LOfQ==
X-Gm-Message-State: AElRT7F/2Ma0PLLCBjqy9sixnwyBcGaHV584V/71+C74dFHSXVsRLF1L
	4kB21fJx4z4z3kxsVg7Kk2vygg==
X-Google-Smtp-Source: AIpwx4+rTSCtIjLgd2rdXmg9KwoMizoqKm8cIsi4SwIMrSdNn2HmttX6T4mwPha3AhF8tGd5N99WWg==
X-Received: by 10.28.12.17 with SMTP id 17mr2191329wmm.75.1522416753182;
	Fri, 30 Mar 2018 06:32:33 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:41 +0200
Message-Id: <20180330133151.25882-30-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 29/39] gparted: update 0.30.0 -> 0.31.0
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-extended/gparted/{gparted_0.30.0.bb => gparted_0.31.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_0.30.0.bb => gparted_0.31.0.bb} (90%)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.31.0.bb
similarity index 90%
rename from meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb
rename to meta-gnome/recipes-extended/gparted/gparted_0.31.0.bb
index cdc882a51..58beaf6c5 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.31.0.bb
@@ -12,8 +12,8 @@ SRC_URI = " \
     file://org.yoctoproject.pkexec.run-gparted.policy \
     file://gparted_polkit \
 "
-SRC_URI[md5sum] = "09b12d3831e91b26ec8726b00eecd43d"
-SRC_URI[sha256sum] = "d31193effe058bdaeb2a4cd4b514ec753191179a0bc3abefda68a2b7975ecf4a"
+SRC_URI[md5sum] = "c554cc5734c50459dd551bd3fa10710e"
+SRC_URI[sha256sum] = "3b7b49a434d9e4b397bc41a1f5acab8539b9ff402b472dfd83ad77b2decd07ba"
 
 DEPENDS = "glib-2.0 glib-2.0-native gtkmm parted gnome-doc-utils intltool-native"
 
-- 
2.14.3


