Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3C39C7F8AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 06:54:47 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id w18so24369933wrt.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Nov 2019 22:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=OukeQGKoBu5wc7ya0mCxHcBGKo5xCRPdHvBTqs83qQc=;
	b=B/skxcizLuauPiHyQ51FGwW3STm6x0/uTdjKR4wS6cSJ0JZJlwEjz3zEKKb+IR+NqI
	kc1Rmw6t+q+AC7z67iAdjzZSJ76vfr4XEmOsunsAeep7h3YcaE6c3zvsNV/gZ/4liFyQ
	PtIKbOZAyJVH47aP9BPBNHjAVafYrZRsJ2VFLuGnL6QAWCj3L8w++DequFOWw1G3II8m
	l5Ju01dAfeWLCNxv6SUlbavxEBO3WuPjDFMK8ygazr2PSGgsK16bV5yUKIR+O6QOylci
	P4sYFkBAlU7QCu+5q0q2qwYNfbpnTRlW2yKUp06y4qa/grby6xW+TKRDGiCMHyjfwvCV
	pL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OukeQGKoBu5wc7ya0mCxHcBGKo5xCRPdHvBTqs83qQc=;
	b=RQFu24WsbqdK60HR6bEHhP4Adh64kFkQiqNOTy8R7szIKc35CEEzVMPrpqLtIypOI9
	+vaMx6BZpXGiObwfvtOtUTmpXbBnx62ua/BzOjQM+rwACWteiq8hJAytDzly2f5B18yX
	bKhx/YLim0myzrGqyQ+F6ni4CzLRTbg3XOT/al69c8I98jR1DVTvvs163d9n5laWgPTH
	PUGmaSuP05ibAVoBgEO/ODfYBV5U2bdPJj0wG5+pAV9s5PF6fC4mQmB9ZyqYOD2ZJQE7
	Dej91HkStw/lkhyK9GGgExQKaya1h7ma8dSjgGREu085pRpSEjpN6tZXwR24xSA9S5gi
	DLaA==
X-Gm-Message-State: APjAAAXin4d0rfD4EN6VMrcR/A0x+oWSsQKnpQ/BaIh0XVe4zhxKZzQ2
	4Eu1dRBAWsnqoiu60AQ8EOoi5yR+
X-Google-Smtp-Source: APXvYqxCBlyQN7VjkPR0rQ/fu++IB39akfXFqk6sOhfXpKqs7GIG1x1IHRiUzFlrFWmARus+zzyZog==
X-Received: by 2002:adf:b608:: with SMTP id f8mr1008602wre.99.1573023287566;
	Tue, 05 Nov 2019 22:54:47 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F438C581B49BA34826387FE.dip0.t-ipconnect.de.
	[2003:f0:7f43:8c58:1b49:ba34:8263:87fe])
	by smtp.gmail.com with ESMTPSA id
	j14sm17996079wrp.16.2019.11.05.22.54.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 22:54:47 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Kai.Kang@windriver.com
Date: Wed,  6 Nov 2019 07:54:33 +0100
Message-Id: <20191106065433.3609-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191106065433.3609-1-schnitzeltony@gmail.com>
References: <20191106065433.3609-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 3/3] xfce4-whiskermenu-plugin: upgrade 2.3.3 -> 2.3.4
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
X-List-Received-Date: Wed, 06 Nov 2019 06:54:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 2.3.4
=======================
- Fix building against xfce4-panel 4.15.0
- Translation updates: Dutch, Galician, Georgian.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...menu-plugin_2.3.3.bb => xfce4-whiskermenu-plugin_2.3.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.3.3.bb => xfce4-whiskermenu-plugin_2.3.4.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.3.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.4.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.3.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.4.bb
index a05f0dc6f..595e3c815 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.3.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "21f1e1d8d4a030f23d358d6c5ac50f2a"
-SRC_URI[sha256sum] = "e0c6cc4fc1e685bc9601ec217a803d5489ca3276f4008bf056600471c6ac1848"
+SRC_URI[md5sum] = "ee9e378fae78b230a23b241cf727c84b"
+SRC_URI[sha256sum] = "84d3de35695a023aab181f7a9b75f59029eb3b07c3e47a5e11e8bd79db62570e"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.21.0


