Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.18026.1590941812372732813
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UbkIhV15;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id f3so2290926pfd.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=pvqpo9Bb6cmncAzK6BEQ4aKuU5+0tjD6JjYLC5GwBEU=;
        b=UbkIhV15Q8G0udi8DywUeZmLmYHPiBBwbydHjx78k1F4jcPO6Hn70TYnNcMJc1b+pb
         aVCVUoZE9Z2jzAVDpaG9YeizEIBLAS/BLOgfbCHYO+57+tkV1md18oP8hyyTkInBx7mN
         XIBxDBgqwCsGU6D4KxMAkWWQVVKXMrXog+DYK23So4AproGqL3FftaA47DPjMf3A98xU
         6ESpMbZpQ50CinFJybLV2ZGbu9J5Z8wj4qejc8SQ7rDDeh9NWO7qI+YFpWoY5k8c6sSa
         33T0TW2TBsy6acaBTn9WkskGFTG56aeKcvo965qJ8/S/ftZkO0RH5bm2XwyXiAaD9D9n
         MG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=pvqpo9Bb6cmncAzK6BEQ4aKuU5+0tjD6JjYLC5GwBEU=;
        b=NZYSkEiLkv5e/xWvcRyt2RI6Q9c5hA/qXIcgYK27GfJxHJFBGAcqy0+kFP8Z65F+ET
         FV094ynx7M/Azo4R2o0cU+KvhdCW7/AoQ3eMlPs5XrqXvcCU2kJEwxcTDSknq7Vwfw9F
         O8tpyIAyq2ianGcMZ+AvpEK1paJL94MxneEfkOz/MItLXhxRoxUxVyLM6AmnDzmPQ02J
         a2iLcpgq4FI5sWM4iBt2uptNph27mQpOioT53w2DEknJpLo7mousabSsspeJitoS1lsQ
         U2Epw7GXFJ/cz5POIdHvTP4EBGLmpZkhH3g9aiw1BTC81pexgn9Rp/GQrSXln26upxtC
         GyRw==
X-Gm-Message-State: AOAM531VYKYpnRYAmooyMeIYVVnkqOnpsu3kt4yB2ppAfeSvC1xt92fy
	l+26PIYlxrQsuH1dg0+a0EJoRDop
X-Google-Smtp-Source: ABdhPJyJKoeZ5OPGUFp3EcIZRs7rT/5Wkh9b/qMTa0baj2TUTI4113LRzfyZV9RhloF2FsqRZyl0qA==
X-Received: by 2002:a62:1dd3:: with SMTP id d202mr15966280pfd.99.1590941811750;
        Sun, 31 May 2020 09:16:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:51 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 22/35] fetchmail: upgrade 6.4.3 -> 6.4.4
Date: Sun, 31 May 2020 09:16:09 -0700
Message-Id: <d8fbd6140f6585260595e020e53e90a6d481d6a7.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e8a43da0cb4631d4302ec84a0dd54ea1b74ddc92)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../fetchmail/{fetchmail_6.4.3.bb => fetchmail_6.4.4.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.3.bb => fetchmail_6.4.4.bb} (86%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.3.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.4.bb
similarity index 86%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.3.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.4.4.bb
index 5e2d1be1e4..efab0c808d 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.3.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.4.bb
@@ -9,8 +9,8 @@ DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "614d5a05ac9a042bfc9317e5499bafd4"
-SRC_URI[sha256sum] = "b0360e14b9aa5d065eef8ff99ad0347ef6cbbfc934c8114908295a402a09d3e4"
+SRC_URI[md5sum] = "53d52179c8bf8e2f57489538b49bfda9"
+SRC_URI[sha256sum] = "511b60daabf7543a01de06af07c8772290c6807cd53c42a8504960e978f3abea"
 
 inherit autotools gettext python3-dir python3native
 
-- 
2.17.1

