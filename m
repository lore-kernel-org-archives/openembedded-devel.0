Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web09.1016.1606889986482971809
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Dec 2020 22:19:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z4SI2OvP;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: uvv.mail@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id u4so306793qkk.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Dec 2020 22:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+KVeMECfx8R8Y6IceJut09KYkyelvLr760fNu8cyN58=;
        b=Z4SI2OvPXj/fjmi6ZqpWz7Doa6pBUIW5QSBbWKgxknE26XEYC7rUD6g2QrwBp8r/hG
         F8OuM1W2zOasyfekfaM6HoVaZDEA4b3USW3bsT0BbJS3l6jLkKLmHKWBrJVAl7lRFlHR
         l6H9WryDNkFlimE5V3g52DuJILVlwANTvJRC/TboDxxfyNPUx+eb9mi7evpa8W+UxUGy
         h/65d2fBJ6DKNOCLpm1Q63462V9ZKZSxpXhVwlX9kfAV7KUMAta3Bm0EDRwx1NqggaS+
         hEQcX5bBwEEQ1JRVhhhCIpxogPrTGWFliKHnuuUUOQCx+Ba6rjwPYHn88BiOdegaFjgZ
         8fBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+KVeMECfx8R8Y6IceJut09KYkyelvLr760fNu8cyN58=;
        b=ak/jLsX+/Mk3E/EYtAC33UuuxA52XRm798OPGsQGV0V15Zk0NASdwYaxGU3/dE0vsl
         yqNiVLr2r1JxtG+78smH3P/iCvi9CQnKdUuIYfEzwnDKuyfVjk/yao5NDkf0xLtjST7L
         fSPr+KxX05Ed06FoLt6jjSMQCSW4Lk6xUAT8P9FBWUAzIXKxD2qVVyVIi9iGWdCO77Nu
         GOrIoEoqEHELoQGcGoPMaUNMW7KXwg0erlYp8kpZ6Capxv61wLVhpeq5gLQBgzmvHB37
         KEM3Hq+ChHP1f+FpH/V4naKXySo5q4soB3wUEp8W1NhxumS31/45PMesWRPX7j4n/PZR
         z9uQ==
X-Gm-Message-State: AOAM531abeHagUNvfDgSO0TtoiKPGsCNGm7Z5Be3PBTH3rwUZSSoi9ph
	4TbXkMFmNkRgO7gOrEdezIOTjU0+uceIcGpE
X-Google-Smtp-Source: ABdhPJyhYO7rJepLxX8Bt0jxXAlz99QpqJ0kGWF6SeauXNc/Fsfy/TWyjryP5azBsCtInsBOSMAOwA==
X-Received: by 2002:a37:6445:: with SMTP id y66mr1092064qkb.100.1606889985515;
        Tue, 01 Dec 2020 22:19:45 -0800 (PST)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([37.120.205.149])
        by smtp.gmail.com with ESMTPSA id e4sm806115qtc.54.2020.12.01.22.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 22:19:45 -0800 (PST)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [meta-python][PATCH] python3-aiohttp: added missing RDEPENDs
Date: Wed,  2 Dec 2020 07:19:18 +0100
Message-Id: <20201202061918.71606-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

aiohttp implicitly RDEPENDs on html, json, and socketserver modules,
which are part of python3 recipe. They can't be properly imported if
they are missing from RDEPENDS

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
index 6cd5a4cab..c98e3aee7 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
@@ -13,8 +13,11 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-async-timeout \
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-chardet \
+    ${PYTHON_PN}-html \
     ${PYTHON_PN}-idna-ssl \
+    ${PYTHON_PN}-json \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-multidict \
+    ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-yarl \
 "
-- 
2.28.0

