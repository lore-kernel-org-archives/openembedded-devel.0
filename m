Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CFCD35E31
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:16 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.27888.1730831944541405921
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WBt1ch5i;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e390d9ad1dso47727567b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831943; x=1731436743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeB6i4XSEybddsRs5B22ujX7HwZYpuFBJS3XSIu4//w=;
        b=WBt1ch5if3c+aqjCu/FkKFCYOAOZMsGdRHNVrudtiUYSUqkU0Zr1QBiE+bmAFt92t2
         hMAlCAZkbOHNkq3rCWgnEQk0KUKDId14sp/UIEUg5M3thARh6pqrOiqTDbElLURe1GSz
         /HaOFSwMN0BfhSTjBCb0rXhp3F5kYuSF7kizlWQXQYEVARMzbhdoLBRZhWE3O72be3u6
         1Q/77wjochh9xD3LjIjCBXGmlpk9oLdGhECrYqgJv4Rii2qIs9ExNfar1cRoYUL+LxUz
         87m3n2HzVOlbRzvf5p+xj8xCmiQjcAzaOg8xl0o4Axr3ZZJz7BPfvoW1xsJrtxZMJEvw
         CsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831943; x=1731436743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeB6i4XSEybddsRs5B22ujX7HwZYpuFBJS3XSIu4//w=;
        b=LJEmkkth9eAC6dQ401gn5fV0KfX60A98sbKBqczxXgDAAlcSX55dbqqtj+ltLIiwv/
         Qc5fz/ET4yY9QYK1IoOdSBCjcoZG71IRToiwLOsdLnaeWGHdRXrq2h/bIQQ7WXehwUnJ
         JdkwWumD6lGHTcGlyGHb6G0iGoyRKSS6LbazEnT2PqHwyBgYXtXDewNz1u7WlPgYV10E
         BuotSZdoDGzrCbVZ8MgBiHdPfGUWqR5qiBv3afvIluSGAuVqGHLsuzZm14E7dt7Xv1Cv
         LQ7At9iaBJF2dlJWuSA4zPyb2eG77TYA0r/I6C/VyjDBmVzMngNh9ey2MWezAAEbdQ0K
         1l/w==
X-Gm-Message-State: AOJu0YwnjlfoqQOiOYIcc+HkxgglrCWGH7+OTshenj4bNK1b6HHRcuTc
	vVAnybk7mY/r7HzV3sgEAPmJaNnxvbafPLcZt0S42cl6UxSL/zmu9igt2HJ2
X-Google-Smtp-Source: AGHT+IHCiQBPOKIfno3oecuWxqG8AqSVqTXB1Uf5uKqVzwQg0g+yYutt9vaqsqUefQE6uj0ryFL+eg==
X-Received: by 2002:a05:690c:6e88:b0:6ea:7afd:d901 with SMTP id 00721157ae682-6ea7afddd68mr119299057b3.18.1730831943136;
        Tue, 05 Nov 2024 10:39:03 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:02 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 079/161] terminus-font: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:55 -0500
Message-ID: <20241105183658.34982-81-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113594

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
index 1fabe2e29..4cfbde535 100644
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
@@ -12,7 +12,6 @@ DEPENDS = "hostperl-runtime-native gzip-native bdftopcf-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
           file://use-no-name-option-for-gzip.patch \
           "
-SRC_URI[md5sum] = "1b6acbd221957e33c8a792ebfaf3a659"
 SRC_URI[sha256sum] = "d961c1b781627bf417f9b340693d64fc219e0113ad3a3af1a3424c7aa373ef79"
 
 inherit allarch fontcache
-- 
2.43.0


