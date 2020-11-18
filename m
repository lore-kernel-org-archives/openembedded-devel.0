Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.29896.1605727311004967739
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 11:21:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R9CwOTGG;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: toertel@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id ay21so3239046edb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 11:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/5WZWEIcLeitEK3tHoxPypRgzDXjs9FlK7p+fk2zkjk=;
        b=R9CwOTGG3sm1YorBVzaCVhKl2T9INOupljenXmIdwclUQx6EPrSLrRCCf8JKTycn7K
         vQx1hJUjXGNyrxEVZE2WZHhfy7hbgwmkUZy6WOB+7iM1fAWEL+/HOspjJsM8lI5HJZEe
         Pd4BS5YNVg+eNOhc7SsmJCmqLBSCBjPrBTqSg5JwZVjO2BLlP4YMqGtd5ztGwEGOOXIC
         OrAZh4fyCxRVHhB0sQI5mKwuKaeehFQS3R6wz6KFh6bdtO96xwGud2nNGa/duGNllUcO
         a/bX0QNLLRKiXHjRGfXHC0Uo6AU6rgRLJIDKoocXokClEuAcLaYWcrMDt28Hivrniz2C
         fljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/5WZWEIcLeitEK3tHoxPypRgzDXjs9FlK7p+fk2zkjk=;
        b=KJyWGmU39w9Ae9GLiCEOwfyNLxzZwcFjWNegqZ6NalFy7gMfdr/rE1xnMgm1kC9MZT
         QXtEFojXa0vyDpwDSlgUQCfX8y7yuaPGNy67zudSNtwIZXXjsfNh8VbNeoNfa/miMT1O
         Zigt0xsz6Ul9h2MZ1rwSLqLNSgMvqIDaul/xEYwLrl78UAjtCUcXSPRFLRj/oFxTLqCH
         4u6+XkZpxpf5V8YsFmYMwCL+/lNqRB0CoIY7fc7bX40YjBynmW7C8L1bbUFKorlVSZSy
         LgLIfHvtiGGUijJhIrycXeeJW1NtBzPhyigD7mp30LFtI1xzN/M0cS8lJPErC9ZIO2pC
         nQlQ==
X-Gm-Message-State: AOAM533ywSDodAKOU5yMHz8+VwyfzUHZS18zy/d3LaO1YrJCvuCUB9Xv
	pjZBCZN/Hn1VSvi9ktCttMW54XKSEytpeA==
X-Google-Smtp-Source: ABdhPJwkBZBxo3inX6KtV8Y2wPL60GTHCPGutLhFHhocOerQdAmS2IpUZ2ReagOPNYqaCcv4dvgZZg==
X-Received: by 2002:aa7:c612:: with SMTP id h18mr26641524edq.27.1605727309304;
        Wed, 18 Nov 2020 11:21:49 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf387a00f80abb9ed0db1154.dip0.t-ipconnect.de. [2003:cf:af38:7a00:f80a:bb9e:d0db:1154])
        by smtp.gmail.com with ESMTPSA id u7sm2266197ejf.83.2020.11.18.11.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 11:21:48 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>
Subject: [meta-oe][PATCH] libsocketcan: Update to 0.0.12
Date: Wed, 18 Nov 2020 20:21:36 +0100
Message-Id: <20201118192136.991500-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 .../{libsocketcan_0.0.11.bb => libsocketcan_0.0.12.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/socketcan/{libsocketcan_0.0.11.bb => libsocketcan_0.0.12.bb} (91%)

diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb
similarity index 91%
rename from meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb
rename to meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb
index 917f5e684..b7a7f6f47 100644
--- a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb
+++ b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb
@@ -5,7 +5,7 @@ SECTION = "libs/network"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://src/libsocketcan.c;beginline=3;endline=17;md5=97e38adced4385d8fba1ae2437cedee1"
 
-SRCREV = "0ff01ae7e4d271a7b81241e7a7026bfcea0add3f"
+SRCREV = "077def398ad303043d73339112968e5112d8d7c8"
 
 SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git"
 
-- 
2.25.1

