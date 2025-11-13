Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8F5CD4F2F
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:21:15 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17898.1763014868218007833
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YF+KG39J;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-782e93932ffso335408b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014867; x=1763619667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iahveETeactFcVWqzB+vGxfrH5AgcenT/okFxd5Zves=;
        b=YF+KG39JkfkDPaSH89M5wNViZ7mkbnCfGZAt8OIBY5+9KhEcc6Eb5Eqw7rzJ3RTNDI
         vyuwsRp2/cp2tNnkYzx5cPXRMBX3cbRajM7DlQI/OEl/nRfMfkmirkOLd4sQjTpKPe1X
         uJ6Ju1eINgTvfzKYi2SaCPZqT62FFfkA0qQFl0HkXsbVuJATHUhatSvER7vz0V9Y8efd
         pmeshl26somM55VtXRwUsJ6PkD7AjU99hH8thK/zF4IC6V0Kbc2KwWAnSxHjATVwQcSD
         JZLdBZ+Nc4utnGsMSJicOlG3nfbXAHUxUdtkI6G1DLMOx7yrHi9OrgJMpb3cxDC0QRXR
         QeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014867; x=1763619667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iahveETeactFcVWqzB+vGxfrH5AgcenT/okFxd5Zves=;
        b=C0GD07zykr3aMo/6chlYIC/7Hv9QyA4jq08Kl6kArHbNh88FnFBswCml12uuf2+BFS
         YpVzCO2E465oE5BQk9FfU+wd6kVVjWaGrIRU3AC589omlEmnunZNT0eqB+g9fjZRfLgx
         DKG2/FahfKtBpeogX5Gop/GMV0lqfpiJrf3cwdYDdSa2xY2C5hku/aA8LB+9aUYn0WEt
         053c3NpgB5kpy4Fgsugh4Z8BsAoCsh7IXopsu4a0f+tlmIjz50kPqbAF1HJ2lR+iuKZy
         2DNz3Dm2Jn2sxc7lQor3cZd8SVPt7WDoBOD59w1zXaIcDE7OqVt4/1sQ3rpvAmYxh/ZS
         EJMg==
X-Gm-Message-State: AOJu0Yw0/sEVf4b0YlQIyWbdZp5Cw2M7xlh2SaxEO3l7n981Qv2mWEvM
	7jCmCdBhSHbuUuHZNXRAj8HoAH3dJ1q003gpiIY7pY1lZy+rJrhHwaKAfMXmyg==
X-Gm-Gg: ASbGncu6m8sZ8bqao/30UkzDGAA6iWnxChX8Q4YZqZWi3Gq7JBBqmFvgVpA4DXKiiWt
	OF3bzubVsyuFe9I6/bAmUoYuN+5blRpNquFXBV/nD/48CCo4+lzVP7FyyJhLgpBj7k5XPlQHWWx
	6EccpS1yKuI1uEyJDQ2qS8lnJj6TUBYQ7/cvPpO5ydkfw0zJR0HuVuIlG6yea95apE49xSxg8Tn
	IEaIaFi6yqLCYI+6JXUqfPGG9u9uXxseZdfATfYtFJ0QYOEdfuSqdCrTMdgxu5cQWyL9eHVTqSF
	wYlR2pUO60hJzJuh931dGdoQodg512i+QiGKBO2qBNzPtWSkHh4ZRydx+YP6wOD0Ql2D4RHpbaX
	CpVfviEwCsakUdFuafOgNZzsohm9cMAinibs4u87+tr+wPX5GwY8oKPL/tBtdtIz3QZA2kMpoS9
	Hld4qD9aVm5ee+YQPJcIwff1Yq
X-Google-Smtp-Source: AGHT+IFgCF7J0pOUv0cdrMBYnzO/VLiG9UCeNlqD0yn9AFIbEdzAoFOI6CuEQMeGEGYeTG1tDfXzKg==
X-Received: by 2002:a05:6a00:3c90:b0:7b8:8d43:fcd2 with SMTP id d2e1a72fcca58-7b88d43fe9fmr3834030b3a.14.1763014867503;
        Wed, 12 Nov 2025 22:21:07 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:21:07 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 34/38] redis: upgrade 6.2.20 -> 6.2.21
Date: Thu, 13 Nov 2025 19:19:09 +1300
Message-ID: <20251113061914.3756301-34-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121632

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/redis/redis/releases/tag/6.2.21

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-extended/redis/{redis_6.2.20.bb => redis_6.2.21.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.20.bb => redis_6.2.21.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.20.bb b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.20.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.21.bb
index 6eaf885f2f..e0bf92b210 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.20.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
           "
 
-SRC_URI[sha256sum] = "7f8b8a7aed53c445a877adf9e3743cdd323518524170135a58c0702f2dba6ef4"
+SRC_URI[sha256sum] = "6383b32ba8d246f41bbbb83663381f5a5f4c4713235433cec22fc4a47e9b6d5f"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 

