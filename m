Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web09.53767.1622522423506988079
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 21:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gSbwY6xY;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id e1so1938532pld.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 May 2021 21:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dv/rwkTW73HtK5dN4XG6jwNwbCPDp7LsM5n3z/ty6IQ=;
        b=gSbwY6xYaDSeYnyfNG01kbrwomALhudwteMpDGi5xSDhJB7IzIplzcVrMMxoUxQbu6
         Ql4NhOf4IX5xHtzss9nLfrjd2B+0vML0IHBnHJhhHow0P5HwoyN4kekZ8aIResSbSWG9
         dgmEKNzwfq39PFvNqNktmUegpNzlF7yEIqRbFp/UhnIAr5V5uF0y/NUflTPJaZclQm2v
         WVC59FUuP5GwEcD+cXq3prMsVrpb6eOY4ufukNr2QjOAbi5KgBLUC73LVRFsFysPtmqZ
         ++y0JrUaPYGSmzHw5Mj+txJk7I8uJfSkktbfYo8y9FMbQIA0Ubt9v9HhQ9+/xX8rfR9s
         a2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dv/rwkTW73HtK5dN4XG6jwNwbCPDp7LsM5n3z/ty6IQ=;
        b=B4kzHDRKOM9s60IyBOhFdNgTtHd4jB1f85iqAlVq6jOZiS9Jf6RmBNxQ+Jool1GM0A
         SKYkcnnx6W7cK/YOaUilSFy9MS1/y7cqpTnvpHYV1HLPuX9oETxlpEXSa0oVj/Kfn23C
         alkIUHEc0Xe7UPF1ZvGSh+JEcNgsQh8n1eWjb1jw2jeBXYnWVMTy/IySf9XkEWRBSZG2
         orvI42/wA3brIQZbtSUJ4UyKsv0ZQm3VTPGm3B23NObleGbDqrTweIJ8vgKNfuzioQ6F
         baPxV/23P0yqwYEXR2tjR62X9d2o71AMIGLkEBMbY7ezNNaSCxaCDIETu7PQzpE1oLQ7
         NV1g==
X-Gm-Message-State: AOAM531dH/49o9OW+MCI3v4f+9ae38ayKDA24j++RK3BF+QeEoJ2g+sF
	orYGyZWvrGKZtdK+Xk2I7ppZaJvB9Q8gxw==
X-Google-Smtp-Source: ABdhPJycHX2634JeeQW1Iqahmj0i3EUYdE/j0F1m4n+uOSV2wpmyoxazTRCyu00MHuOJ3Ho1ki5udg==
X-Received: by 2002:a17:902:e2d3:b029:106:73a2:d147 with SMTP id l19-20020a170902e2d3b029010673a2d147mr4863296plc.78.1622522422577;
        Mon, 31 May 2021 21:40:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id x13sm13922093pja.3.2021.05.31.21.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 21:40:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: meta-oe[][PATCH] mongodb: Change PV to 4.4.6
Date: Mon, 31 May 2021 21:40:20 -0700
Message-Id: <20210601044020.498339-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

4.4.6 has been released from same SHA which was used for rc0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index cfa2bc18c2..ba6d052e43 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,8 +11,8 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \
 
 inherit scons dos2unix siteinfo python3native systemd useradd
 
-PV = "4.4.5+4.4.6-rc0"
-#v4.4.6-rc0
+PV = "4.4.6"
+#v4.4.6
 SRCREV = "72e66213c2c3eab37d9358d5e78ad7f5c1d0d0d7"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4 \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
-- 
2.31.1

