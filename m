Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1DFEDE9B8
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 20:10:08 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.6032.1725999000371483560
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 13:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YGvXf4uA;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so502918466b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 13:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725998998; x=1726603798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JwOwPHY8n3PuPLNd8d8Y3ga+LRJka9y7eN45A85mqQk=;
        b=YGvXf4uAvvN7EYQpb3s23MvJSTAbD9RxMoljw883vrAmVW+U1Y8rD6T3BZJ5ETy6mP
         XRJVlYIHCYNhlRMGR13emSAbCsJt7Tk5Pig00PVFC0KeBJK1Fy0eXHezrgeIrC/rXOwQ
         6MO71qO+K2+9oTysDI3EmDUruwGA5TXw7QS5mfspeSEkqPC3yosYg8RakGOv4SgI4/fB
         q/0zoowmYjTM3UD+3UExDmHr1oJORtPaYY1CcvB174bFLN5ZaRp9hI3yuP0W7o4mbhHU
         e9JdoLGr9nDoV/yguwF9SSdWuvd7LYIbgZj6D1nZcGo9Vf+8Dw87La8BGpeBIm4X0vMj
         dtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725998998; x=1726603798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwOwPHY8n3PuPLNd8d8Y3ga+LRJka9y7eN45A85mqQk=;
        b=vFeRRvdRO9z7iE5g5mLqyDcgWumHtCgPlBsRCLxIsZNaQ+shLvOR92qUv62uxEV6GM
         lusqLtFzhnRMGgeHhzylZi/Kyy5HJuqAJbpf6AgUSTsSvNY/8hb6JkoMRt9OzR5SZwQm
         6lTrh0V3a7sc2ByVGHwLuO8XN6pUFl0yB5iwxkn4xzvFa+LPxYkRuqSXC29d4hb5soZd
         OE0i91lxxhADjSiVXJpJ++euLd4zycGDwou9WuWchdWfFl/xCB8yyS2FGksQEeicPkcj
         yk8cHgnAl7oT0ZkTECp74m3E4bDtoawLt/pRgEKRw4tEm0qzWd4HonpCSS0qQw56FnHs
         ZifA==
X-Gm-Message-State: AOJu0YynEJW+s7EA8ivigRjsbEQObegAIZ/sn1JPp42EYGoX6VIRpVMV
	dI6ztaeBcwRWfkBeZuGpq0p0+S7VqQBGEsn5rclfpmMMPwShgDBFvxY5iVqW
X-Google-Smtp-Source: AGHT+IGZ0GBI46G6bpjuvTVU4PYLX/viZPE70AQMqJ12MSoxg36h2f1XpKv4Y7pzmv9SaZnvC8KZtg==
X-Received: by 2002:a17:907:3f9b:b0:a8a:7027:c015 with SMTP id a640c23a62f3a-a8ffae1e406mr180619766b.56.1725998997441;
        Tue, 10 Sep 2024 13:09:57 -0700 (PDT)
Received: from control-center.home (164-12-20-31.ftth.glasoperator.nl. [31.20.12.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf03fcsm516655766b.162.2024.09.10.13.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 13:09:56 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH] python3-pyjwt 2.8.0 -> 2.9.0
Date: Tue, 10 Sep 2024 20:09:42 +0000
Message-ID: <20240910200941.3791017-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 20:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112234

Updated name of PYPI_PACKAGE as it is renamed on pypi.org

Changelog: https://github.com/jpadilla/pyjwt/releases/tag/2.9.0
---
 .../{python3-pyjwt_2.8.0.bb => python3-pyjwt_2.9.0.bb}    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.8.0.bb => python3-pyjwt_2.9.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.9.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.9.0.bb
index 06d481a3b..7bc3cffdd 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.9.0.bb
@@ -5,14 +5,14 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
+SRC_URI[sha256sum] = "7e1e5b56cc735432a7369cbfa0efe50fa113ebecdc04ae6922deba8b84582d0c"
 
-PYPI_PACKAGE = "PyJWT"
+PYPI_PACKAGE = "pyjwt"
 inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN} = " \
-    python3-json \
+RDEPENDS:${PN} = "\
     python3-cryptography \
+    python3-json \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


