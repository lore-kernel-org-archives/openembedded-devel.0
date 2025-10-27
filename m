Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE56CCF9EE
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 14:16:15 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.34156.1761574569941264439
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 07:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V3b/CY8M;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so3050332f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 07:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761574568; x=1762179368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfmdsQ5iLmRBYkbqTooOsGKdXUKlvSnZQZYSXclhExM=;
        b=V3b/CY8Mvq4nWMNr3CG5PuDVHtrwH09L3QqJPcWiD12HFGgWl/elOIH7Q4DvhdQoXA
         pzFZcoP2fveF4gJ0nInxVVrC1FP5NK5FLkr80BRge1KRI2yxUQRuiNDqn6Lz78PP9KAB
         9QEUq54RxaKoe4Er4Mnzs0MIDGXKTPxvrlFjmVIH2dJ87uJ4SA3PwScEOSLdf3W4JJq+
         FD0X7xU7ypNrnRSbsgrXlYqw1lsH2KwebXuAwpRSjnw2VTKQcZnEQ2e6EWxA03GfJYgO
         b3mj79pi+atTMp5qMRtnH9T34CqLqyubTICIyqTu1azWWDcJs5nbvZ69DkiMGvESAo6l
         dPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574568; x=1762179368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfmdsQ5iLmRBYkbqTooOsGKdXUKlvSnZQZYSXclhExM=;
        b=v/rlpjaxaWt3AiLz4NGOMhs/4AyqHUgdb1RtEG/7l/lc58lQR36gv+vNKsbfisulC3
         XZ1fdRJpTcAdkENJvqnmXt3MNUt9dtzMals3aoJhv5KTuRgyL+GfXmOK+tS8FJf1HJc+
         nzXJahM5qm6YbIvlzZDFqqlzg56aRZiMnJKuknwRODTOKvb2gtZZZhyzmet+HlCjsf6r
         3kSM522RKfRTl9CSgJkb74czWgf/RIhvfVxZjYC84VZuWPp8kjP0m5sC7/JVOBK5Hlf+
         Ed7g0aDhG7bCSISfoZzRjjnoZ4TatQ8jDJ6gAOG0z/MCMw4hR1M0Fu7rvWwd3GvG9LwF
         A+Fg==
X-Gm-Message-State: AOJu0Yx2g3RS3THi7Hjdi8fGGHCBmLdSH/g/hei71yfa1MFJ7exIga26
	7/PJ4A8NC8A1OZO4DvEXDP4QaMsAyushbhW5s4eGpFAtXIwVDH64xMDx3G69Kg==
X-Gm-Gg: ASbGnct7/HmSbbpn0b0T+wUYZJk9Dm7VQXhnSU+QaIXaWhNBaCH4gu4X27x7kba3Cyb
	PMdyAsp+qrpoOAqwOckAAvk6f5qSQPTXpNnzMK97lkGr5dvcfY2DPDn7PLjJTw8+Lb0xQWw9GsG
	dJ1RGDangIfegymaC1GZBW9PxpOyGJnDQjn/jOUJT0f0eFSNyhfnsZfmODqehMet//tEQ8EQUaL
	O89CTKMV+eVsDmhQMhITSZ9xXeB9abm1QoNZ+aKAF4JJyDjtoOLIIDDCCt/JgPQpyzrrCAEC7Yk
	uqdHU38NQTiDrB56xILelgLnpcd6Ilo3kIbQy0RzE1c7vQwoZUEW5yba7t8nM2hC+K+12pfKTe0
	mSEwc6TY/lYK1AjtwR5gV08sFy/B1aS8V1e1IHXGPqiOSYBOzuC9vDfXHKp/fWWF9Nz2IgXlawX
	lrYbL0XGOz
X-Google-Smtp-Source: AGHT+IFEJZgTM2gIlBiaMOSyNF9RdHd2yGfhe7kFRmMMxi2BL4dfB1pf4yjePhdhe03dA1omS95slA==
X-Received: by 2002:a05:6000:26cf:b0:3ea:e0fd:290a with SMTP id ffacd0b85a97d-42990701991mr8130349f8f.12.1761574568208;
        Mon, 27 Oct 2025 07:16:08 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db80fsm14164067f8f.31.2025.10.27.07.16.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:16:07 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 08/10] influxdb: Update CVE status for CVE-2019-10329
Date: Mon, 27 Oct 2025 15:15:55 +0100
Message-ID: <20251027141557.1893563-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027141557.1893563-1-skandigraun@gmail.com>
References: <20251027141557.1893563-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 14:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121048

From: Ninette Adhikari <ninette@thehoodiefirm.com>

The version don't match and only the Jenkins plugin is affected.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 524acf0542cafed3f5e82cd94291a653f6cf86e1)

Adapted to Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE))

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index 50995c09b6..b5d6f16abe 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -68,3 +68,6 @@ INITSCRIPT_NAME = "influxdb"
 INITSCRIPT_PARAMS = "defaults"
 
 SYSTEMD_SERVICE:${PN} = "influxdb.service"
+
+#cpe-incorrect: Version does not match and only the Jenkins plugin is affected.
+CVE_CHECK_IGNORE += "CVE-2019-10329"

