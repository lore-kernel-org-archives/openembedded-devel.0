Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6506D75264
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 16:14:28 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n10-v6so5364833wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 09:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=evnC4hzVPJF0yiB+pgmUinUUnV3ON6gG/Xu7xwaM+TM=;
	b=XzP4OFKCxwjMCim5OPaTuQinUq8gqUnBumrhY1T+n0SdLuqXH6IXYIz/NgX5lNzFdi
	bVlRYYk5PY9nwsxZQ/oQHJb/QOPN4j0IovxLZ5j3EtTycJCHIKHDFnKM84FUsh2aO326
	Adfn4HpMV9x1nmHE4W5UFx4mIma86yDsdzaEoCrXPZwAuY+2lsRfdRf0EvcZ10we678B
	Ad/6dfnFrPFjddQ8X51OZMo2lJ7eY6/QCu8Dc0fIdOCH6908n+WLnXyfsRKyHli2FC+7
	qSo5Eyko+YM6j6YEjFENpIns7fGNTqoiWgtfnB1rE5MYp/jBfo0//oUMnKU6Ex0Yz6+7
	BrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=evnC4hzVPJF0yiB+pgmUinUUnV3ON6gG/Xu7xwaM+TM=;
	b=VEliQGOIP+97N0GohKPKxTedPAsbAV69IuvPTWuhd4p2i+75HdkAxSxOoF0bN86OHv
	TumrwTR5tOrPkyMZoVPX8cLL/XahEZyMOgoeb+GFtZSXxWggWN7DoKuyLjRRojgbwOaD
	pqsqvEZx27b1w3i1uBYSTWZAo4aO4fObK7kpTcCiVGaoH+4EITQX0BpClxMRyBSLHOhA
	kMuw5Fzy7ZcTmDG2PlDdERaP/78kNDj2Wdg3tQCORSt9NDDqe44z6aW+0FQLHLIVtAfe
	2JFyWR2YGoV+hFAzVXUTPbRk7sHYEyq5lkaRVyG8/aLII1Z1WZ9n2X8bzxcM5PIOSRiy
	Mywg==
X-Gm-Message-State: ALKqPwer3dcXr3kBt3HzUTe6ItbGfSP7GbwSHHqiLYcKRgInfdVGx3WN
	9TD/4QtofeLxkEBdquRTJSwGfA==
X-Google-Smtp-Source: AB8JxZrBkZx9B/GlFGSRyjMQmCQhY1W9egrAyk+dpxa3WhcBMcDC+3Hdd0Be6L/IQ0W+SI9M6v6xlQ==
X-Received: by 2002:a1c:d7d0:: with SMTP id
	o199-v6mr1590950wmg.61.1525968868708; 
	Thu, 10 May 2018 09:14:28 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC0732689B6120586BBC15E.dip0.t-ipconnect.de.
	[2003:f0:7bc0:7326:89b6:1205:86bb:c15e])
	by smtp.gmail.com with ESMTPSA id
	f143-v6sm1679595wme.43.2018.05.10.09.14.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 May 2018 09:14:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 May 2018 18:14:13 +0200
Message-Id: <20180510161415.12827-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180510161415.12827-1-schnitzeltony@gmail.com>
References: <20180510161415.12827-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] menulibre: update 2.1.5 -> 2.2.0
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
X-List-Received-Date: Thu, 10 May 2018 16:14:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../menulibre/{menulibre_2.1.5.bb => menulibre_2.2.0.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-apps/menulibre/{menulibre_2.1.5.bb => menulibre_2.2.0.bb} (80%)

diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.1.5.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb
similarity index 80%
rename from meta-xfce/recipes-apps/menulibre/menulibre_2.1.5.bb
rename to meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb
index d1f3471d6..b0e4784fe 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.1.5.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb
@@ -13,9 +13,9 @@ inherit distutils3 gtk-icon-cache distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "https://launchpad.net/menulibre/2.1/${PV}/+download/${PN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "efc7edb49bb0e5fea49e158b40573334"
-SRC_URI[sha256sum] = "ef05b2722bab2acb7070d6c8ed0e7bd58bd4a4540bf498af9e889944f9da08b5"
+SRC_URI = "https://launchpad.net/menulibre/2.2/${PV}/+download/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "9690848dbf9196c3f7baa574e90378d8"
+SRC_URI[sha256sum] = "546fec87f451c8f5c220d02b1f36dd850f4ce9ab607f8e9711ed8f2009e349fe"
 
 do_compile() {
 }
-- 
2.14.3


