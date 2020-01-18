Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id CFAA07FCA3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:18 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b6so25077331wrq.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ux0Rz5mbvvE20WOa3lCJLMS/97gwPWmed5CrOc+QQmY=;
	b=vcL62nGuidIIvKeF72rDcp2aM+1ZCvjspneGRexUnh9ClbYXVSi4llm0TC9C3kfCbl
	cYXurN+KCym1Fx+SWoYHhrewes9XPh09+UAjdi3p63Qo8QNLZjL6ZeQ3KU8v77MwF8ud
	oIc7fucjtWf+d4hs3E8WmUmbywa6bkmcNu5kScj38c1zJsdeZpDAt5dc/DSb/qKmdIl2
	isRuIYhInOTeU4K+g5gr6pULWcaeiWurrl4BtxpWauCDfuw6oSxxfgeMJ3ZE1VQV3jf/
	+zVpwCng1/CjdHggybuNU2DErNManV2ETJXx0c8Phbwre7vAw16FOhkUri/hK2fEjva/
	tZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ux0Rz5mbvvE20WOa3lCJLMS/97gwPWmed5CrOc+QQmY=;
	b=UgX01omVoN+pGLuMPlE8mF2zUCn0Ds50HKZln/ZQi+oNjkAbH46PfJASAqoJEDFkPt
	gBth0zckEgb4DZqCyvuIKrGq7ZFBk9LtYik+ri7T3CCEhk13390wzThonkPUQslBQMM3
	x6acr41WSiYuhlFpyPL9cPxxYhP3JxgpLBHgueJJoX8+g8MEo5BfqU3uhx5BX/Gh8m3C
	lnEF4E5oF7Uywobb8jIwWshI7PZ1LLyEuD42nd7XQEqeLsWZFqwFqBkOBT/B1dswxocN
	ZmIHvsBm+5t2cFl2pz9PliYm9H3RKfSOe1OhWTyQKmvjenWmAFgOO71wpYX+pwnYzrra
	85bQ==
X-Gm-Message-State: APjAAAXtfZkmid5CY1viSZG+17b6/lTGBbmmmf0wE/CDpajKN7RjPVyk
	4PoJiXkYpnVEh0/F/KmTB8hCg9JhIGU=
X-Google-Smtp-Source: APXvYqzSuqXfMj6Vv4hUk5JtbUw04IE7jKS6kVybg2tMYsjLGs8dI3umGZ97YO4lGf+X/gBAliKWOw==
X-Received: by 2002:adf:ea88:: with SMTP id s8mr8020755wrm.293.1579346899372; 
	Sat, 18 Jan 2020 03:28:19 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:49 +0100
Message-Id: <20200118112757.5287-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 15/23] thunar: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/thunar/thunar_1.8.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.10.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.10.bb
index f2376aa52..eb57daefc 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.10.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.10.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "exo gdk-pixbuf libxfce4ui libsm startup-notification libnotify xfce4-panel udev"
 
-inherit xfce gobject-introspection features_check
+inherit xfce gobject-introspection features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.0


