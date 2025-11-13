Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E317DCD4F4B
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:21:05 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17729.1763014863770853293
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:21:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TnP/E7nn;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3438231df5fso480076a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014863; x=1763619663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeeA4gJUmQmmQrCsidfvAWF2vDuXwDxvFBmkSn5YrQo=;
        b=TnP/E7nnqKDG1F/xiIUQuzpimZstQ/2/MOZfqpe0nXuqCNBmJaRZF1QYGE1b/PRImj
         UlmN6MJGrZXkcqCCJu8434UJdlve61pvu+1YUD3qps8wr1LJE+g4mCre1gUkHwkj85QA
         t8HJbWBK5Lhl+9Qpy43Tp7AQpa0oKRagPkGgnVZWRUoQFc77kucDLlZ2zzASBYc3osoi
         z5SkFj5wnPM6DpxxyvMbGvpRnqJw8FVVpKsbA07HEEXdQgNsXG2a9zpOd1IaL507LrQi
         39XDLzajF7JBh4y8D6MId16X/E58lOkHkxkNEiO6+EKAplAm/6DYGn3n5Nj6fnOfp5Ir
         cigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014863; x=1763619663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LeeA4gJUmQmmQrCsidfvAWF2vDuXwDxvFBmkSn5YrQo=;
        b=onrQ87VyLxcPGZ8QfLCVQ6DUfUqrm+BuXzR68wZVhZn/Ve5o3fdqppv8ooJypMXoJg
         M3RSQJwyHKwMbv4aqMhK+TJ5GzVDf/jPZvNlOcJMnPfdVLPzi5xCIp4plXHUav3/nAHj
         tHXjhR1YNHSbRafdCVhWGtpmwbQ6PPVLeMAhf3XSXFaVdJjIcXtvUY2eIgTCAa5eoUY0
         OntoEkFs4wduMPznGxu8IZC7jC3fG0YS0kUTCIFgZyp8oK7ZhHFmUofamC+l297AQ4Ij
         I51avifZuSITeBagvDh20UwpxIs5cYsGoH5mJKCGhXlLq24erEtLx/WfnadzpDVheg4Z
         YqDw==
X-Gm-Message-State: AOJu0Yx5QaQg0z6PMPhEDUuZdyOxBL9qAOqyo+NOy3jVAAXngQWdnBiW
	48oyzBDTcFnAhSlHY5v6Z9/YnZtU0liWVbHDXENcd8q1p/U838wz/w7e3XgGQw==
X-Gm-Gg: ASbGncve3X4xzQvb0mzS2IhbulnQvVa+OdiSEdVI1bu2uZdSkJnwEv980HIKuGbQuw+
	fWOTe8Cc97FQlCNxRNkPRJD8hGfSxiG5ypherJWNDTQecx/GDlFgV4xaJ4WLq6xActRepicR6VE
	PFeT7Ko33+TvXCLfVceeqAAbf3Ywp5PgWYhNYkhAg6BcwmSoK4/Ka5BLlJs/FhZejFYiedM7CDz
	KbcZHVBBu7YhBXOKrfIYd8EjU0Zd37BVmZZWArLmq/8axDiZTItP+HCCdXs6HtukbpYEymvYftn
	Uxd19UB4QXhRL5DC1BhUJGRJEByF+AzqxUpz5i8aNMnNSvuok43GuLRRR1KFQkDVXfJLWsXrAsS
	OXrxSEyFdMa2B3KOt0/q27gpEWxecczQAgvpZ8MuR83IZc9hoRJU4k7mcOZU+Ky8adN5znvh9gB
	eQGmWWvpDBVlR7kQ==
X-Google-Smtp-Source: AGHT+IHa59v4EGOxSwmQHQRK1Lt+7dY9duMuiTu2UJYUCzlg2hF80VDK2Nad4ZWpN4G52YeXZKQ7LA==
X-Received: by 2002:a17:90b:3943:b0:340:dd2c:a3f5 with SMTP id 98e67ed59e1d1-343dde10b89mr7435733a91.3.1763014862901;
        Wed, 12 Nov 2025 22:21:02 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:21:02 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 32/38] redis-plus-plus: upgrade 1.3.11 -> 1.3.12
Date: Thu, 13 Nov 2025 19:19:07 +1300
Message-ID: <20251113061914.3756301-32-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121630

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/sewenew/redis-plus-plus/releases/tag/1.3.12

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{redis-plus-plus_1.3.11.bb => redis-plus-plus_1.3.12.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis-plus-plus/{redis-plus-plus_1.3.11.bb => redis-plus-plus_1.3.12.bb} (95%)

diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.12.bb
similarity index 95%
rename from meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
rename to meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.12.bb
index 3e757e6037..714b991ebd 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.12.bb
@@ -8,7 +8,7 @@ DEPENDS += "hiredis"
 
 SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https \
            file://0001-CMakeLists.txt-fix-substitution-for-static-libs.patch"
-SRCREV = "ad6baa121f4c6fbc7622d83d606210ac22549c78"
+SRCREV = "92c2ab31197eb5ec0a41499fd135352b5c4156b0"
 
 S = "${WORKDIR}/git"
 

