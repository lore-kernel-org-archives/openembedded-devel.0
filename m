Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8071.1795739699997944749
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Sq1gYnvi;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386ab9ab619so10130848eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739699; x=1796344499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxS40ZI19DsXlus8wBPrSivVNpLY/e3CTsHHQKVAYsk=;
        b=Sq1gYnvi5JOo+WGmaPhhmAq+qcN2bcvRVn2fftMRGgQtdOBO9W2WOODP1YHxMjiO7H
         SR3Gpcm9JzroSukSw15uE07WwsWgKE3GPjPVNwhAckT8RXDc2zNS9C1v2cEIm6pSodfp
         LpsJ3BUPx3mzapvSbF+IYME8xMdiZk0cZYsVPWiAwsnR8N48gA38GJgZejllJHB5Klk7
         5oXv4zjtdm+J8JTZuipG9+I4UpUpdtOeG/4ToahJI+eMiTf5fQviGp+cWKkJ5SQVHrpR
         ZV4m8dKEwiERckiyUX27TUfERGLUQ1ReoKzvqTIsXylZphoBhcNgkW5mcrxnydgdxALR
         AORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739699; x=1796344499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yxS40ZI19DsXlus8wBPrSivVNpLY/e3CTsHHQKVAYsk=;
        b=bIKyVC8w+gwRSyjSkyGY6JBTp4ZTLG8fZNx9eGzWA9JDqV+fthb9A4gWX8uRK1raf/
         /DZG/65Geb27HoPQEbLed2efCPQq14A7dugMckG3/PkNMMBfpZOkPwC2rqJy63xLAu5k
         qAKbX2c3VrjnMjVfM1a084XCoThysP4TqVOzuFp+8vAjbdrQVhCkDh+PZnE4EWmIw+41
         CyBQ2t0HqJXaikCgmyCXJRLhiAssOIWCPrJry3X+ZHnitVus2EYaBktvLDLiXv/ngfpN
         yi5AUSIMPtyR2dMecxw6teZqzEhR/bj3ijddDgkTSP9igrSJM1TH7B2gX3t0xpgV4A0a
         AAqg==
X-Gm-Message-State: APuU4Z8fJVHL6v0SF9fCMgdh3uVRg1tzzqaJgYDnIwCOQ1TwYJ9u+fyq
	VxJYHqs5oTqa8s0lcm/UQWH8UulQHUsreyEuGrVLmn8HnWqPh3UaQT1SEOM/aaCM
X-Gm-Gg: AZFdTZeybYY1VTjDeWKvA2uLfVitWFNl4MXn9A/3cUwdUsp/1xCrTTR83BhvBFj2hq1
	uM0KGtmJEYpvxQB+J2pb5+IN3RmE/v5ibUT+wIIvIOyB7kYpNxu0oOy9uSL6YPducXVIyhzs1rJ
	ShZq0EJByhKzw5yLffdwRZ2muUprEUKVzHECb5gT4rDwk0g4fIlWi/uU3C9Lc8o/ms8FRaSKeg2
	/+nT+WSRgoS8m/t5PYlNgsiE81Sj5Ipq6LGZdbi5lNyUhKTFv7meBMW6LgkCcU2DHSARqC65dhy
	vDMbldKpHYYDLBZnY6bShmMBycCey5TBTVT/qD/ykoJvlrEwSAxYRu0/EkBJMcOUC2kgAh4LYV0
	eAlZ7+aVzDl0LDTZgU5YBnSFnkQLU+2I5m7fhFoNhO3LuJ+AbNbphWwQtl5B1WV03L85X1l4R4s
	nh2zAKyZyHqxbgHiNXEOAPOllEEn15VzIxlFSAd2FC3h6B0IEokHK0cbDtviHVUWRO4hrqAW6bH
	/Ad72hOUbpwYXQ0zyccsm0PZ5ERrZAfxEOQEyw+nZwMFrnU2oF0GMHF7OLv4jPqj+deTIrnTEy+
	/XO8riPfEX5R+MVxVRZoGU2rkR5N29J+iRdzzUL/uFWulYQqhEHb0F1AxsIwzzGrojwS37SquQo
	GitYitc7D5xiL7556oJzRprK39Fj7FoUl0TB3KhIzHIpu1SPGCfisSOyHBtci4w6FXRHjNNOEgA
	hH44TaSmttng4EdtRPpL7/wjMlsDlRsDmfu1wvBY62b7oOdVoHwYaVlHgvKxGJ7rkwoW1V4y7fR
	GFZsKTUKIbYw56LCKpbUm0DmzOV4qowvbNopjLq7eFm2ovlilSVVNHjHvGjy1M68n2577S7ehs4
	P+Xe
X-Received: by 2002:a05:7301:78d:b0:385:bc4e:dbbf with SMTP id 5a478bee46e88-385bc4ee6c2mr21017504eec.37.1795739699286;
        Thu, 26 Nov 2026 16:34:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 28/69] gtkmm4: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:44 -0800
Message-ID: <20261127003425.2166632-29-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133128
Content-Type: text/plain; charset="utf-8"

The check reported the 4.25.0 development release. gtkmm uses odd
minor versions for development, so inherit upstream-version-is-even.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-gnome/gtk+/gtkmm4_4.24.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.24.0.bb b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.24.0.bb
index 35f0361997..4e98338c1d 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.24.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.24.0.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0-native pangomm-2.48 glibmm gtk4 cairomm-1.16 gdk-pixbuf-nati
 
 GNOMEBN = "gtkmm"
 
-inherit gnomebase features_check
+inherit gnomebase features_check upstream-version-is-even
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
