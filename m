Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CC8C52D71
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 08:52:44 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.79758.1723193563621655091
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 01:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=s5ZIBSQp;
 spf=pass (domain: konsulko.com, ip: 209.85.218.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7a9cf7d3f3so219152266b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 01:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723193562; x=1723798362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qu9FHeUqHXIT2sFCjninOj6uNaUmryhyAXdhXmVV/Qc=;
        b=s5ZIBSQpd7VJEtsrSPZ0V13D3/IXmI0eSbxABaSac1uayfEQtVV5u+288uKXkV8orX
         lS+LWQdI/uDWMIJfX3cfV937Zjq+nQhof/ytuROUVyQanOWXQyRa58vWkVsYoQGa8Xc4
         L465TomiMQMdNIWgrfc7ij0e6wbWRCQrgWkPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723193562; x=1723798362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qu9FHeUqHXIT2sFCjninOj6uNaUmryhyAXdhXmVV/Qc=;
        b=mOyTieUzaV4jkTtx0rCF89Cgs+ROEr26nbQS8+wh/Xxp0AC9GuffyT3Z/KN4weQEdw
         7NQCKXzZfB5lO8LyzkShuXMkX/JsSsvf0hdP9YY+lt0Jbha9SrRk3tevlhwo5NivJ6qz
         mw7IpfrMvL014xnOvvtGOu3JU9w4bwtAckZcCvVrWZa50rga+bDoh72VXnOPN9AdphbU
         XXkqnOKMphln4bqvYFF+E1lliFc5GALG0EfONEFZIvOTA8cNJ9ms6dB4ASOEQ7YzM/0Y
         gCKEOzMnNaeIsiQCjWmxNGwZuFyr2scFtF+TDjaQZEO6rbppUfEKHyKAe/6+fkkcH8tV
         MJ+A==
X-Gm-Message-State: AOJu0YwElPLHQatUnklhkCNTR2ooEnjaQGd1r2DRije7MnedNR2CaoLw
	1StbbZHATmo31CPx3EM+GGhxlgVSiUrR/4aHfpp2N3DLQtcGVlF14nFkkqgIBIkqLrvXZXRIDyy
	q
X-Google-Smtp-Source: AGHT+IGQynU9xy0xUuwztSdgvckgRrEAd1/ePvXlJAqiXJGoRdJbR0dZ+ShCX7IXFrpAgGVBdyGDqw==
X-Received: by 2002:a17:906:bc18:b0:a77:db97:f4fd with SMTP id a640c23a62f3a-a80aa5ec120mr70499166b.34.1723193561314;
        Fri, 09 Aug 2024 01:52:41 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3c4fsm823286366b.33.2024.08.09.01.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:52:40 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-sniffio: Upgrade 1.3.0 -> 1.3.1
Date: Fri,  9 Aug 2024 11:52:33 +0300
Message-Id: <20240809085236.1828180-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240809085236.1828180-1-leon.anavi@konsulko.com>
References: <20240809085236.1828180-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111687

Upgrade to release 1.3.1:

- Added missing thread_local to sniffio.__all__

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sniffio_1.3.0.bb => python3-sniffio_1.3.1.bb} | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sniffio_1.3.0.bb => python3-sniffio_1.3.1.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-sniffio_1.3.0.bb b/meta-python/recipes-devtools/python/python3-sniffio_1.3.1.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-sniffio_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-sniffio_1.3.1.bb
index 746e4185d..82c457c39 100644
--- a/meta-python/recipes-devtools/python/python3-sniffio_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sniffio_1.3.1.bb
@@ -9,4 +9,13 @@ LIC_FILES_CHKSUM = "\
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e60305c5e5d314f5389259b7f22aaa33d8f7dee49763119234af3755c55b9101"
+SRC_URI[sha256sum] = "f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc"
+
+DEPENDS += "\
+    python3-setuptools-scm-native \
+"
+
+RDEPENDS:${PN} += " \
+    python3-numbers \
+    python3-core \
+"
-- 
2.39.2


