Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.1934.1621647341296717725
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VHIUl1vK;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id y7so7771465eda.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ymqajHDwbgSWlWXT+p5HiW1jPJ4i3pNAx1hwqya6Rws=;
        b=VHIUl1vKIckLlKuyozIKNPS99mJAa5CajNdqXsIKaSOFkkR8QoAItReIyNMh7/jGyb
         zyecpJH3NqLWCat/dkEFwgcWyeImpl8ukxDVJVXrQQDb4SUud1O9cxSvqetQvYWAlA+s
         4g3wbjf8dnGOohAMc7siu6RWJLj5M/5SLDpkAcZSDXS4Tlf+oufM2Lne5oV+Or0JY9NK
         lmVYi8+aAun5LaXtUarIk2flBMd9W1gkwWV1oNNuJjUgEYT1EeHAaOUzoA9rtJAfBIVJ
         +jJFUMDlWFMybkrR7Jkk5gTIJmw/OnuxHlcxt1gCZPA31LlLgruz5T3Og67zmWFPE8Vh
         Ogkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ymqajHDwbgSWlWXT+p5HiW1jPJ4i3pNAx1hwqya6Rws=;
        b=B7rMUisfPYxzfKIM+AN8hMPd0gRjdgrVxkE6Ax/pSDA9zgUQGpJvVjBsJ9Hfb/xg4F
         9TLWh18NwT6LzdjM1o+9//eZ7iYx37XN0YDvrcxQHmoa8Z/5Z/b76WzG/gRS9rX6nDtt
         0iycThcgS70cyE+lGuLxqzwLGUZi8yYCgqV1vzZon5a1aX0Y0YLhcuXE6IruMvx1j1HX
         mbFR99EiDN//WNY9tq1qn2/xr8Z4frls7ALb3halXDlmGTZMeYQNrQSMjoJ8zNN1wg7P
         1Yz81/N3iuWkypej9WvNkGPko1Dct5cvaWjD6jaeso8nx7ojFMCHC7ryStdFuS+dnPA9
         AOVQ==
X-Gm-Message-State: AOAM531eCk46cGnKVEif7HDu0gAemiyjvuqESpcoBWAoGDK4araCEzP1
	BrZobmA7uvlNe1U1QvhUPw2mwyQS1sE=
X-Google-Smtp-Source: ABdhPJwHE2UlwTeoV89KSo52/SElTFP3DeDbX1BqdlLyqLp/1XX7O33ucKd5QClwDi5tRsLU9L3JbA==
X-Received: by 2002:aa7:cc10:: with SMTP id q16mr14243873edt.53.1621647339886;
        Fri, 21 May 2021 18:35:39 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:39 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/17] protobuf: upgrade 3.15.2 -> 3.17.0
Date: Sat, 22 May 2021 03:35:16 +0200
Message-Id: <20210522013521.588774-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../protobuf/{protobuf_3.15.2.bb => protobuf_3.17.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.15.2.bb => protobuf_3.17.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.15.2.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.17.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.15.2.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.17.0.bb
index 0392f9339..81af2d50f 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.15.2.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.17.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS_append_class-target = " protobuf-native"
 
-SRCREV = "d7e943b8d2bc444a8c770644e73d090b486f8b37"
+SRCREV = "652d99a8ee8aa6b801e11977951fbf444cfccc8f"
 
 SRC_URI = "git://github.com/protocolbuffers/protobuf.git \
            file://run-ptest \
-- 
2.31.1

