Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.3467.1608847387240033803
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Dec 2020 14:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AzRmFhON;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id q4so1781074plr.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Dec 2020 14:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=887vp2Yi4ocHE+Iye7k/R9zSsUbJWlGy9AMCJcXOTIA=;
        b=AzRmFhONDB+ba/JsNy6AVt0FDH4/nnm7tg6pls8PyJoiysjQYoFEiMn41mlg+qDlkk
         cOZW0I1QKtBpD5mEMgkrPVosyiCrA4EPL+5Wv7+MmDM3SfUmkK+9RCe62ZLtlNhiWNuV
         J8Hdrnk6+CIhO7IzUExAh9EsoDeGJwIUJbhd7ucIVu17zNPHzimVLRwdRRSvw2dqEL3k
         mVAQz9Bu3y2UqRzrtDA1pwe+jtKyj8TAR0f1sIkibDNgEh7zVXL8lBdYdld9welEswES
         yhlDTlPYtUsslycz4UE2aDCEf8bgwJAN+QCnTL6GsFqO5/4W7Wm+kmFCHO8FynW6aODV
         S1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=887vp2Yi4ocHE+Iye7k/R9zSsUbJWlGy9AMCJcXOTIA=;
        b=d03Sb3fAY65HWoPUsFsQdN4PA4lir6jVQ0lBdC6JkCDYrGwfnmiuclC3vTTtAt9U7S
         e+isqJAQplWquxjbQOtksp4ciuQTZAaQtXvzyT5p+hO+QMXqWXjoX3dJCJIxi7GvyadD
         uN3OZS8hGVC6vfHmd/2u6ebwflizRcKX2v5Mw+D9WHIQ5X/lphfgGdKUNKGFeskjyP9w
         WEMv48l9WkVZdtIj/stOAi8xn+gRZzJoNARiZV13VXuxhj4c7rdBroWCAeM42SMsGHFq
         wrdathsJutF5RDwgBr8RXHrWKanJh3vq0GK+7XY3EPuvj3fmvEV6mDXvJEhuHE5VmtfR
         vaaw==
X-Gm-Message-State: AOAM533N2WDCEUaRPQmwLG0+uaR48Bdc8ox1OKO+31geJbTa24PrM8oR
	8raafm9tL0R2CxvzAkpWcfb0+8rnGpUFfg==
X-Google-Smtp-Source: ABdhPJxRl+hhH1aI++VBp5xdMtwFqaZCr8FnEafOG0IhX41g+qGbdB395FDFvG3pRXS+iqdw7nKTlQ==
X-Received: by 2002:a17:90a:2b88:: with SMTP id u8mr6088400pjd.161.1608847386511;
        Thu, 24 Dec 2020 14:03:06 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:164:fbbe:2531:3c5b])
        by smtp.gmail.com with ESMTPSA id r14sm22256953pgi.27.2020.12.24.14.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 14:03:06 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ricardo Salveti <ricardo@foundries.io>,
	Khem Raj <raj.khem@gmail.com>
Subject: [Gatesgarth][meta-networking] wireguard-module: upgrade 1.0.20200908 -> 1.0.20201112
Date: Thu, 24 Dec 2020 14:03:04 -0800
Message-Id: <20201224220304.26603-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Ricardo Salveti <ricardo@foundries.io>

Relevant changes:
- fe40226 version: bump
- d0bf51b qemu: bump default testing version
- ce8faa3 compat: SYM_FUNC_{START,END} were backported to 5.4
- da5646f qemu: drop build support for rhel 8.2
- 99e954f netns: check that route_me_harder packets use the right sk
- 25320ac noise: take lock when removing handshake entry from table

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 666a8b94a34c0248b02f37136ae052ca36e6b428)
[Bug fix only for operational code]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-module_1.0.20200908.bb => wireguard-module_1.0.20201112.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_1.0.20200908.bb => wireguard-module_1.0.20201112.bb} (96%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200908.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20201112.bb
similarity index 96%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200908.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20201112.bb
index 4e3f3deca3b..c540445d7e7 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200908.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20201112.bb
@@ -1,6 +1,6 @@
 require wireguard.inc
 
-SRCREV = "d97b575a47fb26f27965bdc9e537c85f86165e42"
+SRCREV = "fe402261666821514377d06c2c68ed9bc19e7634"
 
 SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat"
 
-- 
2.17.1

