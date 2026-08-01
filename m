Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028CCC55173
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:10 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5258.1785589928995030822
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Dw5nU0Vv;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84e27035206so2267844b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589928; x=1786194728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZCXs1DrwnAHiBbUZZJgJwBNmVHw4vt3/3dA2ipfr6U=;
        b=Dw5nU0VvnSSeqTKnTOtu0/Hn1O+hYEmIWDjKfXlKqLKORHnxJDcDqJQc3Kr+0XCz95
         9jvjTc4+mWU/NBT47Tp4XmDrYgzmdvy1TLDty71bp9uczr0u0PCpSypj4iO62UvHsNUI
         i6BgXyF9TiOAMrYeMPCpZZbapPXpjK7ikCOFLOvzuaZYE83nQyHrzG/uGkVzrD+zmai3
         h9TyoeEFiwNDNP0fIOmiSWH35mGcltIcrZxYjg2ITB/L0Y6NbzbQX6pZPuG3chACSn/v
         LfdyNpzddm+7Ab6FrUHd9G7tPzk7DnE/FAFMHEUs8uIc62gIiiSm6qnvsYKNFaBvkPAk
         PUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589928; x=1786194728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jZCXs1DrwnAHiBbUZZJgJwBNmVHw4vt3/3dA2ipfr6U=;
        b=mcUcfaEQNLz5RF3kYD0fCOPr9LDMDbU6KTzLPUT9t7j8/2Ch8NJq16pzBZCX2K/XE1
         H2vO8UoWx7bS6T3Iw8GBV/y5EWSQh2NW+TztfpPcBqRuoAK/CtipxTZsX8gcnxfF98zj
         s7h9FJFu1wHjoZdm4efvPPu6uV7MnosMyUcTSJTE3AzgWSyDRT7rLuYcej5N5bd989P3
         Jc9yAE/FyUJ5nD6cG1AFN9ctjJ89qRmDzxvohEq9gPOvFYLd6LAEXjdQtHqaSrms7uQe
         rzHzVh1+g+/ocS+w2ntpDgfarSJOLvPuIgjBho3QLHbDOg6L2gW8dSWVCe+Ydf8a7sEn
         1iwA==
X-Gm-Message-State: AOJu0YzZ5umZNPovgyK9NlCFlBDiuYE4+4HNqSfKAykyTvf8JQuy5ZiQ
	Mmx/beOPM8zFDjy3mzRJhlUgYuRxGdvXfZfGMq+lU45TqjidsumEWfCfO7LkhHe2
X-Gm-Gg: AR+sD10GIXm7UNSBeN0IGC9WDG1o8ajjh+8LtDYPYkJESGCWN+oWX7APFF8hMiCTfdn
	aVKdB/+SUwWsqTiEYNCE+g0wbzP4iWjbHembkB6wOklPfLI9KnW8uxZGRfMGMt/cZweOQ0vqWCR
	xzwlE7DU2FVLcBo+TyCWFZVx+xa8/z0x6munEuajpiXrN2ZHGmZmanPL1DIR2ZhvL8ncRF5VS/l
	PgBDcJGvtg8p4a0yAwWSJg8te1kyhqEBPL1RI1o4Yr/cjhd8gquPPBUWe48PBs03DBm35QTtI8z
	Jien6+4xxTmroqAy7iDc3sAUugtqtul14wMfGsuqI6Sy3v6d9enbKROl/XwZJNdzomZDTsjsW2p
	1PTH3/MEgguW4KpldvMiIxihv9L24xfl+QnhTPQCIygGiQAWezcjOSCDOxot9wf4QsX4oarIBBj
	RK8wEXolkx8vF73Gl89NG/d7SpFiW3LW0bXOpmbLfEynOiVdssYAkEC9RYOFEHpOKLbNBwNQZCv
	w==
X-Received: by 2002:a05:6a00:4fcb:b0:84a:2ec8:fca4 with SMTP id d2e1a72fcca58-84ee4901a9bmr3201287b3a.51.1785589928306;
        Sat, 01 Aug 2026 06:12:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:12:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 8/20] gssdp: upgrade 1.6.4 -> 1.6.6
Date: Sun,  2 Aug 2026 01:11:26 +1200
Message-ID: <20260801131138.3299410-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128602

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://gitlab.gnome.org/GNOME/gssdp/-/blob/gssdp-1.6.6/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gupnp/{gssdp_1.6.4.bb => gssdp_1.6.6.bb}                    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.6.4.bb => gssdp_1.6.6.bb} (92%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.6.bb
similarity index 92%
rename from meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.6.bb
index 94679ce28b..944a4ef16f 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 inherit gnomebase pkgconfig gobject-introspection vala gi-docgen features_check ptest
 SRC_URI += "file://run-ptest"
-SRC_URI[archive.sha256sum] = "ff97fdfb7f561d3e6813b4f6a2145259e7c2eff43cc0e63f3fd031d0b6266032"
+SRC_URI[archive.sha256sum] = "767d2275254ce0efeaeac64419ff9f4f0ad470d134ef672f5c556b2abb786bcb"
 
 DEPENDS = " \
     glib-2.0 \

