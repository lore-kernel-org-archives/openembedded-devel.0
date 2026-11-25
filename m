Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37973.1795594150794142156
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:09:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=n/8z1POr;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-385d8a00598so8058721eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594150; x=1796198950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8qKzQvXgEo+bbs+uOt4zzXvbZ8NY0jxQABybFpuxB0=;
        b=n/8z1POrU3R1JzZUVr2l3ObeFJus+AawfSLBsqckyVzcOeo/lC5BZa/qfJ7U/A2Dph
         8/nAQGIeGHpPNE3xGsBweBS2ppp8PhJHIgV+cWJ/ZL7CHshNJApVWjuaGEFG4tdXPQb2
         U3sH9/80GSwcCtbmBaISFV671F25So5FkSSpQwAnaAs8P3IdB1dcAKfMbBpWuaSXUeEO
         oM1krvjRKND9SUZwejAtJgcjk4TOcorSgURy1zNEAtkCwCEOKJL8/IRxnBdXoSCR7EY5
         j4y3csBGmB64URINCne1fJuIcqRlyhJRSGU/hO+xxaZtxBbXFuis8UfBs78nfsdfNMZm
         sheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594150; x=1796198950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8qKzQvXgEo+bbs+uOt4zzXvbZ8NY0jxQABybFpuxB0=;
        b=ZyDtRoy8HupEwTV0xtRG8ekT9uN1yEPU7E4Cdvr/DlyYrYR/Mbp8rLrzoWrYLpGoue
         S2fi94a+N6FH1DzDRXtix9fT788v1rNlL+hOx0BLPSWBNAxDdMrZ6UnFiQu8DrutR4wp
         OIt4JDstHOmIe4zKxQ3gvM1b2XZm4HUkXGB6QU1HtcVvkXvK8jAGJ2UjZGn+mIPTGbZc
         9cN+CObmCYcuV82v0xxzihBxK5+LWL2K3z43OWZ2F1AZtOUDcMIpYc/yrO1x65F8ZstM
         x8iW++gKcFmTlX/ciX2K0Jymnj/x+xk8m9IZOCNxFtqH5oWzgmJ3IoYB5k2YWLnT6FzN
         I7Rw==
X-Gm-Message-State: APuU4Z80olac+TWYw1oKRCXjKfmWbtL2mlX5LpyfdzRP2pL0QYNnOoYh
	Cg6S9roDGkT5XfjGDEGphBTiLsRelW8oif4xjm5KOqpiN3BVwPs/Q6FV+hX0XL/H
X-Gm-Gg: AZFdTZfU90xcM6xf7Htde02uRuqIJVwR70Zi5tlW2tQEtIGb4vqeCKi3GxUxVlL/vfz
	Dh00sTLZykZ7AS+TNi/h8giKbaUNKFwPLkhb5Nvxst4bHZ7oCB1FCcXthcsNV1tUf71K4Y4+kAk
	RPLjvuQpW9Rv+Gdw6QLklgkFK1nTIgua2UL895JYdSPTnQclZBv8SIl9aLAOd1OzFOUnRPcaAtW
	dy0YVc2LCGcWpsQNnc/u5aYs/GocZmBk3UDw+ksGLotglSrk7z//ECdJLn6v/ZfyW21ggdL/4qm
	GD1OzCoQsp8BA0hvN0Cm9Ls3rLxGARZRng7JEQDg8gxQL2vGYSAh5/GR3AS7cDQfTiuClN/5oBJ
	aDwDRxnH3vOP0jS1EW32QRx61maXvhPFTkVk5XJ/cJyjSUa2Q39/EFhQIoTV1uFRWA3nAKohLHZ
	oWVQiZXhJvJZ6JHm1NebuBYZwsN0hMekk6dZBROVkjz0FVDtz/83wBXXLp9Vu8P4YhfAhG/cNtF
	yJUuOBEraDyt+bgYauKo0mZrGI4N3R+twmfXBRzA7KTc5W4sUNa84bXdHe2Aa77X+tu46pqQccb
	NiEUPjuB22IztCx3Zl4dmKdyjS5x5KJP/D+C1qBebF7UaPzDq4Loqj/r6C63+c/Wi9G0zQ9oPNu
	GXGIPVEB+xnU5ZwROBNdrurINRamEH2Ajd2cNUxMYlQdCFSUYxssl2fago2hBncFQVPi/gl+J8j
	rWuC/ru+9FI4bqRFb04X6WKaeHd+qp19kRU48uP87RSPtmcD0JN8H51EIyq6OtaKWrBGil95+QO
	36jJsu4NGYeuWBqW6d1dtrx801m/TzhYXH2EYBO4G38wSYjgOsRU5t8HFTaxWh5uJCT/3PBqW6v
	THUW
X-Received: by 2002:a05:693c:8843:b0:386:b429:fe0 with SMTP id 5a478bee46e88-386b429175cmr7315681eec.16.1795594150185;
        Wed, 25 Nov 2026 00:09:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:09:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH] webmin: Fix upstream version check
Date: Wed, 25 Nov 2026 00:07:26 -0800
Message-ID: <20261125080732.2419614-76-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133073
Content-Type: text/plain; charset="utf-8"

www.webmin.com/download.html no longer links the release tarballs, so
the check finds nothing. SRC_URI fetches from SourceForge; check the
webmin release directories there instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-webserver/recipes-webadmin/webmin/webmin_2.670.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.670.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.670.bb
index 79b20bfe74..c6647c310f 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.670.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.670.bb
@@ -19,8 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://webmin.service \
             "
 SRC_URI[sha256sum] = "617af07a890bea18a83dca5c9d7168de1ad4d5f3076d8a1df3475f123748dc21"
-UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
-UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/webadmin/files/webmin/"
+UPSTREAM_CHECK_REGEX = "webmin/(?P<pver>\d+(\.\d+)+)/"
 
 inherit perlnative update-rc.d systemd
 
