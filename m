Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6449.1794046338200010540
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 02:12:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pdAgZO9c;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so1912877c88.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 02:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046337; x=1794651137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DReucmgYA2fNUAWL6IIdbGqheg7QCiWx5IDrE+ZdSJg=;
        b=pdAgZO9ctUpgFRP+8cAaWJFY8lhtYXfs3u/nOE9IpPWZg+m9lfwUM++Rp0hGxM85M5
         hpBwvJ6BktVWex1d5rkt+DqS4OGTky7bWpk9N7aaaAir4m8x3WBKBtQlqjiGl0a1b4O9
         P0VDEmd5oPpo5CVLu7BmVkEAYPpwh17nnB4sdKhGjAzXc73YOJaSv0qr1CDu2uZF9Vt3
         C94l2PGTahPyYs1cBtsIQTChfRTTejDRPFglDfWO3DT0zh3zGp53O/UVHXOfzG4rOUyj
         FUaEYzWjkw0Oy/tvP1F/OQGlGlHZm6020ttaYa7lrHYQFt27pP6TslERkda4+YHzwDoc
         yYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046337; x=1794651137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DReucmgYA2fNUAWL6IIdbGqheg7QCiWx5IDrE+ZdSJg=;
        b=P99ZTgyhY1c9xgUVVU7YNgvcvRSO5ONspuEaZ08p2WmjShziBd+P/jnKYUugANM6AT
         42mgDRCtZMtmSjlq6M38ZIsFn6/manYLtObfMfGnPt28m8r/uYJ9VIPTaOGobmJSl+vT
         0XkMQ0+OsFmYSxdw5Kdiz7FDY8lprHkv89Ucfg5KTBkV5ErfkW48I36942emkOOFtYzX
         B2zziEFhk6X2luYXB1BMeZKC+hj+uDqoVscQTli60dgEbQxwdcNMR5xDurkoEVz4Xxq5
         LDZce48/9SU5Bj5uCiIMBQNgZ3uq/38tS5ZzRIjmtHQ6uaalYDbG4jL5eKKH3WtkgJI0
         8oVg==
X-Gm-Message-State: APuU4Z9+gACCWp9VrjFbKuw519mIpp3z6YJ8Lkpg7eiXlIucnVbM4ac0
	lLSPaFP9uay4fbdnaGVUutv+9/u4Zb+XTJZc/9PFJDEE4caXUWBqAdhvX04+uA==
X-Gm-Gg: AYBFou1bFQbz3tI+z0hp2Iik8fQuivO+7wb6hMGtuxnozguylS+vm1Gslp72NG8DVdE
	hIlLZMqLuYNqjK9KqV4JGslKYfFpHuKn9Um4m3SAymCu3KMBocfNLP29/xssuhGkNaZBSx6pMVx
	nTQNqdxNQc1eSDq3P3k9uqAGi/xg7K+2xNoCifqguxbC3aY3ciq8TbRq2jU7FbEfDH0F4CUJhDI
	xlOyaRkaEYhuzPLtxK0U52rSgmJEh4mpQNdMUlnb/ziU8HQ5Iq/OU4pkFfW7Yai/SzWCalHHXkW
	q75sBjsN+EuEaXCpYw2b3IOF0PR97rUpPVofx6htsGH/19CtuqWlvwrXcUQLWnG5Py11NJvoPmK
	WL687NER+0xoIfFcT74yttClax8QceZ2DrH1aI1sD2YuFzh6R+rEkElSUI/A4gNyqdvJnlM82fL
	ZGql3aRJrgEReRn3M7157EheJ1TkXIayGKkLoI0TLHr92qdk+dFRkXHJpq7hUerEAEJRgFGgVRt
	/mB6i9F7ZY3APZqezCBTipHZnnlcVx9NNXE8tPivEAaB59WloLJdkpg+5cOlJUdTSU+3z05gwnL
	/jgl+tm89Y29cl4QZ+QoXVBemt+waBEMaZPWI+NXGB35En6vjCQjCfvSC9pgxw==
X-Received: by 2002:a05:7022:7f04:b0:1a9:cad6:5b58 with SMTP id a92af1059eb24-1b25d3650f3mr7149928c88.39.1794046337494;
        Sat, 07 Nov 2026 02:12:17 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm22856467c88.5.2026.11.07.02.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:12:17 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 9/11] vnstat: upgrade 2.13 -> 2.14
Date: Sat,  7 Nov 2026 23:11:52 +1300
Message-ID: <20261107101154.2992152-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
References: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 10:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131983
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/vergoh/vnstat/releases/tag/v2.14

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/vnstat/{vnstat_2.13.bb => vnstat_2.14.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/vnstat/{vnstat_2.13.bb => vnstat_2.14.bb} (90%)

diff --git a/meta-networking/recipes-support/vnstat/vnstat_2.13.bb b/meta-networking/recipes-support/vnstat/vnstat_2.14.bb
similarity index 90%
rename from meta-networking/recipes-support/vnstat/vnstat_2.13.bb
rename to meta-networking/recipes-support/vnstat/vnstat_2.14.bb
index 6c324ddca7..0f040acc0c 100644
--- a/meta-networking/recipes-support/vnstat/vnstat_2.13.bb
+++ b/meta-networking/recipes-support/vnstat/vnstat_2.14.bb
@@ -6,7 +6,7 @@ SECTION = "net"
 DEPENDS = "gd sqlite3"
 
 SRC_URI = "https://github.com/vergoh/vnstat/releases/download/v${PV}/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "c9fe19312d1ec3ddfbc4672aa951cf9e61ca98dc14cad3d3565f7d9803a6b187"
+SRC_URI[sha256sum] = "8ba2119b3c6f780775135f9c9fa7236867da67e2f93649f1313319b9cf48f87c"
 
 UPSTREAM_CHECK_URI = "https://github.com/vergoh/vnstat/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
