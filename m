Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C06ACD98D2
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 08:19:05 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87541.1781338739595005314
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 01:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NMIkQTkj;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0a5354da1so14948655ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 01:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338739; x=1781943539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE6q6wd9coI9oVIPHvAYDhTwkUDle9lN3qvZIU0JMuI=;
        b=NMIkQTkj0VAv8xx6GtUPdSwd6wH4g9j6fuyN7OXNdh416NPACc2yuV5V60STdI8mhZ
         n8oY2q9/4GWMn569WU2VKKuDNtTQl8BrY7pbpj0+iammv+TewDg5MQOHXOxa/UXHQrzE
         zIxmjKRH0gV/2amJ5kEMUHcv4OX7d+cPf+Hzkd/KzYTKZOEdjfz3sCzZyZPsZZeaFi4y
         W8whjSfzFfQKBh0LlOhh0T8LYQBHBn0Pk1Rn68zPFd3aFCyhqipSa8QKMBwwJvHgW4Uj
         D6cBReiVlV9tV/1DV1nAl2DBXwmamzsoqOoCWMBojbXFu2sJeGxucDS5XR7paJPVhdmq
         O2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338739; x=1781943539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sE6q6wd9coI9oVIPHvAYDhTwkUDle9lN3qvZIU0JMuI=;
        b=WCMz0yJD/RvGfw7rDV63txw8ayKEBN5OkLWXyWzFPGxk3jVTjGP4X2KyGhGrMvXV52
         v930z/PPq5p/qT0XF6HF972+HtdgciVrP2mMXH2JtoMCQX7RqvL91WAua5laadvY/W87
         dvmywWbr/dfXrfa1gs7ZA/1FoQ7sOHuZ2CyCdkmYcp8bZTwiDHkHIDtTHcQ6oYMLFjKs
         5whelkr5ZJh9bO4Y1viV1G9Lf1J6W5S1SCFKJNpRryurNt6MXTcLHM/Ny05wSaRtHcqr
         CiOrRrGEdYa4G8tmUvuUURGQzPDHSOkXf2iTeP+BF/OfziHVb3PZeQ5WcHcSD3jyK4As
         U+4g==
X-Gm-Message-State: AOJu0YxNCkhaphRqnfyxGlmc+QtitrwSbwMtMxlelE/uxioUVziIDCLY
	1f2cVLLFpTu/w67jUj8UIC49x4I8vJa+57znUkvYk08jJt9+jnevKKBGsbSxzVbA
X-Gm-Gg: Acq92OE2Vyzz2ue0AQDDdvk3Z94xXd0ftAj6nZJlJUCHkZ/Fa9vhRBk7VHNtJvBgS9W
	HdHl0NWnp4bUJv+rdRWlaGZqHn8szSSzVHtL7dZK+O5fzQNdFH1FDkXRt1RDxe97Lmo2fOizuom
	4qfhftZnHjk5nz1/XxzWtD8cmcoL6HjvpbNI6yWsLptXtExlmVTW/i65BQ+DdU7RlXGYdMWFvc7
	pdEP3Y7nrJsaIX8aWjWbtUXnUE8Hgjp4vu/t9+lhUjSNWufEbKfVyx82GTiW+7YVVdGmFg7vVC4
	TmMIKoG/vFlM/rlVyUl8yMtD8WuuyG1zOP99sQMjcpdTrouASn4Xoyns9p+L+M6Ww8AqWoJbz2S
	ZCtcj997GokYhLu7v9jYu9ISCCquU7MmmyM5YisJoL57XuWt2byVujs0HPHXFA+t9MJmRV64iUN
	o/CGR+FbVb/fFb/VYJeXfwTGllghAl46njuPMG
X-Received: by 2002:a17:903:18c:b0:2be:1eb1:eaf3 with SMTP id d9443c01a7336-2c42e44c50emr45423855ad.11.1781338738972;
        Sat, 13 Jun 2026 01:18:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm43885095ad.0.2026.06.13.01.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:18:58 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 9/16] memcached: upgrade 1.6.41 -> 1.6.42
Date: Sat, 13 Jun 2026 20:18:17 +1200
Message-ID: <20260613081824.1223609-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
References: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 08:19:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127561

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit aab5fcaf7983875b9f9e84acea56891e755aa536)

Release Notes:
https://github.com/memcached/memcached/wiki/ReleaseNotes1642

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../memcached/{memcached_1.6.41.bb => memcached_1.6.42.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.6.41.bb => memcached_1.6.42.bb} (95%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.41.bb b/meta-networking/recipes-support/memcached/memcached_1.6.42.bb
similarity index 95%
rename from meta-networking/recipes-support/memcached/memcached_1.6.41.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.42.bb
index e41ebdb171..28d8ba3cf9 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.41.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.42.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
     "
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz"
-SRC_URI[sha256sum] = "e097073c156eeff9e12655b054f446d57374cfba5c132dcdbe7fac64e728286a"
+SRC_URI[sha256sum] = "50f08b879d4f9d36dea9d905e9eaade15c708e38db7e9a73fc21dc8b45395de7"
 
 CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
 

