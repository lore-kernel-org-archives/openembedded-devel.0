Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6375.1794046326617785670
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 02:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=znsOB+HO;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2368877eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 02:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046326; x=1794651126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POzoNvKQ1VgRyFzE4vorQMJx2EBfXJ88YEbDZqAFF1c=;
        b=znsOB+HOjVhskTs6secK23wX25BWtlnZo4DM5psQTIWdkEyTOLiQNXufdQHsf75ub4
         iQ90YKk8WSbGFuh46BD32weKJLvZQ7zYpl5fkjeoFp26HmUWULyM94BH4OeklUDpzjiK
         grBOJkzOlbr1Gsd1MVqANPf5/H0uUN+KgMIQvd56ixGWwq9EhxARr6oMKw7vvR7pwGO7
         dM3vVHCPta2b1nI0LhRXAqqtlc0P95spF4yzADDT4/Bb1dYSacWmqhkCm27vN+DIevAU
         71TxdGUdG23YbZk6AcVM0yQGUlzoipWxsb7993msnVGCEt1iTmPpq1DdjOsn9OupHM7g
         o+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046326; x=1794651126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=POzoNvKQ1VgRyFzE4vorQMJx2EBfXJ88YEbDZqAFF1c=;
        b=turSzs+QDd8KTUnbibn5Qjb7B8szxL8IVW7UrJVl4j1SvYT9WFtNFWSSuDi9nuHaM4
         FysCuASy8/dQ9IiMhJPwTG+dntpQe61Fgy7BWYByA+5ORsn5DUjyD2JgTIiMpUHhPpqM
         zU0GbBfN6b2e82yYlIlp/E6/lU+ZaX1lYh5DOsG+MjFSXrZ8UpG/Gh3cE9YAbqpRC5YC
         33LmvAJFtvZ+g/G39OvJ9hmCZaXyl9Zz8JdDrKQcZ/MHn8SpOqrtRBHXSfGpZsIsE4+z
         PjvGXJKXnwEJL32IaNKYPjfifwZ/ALD/0rnjlqgkJPQUUFfEEnIWST1cpaM8Whz4j/Rd
         B1Pg==
X-Gm-Message-State: APuU4Z+w6aJeqvg9lPRPgTQnEcVVATNDY1ZAi57UsA9UXBCuVBpmHL9O
	TJ+gaJS6elKK8DXaSofOBYo6ShNx0Qu1YzhTgbaXJSxWjbrZ2B9EKBfCnhtSFQ==
X-Gm-Gg: AYBFou0CbwCbWDIlz5JLFQUoybMIcKW/jEDdPstCOsS1055jgCGphbrb7wjhA6uI4qN
	U9Qjze3S0FPuNMm4+Vv0uHwHtL2g18KXognl+Vqd0LCkggJnT2496M3hoWcKFpbkybByFfkUM4s
	ZDt+7nvM0YQLx/6lNJwX2TOciYW9nJ3FOnG/q4JhW9N4I3fdka4gIku4C/0H5LoCszBZ/kDU1kt
	vGxbFQjJqKqB9WEI0YZtjw3OnVJSpg+G42a2UqcJ2/fysE1NSpWcqGQOXfg3BiE6U6dlsEiKaNO
	fzJFFfFgpVL7igd6g/aJ7ORenpAK1T90OBRMlhg8BIXaDmy01RtA9CXMtqecOGKQzU/nJoT8VgE
	xWf1lWwM29t4riix79rF+lrZC5kbaiWF91h6J2J70d8H9ACofVhOKt6k//6RFZCJFXjDCUV2rYG
	gcKaWwW16TlLFOQOuCukPvIuYq1IHAPpPe9Ty1zZ+JoaqubFvwVZ/J3k9zWK3eG/MbhMIQJawI5
	zH4+lzO3Dkm3JqOf8piX47nmuGE1zniugIu4ZPutDB+hwvQeP3mLXRFCZ1KW9Ncp2aSMo1r9ujF
	bQzMlU+SdG1uPBe0Pc/18PHpuwtm/vvzKFqMpCXakZ9CTqBtvMXXnNQo/ZSQ/g==
X-Received: by 2002:a05:701b:2309:b0:1b2:6c97:fecd with SMTP id a92af1059eb24-1b26c97ff1amr1281420c88.42.1794046325737;
        Sat, 07 Nov 2026 02:12:05 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm22856467c88.5.2026.11.07.02.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:12:05 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 3/11] libspelling: upgrade 0.4.10 -> 0.4.11
Date: Sat,  7 Nov 2026 23:11:46 +1300
Message-ID: <20261107101154.2992152-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
References: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 10:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131977
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/libspelling/-/blob/0.4.11/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{libspelling_0.4.10.bb => libspelling_0.4.11.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libspelling/{libspelling_0.4.10.bb => libspelling_0.4.11.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.10.bb b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.11.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libspelling/libspelling_0.4.10.bb
rename to meta-gnome/recipes-gnome/libspelling/libspelling_0.4.11.bb
index c906c8097d..d24d6f35f2 100644
--- a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.10.bb
+++ b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.11.bb
@@ -16,4 +16,4 @@ GIDOCGEN_MESON_OPTION = 'docs'
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[sysprof] = "-Dsysprof=true,-Dsysprof=false,sysprof"
 
-SRC_URI[archive.sha256sum] = "56e3f01a3a18b575beea4c34349f99cdaba316e1f7c271b1231f7bcf5d9af73b"
+SRC_URI[archive.sha256sum] = "52e53ec3fba0f604cfd0931e26af7f7241a0d4f0208dd5574f43b3589f6d28b2"
