Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 563C87FC9D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:14 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id f129so10108772wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tdYzx1cvKSBFr0fifbgz5z3MWQOhnyIrUR5mxlVIUhU=;
	b=n29omgONRlMDVYZlWymEqRVG5qe7WIVWDUiFe2f7XGIniwkIZZs8xaAVMFsjltlyn8
	7rkk6Qsay9wT/v0nuyMth91ywQXiRp0jdfDkCjjYJByOP/T0VuUrx70i3Yqce0I5uyxz
	TuIn0ym6w3Eby9BJQTjtWu7PRCE1SbibxX1aL4TRmklgssNuPJdf/gdBTS2YNiyIZHJ1
	228vqkCm6GDm5/MiYW53vZ/byxC51N2TRC+tkle38PLRr8mfKlLaQtF9zT4UAmM/rJsp
	QrZ1oLMvtK/lJquVX1YhVEGRWTvtGVcs+wtllVGLvbebn9dqE2lkVaWeX3wZW3gLnoRv
	xgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tdYzx1cvKSBFr0fifbgz5z3MWQOhnyIrUR5mxlVIUhU=;
	b=lvZRUq1vQuW8YOAfUjqo+wzecWoHfouRA3l9JJ0iKZJoc0GXu5hYZyPLd/bHXPcb1e
	WtVcrIyQvNPK7+IMp0boQNn7avZmxxoPS4S2u54liiEn9W03YeM+WUS4tas7fvNhCuB0
	bUOPSw7c3apwQxZSkp8QwyQo5gfSkrngklfh9msc9jYaE2A8lQ/l+Htc9+NazaYHL8TD
	0TgXHeVSZXmcoySFJamLkcAk9RuxS/dxefYB4x8InaXE2x1zFXyMW3kjkvlc2Hwy19mM
	pouRiplkMzE4qHaNe/G7aiTUowm1LHMBGCi3Np7A+qno2r3ZO7R0FvfLTajXHU9yGh5Y
	6lUw==
X-Gm-Message-State: APjAAAXbwBetdHNL64dpDBshRLYbj84i+A9yApxeGCHqWZD67K2UTWgC
	ZRIdJDNZiudWrH+Xvm2RWqQQxRb1LHE=
X-Google-Smtp-Source: APXvYqyDDZUSVh1IFv1MawgdS+jPdW/4nkw8tGnS7ysovU6nl/fGO0JCHEPiUaYBKbZi8ih01fqF3g==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr9739499wmc.154.1579346894909; 
	Sat, 18 Jan 2020 03:28:14 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:14 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:44 +0100
Message-Id: <20200118112757.5287-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/23] xarchiver: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
index d6990476a..64582f28f 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
@@ -12,7 +12,7 @@ SRCREV = "9ab958a4023b62b43972c55a3143ff0722bd88a6"
 PV = "0.5.4.14"
 S = "${WORKDIR}/git"
 
-inherit gettext pkgconfig autotools gtk-icon-cache features_check
+inherit gettext pkgconfig autotools gtk-icon-cache features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.0


