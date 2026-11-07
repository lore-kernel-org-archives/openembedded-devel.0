Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11968.1794070361837386814
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Fjik2rBI;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso17638985e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070360; x=1794675160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+GjBqxa5uDNs/Bropyrzn0AzFjOmjFqeK0S20iDjMw=;
        b=Fjik2rBI0P4n8xjqWDVkzh7Wasdt9+c8RhF3DuiTmYP344+9/SeweTWFjpr9SjKD1y
         Mam7NkUSh7H01DM0b6Y3eVHXPF9Q/7uVs6zQG1nibT/c5doAe0Ma6bZC8052S8Eq7+CQ
         niNSzC8/ICR8c7ZtGnA+KfcijivuzmNP6i4zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070360; x=1794675160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+GjBqxa5uDNs/Bropyrzn0AzFjOmjFqeK0S20iDjMw=;
        b=u9IyJvkR7PwE1wmCtFw9bNzgO+VkulgJVTZGlSDPZkQXiKcHTAiAvbo8P8gseMSA3h
         lnmaftPFv1A40QsGVotkIaCF13HKmFYMkca/vSkE5Lh3rho8GgQ4FrcTYhGwDCS0dqJA
         /r3B1z+2sm09dJGyTsFS7o/tEjxaOG01SBy6VQpxQi8Iaj+uk7oFq2zNna71aAi5Iz62
         5cEYSnwLjOBlYALEhsM352tTWwaBI5kqTYi3GZa8KvvIj8gpo34LZfFIbboP9+y9m5dZ
         5Tm68PJ6P07KK3/Jt3p2AqwTHR5H2C/yUvFey9s405M96z4v6PQ1DAyRxUXx1J5dAlJD
         YwNQ==
X-Gm-Message-State: APuU4Z8pTpAmayWUeruobAUJ4a3oBulSeK4FiD6G7Hsqxj9QJlAdgN8r
	ATXX3UFFodzxhUy7OW4fQ07pavlqlIkfrAhvHx0cBL+RFU61wiShLEy03DzRwvmRm37T0OAxgBF
	mmUSv
X-Gm-Gg: AYBFou2lHEGKjPWuxp90/1HpnTUVM9M9u5g5nNg3+ubmyZVYCvoodLzD/NvNWt9PUPx
	5RBgNGhUOBuIJOpFJHlUeR6HKAOvHT11P7dZYD6KDR7zQqLEa80ARjYbJcQel6LfhlHcH4y6syq
	JJhZ/5s1WoQyAxlSsxSQFxmNQhAdt2Z6bkViM6+eSV3UFwz7HuzG3nM5Pa/BQBMjVX0U8tGyhlx
	vwfjk3JONoIC9iWXAO+HNjSzuaUZYGDk6WHyFZKdN5BFjV9jYxeBru/V+6B4hUytBXpyV1b1ZCI
	YKnZLgtAtAqLfBJ1X7VKchDFVh2z9Q5SMxi7/hvButP03ykhNxQiNrVgYkOBTB2g9xy15SdV6c8
	eyEvYpbNiGGov6V4YD9VNX3Spk+373BT9paItAb31zA0w9tKWcD1wuFONGEs7bikruD5hTp11Ox
	8pp9RfTygEKwKdZZcXZK2VWG8aDAm/kyVrv9/BxCDU0Ny31sSv1XNQ0wMXKBAyTsy1zevW7OtOI
	GGicUhQM5BMjSRIEpdKzL8LoQ9KoYn1tuvDeuf6sZ13qW4ceUG4p9RjT5VcUYK4XKwNkMJb416U
	8QxI0MmbP1fGoTjINH6ZLFOVN6RTKSH3RrjEM0SfgkA3putMAS11lDLzTR/j7eWSB4b5ygHL3JC
	hDBap9esWabinRDm+419w3gf1pynVosV3gOj02rw/IBUxz/PTmCCw9A==
X-Received: by 2002:a5d:5e86:0:b0:48f:ead0:631a with SMTP id ffacd0b85a97d-49277e91eb9mr10920632f8f.47.1794070359659;
        Sat, 07 Nov 2026 08:52:39 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:39 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 16/22] libpaper: Upgrade 2.2.8 -> 2.3.0
Date: Sat,  7 Nov 2026 18:52:15 +0200
Message-ID: <20261107165221.122340-16-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132001
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.3.0:

- Remove paperconf(1) and support for
  {/etc,$XDG_CONFIG_HOME}/papersize

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../libpaper/{libpaper_2.2.8.bb => libpaper_2.3.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libpaper/{libpaper_2.2.8.bb => libpaper_2.3.0.bb} (81%)

diff --git a/meta-oe/recipes-support/libpaper/libpaper_2.2.8.bb b/meta-oe/recipes-support/libpaper/libpaper_2.3.0.bb
similarity index 81%
rename from meta-oe/recipes-support/libpaper/libpaper_2.2.8.bb
rename to meta-oe/recipes-support/libpaper/libpaper_2.3.0.bb
index 83932d3830..ed8b64b3ee 100644
--- a/meta-oe/recipes-support/libpaper/libpaper_2.2.8.bb
+++ b/meta-oe/recipes-support/libpaper/libpaper_2.3.0.bb
@@ -2,7 +2,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://github.com/rrthomas/libpaper/releases/download/v${PV}/libpaper-${PV}.tar.gz"
-SRC_URI[sha256sum] = "1e330571690191874eca415ec76889dd11bab9887a2302d6a3665cd081c4d77b"
+SRC_URI[sha256sum] = "882b1c7636052fc9a318caa20292b35616b588824b70e7053018262b29b1409a"
 
 UPSTREAM_CHECK_URI = "https://github.com/rrthomas/libpaper/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
-- 
2.47.3

