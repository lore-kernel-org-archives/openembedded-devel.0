Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8202CD5B84D
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.132.1730140098687408360
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bdkkPgbN;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ea07d119b7so10532057b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140098; x=1730744898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9Lgz3psCwJSSIJWnUHVEdsl/dEzfR0X6fEKoJtuyZM=;
        b=bdkkPgbNJ9MnAfeLl9BgzKV6evuy+PVvHdwzTWsLcFp2f0c0obTs7pTJhwAf27SJde
         tdEojSU9QeSZarHIDAwQh3eQWk/YmV4U6e9nRY0W80sJsuxv8jDaxSUvEezYrPR461cO
         qcQksgCAXQ0R8wF7x36jQ+rT0tsFGsutFKjPskovoKMCxfR2T3WeIvwW/kMcatdNz51/
         wJB6uL/vzRHj0yWnvlvriq2fHtUcrm23GaP0twj5El5StOq+okprl/1aBPfZC9c7pyR7
         SyXYvbD+g1X6KUkWDo9z39Xdbk2fAb/JF56vyE9shj6NCjZLAgSzLaAJfXWc8Eitsb2g
         V8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140098; x=1730744898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9Lgz3psCwJSSIJWnUHVEdsl/dEzfR0X6fEKoJtuyZM=;
        b=W5YSUnFwgyCDu6Rgu1KCh0/IXH8BbZPgRZso2c0MIWMBaHUvCufxI1+XHoOKpqTP96
         hYiHHx+4A5wH3jy5WMXMJNwxkneQhD5CbLU3SLjKj+wCA3yPNOTwEN08PdlkwdqQu9Na
         /DY5ATdZLl/az5MwwliTLgLkHD51Ry1ut/5uHjTmzAwnbkpsfRKdR5PfNkQJeT3ScK43
         jB10868VXE4ZEq5N/WHgBeBwGesSEa3bMDK0EhlzpRC7ULLuGGllB4X9H4iTYRFjd8Bh
         1sH1U0UlT9SGUUfUd8enS4EVoDC9g9j1mcgGpnPO1dwEHzzCIcLvxTs1HpWP2K88YVu6
         E7lg==
X-Gm-Message-State: AOJu0YzNCNA5S3l1ej0hPcNk8yE7viYQwvnQI5X40VE5Trjkcaa7gwtB
	ZVMPSrJQ/5RjOD+vztplFwii4M5d0mJpB8WCYyvwIWRN7+dbWjwllwcI5A==
X-Google-Smtp-Source: AGHT+IEYHQrLZq7KU/MgbNUTuJOTZZOWznvTIrjSaTrS1HRa94fsUXpYLKstrrLHubaK9ndUZY8stA==
X-Received: by 2002:a05:690c:3206:b0:6e5:b96b:6de2 with SMTP id 00721157ae682-6e9d8b5d45fmr67666477b3.42.1730140097326;
        Mon, 28 Oct 2024 11:28:17 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:17 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 10/22] libhtml-parser-perl: Use
Date: Mon, 28 Oct 2024 14:20:26 -0400
Message-ID: <20241028182749.5058-11-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113278

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
index a3f287dce..64330ceea 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README;md5=b0459e4426b94753b9a9b8a15f1223b8"
 
 DEPENDS += "perl"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTML-Parser-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/G/GA/GAAS/HTML-Parser-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "ec28c7e1d9e67c45eca197077f7cdc41ead1bb4c538c7f02a3296a4bb92f608b"
 
-- 
2.43.0


