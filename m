Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A656EE6423
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:55:00 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81876.1767167691289736156
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hPmuQiF+;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47a80d4a065so52927985e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167690; x=1767772490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K95N90D3YLXNoWXMyKZ6sxYaoq5dp7UFGWyBIn9kCTU=;
        b=hPmuQiF+J8mtASHG5tDwFchVCSzyQuC3VWiZG4c0PpgQin6s526D8Pew7zIRB+B+wx
         mrJbsgwNlbhJKX3nJ0v7XfDCKHob/VRtaWKAyk1G5ZIs0CGb8puDQ2TrKbWINfZXbY+n
         Idb+SN20Kgj2L8aRa1zz6TApxSyZmdnHbFNSu9vZGKqMhFJN1lfJ3YJaBxdMJI4b0H+E
         X5p5Rq2n2cBoczk5JyYeyWBwRbux1N0ISEyX0qAGeiJplXNIz8Kr+bsOjzeOg4ZKDdaX
         DOig7cfolgwgj/cFcBTXPnBeWA3XKfT22ZaetStcKI/m6qa1z2aX+6rdvbpdhl+ZiX4y
         k7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167690; x=1767772490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K95N90D3YLXNoWXMyKZ6sxYaoq5dp7UFGWyBIn9kCTU=;
        b=BQXtUh1dJpJRDmNudfrECDPcxCGguqmTv9ncxHpGBGygt15nHX8KJHaxYIHG9VBouj
         3Xjqcf+lpbbrJOZAsv9oUsl8Z4J9+OzePoUCkV9royxF79WcDz4/pVhwtlCzXLOe5zUD
         exiv15BkRNajgIPRqzrZdTgoeN8OxU+xwwl7LNUF35rxaLaHuE3RqDZk0bVDuHxvXAZw
         AfAYqLqpXJCe9b68QGaza+mriDZH940y9sgfU3MzpK1r2DuzZrH85O4nTB9onScwUaKK
         AmbdYIqEH4BgOxLjEtETxt8Ow6mJKEZVYEVXvvSbmRHy8rVljozs0Ii/phVW1+g/yIGl
         dMXg==
X-Gm-Message-State: AOJu0YwAUhgmUDxpPYpdxLEOa+HBJsBUpA8sCEYo+9urVtwBkpEbRL2K
	IQLIK8+VArlHYMKFtSgw0WS+mjMyUudmxPNlgS/3VPJHd+U7WWl97As2J1roaw==
X-Gm-Gg: AY/fxX4k7z0fcXrZvZUAeD/beA9Ioz75DNotamw+24hP5ziPEw0eQisyO/TUW4PbXDE
	MDWeRS2jc2w0yjIQTjmulyQBqisT3ePrZFwPjOEH2KtkOLroXao+yVX1fo+AAasqKTJMOANxmYh
	tuDo1Hvm+oTLQkjwfBXOsOrHs703l59a0MLsiU1QirfPC9mC5z1uaA7+kSrxS8Is3lbU/4sVrq4
	r5w9dweoBq/GoruAS9a7FujpzHzj2VNc7LhKXW7VLaUwEwLA6yYtVtTMXC0TUwlFrZa+PRhx88n
	fUPojC36Gd33PhLvXOJRsRWatTLniLbwL8dYbyXw3TiCtldGePZ0mKS965zb22+ZVHCwWvpC+Lh
	sQCvkITKxUywoq+3o815M23K2Su9s1SVV9druMVn7RlrECkRystnzVoyYS59lRjQla3d/hlxb3B
	bwJ/M3C2e6R3TipcMxweM=
X-Google-Smtp-Source: AGHT+IFs5gKt77IjcXb1jFi96CHkpmt8g2hs/6y4vC7xFjZlxBd+9rrZXj7f6q8aV6IVIpklKhAUVw==
X-Received: by 2002:a05:600c:468f:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-47d269c7019mr385092055e9.18.1767167689588;
        Tue, 30 Dec 2025 23:54:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 18/34] python3-httpx: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:20 +0100
Message-ID: <20251231075436.771395-18-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123058

The relevant CVEs are tracked in the CVE db with encode:httpx CPE
instead of the default python:httpx. Set CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like '%httpx%';
CVE-2021-41945|encode|httpx|||0.23.0|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-httpx_0.28.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-httpx_0.28.1.bb b/meta-python/recipes-devtools/python/python3-httpx_0.28.1.bb
index fc41d7d2b2..5bbf7475b6 100644
--- a/meta-python/recipes-devtools/python/python3-httpx_0.28.1.bb
+++ b/meta-python/recipes-devtools/python/python3-httpx_0.28.1.bb
@@ -7,6 +7,8 @@ inherit pypi python_hatchling
 
 SRC_URI[sha256sum] = "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
 
+CVE_PRODUCT = "encode:httpx"
+
 DEPENDS += "\
     python3-hatch-fancy-pypi-readme-native \
 "

