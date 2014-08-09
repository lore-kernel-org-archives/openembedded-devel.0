Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD0170A10
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:31 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so6974086wes.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=r1Ei4VI7mGNwuJVn6u7YJ3e1vtgNo2rUp57r7BNJKoY=;
	b=aE/hZG4WukTT2XvuSrOm5EisJ4qsRvmLwV2RcdCJur/gnGJGO9F6Cq0TeSssvdZUNw
	kKZMnsP8rrXrPdG3HSO8ZH2LK1n70YDWHddubUBBQqbmXi7AB+pO7A8QYhQP0yJSEp/L
	4bYffM+U3zvnGJnxofitVTTZiJEdFnmpT1/GWX8hJxALElx8jN2eibxraJ6P2D709ozB
	7jYURQBX7FELuoxbgs6Ucyul4So1faECyZRjvJTT5AWlkL28RIXOKmMQbmO/D+Cdkgya
	6s9QhnMlrOJBQVfQyBxfY0WMxp7sAEqWD4DPOR1d/kWyKLyxEeFIhzLrFNahKbszu1mB
	TGDA==
X-Received: by 10.180.105.6 with SMTP id gi6mr11480191wib.81.1407600511988;
	Sat, 09 Aug 2014 09:08:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wi9sm25527819wjc.23.2014.08.09.09.08.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:25 +0200
Message-Id: <1407600537-10857-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/36] mpg123: add all floating dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Aug 2014 16:08:32 -0000

* fixes following floating dependencies:
  mpg123/mpg123/latest lost dependency on  audiofile esound libjack
    libsdl openal-soft portaudio-v19 tslib

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb
index dd5c3a4..9d9dc84 100644
--- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb
+++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb
@@ -6,6 +6,8 @@ HOMEPAGE = "http://mpg123.de/"
 BUGTRACKER = "http://sourceforge.net/p/mpg123/bugs/"
 SECTION = "multimedia"
 
+DEPENDS = "tslib libsdl jack openal-soft portaudio-v19 audiofile esound"
+
 # The options should be mutually exclusive for configuration script.
 # If both alsa and pulseaudio are specified (as in the default distro features)
 # pulseaudio takes precedence.
-- 
2.0.4


