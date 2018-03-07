Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1D1A678A26
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:29 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id m22-v6so1863967pls.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GlS6pwYENPFpgm2FWkDC0kaqGLM1EZ6Olidz1kkquqU=;
	b=eo7gPoeYYnF2V0rIamu2URTHM6ig1VYxeKmy98G0YeINr2qY3fpt3aSqNUIxZoG5M+
	2erA39sBcdxpfi3nxVde6MH90OoCfb2PdD3c+pmrAUrNJQMSPgnGhxvXDLax1DIC3WBo
	4X12deR8NVQUP2kYJKyUqjM7XKwCWINcUV/vF4BUl5RK50QkTESSNWPrtOlHu96Gvewy
	eHLJJXFIoNDj+ZiCgNRtu581Gue8KLIHIhWl9DU5neC7oJ2UEscortnEMyCaO8bH0V9L
	yoRuMWisOz/7isLDHbg1j/rezo/jc/CVe0dscPgGVc8sky7EQuxNhl9523WKkgQK/oMN
	H1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GlS6pwYENPFpgm2FWkDC0kaqGLM1EZ6Olidz1kkquqU=;
	b=UGz599PP57kkBWBXO1RO05M8koMrDRGNtUn2eTP/WK/D0Qk78stiIDLtNrSyL5sEth
	NouLAXIqIyhkC/Zsmrwu6TH3TpTyvXLHohaJ5GsS5PByRd7/acTsLUAHtCHwPoPNM+2A
	vBvfeZCZcbkyUxpY8HmKBWjgBtuU4goCw92P+ogYuu+AxYuZ0nT+Btkn4jF8C3w6diGN
	EUFFleqqT8kmIbfplkC9B1GIA/0oVsXbEuhkWFP/tG55n52qt3+cLYizfVyMb4Ksd2eu
	FP1bmSGVZGf7m0rp+uqBuBe1dYTe1GsRPgeg1GzCISclx8U3XYIgbj409EI5dntJLRqT
	0nOA==
X-Gm-Message-State: APf1xPAJw1nhN5gRx5sCESOtEl61MASgjKP8QLWheCib2AUGL/6k+Oov
	s8PYY2zgwsk8nZOksbkAMu8=
X-Google-Smtp-Source: AG47ELsIkCwoYfa6P/1oN/WV9NXq4mH6gZP89VpLYCvx/PhSxRdB/bDnMhL1uUca5naLVgNcy6uvOw==
X-Received: by 2002:a17:902:aa43:: with SMTP id
	c3-v6mr21528692plr.357.1520449290816; 
	Wed, 07 Mar 2018 11:01:30 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:01:01 -0800
Message-Id: <1520449275-29492-9-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 09/23] keybinder: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:29 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-support/keybinder/keybinder_3.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
index d6744a3..0a0a3e6 100644
--- a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
+++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
@@ -18,7 +18,9 @@ SRC_URI = "git://github.com/engla/keybinder.git;branch=keybinder-3.0 \
 
 RDEPENDS_${PN} = "gtk+"
 
-inherit autotools gtk-doc gobject-introspection
+inherit distro_features_check autotools gtk-doc gobject-introspection
+
+REQUIRED_DISTRO_FEATURES = "x11"
 do_configure_prepend() {
 	touch ${S}/ChangeLog
 }
-- 
2.7.4


