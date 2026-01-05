Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FA3C2A088
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:49 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61169.1767607366598987382
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gohukuhX;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so110052375e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607365; x=1768212165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EiLTQVZbllIZDnPlvk+Rp1jpnYMla0W8YeVfynKmujM=;
        b=gohukuhXNlWKh4exa1wd4ACbuXD+BY8JALiyuV/Rc0zQHkPhBdL+6ERxEaFu356TDs
         puRXaBRJ09qEEq77clGN+v7DsZ5WIaaOxrXSm1DmVe3PkrcFxSqmyjvyVSbyjVxsACvo
         c4o17WSLyLLBsAxypqajoD95U29jYGEYy/wsOqWi3jlksRW7eJLQTeoVKbyvFQLgp9XS
         FHpJMnK/uJV08QvgCSE9rOejaLec0iQr5Fj4Xdb9LY0PC2/rxS83P1U4n3E+BXxUyYGn
         iUAJO7rTYl2Na74UtGrfCJvqlFjVYklfpMb9snhF+QJPNi8vJMm+vWOlZ7gqfYEwzn4u
         5W5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607365; x=1768212165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EiLTQVZbllIZDnPlvk+Rp1jpnYMla0W8YeVfynKmujM=;
        b=fsHjyEdYg39NXFtSVinv8flhi4noCAzO0FmV69xqT4Pjcr/tiXMjvPSk5v+YtbgdMl
         LKnFQXrVcf9ob97NGPsTWwXhHf5OPVHKuW0gZ/hbap1fPpaI2mlj2wZvXdC0Oow535Gg
         G4VUO4+zivfwrOfsr2jjf1ZSgaxM7WgUZ1KNJBbe8lDc5vdIhRcxvE/lnBVCW92UkaT/
         SuziWtBKVYfzy5ZrrgEJu6Gk9d/6Zp+QcsBJgGC4k9gSOLJCH1cw79ojZrHWUezHiEvX
         1TvM4Qoc9a8V9rbUamBnR644F2PlHLqbhx7ge8hobxU8T0Er/yU+KE1wS99GniVWQtK/
         kkwQ==
X-Gm-Message-State: AOJu0YxEHiFvlAoxfK9aT8Qm1AAWMq66/nzo4jn6yReY7HOUSw/FxP1R
	c2LTq5z8FPP8PupzCrGrfW1QOepQDHuZoYmnzGaGiirocirpoa1SlemAm7yvuQ==
X-Gm-Gg: AY/fxX5ixX76c9kq8NPlWZaZ8cfOXWjQbK3lcYPrIkvJdtyVvVaxjwK24Z6C3Wd+icd
	WDUFW2eade0NiFbIBTtOql1c/mjFbR28k8+3roQc83i3tCCjTLCxW/uq3P2paoaKiiTNATDfNU8
	gSf17uMCvbloNEquePg1kIzyDaQv3GlvtzhKMXIbHCBhiwgnfzE+lwRflhRQ+EptgWOqiEZlY8a
	pJkyXRt6WDs6Uarlg065PYnAkGkoUorxM7fT1fCz6euqp8022vp2NTah52TvHZezAi8PtvXMZrp
	H0jdmMyGnRBaws0/45aCe6vWHu428fSVnaeDtQGXvm/AzhGNg5nhawNP9hDQnwhb+iDb3dPGE5c
	0k7TFHhPNQ+6M5ORLNW9hD5ka+6/iTWXcVGknR/x+inXh6Pj9UvIBc6fC4FSeVLkVUQge8Ychii
	+qY41yElqU
X-Google-Smtp-Source: AGHT+IEccWF4RTyKKtnKXCzWMPFwuOaDpxrv6iW/Jq69guALRKUcbYN8BCwS0Hg/UrMo5muDO/ayAQ==
X-Received: by 2002:a05:600c:444a:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-47d1959eae7mr608456455e9.29.1767607364891;
        Mon, 05 Jan 2026 02:02:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 09/17] libcoap: ignore CVE-2025-50518
Date: Mon,  5 Jan 2026 11:02:29 +0100
Message-ID: <20260105100237.3081345-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105100237.3081345-1-skandigraun@gmail.com>
References: <20260105100237.3081345-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123140

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-50518

The vulnerability is disputed by upstream, because the vulnerability
requires a user error, incorrect library usage. See also an upstream
discussion in a related (rejected) PR: https://github.com/obgm/libcoap/pull/1726

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 598176e1cb6c928e322e26d358e8d01ba9d5af0a)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
index 55c5ed8775..1a8d7ed725 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
@@ -60,3 +60,5 @@ PACKAGE_BEFORE_PN += "\
 
 FILES:${PN}-bin = "${bindir}"
 FILES:${PN}-dev += "${datadir}/${BPN}/examples"
+
+CVE_STATUS[CVE-2025-50518] = "disputed: happens only when library is used incorrectly"

