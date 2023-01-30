Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D812CC54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 05:09:15 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.34503.1675055354656583329
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 21:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HpcujjhL;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so10014898pjl.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Qz4J3CIe56/B8Re+AOWC7+G9O8yYsbBSZkITDqqEnQ=;
        b=HpcujjhL219RfHBiDMK8gsgbMbbFlYmXTjWOrE8E5kNQnrAA6rqCXrtqDdJK3AEaX3
         Zcj3oEepZ7S1m6hTxiiPofjhQzUQ3/E3/oEP79Ef7+ksDc0v5hvO8SJfj2O02smljAcV
         95b+oeCDqFmB/qc+Ji+u03RkVKVSv9Fyxi8nPgupQa7No86a4fsVMAIerETjE60iIGi+
         mOv8c1gvTZ1LkFoApTM/O6mir35sQsOUhWvDDW9cZyrXfAIsAh+KBg0IWlUUP1XygZmi
         qSYwA+iwokoKhvBwdR1B7ACyY5C0ODN+Yi/J0bmeXCP06Quvx3ORuStqf9khlWeKVjEQ
         Bgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Qz4J3CIe56/B8Re+AOWC7+G9O8yYsbBSZkITDqqEnQ=;
        b=XaqfXs0dD6/ZB4ekdTd8C11SlZ5QjIlCH9wS3ld+BXDeOdh9eVN6ALAjj0OiebadBF
         FnN+C2Y3fL8RB1LH1l0o1SUylSTbD5V8vDDqHRnX5QFuTapW0KkaBVT306D1adQ+g7Bg
         lLL0BsEjfsT3ugTVsIHxW46y4Nb/kWiMUHPwlBOkw7wYHmBQ9CdYSTzdqN0minhQo9gp
         xb4KaOHJ5ih7B1koW90AfLcp5VtW+E8CqbXC43aIgE16+JdqTGozZmFUYXDH7Y8BKUcw
         zIKjAoSHsIUBW/yzkijhYwWc7dKUA+F0r6+jnJOBSSsLmEQP4ZqfyNspW1XZaADHkqXs
         XiDA==
X-Gm-Message-State: AFqh2kp6gIXv/5WqiZHf0GqEul+Ys8WrZoNEq1nk4N246NxNR8LORRIm
	ceQp5f2tgNYvej64S95HYgt+aY+AmknKNw==
X-Google-Smtp-Source: AMrXdXuWe/IY9vCB/EcNWASL+LZOvjaFbMBEsa3vSr6s5ZQTwmwTxI8390G8QUKrC1nF8tUD1JpoiQ==
X-Received: by 2002:a17:903:2c7:b0:189:f7c2:7245 with SMTP id s7-20020a17090302c700b00189f7c27245mr52727782plk.45.1675055353778;
        Sun, 29 Jan 2023 21:09:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id ju20-20020a170903429400b0019493c84880sm6671467plb.188.2023.01.29.21.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 21:09:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 03/12] wireshark: Inherit python3targetconfig
Date: Sun, 29 Jan 2023 21:09:00 -0800
Message-Id: <20230130050909.133727-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130050909.133727-1-raj.khem@gmail.com>
References: <20230130050909.133727-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 05:09:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100847

It uses python3-config during build to grok the python specific
includedirs, therefore its important to ensure that target specific
python3-config is used, otherwise currently it defaults to native
python3-config which ends up adding native python3 include paths
which might work out ok but is exposed when target is 32bit + lfs
enabled, the headers don't match between native and target python

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index 37faa68bea..693a167938 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "881a13303e263b7dc7fe337534c8a541d4914552287879bed30bbe76c5
 
 PE = "1"
 
-inherit cmake pkgconfig python3native perlnative upstream-version-is-even mime mime-xdg
+inherit cmake pkgconfig python3native python3targetconfig perlnative upstream-version-is-even mime mime-xdg
 
 PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
 
-- 
2.39.1


