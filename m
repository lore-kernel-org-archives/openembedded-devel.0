Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36313CA600C
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:19 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31568.1768811293707388862
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UNZDbpT+;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29f0f875bc5so27840635ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811293; x=1769416093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcXx3ic/QCkYpTT0hvX4645Tahdlvg4mgVr+SKVHr3Q=;
        b=UNZDbpT+hgdY139J6Wkq3eSJGSdytXOEhOXKzka/Qly1VhJYb1xjAERbUVvna0p+eV
         dv1Of975LdQBmXV7K9ZMmqDPpZdzuOrZ6kpNadE4Wj6umHaTlFsAJoFbTiLMPeKs8K0/
         ObjZ/CpIznBmwF7oaSzdIXGAfD0fPQjpRDr21yf4h1l3Hc25jvhkrdLOWSGxrfGga82J
         KF/AIvVXsJEZXnqyPXOxmwVd+IzNujv3s9PQO2Hd8JBI+GTMzPuYd5/l/zHzDmmN6SLT
         ZwAH/ZlZYh7fKGZPMngFp3HxH8lFUajQwcBSrb4sofo8Swbv+LmCmDLH1Th8aSjT67gf
         RWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811293; x=1769416093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rcXx3ic/QCkYpTT0hvX4645Tahdlvg4mgVr+SKVHr3Q=;
        b=Hu+z8FdEM0SzsHzb9EXsMNzDOyy5b/i477w1oi5btHfD/WK1Uzhx0yXkMZ+nNngEB/
         iFeXqI0asBnoNpI0fU8Pw0JqPYOJYw4ePJpLQggvY3QxLGqVD3gYUlyqZDE3uVgwNWNx
         rr+mQMMWLJ+osrmZalM2RYcjmrOfqoL9B9gCRTSriSP0Z90i0tkz0JX6u7rmkIePr3gN
         MT+BygermLk98Ab6dozkasSO2AsrO1e4okd7DkExr6z1fjtXBxvRpx7Sg/xNboQLb1Nh
         MFFbBMHf+yyp839GpCBwCyq+pC5b29Xc+2xhoFibiD3baDk7YIHAbZxafqcU3xFAV58L
         bwEw==
X-Gm-Message-State: AOJu0Yya+EUOGTYrJCKuYMb3/pYKjzdhJyQ/YGXGxTfZ0rS37hxM3kwL
	Jm9xftRAO/I2ndN2JLnpmjrHxlGDeWkTgJ7xuNKcl3WXRNb2Gb0n9zkF9nXHMg==
X-Gm-Gg: AZuq6aLFJCuzJvqZ+mIjRWwqUrBRO3Xpv0Wi/Q3Vr9Xfw1ye8J/bjXimfttLFCwA4jj
	OnsLCDeXKA1pfs+3I2wfT2Bvhsv/YJyN1BiqAzUgxNSLGL/lyoCTMpk2dSjMVtmHfT/UyYyFf9D
	1xumHr1EfmUeySm15l2SJQGJiQXQb+QVOL922dZPC3qSowXeu0NSp+TeAduowPdAjLkVZFXuAIf
	g0OZCzALgS6wvDUR0yRkTWKWwsf6Ox5RdHGduLJmqz6DakOJ103oxZd+O5PzxDkVZFxm2Gy0pmB
	09PJmmpDZJyfbTCY/Ue8xFPiIOOUV1IsgZgzU//zHMCVjwQYaxapkJ2fDhPkxfIoei6QRLYtgQ4
	/QZy9+yhA2Y8c0ze9EgrYdSjacEmx8jeYnQPlVSOstZgInq4lel9WMaRs61St3J/Xvu3b4/N5DP
	LDDuD7KO3vWYbtv3pTXi3Osrw=
X-Received: by 2002:a17:903:1a06:b0:293:e12:1bec with SMTP id d9443c01a7336-2a717539486mr96432105ad.20.1768811292848;
        Mon, 19 Jan 2026 00:28:12 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:12 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 05/28] usb-modeswitch-data: upgrade 20191128 -> 20251207
Date: Mon, 19 Jan 2026 21:27:27 +1300
Message-ID: <20260119082752.4120991-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123599

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8f2c436db5b4e6ba59550ad63f73a61dd459ba45)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...eswitch-data_20191128.bb => usb-modeswitch-data_20251207.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20191128.bb => usb-modeswitch-data_20251207.bb} (84%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20251207.bb
similarity index 84%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20251207.bb
index 2dfcd886ca..3bced56f44 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20251207.bb
@@ -7,7 +7,7 @@ inherit allarch
 DEPENDS += "tcl-native"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "3f039b60791c21c7cb15c7986cac89650f076dc274798fa242231b910785eaf9"
+SRC_URI[sha256sum] = "0bb12d64aee5e467c31af61a53fb828ff7aa59c54a82ca85eeede4c5690bfa66"
 
 do_install() {
     oe_runmake install DESTDIR=${D} RULESDIR=${D}/${nonarch_base_libdir}/udev/rules.d

