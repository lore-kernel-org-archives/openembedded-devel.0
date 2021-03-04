Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.4583.1614852790257986357
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 02:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MBCBATRS;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id j2so14112101wrx.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Mar 2021 02:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GS6fsGmgBxWwIyqfvv9ryiu5isPz0KYMg46GQt7rPIs=;
        b=MBCBATRSlVYb7zI3u4op1yViziZEfn/ABN8MelI2irMbbW0VF2PCNixTb3kg7fPj8U
         bx19lpeLfsEdXq3+nBe3mD2Ec/KY7LKLMDuPbrqUUNO51OsytQTErUC//AH5Lq8xR79Y
         iR17UGmBHIedCbcTUoskVwh/FQgx/PttAUa77/9N59hZEjb2099DmRHAQEfUjKUKMvbM
         P74Ipmh0kemrkxv4JQrQ1rYKYHm7HDeXd+zlzIHjeN54nc1jT88VZi+wUVAbixqH7b0D
         QUwbLwcXN4wBltTKqv5JbHrpPxsfhlVh+vcaqNTzUvz/X4g6h5vRGiVf4NoM8rfkMdEA
         nafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GS6fsGmgBxWwIyqfvv9ryiu5isPz0KYMg46GQt7rPIs=;
        b=Iv9rV2OPogzuoc4GRWiJFM9piSJxZEKhgd6ickQv/4B0vHvepJkFTttgX4FoJzQ8vf
         LC4rbLlOpeIbHW9rVW4SD4pstQIAoxKEKrAr8p0rZUTgF/M5UY4xTVoAoGLi9vXYO/gZ
         f9s+5MHOWvaNBihQnpyjVEnlmnDpKpGkqMwfstbSCSGbkkg3/bxBgtUcS1BUsYXNNzfa
         H600yf8uiJ7PBfbwRlMXzWHME2a3Xcu8YliBooVBO2yqcuHzgkeIJmnKWtoJS9ndU+ri
         zMcYwxas1ZUXH7KfaIs34G0d0MWHhUg8HYYsqJetvapGXTE23JhyUkQ+/X/X6T8sPW2F
         gWlw==
X-Gm-Message-State: AOAM531hcOiF2CAII8HtRHx0JJb6swUdetHXY5UFicHiWJtI83ko12sE
	O0tVKBjpD7kawQ0XzkwN2N3fnHKikdS8qA==
X-Google-Smtp-Source: ABdhPJy/csOVSbN38IfSH3rawJyTv//SHPWP9m4c/k875GE84P/W5+XzonbVQYBU95NRFXvNSPGuDQ==
X-Received: by 2002:a5d:4141:: with SMTP id c1mr3355917wrq.248.1614852788570;
        Thu, 04 Mar 2021 02:13:08 -0800 (PST)
Return-Path: <peron.clem@gmail.com>
Received: from localhost.localdomain (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id m14sm8727548wmi.27.2021.03.04.02.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 02:13:08 -0800 (PST)
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Anatol Belski <anbelski@linux.microsoft.com>,
	Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 2/2] grpc: remove gflags dependency
Date: Thu,  4 Mar 2021 11:13:03 +0100
Message-Id: <20210304101303.1199430-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304101303.1199430-1-peron.clem@gmail.com>
References: <20210304101303.1199430-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gFlags has been removed since:
1f670397ce7f8a12dfb1fb32d8857b2233022856 Remove gflags.

With the move to abseil's flags, this removed the now-unnecessary submodule and installation commands.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
index 56f20a4bfaed..358ec80e8770 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-DEPENDS = "gflags c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl libnsl2 abseil-cpp re2"
+DEPENDS = "c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl libnsl2 abseil-cpp re2"
 DEPENDS_append_class-target = " googletest grpc-native "
 DEPENDS_append_class-nativesdk = " grpc-native "
 
@@ -25,7 +25,6 @@ EXTRA_OECMAKE = " \
     -DgRPC_ZLIB_PROVIDER=package \
     -DgRPC_SSL_PROVIDER=package \
     -DgRPC_PROTOBUF_PROVIDER=package \
-    -DgRPC_GFLAGS_PROVIDER=package \
     -DgRPC_ABSL_PROVIDER=package \
     -DgRPC_RE2_PROVIDER=package \
     -DgRPC_INSTALL=ON \
-- 
2.25.1

