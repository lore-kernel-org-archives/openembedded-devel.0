Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0629C0218A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 15:56:16 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.45575.1738425369238286595
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Feb 2025 07:56:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QiqyNVZv;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436281c8a38so21573635e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Feb 2025 07:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738425367; x=1739030167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N+jJuRPN30h2HP8VNdovQQB2/BA4FMH4xrfCG1cRLFQ=;
        b=QiqyNVZv5g0bq4eUOVybtmLvVEd4lRkuOgjHia1oxLFtJ/UKi2qstxykQsRhXtaljW
         V9EgQAxbv1VnFtdbE7vOu08yvyKQFk0YxQVTgJKesZLFY0zeCxQVADYX1UuIXzSbaFzJ
         OJp7Pdjn2HL82a338w9/zkdOovzM6GuIKKcbIacqTUIN9hmMZhF1T/PscrSSLWSmuviU
         P0vwilBcEeyWuQkJo4UiT+VKWgv1FRevUyx1SgpUH+BgyCNJMUePlpiKJCwjGUfAQwen
         PWjqreBEJ8XhhQ7OvYp/rTnriD+qB1PKNSEdPIURWlMRE26RNmkNk04EiyWttSxPV1uy
         57Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738425367; x=1739030167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+jJuRPN30h2HP8VNdovQQB2/BA4FMH4xrfCG1cRLFQ=;
        b=gvoJa6aKJMVAENSN5bHQ7Rn7uMwK3pjTp0AqEkI/x5RCYmgQ/qw28XaAh2dxaZ5jPf
         iz6ridlcL374TIwDWDmsscgdf67AGd9t1IaEUiwMm4E1BhQYFIdlyMsgFirp9eM/w9dj
         B217GuzBzkO44mm60jRHgrRQnjkCGD1OQOxkIKJfhU0JAPWtlevq57Hk8m18lmWBHDzS
         2wa0bPstblKKKiauE5/1AFuu9wvbO/Spb25E7KZB7YNYhUC4sV1Clnx3OGcRVJDa2xus
         yJKy2iSgNtnXLQr3VSKX4PpoTi30spABf16ahsZ0iUQtH4edGQXCGErW3dhNi/f1hJOa
         +4TQ==
X-Gm-Message-State: AOJu0Yy5byNDO1NCV2JKNCowcZLEb/gac6kHk596TKMCrySmKkTWlEHp
	P84mquE/d7rdzq7jOhDhBNSutQUBZ9v6O1UqKosf6jWbP50iSDRgm5oicE2t
X-Gm-Gg: ASbGnctUeOti2aiK2fRHezTGUGW1+ajhsffW7DeDllOMia5AoqB30PC7O7arsqg/epC
	o9iGkzChfSmId3jIHGTmnVFCwDCEg5LvGv8ynr/mHdvk5JXyNVurZ9vAG5I/Ywb3dKrYNgN6Zbq
	piLbeDKnO9fQNafoNgWq7DuSNfRuaU+kieiuBDl9reVM/cspEHm2Bb0WSaYBp7zRW+r1M9m6DMz
	RsaHZvXlsoAFCmlEyfKO1l6Ko1l5yaXdoYR2RhQR6gkqT7hZAP1ruodkoUEN+42HoADBxJrsBEy
	2vUYojHqdyL5fm3Zhqyf4Sr7gOUwKM8=
X-Google-Smtp-Source: AGHT+IFdK2TcbrwA1+Be3piWKUjxDa5EPs2HaXliSRpYR7US8NsEwGdXUzeMArcqFytKktDUmmDVgQ==
X-Received: by 2002:a05:600c:4e01:b0:434:f3d8:62d0 with SMTP id 5b1f17b1804b1-438dc3a3e77mr130093015e9.3.1738425367226;
        Sat, 01 Feb 2025 07:56:07 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc6de7csm128445175e9.32.2025.02.01.07.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 07:56:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-networking][PATCH] ndpi: correct LICENSE value
Date: Sat,  1 Feb 2025 16:56:03 +0100
Message-ID: <20250201155603.1323418-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Feb 2025 15:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115212

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/ntopng/ndpi_4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
index 13c3398c2..ae5139c94 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
@@ -5,7 +5,7 @@ inspection. Based on OpenDPI it includes ntop extensions"
 SECTION = "libdevel"
 DEPENDS = "libpcap json-c"
 RDEPENDS:${PN} += " libpcap"
-LICENSE = "GPL-3.0-only"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
 SRCREV = "8b5c6af71b562549f8416b31803daae223e09f46"

