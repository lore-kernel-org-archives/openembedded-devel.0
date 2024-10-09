Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A367FCEE352
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 21:31:14 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.29036.1728509473241606280
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 14:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J6W0wSAb;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5399041167cso328720e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 14:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728509471; x=1729114271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=441msBrBkvIfUKbhQpbZgLIYHa+EJmcj3OMo0fQRIz4=;
        b=J6W0wSAbftBqtXRDO7916CzsHaekF//zijgOta5DN8YZ8gVboVxuZEJAmFWGoFIPJk
         fFrr4qHz30FzqxFsFFpOiwRpwYihJ5u3YYyUZ/JGFZX2p8m2zBnnkDahmVdZudEbtBd4
         LLuTPb+Z8AVJV4BKo/td/Jn6orVIR9uw66HvDzQUJrG/be9TWKPQymw3EmFjtzdVT1zI
         RiwEc8vmzZYs3dksp0tDTOteYLoHq/qGJBgeW4QD9G1iTQmlr/k9RLp1/Un6CuVpySB8
         Rn0oyfCSnr6gkD5oex8nImrnh00NrJdneoPl3Hlr4CuISDlG5kagNQktlsu9X5HTtroU
         F5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728509471; x=1729114271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=441msBrBkvIfUKbhQpbZgLIYHa+EJmcj3OMo0fQRIz4=;
        b=Mndw/DZZfneoFV9fa/lA4JlFvqeW3+VqZWe16+iNNVPhUzOfVu9GMRxIax51pldFj7
         IgyP5qfbuHaxvlmyzjWGoA1Q9dSKtA3h9ZQ9S7SoVebQ96gA6FYIycwKK6qL3hV6Ou+F
         ixbIx07IBs/ojp9Goo7NYw6/vLVEGE38r4T0EFdmVMlYpTLp5dbJO1tnrPcHkhtW6H5t
         CMAV+BDTL1pwC9MFaSyqb1EaS+0BLbTgspxNmCWNRBccmp9fxnpY4YgjV7PyVFjJ8wfC
         9XEhfBSxU5W//sX+JrgJx0Sg811N+b+e5M9xTr6ShpYpeAlvu0JmsoME34g1NL264z78
         Srhw==
X-Gm-Message-State: AOJu0Ywt/g9U9AuBFGDZoRVjEr32L8aSm4+YC2XNPx7Xvis48SnRTCD6
	+7IyN9SIVTvokYQo7NPP/QoSpREgOsauUgM55U3+NWxixeIyhiDeEjG7xQ==
X-Google-Smtp-Source: AGHT+IFXFOoP+1I+dBWamtx4gKpcLw5OpFJ2m4e07OwFs9DibSwh12pYdw2Tjd2PltF8nhOWut41bA==
X-Received: by 2002:a05:6512:1091:b0:539:8d9b:b61c with SMTP id 2adb3069b0e04-539c4968056mr3537631e87.51.1728509470395;
        Wed, 09 Oct 2024 14:31:10 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9954cd8395sm469885266b.30.2024.10.09.14.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:31:09 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-pychromecast 14.0.1 -> 14.0.2
Date: Wed,  9 Oct 2024 21:30:47 +0000
Message-ID: <20241009213046.3065769-3-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009213046.3065769-2-t.f.g.geelen@gmail.com>
References: <20241009213046.3065769-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 21:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112745

Changelog:
https://github.com/home-assistant-libs/pychromecast/releases/tag/14.0.2
---
 .../0001-Allow-newer-version-of-wheel-and-setuptools.patch    | 4 ++--
 ...-pychromecast_14.0.1.bb => python3-pychromecast_14.0.2.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_14.0.1.bb => python3-pychromecast_14.0.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
index 447f67907..3d5d043f1 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
+++ b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
@@ -1,4 +1,4 @@
-From 5ee73f91b7f13dd5c700c69e7fc43cecab5868da Mon Sep 17 00:00:00 2001
+From 41da1605df6d781bdf01c0ecefea88bba7758c21 Mon Sep 17 00:00:00 2001
 From: Tom Geelen <t.f.g.geelen@gmail.com>
 Date: Sun, 7 Apr 2024 22:39:35 +0000
 Subject: [PATCH] Allow newer version of wheel and setuptools
@@ -10,7 +10,7 @@ Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 56df5bd..17ca62d 100644
+index 545297e..84a92c2 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -1,5 +1,5 @@
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pychromecast_14.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_14.0.2.bb
index dee4bf6eb..5a51d2e13 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
 SRC_URI += "file://0001-Allow-newer-version-of-wheel-and-setuptools.patch"
-SRC_URI[sha256sum] = "e16e0a7f9488319191b8b4fa21ca0beb4bf12eeda5c9bf640241188f2bea0a3e"
+SRC_URI[sha256sum] = "092c65f421991bca565338bc61a0c14861c47e0f5c0a65919a5e93f02dfd071a"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.43.0


