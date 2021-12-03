Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE19C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 06:42:22 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.8646.1638513741030464597
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 22:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OWNaaalx;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id n8so1441559plf.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 22:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=owwiHf9gZWm9j0uSJH7d4etvCgrAsa42Palv6Arz3Zs=;
        b=OWNaaalxDBn62q2eNpzKvrjWnJ9fRDaRRezcA4/y5TVuvhTk1yC+cOm4Qt4n4/Amj8
         /oIVIkAXaQRBt9NcLOEY4XTTsU2HewU7NVbGSUqq682JMOPOAch64kws8hDgj7+rsiN4
         7978tSnAD0WHZpW1WgdehHxzOxXXNQg/b1CcFuzddTAqD4RXwVdomam7Xs0IF/WtGz2t
         PViR9iq5FBj5phq1AUYjxGEZ2+3RUkSU/U+5JWONj0g8aT58OrDHUWKWepuaThWx3PvV
         bjFWBMNoRLKmGrtQTtCyY390jtme9Rdnt1rJ1uNiCe9ncuKj6WvYyDbB5S7abfV40Tts
         AEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=owwiHf9gZWm9j0uSJH7d4etvCgrAsa42Palv6Arz3Zs=;
        b=ICbysbu34V7nJBMCD5U4zu0wH9vxIeWEE8Ajtqe6jFqtmK90OMimrrPwqwjH36l8ZA
         5oTZFeQNrAHiiiCZvOntyQH8w0TAVTG4sEtg52jWZZTg3YjqAgbILCKqtEfaZ0ZL2WMh
         O6Vfabey5D9NN9Rg0k0T/pri/Af2T6M0cI/FrMY2Kvj88sJ+A5IereUCRK/y7g6imp/E
         mGcwnC2p20EZJPpP4VBqtZyKSVnilckr6KeTZqGIqMGq6DntJ1hvtTujAqS6zNbvP7i+
         RFBIms37OwUzCyO0nooyIDdMNCX3uCkVPRj3V19Yvp9doo2pZtmtZ7zWQBKli2jl9A5Q
         GcaA==
X-Gm-Message-State: AOAM532oyYcTOhV+7wWgO51wmE5Q5m09HaL8N1cOZV9NV/wVBJNxXYXp
	I2t1n6CrnWSOiS/5lqyFlTOD2EKVUnikug==
X-Google-Smtp-Source: 
 ABdhPJyym9R0yL4xcAt/Q0wzBkqzpELJ6K8kBe7R/0/TS+Xlneu+V5nMEXcabKzWypJ3ZiI2kLyIFg==
X-Received: by 2002:a17:903:120a:b0:143:e4e9:4cdb with SMTP id
 l10-20020a170903120a00b00143e4e94cdbmr20452198plh.89.1638513740286;
        Thu, 02 Dec 2021 22:42:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 n11sm1300956pgp.15.2021.12.02.22.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 22:42:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/3] gjs: Link with libatomic on rv32
Date: Thu,  2 Dec 2021 22:42:15 -0800
Message-Id: <20211203064216.2609394-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211203064216.2609394-1-raj.khem@gmail.com>
References: <20211203064216.2609394-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 06:42:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94193

Fixes
libgjs-internal.a(gi_object.cpp.o): in function `no symbol':
object.cpp:(.text+0x534c): undefined reference to `__atomic_fetch_add_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
index f6878d1f22..af4d7f6cac 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
@@ -26,6 +26,7 @@ EXTRA_OEMESON = " \
 LDFLAGS:append:mipsarch = " -latomic"
 LDFLAGS:append:powerpc = " -latomic"
 LDFLAGS:append:powerpc64 = " -latomic"
+LDFLAGS:append:riscv32 = " -latomic"
 
 FILES:${PN} += "${datadir}/gjs-1.0/lsan"
 
-- 
2.34.1


