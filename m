Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.43424.1589813422937292546
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AS2dhKa/;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id y18so5060407pfl.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AjIhZqYdx6Irr25qG4Q7GhZlKNclpkiABLa1j69zvnQ=;
        b=AS2dhKa/JDaoirrS50QjqXkGpM1zU+nn09L6Zo532lLp8ekCUqicuEwrk28+LIxVK5
         eCFIxchTJi/D9EAxvqo3MSo2xUy4wQzKn/41vCHXJYfFdq6iy15VVfQTVf5MJwpq+Mwu
         W3wON3XnvKKfgAiERIGjl5kvxQiQXEZbZDNBNwV7pzmoxtApsvajEpcujiSO91hBV87m
         Lvgr3lDbxmfW/Sz5yqd7wWVe0LLl+1cyaemNzovp7M4mlVtg1U2g/nGFjautJeq1nyQo
         JQGvEmM9X1XEWXOWM5A4hVciG/gKRjdRiSsxXmXmseWbDfZyVfSaX+spIKSCrE4MD6IM
         dMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AjIhZqYdx6Irr25qG4Q7GhZlKNclpkiABLa1j69zvnQ=;
        b=k78EjS9RKGTZRpL6b+HROyDhgc+pr2n80xEg4kvBukLD3uh0EQT8HOmRrVHpW/IBmy
         ZwTpRpymukVgwjEOORT9S9mjZFJGxM8SN+qCMgwqiSxvOxhqyqQ84KR/u6jHTAG0nd0/
         RyuIsQGdMSa87Bwkdf9+M7wIfY9dC9idz6iIJo1FI6TEsc+CmSxIXNQBA4xPNtn7BTtb
         2a6kwjCoYj+sNPWp5xBxd0lkTRAaQMpvLuU2+iZ9qiO9cmgDvIUCTzPM5Qnkz0dTOA2b
         A7oUPdr/RUipFXsW6p7WvO9esAgICHBXLnBcVmKxJJzPp+EC74GUL0AuxYKLi9hH2lbK
         VCPA==
X-Gm-Message-State: AOAM532dSkPi1tX0ssDHmNAaB7QhO1mEztXSU4Tu8zLzHQIvn3//rHjt
	xhqLl8IudAkNkpoEVODZAU01suSL
X-Google-Smtp-Source: ABdhPJzG4OMASDBfmDlqKl80YSLNisG+68XXx1gr03GnMk5tDpFI8p4oy4LeH4rRKivT0W5onLALpQ==
X-Received: by 2002:aa7:96e7:: with SMTP id i7mr6063915pfq.114.1589813422302;
        Mon, 18 May 2020 07:50:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:21 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 15/57] python3-pyudev: add the missing rdepends
Date: Mon, 18 May 2020 07:49:20 -0700
Message-Id: <5c91e3aa46b7fa5427af584aefb51f22cf931917.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import pyudev
 [snip]
 ModuleNotFoundError: No module named 'fcntl'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4e79bf9f1d11739389f0cc7c9e6360dcd156f16c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
index f39847ffa7..49a3628f41 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
@@ -17,5 +17,6 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-fcntl \
     libudev \
 "
-- 
2.17.1

