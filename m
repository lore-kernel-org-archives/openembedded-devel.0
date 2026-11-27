Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10298.1795753112643092289
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:18:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=uKPuwBUf;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38431138772so9928334eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753112; x=1796357912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ksiL34g6LkOA/j79eC7CZbgtCCZUgchJ4Ga7RjHs7y8=;
        b=uKPuwBUf+Zdnce0oSWhxnq69PcYmBsOQWI4d6YCoH4tnuVX+spvC0kF5FdFBCTwAyk
         4v6eKZnUSgj/8vDMZmRRyHGRmj4smw3BDct2R/PI5jnEt6VsAl9c1hDYs/YSw0wRlwlt
         iJhnR0mjahVi+aoW8xpiihHhqMuQcaZpc8fQr3oMkMUMAJGwtbwVxQ+3oB6JatiU+f2v
         qcHQRKwBWhH0ifcY/PG9AAN3D+js2jpeBFn9+LK0x7tqHDeKfsLMEjTHtuWjV0HVXyTc
         2NQLLMxA6oHMjccg2cWaf4T0LfAdqhlPXPlgmU52810L4ZAkpAZAurEAHj8EXeAUihgk
         c1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753112; x=1796357912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ksiL34g6LkOA/j79eC7CZbgtCCZUgchJ4Ga7RjHs7y8=;
        b=Bz34OoKttmsSQOvkKmiwYHSfgM9h19QiCO+vEnhBHq0b3jhbBQq8tnB+cXrUNvwMhk
         DceYpemg1xlykLACGUlriObeXhtePfQuthis7xSi1n+cLjixyKZNJ1dMPPcCi0tAfzss
         4TkUdMZiLYotv5s1oRLDlklEUNj3dst0WW/A5shsSe0mebZPDLKB24ptN+NV3GcG0OIc
         eS6kOMsoCGsuzBPfFQ1ouN+BBOsLNE6FwXmc/XHmmtkT9eGYq9KL99ERFde0QCnB0KAU
         mtmZgDKeZAGgL6EqcoFQdq480bheDHcdInEF8dJeF02bolM+h66t/PlnmcEShwbMt5qg
         ICoQ==
X-Gm-Message-State: APuU4Z+envbrQ40k+TKXQsKXqLQuVnm7wEJgh3GWXeuGiHGk7RcXHGfl
	0bx4nenw1b40G4pv215DgfNM3qo1YNe9rJ9dVfQyx1xssZyiwG+SFl8k1C2j2/xZ
X-Gm-Gg: AZFdTZchQDSgbX4jWEq/jWyPzjOvS7Otyhou/cM3ymL7o14q9of1PHmXLru1qkeYGU9
	f4l6/Pu+WXWbl7a5iR45mePE9HlMiblyQZcNyKJp0rafbzsM3WD/uC57OHRCwJnO+UBFJUYPZ1i
	W2jEBm6sSHSyQF5heMK4dHgU4Q8skQYjyLfhrSnw0nuQB5/sDGT6N4wPeUhBlN9H+av1tQ5zctu
	fVoFBRSeGTbmX1gHAnrIHQjUCegUqG+fVgA1+wNlcPH2T7yV9LtyK3xWU3jEf3wVpvTOQfzzhH4
	bsN6k5qBLGrpVBrrxTGxR6oF+fvPYJk/3U5vX/40F0trHgku1TV2/XVOKNu7Do42eL4aMTDQqsx
	coBrf6LW9wPfj4mCsOdicaU8AnVgcAmrswshoJ1IO/pfVW8W5xlPD5zM9jC6TB8ydynZT0oe1yh
	lIIhudeHpNL1Bd7BwzhKQHiz/20AxF2y4sauxvXp788Nbpg49Ve9z9w/G41ugf20c0xXfbLnD8g
	HHRSxH1rADP/UH6dlfAhozrX6vfk+yGTABqwoFAg4uiiGi42NQGfc6CiFACDoGrmvJx75KV1ntt
	E6OH8nKRUE1GC6jMZYjiGNZSiLaao35voaMCLks0x7hWa6yl21bn1u0SxG1fdYIqZGUm0GSFf6/
	09kor2EOE0i/u5Bav2bc3zs1+WjrCD53FIytXsxDSPEymwa4vU2JDx/FXoqKYX4TsnSmjGPxBVV
	l1DFvUwgDWFhnvbyd+9i2OMl0Ad6xouctBuyprF3dzXMZmQI2mmwZ1Bv6fuA2tpnuGLUGc7+5Si
	oXZWsXZEQ9/tdcr6giCZNREDGBFQulZmZMuM2+aco9o0zBYHu51/GAHsVVU9g12QX7wakWH4lmF
	KStg
X-Received: by 2002:a05:7301:fc18:b0:36f:2e77:93e2 with SMTP id 5a478bee46e88-38570f27031mr22687424eec.28.1795753111957;
        Thu, 26 Nov 2026 20:18:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm56941116eec.25.2026.11.26.20.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:18:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 02/15] relayd: Fetch over https
Date: Thu, 26 Nov 2026 20:18:14 -0800
Message-ID: <20261127041827.1778052-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
References: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133290
Content-Type: text/plain; charset="utf-8"

git.openwrt.org no longer accepts git:// connections.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-connectivity/relayd/relayd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
index 64ea4e798a..fadc12ea4c 100644
--- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
+++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://main.c;endline=17;md5=86aad799085683e0a2e1c2684a20bab
 
 DEPENDS = "libubox"
 
-SRC_URI = "git://git.openwrt.org/project/relayd.git;branch=master"
+SRC_URI = "git://git.openwrt.org/project/relayd.git;protocol=https;branch=master"
 
 SRCREV = "f646ba40489371e69f624f2dee2fc4e19ceec00e"
 PV = "0.0.1+git"
