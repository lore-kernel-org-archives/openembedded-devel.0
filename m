Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11784.1795762939235299245
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mjCHFAut;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-170135e43c7so12064833c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762939; x=1796367739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsCk6vJfC2k3mnOv1yHmYGakUBsT20xpZ7XjNOqFwG0=;
        b=mjCHFAutYp2MC1vsUY5amgkIIkwxn2AN+qNWKoMC0OnMSLrOf7SQy10grDXKQXNaRm
         5LKWLDF6Y/B/Nz+Emu1zIc+iir388wy7FNQAEbvlcgC1o0APjvs9U//f5AGcm+wMB5Ny
         Xk724dBB2rRqKGEvevAP4t+IhNlH+II4CKu3Vd0cobNRVakELr/kJED1gO7SiHVbX35x
         9CcvC5UA0joN6nHzZjjZSxxcz2HyH2a5o03Mukv9MJMr/arcx4a5ZLGDgYrRGrZZwWhB
         mn7ESR93Pip9I8zGD0XVaj87S62LgcnbqVMZlddJ0O9XtcW8KDIT/6MjFKx+tV6gYvk3
         vLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762939; x=1796367739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsCk6vJfC2k3mnOv1yHmYGakUBsT20xpZ7XjNOqFwG0=;
        b=qJmwfE7kf3k9abG7VNnVssxj0FMIIOWmmZvDhk+czPedTzGiVnQAmIN3okj9w2FMft
         BPkgATY9iUz8z//UHYts/lfAq6CbTYmdASklsDKMUGAatqjHOfi8TvG49pOfSdBgNARx
         F3C8eEDxiCwyYbcj6ahS61YVoiT3Rg2Y7ZFPAfE7vbf7Dtv7YwVY0DZ68sDrlsLPHAVC
         aGGO/xbZgVf6QVZ/4eaL/8jG1Ug/G0GV90Z8jVq7Fk2B2VDl0of6dN2k48fe+pTJIi8+
         IuN34FuA8EUP4k/935+jJB5XRiKPMzmlwD0zZog9B9rz1PPMXV7Lb9YJfvcWCXTsRosU
         2i+A==
X-Gm-Message-State: APuU4Z/xw9F75Yqq8IcB4U3vllIiqUcCFSrkw6EmuwZes/NK99e4RclY
	aUa1Gtxx2h5b5+Z+8dKCeynhwdaAOC65mHEuFTkQzXyxO47HqqImAcEKRYou4DxT
X-Gm-Gg: AZFdTZegDmHLNXaUl7CK4yOWXyjq34FzMNbtv7VLVqCTzSALN3Ul2+Z9a7kwzqVJEyE
	pAGKQu26Vjto7oUk/JLmlA2NziGUpa2Yf1WIzanqawQo1joXZ4VNnevvLEXgxcgE0W+2G0k4aQ/
	U8WOBnO5oIiKqXetVo2ku5uwbfHFDGnxU/P80D+13v4EDyS1PPj0XySdPoWoCKeNXtOHmi0usrp
	7NtTJ1+EqIyFiC4DDjrqULlIySYasG8cRpMhyNbvdmQuwHBDY69k/e1Cl0MSOlvZNisYFbKM815
	Ykt7GQhc7zDZe0pMM3yvYoXuB+k4HgcIN+AP2ALKW6qivLm70YXG2hZmg7V3OrLrx6fTU38Jbwh
	SV0U2mstc7Jqa39Km2b2NAQPuFDwiRKNE0ibN2WGIRSQM7wSS5TtgOmuojb4BiTR9Uc7X5fI+S/
	t/UHgAFwLnMeSYFCmrudwZBDuvN/dxrTZZHp+Mzrb0gOldSttV4NO5ntudCXymooyY32j6nxXQw
	iVuSPvhhCPI5Xhsncus1eAJyN3Lc+Ez22UE1V5netp6D3wozgS2QCH0DBe1gfr41TDXWIiLhwfM
	vDQFYxJiWUANCIf8tz/D9UyW2qFHwMJuTD47J/Yp0CetymiW4ek38kJCuUzp+NUvFMtnwWQ5+Sd
	84tsJq5NERV9nq71COdnrGCWYE5Ir8soGbA3heE56Oidst54vXZhoArMlxw+qf47CXnVoQO5WCM
	dAycKzQq1PDyp3QZxudBnK+4w4Vq3pfm0Mchgr62wAb/EPq8YV4Ji1Cc0Kvb1uJ2rBjcBxTkT3s
	YhvWdJkndrA0Ij0IDu7k+FQKmr2cEWA21+s1LUOaYFJj5ChqrWaBYM5vNcb83Dvw0ALB9SvUutz
	wwk+
X-Received: by 2002:a05:701a:ccc8:20b0:196:e254:db24 with SMTP id a92af1059eb24-1b5568d32bdmr23684125c88.21.1795762938379;
        Thu, 26 Nov 2026 23:02:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 03/21] gnome-terminal: Fix upstream version check
Date: Thu, 26 Nov 2026 23:01:51 -0800
Message-ID: <20261127070211.2329979-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133330
Content-Type: text/plain; charset="utf-8"

The default tag regex picked up 3.97.0, an odd-numbered development
tag. Match only tags with an even minor version.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-gnome/gnome-terminal/gnome-terminal_3.60.0.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.60.0.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.60.0.bb
index 33cafe6184..ddab751acf 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.60.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.60.0.bb
@@ -25,6 +25,8 @@ SRC_URI = " \
 "
 SRCREV = "5d1d01d8bad69d33b0048f7791ebb6b0c7fb9f21"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+\.\d*[02468](\.\d+)+)$"
+
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[nautilus] = "-Dnautilus_extension=true,-Dnautilus_extension=false,nautilus,nautilus"
 PACKAGECONFIG[search_provider] = "-Dsearch_provider=true,-Dsearch_provider=false,gnome-shell"
