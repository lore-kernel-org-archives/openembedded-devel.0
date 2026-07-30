Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82380C5516F
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 18:03:05 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17843.1785434585151689778
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2026 11:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EDxgqJXX;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d02b4c3601so827755ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 11:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785434584; x=1786039384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3TYEB8quEUgNPbnUDsKarul1pe8moIDUSxGG65M9KY=;
        b=EDxgqJXXFdRFPHr6bBOx47IL1FS02spklg778JttZh6GBKLgWJlej9Ya6KbuMLp1dD
         +DD9juwJOtSXgvWSA9r34GjnbW0G7ziJDsiB6vATM9n15uKnc5GEMXmdFbPxacnCJ420
         4x6KccQbC2E/LXdxTj0i98EzNguKOCEPuFdgajNJty5i3GzM2G26KlzVZ+468aAUUkhd
         66XeKXW9ZuHNTrlfITKyAfFnUHRjpSRUjw6SUGbdW/Aq9adkRDb/b0N8+y/3nDrCnavr
         mfw8tqY1XINQtKX/Eon6AHNvx9fOkOaVLBXiVn1HsLA7GdE1ckMdb4Z4yd7GJhh5dGhS
         UK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434584; x=1786039384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q3TYEB8quEUgNPbnUDsKarul1pe8moIDUSxGG65M9KY=;
        b=le1VxfBdVvZ9rjZszHC7LgVdNAGM36/dxsstnYNilMelKnGgZIl3SO9hYsUd/QrZMK
         NugCCfhJZbadqCyhoKG6IGbE1YuMYhvXnDjS9cTF3CgH0rsPVKC9znOSMGCOL67YB4Jc
         qU31W2AIiqe06tu6c7ZnZ/KgeeFkhYYBLkf1Xm6cm7hVNRYlAUmoX4MOalzGFIMBzALM
         sEe0fp4urML0R5lSCzEM6aYnYgnmfHeIcFqsPyEv9AxBsuweuecawAGs6XvxtT/LJGkh
         GT2Lgs+JpWC35g7QxCOCuFKyrMJ10hBo6EqqQRBA+WAzzsc5sqMPaPdXe5aWwHLh3Kdu
         3sAg==
X-Gm-Message-State: AOJu0Yz9TWcteZwMJIGw7plIqRJ7wV8i1DZ4J5T8JwjJ1keoAJXQwCvs
	fhXUsWhw99opHUx7pAQCOS9ZCX2R6KfASzGV/MDtQEQQv0Diazbbn+k5dDyjzViG
X-Gm-Gg: AR+sD13A+1E0k7QQ7hJAPi0qIyGSrRZbz04Ud1fiOFxEPoIg9Q/PCgX47V+J9eOvuOe
	9Lq+GtVDSELahoCQ9FHYB5Dss6laBnajZW7jbtrOkYbbkbt9WVs320qNuPxfvdhfO6BLhG+zjGM
	5ON2XfZIjY037R3VOdMFpqszFj5IJQAh9VV9a/s/wSnKkopNy6MVVVpQrU4CKrAKpI5sn/4Fi1X
	GeU5Fc2TJfdKPla7ijoMgufnV6+OEFEK51j9GYRJNJXDG1gSoE8dYsnsIHiuzeNktoFi/yguQ16
	9wyXpehTQfXIlQRO6sWyDnR2XhOKHeaFlCld7lqtcGLw1y08i9wwJldGGCrHtxQmZozK/WW4+DY
	ETw9k8hXsS0mAY4D5vn9rVUoWVgtE5ICvPAsaioGNsoQi9lS29IL+0bES71t0xPHouhzYNgCcr3
	NJnPoGJi+beyxv2indCGrRDEICF31EPoPClsEiYFlh2euLsoeJZe6pQcaLCTH03tzS7Z7/yHI25
	35SJCE4c5IFM4G8RBZPCsYgVqXVZWKtAMeoH9aLFKcUrkJGI5ML5AFnDphyQw9vsX7aT9Ltwm/i
	xG1vKKhGD6gwnNxqWI7XghaM1vqxOcKTHtlhPDB/vJoLjmg53EyvBF5PSIPvPGsxclTGdtkAWn0
	1ceKN6E1gib4R
X-Received: by 2002:a17:90b:5403:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-38f9bdaf18cmr3159795a91.14.1785434584217;
        Thu, 30 Jul 2026 11:03:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265010esm24015408c88.6.2026.07.30.11.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 11:03:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 4/4] apache-websocket: update to latest master (0ee34c7 -> 18ad4ae)
Date: Thu, 30 Jul 2026 11:02:56 -0700
Message-ID: <20260730180257.3733387-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730180257.3733387-1-khem.raj@oss.qualcomm.com>
References: <20260730180257.3733387-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 18:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128576

Advance the pinned SRCREV to the current tip of jchampio's master. The
latest tagged release is still 0.1.2 (already reflected in PV), and the
23 new commits are entirely test-infrastructure work: porting the test
suite from Python 2 to Python 3/asyncio/websockets and adding coverage
for the module APIs. None of them touch the module sources that get
built and installed, so the shipped mod_websocket.so is functionally
unchanged; this simply keeps the git-tracking recipe on the current tip.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
index b93fa2d186..533d3e3969 100644
--- a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
+++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} += "apache2"
 # fork contains patches from the modules ML and fixes CVE compliance issues
 SRC_URI = "git://github.com/jchampio/apache-websocket.git;branch=master;protocol=https"
 
-SRCREV = "0ee34c77fc78ff08fd548706300b80a7bc7874e4"
+SRCREV = "18ad4ae2fc99381b8d75785f492a479f789b322b"
 
 PV = "0.1.2+git"
 

