Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2193CCA471
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:35 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.52847.1759151073687420776
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f/uaKj89;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-636255b92c9so3531532a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151072; x=1759755872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOaCRcsLpc1uSQHoNqsn7Q5XMKQ+15+m/k0xF7ICgvU=;
        b=f/uaKj89A6S4RdasFi28srudQ1O1x9SafcK0a/LrKPLUI0HAbNOEpgba0x9MTwVbt9
         lg0OIKiBCHnhVnbuu6ITiiGGxL5tflSB5DNWOmvRl9NVxgpe/cmKcj3buaVvWIYQArWu
         QreiDdf2cpBL7FA44OU3JwlFshzhHxrK8ikOM1pX65hcVONA5YyrLGcnN5UM+0zr6Ou3
         YCvp3csC1zGpF+61UQwHRCTLMn2xshYhHBCRik+qVtmG11j9k20ZUx1b7TynJvyqxhav
         ROdT1hBeyc9kwRS1wEWPGzEEBCmtO4udIpdEVhya/yu/U7W6zkzTRGuoydUsLcVDgH18
         4zqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151072; x=1759755872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOaCRcsLpc1uSQHoNqsn7Q5XMKQ+15+m/k0xF7ICgvU=;
        b=iSmgxlPKy2RnHkf/W1Af7vfNa04JEhCUvAhKUWFJlWnAWe96me6iFwIAJmk5T5z7di
         uoxmXmgJHQIYoug7lqke4T2pi1egnDJxEDLFtdEGvmg6SAkw7ZYyrP5Q0ZuUkbzXAela
         SdhasUoCemqS3lTVF7lIVpVM49Jcd3svtcWV63wf1619z/HxqA79Z1yb4WbivEdhnCNk
         6R5KBmbECZoM1xVRJVe3xpObMQ19jA5VzcCe7iMqWUXvWxwK7aNquvkHdEHyqig9n5vs
         zIaES1s+jrO6ErDvl9RjfxNoeo8egD41ZKSCXpmwb+EYFE08E8hygXyTeYKF1NcC2+7+
         Micg==
X-Gm-Message-State: AOJu0Yy5pDwUql96ljm48peLqc4XY471MiDe+bupsKJTZwlVl1UrOXEs
	x+wHjuV2m/5XpPXzby64Rxrtai5KxpOxhc7i3Rwyw4PUxPJlhYzK3xcTSuUx7w==
X-Gm-Gg: ASbGncuccP5mNbG2pY42Ik2W1IgeX5MXvYKlN/dmh7x1ilfC9BqIGuHQcZPyr1wpH8z
	lIfx6lP3fpvuDDk3aCWs8LRw9CEH6QSm96ZUJGnkR/Nbdzi1EZkOGUfo85pGWlALZ/bhYyDSRcG
	rypUAyAkMl4AB+sfMYVglqk0IZXYqzxM8QHzANl5Cs+0PoiMSIi0dJIRIsdiU8VjMDScy19S6pA
	vqMrLPBgB4ZAwXcRlcXKLtL35wDmN80ThKj2LLkz/EIT9PAYA775ebpBra5Ohi9GebIJ7CP8pEv
	ho9tmROS2lQ6wdMpBbTPRCuI+XWJl6fiLrwdvqqIimS+TsvxvBFwqoYMCKfhFK6PLEDpDOz1R37
	c+I80SaOL45sGUog97GOK
X-Google-Smtp-Source: AGHT+IF1/WhFzf5mUEs04T/GZlx2PCTBMgAvdU1V6QPKG1orsnTwPEEBlREMX0I6cwqf+DAOlZwalw==
X-Received: by 2002:a17:907:3fa4:b0:b0b:20e5:89f6 with SMTP id a640c23a62f3a-b34bf3761e2mr1888753066b.60.1759151071880;
        Mon, 29 Sep 2025 06:04:31 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 05/22] ndisc6: upgrade 1.0.7 -> 1.0.8
Date: Mon, 29 Sep 2025 15:04:08 +0200
Message-ID: <20250929130425.2912077-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120018

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog
============
Fix potential garbage whilst prining an advertised prefix.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3fe7c5fae8576b41dbe546491649e9bdb4ed5096)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/ndisc6/{ndisc6_1.0.7.bb => ndisc6_1.0.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ndisc6/{ndisc6_1.0.7.bb => ndisc6_1.0.8.bb} (98%)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.7.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
similarity index 98%
rename from meta-networking/recipes-support/ndisc6/ndisc6_1.0.7.bb
rename to meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
index a5b9bd08b2..a827e7f42a 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.7.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.remlab.net/ndisc6/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "c308ba5370d66acc44d411f12d59af61d522b91a"
+SRCREV = "92e5d1cf6547fe40316b2a6ca2f7b8195ae0cbe5"
 SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http;branch=master \
            file://0001-autogen-Do-not-symlink-gettext.h-from-build-host.patch \
            "

