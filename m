Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF8AC0218A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 20:13:47 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.50637.1738440822181279913
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Feb 2025 12:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=InC4ko0r;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385e27c75f4so2645412f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Feb 2025 12:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738440820; x=1739045620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KRPtZAURIDSctPSlwhK7E2Y/f4P275fQwpjTBlYYZHw=;
        b=InC4ko0rVzOplA0AZEfwICEyicOmHXdPfbZbbaEEzu+3M/399+PCxuYvIE5THot6fp
         rviTnVHaGm3rNJ62WFchAxqvTnVlrAXfrGG86OzougkM5ezgcYJ+Ryenqp3nT4LiErdP
         BxvTGwBMNxxCS6xKvRc/fYzpci/x/DzeLigRLxdN0RK8ChQfHVym29NamEIlN8p8MKAK
         +hoQ3jNr5QvjmcUaFYZU/Y0n9QQmSOlBWrO0HfFZFyvhGiDlfCAerXX37YnVjfD5spFP
         TTy97r95vLRSJ8wHgq1PqpAEFCKNW5caRPi70QpsZTaKVhXfQENYF2bxlEg/KLwQU/y7
         A4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738440820; x=1739045620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRPtZAURIDSctPSlwhK7E2Y/f4P275fQwpjTBlYYZHw=;
        b=PLJ/KH7ixwANtJ33m0fh/zQhCbq1aHb+n7vX0A91IO02ufKtx3V+M4vXDJizOZDoiC
         f5NS2sM01lRCaMX52bsgt6ZGPzjF13Bm0ngnXZ795zpJYqhqnI6bCyh+nRGuP4WkmUCV
         zOJM7UykQMywVZEvSlsgK4swLDaaVY13IOGEdzUkTb7D5MsMPKzchoEUKwztE+F7vJs0
         kLcZ+0nSuHT0NQEhGpPUgWomwRcv9LqdcEkNh5Eb+rnRCTD+1n6d/+ln58rcZ8dKgq7J
         NtM+KT/LB1l05A4LFOAZzS/+TT/0fRr97lLQ0+4920hZwOw/r1pEXg2OrkuwopHNFm6f
         FqRg==
X-Gm-Message-State: AOJu0YybKxrHLVm+IH76D7chq4wdMxiplULOWtz0pbRQ0ME6VAJcfM5b
	lH7Xg2IB52FNsMyRkPY/UiV+MEamg2r+WRVcIqaANpzo+GWF+7nMgptCaOv9
X-Gm-Gg: ASbGncubzXACxlbBnooa043GC074LcT5Qeki5dUxkRttxvTX6g7MQ4gil/4kw29gmES
	5qh/JByjcNoX1T8eEVabJiiR4flv0c59JZz2RMk9alr5gNa1E7rL5hj4LxXP6eKZHnGcIgggg8K
	ec722dXCkxHYdvSyaYPoL8/RvKHyztYcXpG6XTJ0mMY1V/8G78OlNsK5lBLzUqWKBaXCvj9foF6
	nS4XgdPJAcqfLK2jYNMezFrWtQkLSKOXJKE/9Q2aFB91sVEgLCxwboszOpFjDapCpY5jZnKF/xd
	KoemSVnVhV5EQOMQ+Lts0YsvePXmqWY=
X-Google-Smtp-Source: AGHT+IG40xQ0ulJ72rFLYfldI2geMnGHTQiVcLd7Ia4IW3KlYamMZlJks7X2LXgGrwRTXmSf8W29Ug==
X-Received: by 2002:a5d:64a1:0:b0:385:f0dc:c9f4 with SMTP id ffacd0b85a97d-38c51967de4mr12511337f8f.20.1738440819857;
        Sat, 01 Feb 2025 12:13:39 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c12164dsm7972367f8f.48.2025.02.01.12.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 12:13:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-webserver][PATCH] mod-dnssd: update SRC_URI
Date: Sat,  1 Feb 2025 21:13:37 +0100
Message-ID: <20250201201337.1372531-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Feb 2025 20:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115216

Upstream repository url changed.

Fixes unsuccessful fetch warning.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
index 5fac0a6ed..6f2a2330a 100644
--- a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
+++ b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "apache2 avahi"
 
-SRC_URI = "git://git.0pointer.de/mod_dnssd;protocol=git;branch=master"
+SRC_URI = "git://git.0pointer.net/mod_dnssd.git;protocol=https;branch=master"
 SRCREV = "be2fb9f6158f800685de7a1bc01c39b6cf1fa12c"
 
 S = "${WORKDIR}/git"

