Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.13898.1612653438161939245
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 15:17:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W49gRiBO;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id k22so1142629pll.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 15:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Mu11dPHWCCjmnha3Uv9U8mpnGxhSAudvWTZzGIdQLyU=;
        b=W49gRiBOQ0Uz+Wap71yujGnBixedXAz2MPn/wWmr8kOtvzhwDYbqn43BUFm1IL4nVZ
         nZpM/PiqxMnzVLhDwOcYxxiBrl/LX6s8vLjC6KoZjc2CmLPNIlo3A4UF3rGMtixvXaaz
         jnAFC4CLYO8UNSKs0dt8/m1gijK4w8W5VNo972dodRk2OYkW2L2EfOJHUZSj214mJq9Q
         ngUGAP/Vrl5EdS/y7CFjqwC8qLSO6NofZsVlVwraMJgahPBCxcNUz57rXuKWn2ajAzHb
         4hujHdUJZSyTlFM9fqvoexm1daPfo2wDWBV9/MSvH7/hpt3dJwQhnvSSVL5m+IZr0R0U
         iSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mu11dPHWCCjmnha3Uv9U8mpnGxhSAudvWTZzGIdQLyU=;
        b=CZET5AlGQgxFCqWC8p500KdYDwN6ORFfM+VhNMtelpqj+LPzXNfS+98fqze4srwA9L
         2mwxZe6ITlfOszRtIGr1R+b9uUsqtM4CryOiKtNQsz7PW9xHc+JPi5SJWKzx18xKn+G8
         maN8THQ6DYDh8V7NUK8U/9NyGlBtfcURaATTU3sCxSDTxsUmH6XqIi72fAX2HkBjmj4s
         vdfxH0OqxtF4nfvBqnNAMu1JcWDEU4Z+HSNenEQz9fdz7QuQ8p1ZDaPyEpWgOriwTV+t
         +1ThucD8vru9uhRA+3R4AlqQKAk0LgZL8zNknjfF5mKweAbclt6kE9b/xL0QO0JAr/Q5
         pFlQ==
X-Gm-Message-State: AOAM532tgU+gXdDu2vvVoBt4jD44jcX5WMQQz6jCBqj1BlcZAdFaq2LY
	Ix3ksbt6OlS3IiMsosZtpw5qlGze7ahhRA==
X-Google-Smtp-Source: ABdhPJycHKJTAxfnZXoVjj6ywQJKEcVwpxwt7Wlg159suUWuG0QW7rAMGf5rV8XnpF26ivukc9B6Og==
X-Received: by 2002:a17:90a:8d09:: with SMTP id c9mr10438241pjo.92.1612653437635;
        Sat, 06 Feb 2021 15:17:17 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c5c4:f80e:4f44:b02e])
        by smtp.gmail.com with ESMTPSA id b65sm14331882pfg.3.2021.02.06.15.17.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 15:17:17 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgargh 08/10] zram: fix sourcing of zram parameters
Date: Sat,  6 Feb 2021 15:17:04 -0800
Message-Id: <bdb79efaba481b2d9807eab59df04fb67e5277dd.1612652802.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612652802.git.akuster808@gmail.com>
References: <cover.1612652802.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Søren Andersen <san@skov.dk>

Signed-off-by: Søren Andersen <san@skov.dk>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3c8ad9192c1c9f4323bdc7ff28456f11db689adb)
Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta-oe/recipes-extended/zram/zram/zram-swap-init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/zram/zram/zram-swap-init b/meta-oe/recipes-extended/zram/zram/zram-swap-init
index 0643dbca23..ccc3aafe3a 100755
--- a/meta-oe/recipes-extended/zram/zram/zram-swap-init
+++ b/meta-oe/recipes-extended/zram/zram/zram-swap-init
@@ -14,7 +14,7 @@ fi
 ZRAM_SIZE_PERCENT=100
 ZRAM_ALGORITHM=lz4
 
-[ -f /etc/default/zram ] && ./etc/default/zram || true
+[ -f /etc/default/zram ] && . /etc/default/zram || true
 
 memtotal=$(grep MemTotal /proc/meminfo | awk ' { print $2 } ')
 memzram=$(($memtotal*${ZRAM_SIZE_PERCENT}/100))
-- 
2.17.1

