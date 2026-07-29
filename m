Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466AFC53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:38 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3034.1785293077960988304
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z0NoM0VI;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso364257a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293077; x=1785897877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3F3C6e3od3akfBJkNGDjolF/voQnS9SwlYSZOsyZdhA=;
        b=Z0NoM0VI3BgCZuNKgQuMyAbvwgOWDSgDZKr1GcuL+Fw71q3WRrY+CJVWSrMl0Moh2L
         oG9BihKomKcYk43oWfJlG5TjQf0XVRnTQnQBagGqoHwE9tAxCCJEum1wXWyf2U8QRW9+
         7vPkC7TNM40giFATiVEwrZPM+4l9VI0akaUrc7mt2JjsjBiLzSM/CefQ/wumBI3w8K59
         v0IKwpAsX0bGoOWFsDxkvXxvuf3gdT3lELJ/C5brVixQeis77VrKhrL1Co7e0q8MB6ox
         uefmxr0wBpRMPM0DG7UH9OTEfjUmItGsxVbYFx8J2q+/bvk8K/BPvMGciBZclpTIFwhs
         3Ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293077; x=1785897877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3F3C6e3od3akfBJkNGDjolF/voQnS9SwlYSZOsyZdhA=;
        b=nbTzJood0RvPjQCM83rYWkvqM1jhaDHYI9Jr5edG8l1no6u4ARWadFmdbsnWTlAKOv
         3IZ7zGgB8nuYOeAKegVd2u/2g+YYSXMyn1+wMcf9MS2Bo9zv2Y8ELSrc6f/PxKOTo4g2
         qah1xTeBczXZMvlN8LWopRIEdgp5CTuJvO2+JukFEwJZywuUhMN3cNhE7bslCDmhMDCP
         oSV3xwazTZpgkttmWmfUilWqbrx85wqjImBPtSefEcE/1WGqhKNa7Zp8I7DVrg7PmPaS
         uHasTIgPi86p6+RXBHt5BIBhHyZN1i9dLlJ1mcLWgIWL8Amt8pFGFy6padBQgZTpZzSO
         ljPg==
X-Gm-Message-State: AOJu0YzwhvonCFNufKcKUKo4+Zn+XrVY5wRAkI5EZhk33y+Tgea8wgSD
	oXHDBb0vmttKo2rMc2SLud8INfBe/f/aLrhylFY7ZDdkm55Pb5yywrsjSX9vk+Lj
X-Gm-Gg: AR+sD13SzeXvGzwujKtVBeKuj0GUCwqKfOdwfd5eXJ8J015eDgG+xpmnMNkmr1uR6Ji
	xC0fLbYEVqeQbqGBc0UhNQFSiLJraVKPZr+PN03Du64xribeiyRm5S4DOA1h5pf4zpYvXDrYnwr
	VcU/u+IxDFYaaoXMbW9+Jb9Oit9WoReZ6uXILj+E1RGR27fMg4LN/B3cfDbz6ZOv9lN79StLVyS
	QLp6FFBLK6Rrw5ceWQV2ESnfQZyLltosQm0tN6Re7fuEY4cYewehoauRD/U3q/JEVi90BHq5x/Y
	A/L3xIW6o1Oqxw5Gn4K9/a2mIWG2ryctClvuow8EZS+Bi/AnD6wOl73N7VtW+nh2dyKJClSXa3k
	lSylcouSaiGxFyP+kLO0ENIpqSw1KO5rV8ZzrM5v3PoZs8otulr+DTWzGoF5N6Rwc9XdlrGlEIn
	3J6CbEwP+jRjMAZygyZDpYBgweK4gZgbYbr7vLA7OAd9E8eDWBz3qt/IpPVAgwHOcKCFOGwza+V
	F/QPHMGSdMWBL2aBUEqwbeMV21/t95SMCbnE/B86BxKmTxPCUrLCXYIUDdOtJqC46mDPmXGa/PY
	YrXrLivOMp2spWlOkVg3Wee/nalwkHPyrTkDsnR5bZFPBdSwWT9tkogXXlHcVxfzl3hAmGGY8kx
	Hxw==
X-Received: by 2002:a17:90b:38c8:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-38f6a440bf9mr4832911a91.2.1785293077254;
        Tue, 28 Jul 2026 19:44:37 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 13/18] zabbix: upgrade 7.0.27 -> 7.0.29
Date: Tue, 28 Jul 2026 19:44:15 -0700
Message-ID: <20260729024420.2328180-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128529

Changes within the 7.0 LTS branch:
- 7.0.28: raise the maximum supported MariaDB (12.3), MySQL (9.7) and
  TimescaleDB (2.27) versions; update VMware alarm discovery; fix excessive
  history upload delay for Zabbix agents (ZBX-27495); assorted frontend/agent
  fixes.
- 7.0.29: raise the maximum supported TimescaleDB version to 2.28; fix a
  potential VMware collector crash on vCenter connectivity loss (ZBX-27975);
  fix RabbitMQ template duplicate discovery keys; fix trend-average producing
  inf values (ZBX-27453); fix remote command execution for trigger actions
  when the target host is monitored by a proxy group (ZBX-27665).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../zabbix/{zabbix_7.0.27.bb => zabbix_7.0.29.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_7.0.27.bb => zabbix_7.0.29.bb} (97%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.27.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.29.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_7.0.27.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_7.0.29.bb
index 584dcf59dc..8707d65bb3 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.27.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.29.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/7.0/${BPN}-${PV}.tar.gz
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "15e4c233e65c87922824d01abad624f34128bbb4af021a75e38e89b68e13e851"
+SRC_URI[sha256sum] = "184d03454d7ff2d49fa1d292082ad335bce907ba22e30d54035d05329708ce32"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 

