Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A4CC4450B
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:38 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14754.1782634357876889535
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZWCaYH/D;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so6038151eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634357; x=1783239157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSwPRoFZW8hpBek6LVcWp3UwFJPNFStkUKW0qCpgdJE=;
        b=ZWCaYH/DEBd+sbhdhbzKPGBYIYGXHGfc/1zSzWbUf7PpKWFwYjA+RYfy0XZO8bZuYV
         m+A0MolRHJFS8H+md0lB/T8etOMpVA8jQxX9YpYAU3fNvQHJT4M2PBBGC48y5jk0Eh82
         91K1gyjbzy6W4C6peAEr9n5tubagQjq302IpSf6DG3HKW7C063K7USOTea6kKwPyYeGU
         MkjJMbgSJANKsyr4WGLIZEyj93baliNzMjErFSPxoMSIocQmwk59FHV+1JYIr5MmFsNf
         2Ul7+Yc+QJAZHR2YiQ+AcriAsO8G5nFRAvHdv4XEXeEwGsfTRRvN0fZh/psklHmsbkKe
         RlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634357; x=1783239157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BSwPRoFZW8hpBek6LVcWp3UwFJPNFStkUKW0qCpgdJE=;
        b=GQsPLQeCunc1qb8o4CtytJd2uU5rLyGZxJUokB7snSl5tdjMGMWAnp/emr3ttMX0o6
         IoNnKxC5IHIpH+vx3Pykz0vlwmvG5haPiT9fcyTxXNwO16oIoMJEXF2Y3uVtMckHldMI
         gbtvLnC18Bf6QqoC4Dq8GRnbIVqwlfDwdU//XjcStXNa9dabUpcuQeObraj2SLX5RnPQ
         AmmbzPTANm6Zgw/EvKkqXx7Te35PMI+Olrfl0HP6VXxmBzytqVg6ZTQEZVLKV3G3IJA0
         8j2nqBXjLSyMo74LGi50QXijjMmi70Piml0kRCsI9BtHjv+vKI+aXFF1ipZcKeobDDEv
         CNxw==
X-Gm-Message-State: AOJu0Yxnx3THabD8GnG0sV9JjvpI9tjSnpSUUlrQmYWHajjn0B7ybTq7
	og/ORQ7/GFo1o5tpZnM278BFBGJ0kkrpfMymyvF4ALX0KfJmqQbkhVxafdxthw5cgXoQew==
X-Gm-Gg: AfdE7cl/xS1+hrc17tRlEHeTyLdqskt6RTguvcth8hb+59eNRMlrKCpAKkBC+3nQDa7
	uixd0fcqNga6Yc350NECWA4GpaAO1KST0xYMSSrcL4EV2Bi0RZt+Eh/EfQXpFB77Z9eflEbQVoN
	wfFA3OjTt7A3IaI0x5XEYVy5VZoAlmMMvvGH9NXKPSEU/0onkVIkWI0OSguA5ISw5Vq9zgQgBBl
	R9xwhraR2hTkKfHMkRuN5YIrjJJnqZIfLpDjgtk/eQnXzB32Ii5wQl9UIcQxTG1TudC59vYTB4K
	+bIlZ/8Js9upKs0xqdP/8cPIR/JJeclE27wrRO8XTF6RRLT6TNCNt2dkBOOTgZ/xuhM1miQAZTA
	83XD24k4rqYT3Zw8qQhVv8qWOvFuagNHMyorhYJX6K/I43lFTir8EQFdC+01z3U2UHRSAIfuaLN
	V74iRohmJsXwT+lcrC6Towj35yY2ShxYGH5rF+wnpHmmTH4c8cjHeXGzM6sxQIFbrRmJZPijImt
	Sp/H2Km92KAB5cbePu47qh++CJCuqJC+G4VUrpgoztCfbI11tewLsZDTzS1ReE8Bqgd1Ivs7CaA
	72EEc/sl3EcUw3KhVYf1OTeso9VD5Q==
X-Received: by 2002:a05:693c:41cb:20b0:30c:9ab8:da85 with SMTP id 5a478bee46e88-30c9ab8dd63mr6085964eec.11.1782634357233;
        Sun, 28 Jun 2026 01:12:37 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 079/128] libopus: upgrade 1.6 -> 1.6.1
Date: Sun, 28 Jun 2026 01:10:30 -0700
Message-ID: <20260628081122.178348-79-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127889

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libopus/{libopus_1.6.bb => libopus_1.6.1.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libopus/{libopus_1.6.bb => libopus_1.6.1.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.6.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.6.1.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/libopus/libopus_1.6.bb
rename to meta-oe/recipes-multimedia/libopus/libopus_1.6.1.bb
index 0e2bf09898..14c1cbe0cd 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.6.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.6.1.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4b365c2155d66e550e1447075d6744a5"
 
 SRC_URI = "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b7637334527201fdfd6dd6a02e67aceffb0e5e60155bbd89175647a80301c92c"
+SRC_URI[sha256sum] = "6ffcb593207be92584df15b32466ed64bbec99109f007c82205f0194572411a1"
 
 S = "${UNPACKDIR}/opus-${PV}"
 

