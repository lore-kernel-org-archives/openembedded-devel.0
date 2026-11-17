Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.728.1794955427774810019
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 14:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DzKhE8GJ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so2665825e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 14:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794955426; x=1795560226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRlm5DSDHc2GDay9VA4eOG9qBWjh4rU3I6Xo9pTcpQ8=;
        b=DzKhE8GJPOU0JMP+duP59iwhp9ildZZ96AxvfxJf4AZ+fGgdnP/bLJ+NFPPR3cdSr2
         flnOX8pAL9RyZTJM6WJAtkvVMeug8+BNu8iv++2Nb2EiFyugEQp5Kfu/V5ncpcLp0lPs
         f9GmMRbyMYryjWqf/YQnqLjnkP8jleLtYed4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955426; x=1795560226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mRlm5DSDHc2GDay9VA4eOG9qBWjh4rU3I6Xo9pTcpQ8=;
        b=L5CpRD/5vfnkMGUIkrsIHAVSSV4KtjRkC9dy7GiesjhljI6wSoopAvwqhBJj5TeM9u
         7Ydvzx3jBN6O5Kv8y2JCFJ+dfCeOD+x9kX/f5EV5HTONaAfX2MJKPzVUJobGxfcJY2Ak
         wp3Uv9gapYaS+U0Flfqg//tHqW7fUCMc0zXqbT4dp8044oXnxHnHlrgxGIoUD3fp2Dak
         QZ9u4/MfQse3faVcar1VD0A6JFMK3EEgLV+DswCBQMx/1Dkq1k51HGNBZRVRR7iRPMwH
         ElDinoJ17ztnQlBe+MEC31n7OpvVjtqtDot0/5V0GlquXTZ02gyAUylSJmdACp0M3g26
         y0zw==
X-Gm-Message-State: APuU4Z/YHWBUxkme8Nwrp2ThLiktx5UFzespRcJtAFbbECrLAv7jZcHm
	qafU9Pj5stS/k45PkCZ7QLCsSCk4vuE7h0DHgtnzeUKgCqOn7mANRlBSUGtcfOvMFNRRX1lydoq
	C+InP
X-Gm-Gg: AYBFou2vmjXAi7txxePuP3zGCgGAPUrJsCYysweVOXnlG9Azv/3w7LpRyJVdQMx3oJw
	AwiqLmAImvibunNkp9uwaRhqGjx+Jb5aOWEL4qRMPC6wpaOGY5yB3CPgQaVlnVMOzoKamDAjtSv
	1lLfTjel7Rfqrz9IJ0YzUFk3WyWbjgWE0FhzFDl0WzwSQsikr1olPMMQYlItSa4JrVSsM8Rm7sS
	ooMGGP/zU7hoU8RDIQ9jmP0sNkPFFB5OoDeVKqxgXZwLiU9lwYRnmQRsqb2Bn6AfZSlg2zm2ylY
	ertXWU9zeUzfF3wPZmvAa3FnI8VmR/hk/FkfK2Rq17U3e2Y9ETJ+o45Z71lOUvun47fmsaQAJ0g
	OWHG7EoyfRjCxI4denClxuLJqAdyE7nXcFHn8fTcAAXCjBeVjBBCJi20UuKhlLmp7GwxYodj018
	nQbXkRTRE88I6+zKmccbnkAtgT93EWHekpRdNAfoK/ufrc8J21pihMDEMrpp5sqMFDxKZYVJYnI
	Jav2py8EFdohUadi0f/ZVMf7Je7ehlOnYYheodAruxqdFikeaOn8D24oIlQdHgbfRlMsyHfIwjJ
	mSruRrttvQYeRaJr+2+CSrMUbDsR0ezOvAq9alDLw08K4oQ6DaZw8j4g4k/zlpxmiSIyDWVcxXM
	pQ9osl3KA10eoDtdetPAk596pfHRtEXGc4u6VFw9cZzTIaldySpCiXz0=
X-Received: by 2002:a05:600c:1f82:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4bb7da4a0b5mr11294235e9.29.1794955426046;
        Tue, 17 Nov 2026 14:43:46 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2c3c93sm25012915e9.13.2026.11.17.14.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:43:45 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 08/11] usb-modeswitch: Upgrade 2.6.2 -> 2.6.3
Date: Wed, 18 Nov 2026 00:43:34 +0200
Message-ID: <20261117224337.4181772-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117224337.4181772-1-leon.anavi@konsulko.com>
References: <20261117224337.4181772-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 22:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132598
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.6.3:

- Fixed linking error for static builds with jimtcl (static
  dispatcher)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{usb-modeswitch_2.6.2.bb => usb-modeswitch_2.6.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.6.2.bb => usb-modeswitch_2.6.3.bb} (91%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.2.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.3.bb
similarity index 91%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.2.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.3.bb
index af2b5b6491..67fc5cd1bd 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.2.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=091556bd6d0154cd4c2d17a1bfc7380a"
 DEPENDS = "libusb1"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "f7abd337784a9d1bd39cb8a587518aff6f2a43d916145eafd80b1b8b7146db66"
+SRC_URI[sha256sum] = "cddb987af80eca5bc9c364dc0ccd0e2b788de4d28626d017277a48c06b0453b6"
 
 inherit pkgconfig systemd
 
-- 
2.47.3

