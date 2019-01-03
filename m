Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 54EEC79BA6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2019 18:07:59 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i12so17025258pfo.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2019 10:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0oJNa15qPxuOkHIBlRgXMBqEq6MOeSQMjLMVlj3GR3E=;
	b=O5DsUE65RLqe2x8ImrgXRkXYpkteVLGheSppgQ5BtSycjzSInYhrsXQvZ4a5yG7tQG
	lu0H2o/Z4lqFoTOxzItgGDVj2Z7VyR3XBiM/xRt+7zkqwBBzVdbexfbA4wIL7OVdusJC
	ZSftJUVomXTBEP45TIbAORwpRHNPpU6udXjm/G7VcqQxfJspWUOkm//fuzchuegK7bUg
	skyVqV8u6qylBkRBGXLdUGMvU9vOL7bOUcJoets6+Jmcua669/Pg0IWrDB1vQErIPwgJ
	7Vvnu6jSOQ10i3YNMgkFBTvj9Ya4SIkNrMR6B9vxRqAdKpaEONpH7Ds0PQhhoJ+dtArP
	7fXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0oJNa15qPxuOkHIBlRgXMBqEq6MOeSQMjLMVlj3GR3E=;
	b=RzkpGv6w3U9/3YaQas+J34XHIhe1Mp0zQnCPfliDtj+x8J+omas7T8wUT4is+yaAjU
	8Gy/iOZ/f+o+wbQAdjlKb+Ljjv8XDsUk2C1NdsTBU3ONKbcAnjH/RDbCPeMyEeaHR7pi
	9A8K3P8izOh3mqrqzFpw5a7+BmOsy+vW97boFc3AFRhEt6lwI3YBofaYJtgEVqXVTxHL
	UniAc2rEzNclm0wpelFTJ19u1SZmL6gGIpLpN2D9SVFbk2OeOrZ8Kgf4CJd9TqWpDnsX
	gUsf2ansS7ONVeYxun4Va2os+1buA6l3K5i9oF/aLUMHWln8nHU5VGp492cVAwtwFpdA
	T1eQ==
X-Gm-Message-State: AJcUukeEheN2J8WfyLng5s4SkwhLv87N++DPnRQgLakoM4WeUJUa/s7A
	KXHiCoLP0I9fN97A3nVfJgTOvTN16/A=
X-Google-Smtp-Source: ALg8bN4NXMuxHIKKWzXSkQsZLlc/g1aM7LdWJF4P/YgiFpbTR6eEclEkktjrVUGUKYbJ5fMGy5DCRA==
X-Received: by 2002:a63:b105:: with SMTP id r5mr17998205pgf.442.1546538879966; 
	Thu, 03 Jan 2019 10:07:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6ee7])
	by smtp.gmail.com with ESMTPSA id
	m67sm75487168pfm.73.2019.01.03.10.07.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Jan 2019 10:07:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2019 10:07:50 -0800
Message-Id: <20190103180751.24958-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190103180751.24958-1-raj.khem@gmail.com>
References: <20190103180751.24958-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] mpv: Disable lua on mips/aarch64
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
X-List-Received-Date: Thu, 03 Jan 2019 18:07:59 -0000
Content-Transfer-Encoding: 8bit

Luajit depeendency is not available on mips64/aarch64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
index c2e8e3d574..6586e352ea 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
@@ -25,9 +25,12 @@ SRC_URI[waf.sha256sum] = "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f2
 
 inherit waf pkgconfig pythonnative distro_features_check
 
+LUA ?= "lua"
+LUA_mips64  = ""
+LUA_aarch64  = ""
 # Note: both lua and libass are required to get on-screen-display (controls)
 PACKAGECONFIG ??= " \
-    lua \
+    ${LUA} \
     libass \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
 "
-- 
2.20.1


