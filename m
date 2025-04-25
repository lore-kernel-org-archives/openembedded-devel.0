Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF114C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 09:32:57 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.3133.1745573571716615721
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Apr 2025 02:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mHgmqufZ;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c0dfba946so1436346f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 02:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1745573570; x=1746178370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16l7T+uh6m/XdqvXcOmSKDe6IXOzN026/CMYF2178a4=;
        b=mHgmqufZlgyRWoabMttYOi04sP7unKRCjEA/irwY5KvnJqaTlshmBI+AtqPi21zxA4
         uUKuNb9sd1XgbhvkOGIHXGVrf2CVwSYAS9HcV1d4pB4MT5E5FLaKie7/DPT8Vp6ZTfFc
         paVbK5dbMbLi8Jq+ecO7gm1PYo2t5mW5vLHjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573570; x=1746178370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16l7T+uh6m/XdqvXcOmSKDe6IXOzN026/CMYF2178a4=;
        b=Wc6A9knH87nONJpWSZifkxsmbRKZJjbSkMonH6Ezfibaso7T1s61XoniwAC7fYvEoT
         Y0PAUd8p1W6/yKwW434r+L0nOLX9sFRLg36glIxz/WccJ0a1CySvgy+JWK1OVZqqRbN4
         qOkEV924QSde/OXJFHAoYMdlUHhju93x6OdbsKLz/wOh8qU/ONRRQdNEyryXug5ktC9L
         CEXevTsVAE12iyGQ4EoQPds6zGFklKVk6P1csxl7GxyDVohBRecFFyu3CC2G+Z3PQTKh
         +n7Rtt7PtIYhaWwmoghSKYyiweBdDsZ71bLVTrp8TSWqVY/B5fp8SkGoHVO9X+echsCi
         Ro4g==
X-Gm-Message-State: AOJu0Yxc1ldwTrYzkKJkFV4npusl8iL2ToOEbQROHpbYS0BZMvKFRfHc
	cV2UKZmCZ4dQXgAHIqzGsxFjs8e3/oORNG86nem1ZnGlpoT3Ex0p6CKAumF0G4T1cBKMyiKQ1Fl
	7
X-Gm-Gg: ASbGnctlDR0jgM8aHYC8aYEAw3Rk6BRaxJcCvIQDb6BF5+aIibuOFDJ0d0r84zOQ/4X
	LH6HN/FRgc/dUR99+s8p6av+h9TVsk9+HYXI/VNFproJiRUOPJy8nixP5PQHGTmCJ+e/BylZav0
	nin07VyXVFcW96SEcsBMhlP3jZiCcT7RwosgA9GKzna3ujlYt0XvMTQU03Jm8Bq1SbBbt3OjI9F
	wPmVUTgpenczlpMGA01BIwa7+5GdmlEyxM2fgpHsHkhk+PJdjMtAlwanl936oflrD2QdSe9WAP3
	/d+yyjEbx8I/izhFXUT1s6rt8q5Hox3QvOeLiGhKJnrQOkJaw8HUgDs=
X-Google-Smtp-Source: AGHT+IHftn/Zz/0iOMHsxggVA82S0TOKQjWFEqyx91/RxgenK4EFPBIK9AY8NeXFjRAHadhTp/gkMw==
X-Received: by 2002:a05:6000:220f:b0:391:40bd:6222 with SMTP id ffacd0b85a97d-3a074e1fb36mr1188908f8f.22.1745573569861;
        Fri, 25 Apr 2025 02:32:49 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1787773f8f.3.2025.04.25.02.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:32:49 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-bitstring: Uprade 4.3.0 -> 4.3.1
Date: Fri, 25 Apr 2025 12:32:46 +0300
Message-Id: <20250425093246.1951085-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425093246.1951085-1-leon.anavi@konsulko.com>
References: <20250425093246.1951085-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 09:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117122

Upgrade to release 4.3.1:

- Updated bitarray dependency to allow for v3.x.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-bitstring_4.3.0.bb => python3-bitstring_4.3.1.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitstring_4.3.0.bb => python3-bitstring_4.3.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.3.0.bb b/meta-python/recipes-devtools/python/python3-bitstring_4.3.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-bitstring_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-bitstring_4.3.1.bb
index 79591fde7d..31b4330c21 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.3.1.bb
@@ -3,9 +3,7 @@ HOMEPAGE = "https://github.com/scott-griffiths/bitstring"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=963a24c175e658fbf16a764135121ffa"
 
-SRC_URI[sha256sum] = "81800bc4e00b6508716adbae648e741256355c8dfd19541f76482fb89bee0313"
-
-PYPI_PACKAGE = "bitstring"
+SRC_URI[sha256sum] = "a08bc09d3857216d4c0f412a1611056f1cc2b64fd254fb1e8a0afba7cfa1a95a"
 
 inherit pypi python_poetry_core
 
-- 
2.39.5


