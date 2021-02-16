Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.2367.1613440713034236303
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Feb 2021 17:58:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gsAJXW2S;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id z7so4673923plk.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Feb 2021 17:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BcE0fwXcOfLNoECQYaKNzkurDZoaH0uXK2JwkKUHFwY=;
        b=gsAJXW2S4v4zt/As8OvwsaBCvVwlAvh2fqqGlhHT2qgPzTV7Zog7rvciN0n3d2i8ud
         vQsvsgNNZwGdF4P87y6WNhCg5rckqARSyQzipubSmfwx5mfNqqZnz3+bXBM8h5/aQ+VI
         Lz2cVUqfV3pxQoPte9tO0T311KpMHeX/h6lbjvFtq8U3lv71Yr3gqTZNj0S+TUHbNGhh
         YlojiBcNOIuGHTNAkO3RuEvXIm0AIVAvw2O0rgF+rA5GpBLSXvj2J6CHmtgP0WGrFKKj
         PymqfV7kyPJbfZ2dPbPjjphx3uxE0KP6rBcZT4I7FXJcWITHoP9Nxj9oYxOyW4wwQd8g
         UK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BcE0fwXcOfLNoECQYaKNzkurDZoaH0uXK2JwkKUHFwY=;
        b=mseIGBsFRQJVLaF3Q73CR4nSjV8HI2xJV04fDfP4e/3vTUGc9vjHp+Z1hj3GEsx7i+
         QIJxaw6s2zRhvzZRCiSAM5zCiPjGQxv8jskoojwPlCGbwSGitAbnt62lkEkJGXdTfZM8
         C6UWoJxTx9hxevmSNXNP4chB3HA8qT5kD73qhD7xLh1i1PM48IaGggcFrvgKz/bckE4G
         1k6dg29SA8Q4gASp35oq4i59JlU4AOJ+z48Sy/Ghs2fvM4rBKgFT5xTJnyVzz17jCUVY
         /JJn9spfZ3kW6x2zMlN/mTPoA+JftiCQPZrj+R7n3WwRZh7nUuoB/4VH9b9s2mJmkhxI
         ldXQ==
X-Gm-Message-State: AOAM5309xEeF1VPI7/MDSO/D8rNURxkNRlZ+IoEfAPzwQuVFwdMdrCah
	w4DNZrjdewUhsICK1SKYj4YJtMwWXKtGQQ==
X-Google-Smtp-Source: ABdhPJy+Rd9oBnHY++LtiwlSPzi7gsIB227pjWRokRMJW2p+qP1Sroie3NWhUMnC3i3fyzxWfmz/Jw==
X-Received: by 2002:a17:90a:3905:: with SMTP id y5mr1647137pjb.203.1613440712526;
        Mon, 15 Feb 2021 17:58:32 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3567:4d62:c82e:b7f7])
        by smtp.gmail.com with ESMTPSA id c24sm19756159pfo.209.2021.02.15.17.58.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 17:58:32 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 10/11] dnsmasq: Fix systemd service
Date: Mon, 15 Feb 2021 17:58:18 -0800
Message-Id: <0c87ac59d732b2188aeaa748476757460d093262.1613440394.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613440394.git.akuster808@gmail.com>
References: <cover.1613440394.git.akuster808@gmail.com>

From: Mario Schuknecht <mario.schuknecht@dresearch-fe.de>

Systemd service file option 'ExecStopPre' is warned and ignored by
systemd. By replacing 'ExecStopPre' with 'ExecStop', the intended
behavior is realized. The 'ExecStop' commands are executed one after the
other.

Signed-off-by: Mario Schuknecht <mario.schuknecht@dresearch-fe.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 55c94cb3196f53d0c1c76bbd74136d1b5d51802d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 83842c9150fdead52dc7b0913ffac32677720f98)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/dnsmasq/files/dnsmasq-resolvconf.service    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
index 2980f7def6..ef2f3f7e41 100644
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
@@ -8,7 +8,7 @@ PIDFile=/run/dnsmasq.pid
 ExecStartPre=/usr/bin/dnsmasq --test
 ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid -7 /etc/dnsmasq.d --local-service
 ExecStartPost=/usr/bin/dnsmasq-resolvconf-helper start
-ExecStopPre=/usr/bin/dnsmasq-resolvconf-helper stop
+ExecStop=/usr/bin/dnsmasq-resolvconf-helper stop
 ExecStop=/bin/kill $MAINPID
 ExecReload=/bin/kill -HUP $MAINPID
 
-- 
2.17.1

