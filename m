Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BB7C5DF74
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:01:58 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2323.1787029313129080668
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sbfDNGJ5;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38101f85591so580054a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029312; x=1787634112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XStAAZdEEKGamaExT43zOXrWBwKbSjTrRinw0X1l/c=;
        b=sbfDNGJ54FTwyt0ENbNTIqb4EWfOABDIq8o4F3EfGMdg97MQgIMDz9mMmsCzre/d5s
         9J/DYWucBW58XgxE6ffnGk2OUQXqOWXEdqBhoC9vrGFt7U1Tk7dsaUrbLS9GxRqgiHHn
         sGFMZNkSnsLaWzXsKhZCVpwHRSONKp11I/cXFAf47y0IpJqlizVbuaSCLYJEusnaXDaI
         gJrbCiz+8njVY3BjvXxV2XLSIdzYirZ/ZbNj1YRak/4qdsxGXdbOyygrR0qfIzsijfVX
         5W9dP35x+A/D0f2j9qTvywdO5M/fUiYHr8HI3idh8nCdrae95OqQUrp8nxGT+9xDgZex
         4zTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029312; x=1787634112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5XStAAZdEEKGamaExT43zOXrWBwKbSjTrRinw0X1l/c=;
        b=EvMPQZ3SNeR3iePV/qbkIlqPXRbQ3HDrBR/glTfdgyRajrVYuXVyuRW4D+XNq/2khd
         wRdVI1Gvl/5umHBxu7/PHEZ9ZzJ4jwVm1C5NZZ2obVwy8XOEX+YYunwmoFIgUqystfne
         NZFtVlJ/SYPanCqJK4gg+L2UeoTFZ9hWTUwhtoRatzZsGxJNQS1M2FbThjsB3N6MJUYV
         MfNFajit3sYktecEIAFVt0N7JAp2oCYREW+bjajCZuXE5U+KWiczaZRfi+/GJ8C41qOJ
         guAY6tkfPGB0CVluwOyOrh23QPyW9+fBjH5imcu7O4nZJxuYTOuVBTODC1Da2ZFog226
         YACQ==
X-Gm-Message-State: AOJu0YzpGHz5hcb1P3sCP94vEOFpF2s0pc6AxHhjXimZ40Tk5WuC6eSN
	4Cwfr4MUe8UOw0Gh0sSxdrE0vRKzI8DVEJDT6fbXNQ+knYjHxXTd3wg0+rWsbdR1
X-Gm-Gg: AR+sD10Ined/4ZWOxU1ix8E6XZ9GMkjUVhViERf6G65KvWv2PT5YAaDrFh29vRjLOww
	sSjDd+VDBQ/ItQ2Vl7LzU1YQJHhjB4RPNJT0AddLGolHh1lJ5sheAY44h/jaB69chGRnzBh5Yfw
	2S+4wyK+tMoDU0awng3nTmsejuz9CXXi1V05ZrAoF8ItlCLIf2jPMVCSRKd3kgOK/cKZKaemokR
	gTUWh6dTKsVFjgMU6OCV/hxbVq7wceRFlMzri1H36zwCh0eouGxT5ot5UU9bbb0qMVm1wMuPjXG
	nBoSS6HKLv0D3Dk7P2cmhiWUSPrexgg18ZRpPACNmZheJnSnKprVhlKBR/pum0PWCICI8s0BO55
	hNl5D5IBkeLljwm5OUwibffboibxkAL4nGiHalL+6TawyX7s4SR86JVnx4IeAIzHDvWJHJkfKyU
	CRbqYY0ctb+9hRmeNBTz5Mq8TISNv+npYO3ZNxTruPMLO76fkYQ9TamSC/kLa1bEE/Ng8iMZZcI
	A==
X-Received: by 2002:a17:90b:5404:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-3955f0c0364mr4015880a91.3.1787029312012;
        Mon, 17 Aug 2026 22:01:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:01:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 6/27] onboard: upgrade 1.4.4-1 -> 1.4.4-5
Date: Tue, 18 Aug 2026 17:01:01 +1200
Message-ID: <20260818050123.2901739-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129205

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Update tag in the SRC_URI.
- Also add UPSTREAM_CHECK variables to check for new releases.
Fixes:
$ devtool latest-version onboard
...
INFO: Current version: 1.4.4-1
INFO: Latest version: 1.4.4
INFO: Latest version's commit: 5fa181edca5daf2450a63ca842a913cc0255c030

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../onboard/{onboard_1.4.4-1.bb => onboard_1.4.4-5.bb}      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-support/onboard/{onboard_1.4.4-1.bb => onboard_1.4.4-5.bb} (89%)

diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.4-1.bb b/meta-gnome/recipes-support/onboard/onboard_1.4.4-5.bb
similarity index 89%
rename from meta-gnome/recipes-support/onboard/onboard_1.4.4-1.bb
rename to meta-gnome/recipes-support/onboard/onboard_1.4.4-5.bb
index 14ccf59e27..c30032893b 100644
--- a/meta-gnome/recipes-support/onboard/onboard_1.4.4-1.bb
+++ b/meta-gnome/recipes-support/onboard/onboard_1.4.4-5.bb
@@ -10,10 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL3;md5=8521fa4dd51909b407c5150498d34f4e \
                     file://COPYING.BSD3;md5=f56403ae5b2d6b82ad136d753c05a82e \
                    "
 
-SRC_URI = "git://github.com/onboard-osk/onboard.git;protocol=https;branch=main;tag=${PV} \
+SRC_URI = "git://github.com/onboard-osk/onboard.git;protocol=https;branch=main;tag=v${PV} \
            file://0002-toggle-onboard-hoverclick-use-bin-sh-default-shell-i.patch \
           "
-SRCREV = "02b19e2aee88e4bf2cdc7094813ddd4a6c05d1e7"
+SRCREV = "5fa181edca5daf2450a63ca842a913cc0255c030"
+
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+(-\d+)?)(\^\{\})$"
 
 inherit features_check setuptools3 pkgconfig gtk-icon-cache gsettings mime-xdg
 

