Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48028.1795411843980778015
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sZxAPsxh;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so8806223eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411843; x=1796016643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Dn/JsrIGCM0jntHlMoj8CbNN0BvIaqGLY0wMos0Vb4=;
        b=sZxAPsxhC46Hs2Sh/BEIdxtBwvPiwbJEN90iR3hYKVDk7owyoHTzL35we6xq9VUaMn
         tjaVntC87KdP9UBkvDh15DuoRZC5bHyV5FlQsGdPkAlprSUdGCugg1bbhdby5rVZY8iy
         EN7+ihsvqV5Xfn58ayu94oNVXyPGT3vxkLICxcVkeet1757sF4lQcp+foihudEK/cEGK
         1qJ4auI40q6kngm0XTNQi1acoAGB4u/MHQmtYR1M0Y8KGh9immrjoIJAocZOg1kwuI1J
         1v5+ZexY6LHPP7QNXy5z/ijdnIRMvhYcfqMF34RERAqXCsNi+WngMKChPtBLzQNF08l8
         PYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411843; x=1796016643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Dn/JsrIGCM0jntHlMoj8CbNN0BvIaqGLY0wMos0Vb4=;
        b=DE4GoyNo4rigKld5f4mch5iiGvBDfsHgjvVtH6FmdBvLYvc4HwcpKy/cIyPYl1KRiH
         sYrfB3U8t8iFs7ozBcBxt6ynV+qcpYrg3BXK5Z9asU/de6ilo/EZvx3ssq4qC0tvH+Az
         C3JbaSjKPBaq8tMTNhTP1axGtUcvWHHYUfxYw7+MyUEzMW6ZRIyHdSPxLXIX/WCEmkHB
         eB7O4wEkV1b9bhVIqfHr4Fvmc2yjqT+xGodK9kb9PBrTZbScdaGgpuUCFBEF7VvFaQLO
         m10ofg2Cid9cHjtT5wNy7l0QikhggyfVmsRVVZKB+O19oXsCtugf2yS8Qnix8UvULLRw
         BbfA==
X-Gm-Message-State: APuU4Z+/zMVDa9xgDDumPkYeQ+rzH3gYG+8lNl7ZTI+5W1bioqKc0/hd
	YUB9bXUyOlMd+3wI42nQVBkGNf3WCgNS9qbX0CsEYcrYENMyTizsXggFcrWxl/YkkDM=
X-Gm-Gg: AZFdTZcPDIUDFmUZUbz3JczoNwmGByy3v1ajLoDeuABe7OziDnRGeR2I+iZgLAUKOYQ
	rEHZYedNAm1Kpi38ycdRD5otSVxF5YPUgHON8XBWZNR3hMZ/dystEB9EZzQAVq+wKXjQ0AbQ1Vu
	A27m1qLXrLVh3GHx2YjZYyBEv3itfeocm1//75PVducGQmLbWqFH134E1hf95cPJuUYzBVp+z7c
	TRQK8cKs9mrxd/Insz8y+A1IK0UK/Hpeua2asqoOtkC+q9NtQPOUuoK4gQcra4N0C70deyPqOyN
	zX95IK2xyn2vqRF9q1fceW3Y27QaTuD2Xv29P+SbIIOxj3tXbiDzBzUgc9UzXnD/SjLZgjWUWwn
	IxyhVntd1B1t8UYcCWwMZxxV/NFllTnAfE4F8hp0AFzXD9iwLLazDy+pjdnge3nXgULGBs1heXF
	R5uUYi5Twqx8wJYDbOjBlTxDKNsUFWvp5MKFrcZv8KjAy8trwzN+m+bGKAMWsf1L+XERVH0NNCV
	RzsKET98dNk6jKbGfyr8iBpeRd7/4qL+bz9HTex/V6Z9vMMveJLj8ZLkpkGV3yTNSfsCKf4F4De
	GGoFkDnVyEk0LTCT+c2MCLPOYbwvkwK4Uta/cRq0evlZA737BpXPnER6HEK1Xrd4htRrc8ZGRyM
	W+kVuOOad1UI5Q91OVcBKV1HeExrNW801bOI1hRqSnAoyZCGCQLvMBsQWQLYKvPzMIapv2qc/Na
	OMLmvezBARiVRZj9ZmnsGrG+xfGjFregtI2c5X7LxakXNyXHuI5FtXjuul80Lqv1ANmnf0WzBAT
	37qHOn/c/+LVYB7Nu9lQPfRmUwVky7OXNfRnwzLaZOugOQb7Dkf0nviuGfjHw13WNVBLUMMhlC6
	cpQT
X-Received: by 2002:a05:7300:b597:b0:386:9e36:df0a with SMTP id 5a478bee46e88-3869e36e011mr10032548eec.13.1795411843352;
        Sun, 22 Nov 2026 21:30:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 10/42] exiftool: upgrade 13.63 -> 13.64
Date: Sun, 22 Nov 2026 21:28:54 -0800
Message-ID: <20261123052953.3658549-38-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132825
Content-Type: text/plain; charset="utf-8"

Decode more Nikon, Canon, 70Mai and JXL Orientation tags, handle the
improperly written Insta360 X6 MP4 metadata, and fix reading some
M2TS videos and several IPTCDigest/PhotoshopSettings bugs when writing
TIFF-format files.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../perl/{exiftool_13.63.bb => exiftool_13.64.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_13.63.bb => exiftool_13.64.bb} (94%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_13.63.bb b/meta-oe/recipes-devtools/perl/exiftool_13.64.bb
similarity index 94%
rename from meta-oe/recipes-devtools/perl/exiftool_13.63.bb
rename to meta-oe/recipes-devtools/perl/exiftool_13.64.bb
index 8372a5f153..c2096075c9 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_13.63.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_13.64.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "1da714924f67763b6a8a7013dd2aa1983a16f87b"
+SRCREV = "3d7a0538324e9b04aa8930201b007009491321d2"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master;tag=${PV}"
 
 RDEPENDS:${PN} = " \
