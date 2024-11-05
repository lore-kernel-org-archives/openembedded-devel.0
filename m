Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75C1D2C108
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.19613.1730817417214501992
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aMtEa7qs;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e29267b4dc4so4518295276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817416; x=1731422216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLxyd6o74CqrVfaj6xKzZLvbOcL/4wZCO3Qvb10t2Qk=;
        b=aMtEa7qsNcWNeUbFUrtddCwnS8ATM4UXY4nQf7l3Thx6RnsvimKHc5Y7jmaYbNxv/1
         NXqevlZBSt7rPg5SHhbMDRDcN6Fn6N5Iszi3t9klHoCuM/cxEEm0vDlMlczPlmop0T84
         jUpOl9c6OXOubtx+R5udvR7uFBCyGcPEOa7M9nshwxNJgG+lgAJqd8UsN9BYwHB6UzUe
         64UClVoOlSF0boCwN7Jf3YHRp0ZEUnthu/6YOYeZC16rvBuVk23W8f3JXrC77+XmjLBX
         xuGOg+IhtTqohKaey4ZTJWyu1yY2/DeAc9PnlKOIuGsSnh3SRqjbEM+y2+LX35zSoFtd
         eo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817416; x=1731422216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLxyd6o74CqrVfaj6xKzZLvbOcL/4wZCO3Qvb10t2Qk=;
        b=ZHp84WW55+owerHKcunXzK/4CTJMvZzKCPJ7pQ30JqwKb+0qIHh8dylD+rU5GXxPpo
         DO9JTC1hz9cXdroYUghJqEyLy3nGNqr75Gn25JHsRkIwyQIx1j9pgBDQQ1+ErGVB5PCm
         +915PJtm/QtYXhZhXlplWAVhMqMEZtbYSjME4uQobT5tIM2/sRWhTxxBypOquycajChY
         yoxOJtjdtyY5PQ3o3YgxpBzKSIKASi3nuWgKHxwRNeS1HklCggE0vi+oRjgrGsdxJvMd
         mVwbfEl3zuYtxzxj95iHJ45Bt0rDv91fqNUxRSpHxmeP7mpK7jVBZBXCSoF0aG/5/i/c
         iRig==
X-Gm-Message-State: AOJu0Yz5UP+T/acjrMpsCFHSre31cZlIbC4fsFXuSUo1c6BxdGsZtm8S
	xFxXrqfZXRzKpU2fhOjZaJNUgVGLWTyV0GSduDkIv1lP5qCaX36FkQULaA==
X-Google-Smtp-Source: AGHT+IEoWtPdttCoPPiNPz77slH2ou55MrvO086obRqX59JgqbvP49nSFj2kEVgyg7Yoduce01BZCQ==
X-Received: by 2002:a05:690c:6211:b0:6d5:90f:d497 with SMTP id 00721157ae682-6ea64b18e26mr154978477b3.19.1730817416151;
        Tue, 05 Nov 2024 06:36:56 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 37/90] gpsd: make the meta-python dependency conditionally
Date: Tue,  5 Nov 2024 09:35:02 -0500
Message-ID: <20241105143638.2301245-38-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113455

From: Jose Quaresma <quaresma.jose@gmail.com>

The python3-pyserial dependency was introduced in [1].
It is provided by the meta-python layer and so make it conditionally.

Fixes:

| NOTE: Resolving any missing task queue dependencies
| ERROR: Nothing RPROVIDES 'python3-pyserial' (but ../meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb RDEPENDS on or otherwise requires it)
| NOTE: Runtime target 'python3-pyserial' is unbuildable, removing...
| Missing or unbuildable dependency chain was: ['python3-pyserial']
| NOTE: Runtime target 'gpsd' is unbuildable, removing...
| Missing or unbuildable dependency chain was: ['gpsd', 'python3-pyserial']

[1] https://git.openembedded.org/meta-openembedded/commit/?id=1266c912afa0abf118eaa5d152a0641c87665fbd

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
index f893ac359b..458aedbf85 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
@@ -27,6 +27,7 @@ CLEANBROKEN = "1"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} usb"
 PACKAGECONFIG[bluez] = "bluez='true',bluez='false',bluez5"
 PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
+PACKAGECONFIG[pyserial] = ",,python3-pyserial"
 PACKAGECONFIG[usb] = "usb='true',usb='false',libusb1"
 EXTRA_OESCONS = " \
     sysroot=${STAGING_DIR_TARGET} \
-- 
2.43.0


