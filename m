Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9CCD75BC0
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 06:25:31 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.5049.1732170324427178904
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 22:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nI9JBPgC;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20cb7139d9dso4760805ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 22:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732170323; x=1732775123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eidwMt9/21xW6/m+UzaagEEE38CNdUxOKud1ppj7zZU=;
        b=nI9JBPgCjraGXeuHx6Yaj6D95T4AbUxYZ9kUM8PNlCwky4AeN3q49N+W3QExbManOV
         B7Bvz21hYGyZsSv7gDBZOuKf8DWyIdht1SGPZ91DKLmT1+x9/RciC4glbF/xIHbO4UkU
         RSzijkVuKECNClVApBTsvezIUebaHWWHS0mkY6zt0W0bMlyU9mcdf6xj+5qWwgo3fqtD
         X688ESPU+jJk3xiE0Zebn2IWJjLEZIfIcznM3KW3V/Uoy7nR0f73nz9TR09xxeCNu/gm
         /JdfI4cMqaGlrFqtNrzwryjZBtSL/liZCfmkbJ9kaqmCnaFIz8mrNcAhfuMw4IeyGhSv
         Y1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732170323; x=1732775123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eidwMt9/21xW6/m+UzaagEEE38CNdUxOKud1ppj7zZU=;
        b=NMSjqxtsqLbEiPK7VSeWRocgbJgP10IsSAarsNVFbdCLwPU6SskY/qd8sey9TLsufz
         AWi9kGqoJeq4kPGMafECxYujO35O+epgyim3jdBapBNoOPT7WWZH5oGRaOzbbyyqs6m8
         gQ0ecmXbwjrkAzyPnHL03qHyABkc2NJaHpRv1ZjfDhFV2hLFZaPWDI5DnYOIF02wt6ke
         bqMhCQ1Hb6S4mu2lmpnLhLPimf44X0eiseAb3weepw9CEaanTFC6k0epCS8UHNYIh0M0
         6lQP7LoEeuXWj01G4ny9OCPNvZYinw7esYbIjXcGTLO4n+TGHXJ+QTiVFDkeL9ZEh+W2
         W5bg==
X-Gm-Message-State: AOJu0Yw6N53FNwbP8Ms6EVnYqqAQQjzAg4+504QbInXRHNkzGLQVwWmN
	rs3OjyU9uUrYko2Kr9GWMuhG0qVgK4fT9CUmbEcPl5toFnutqHw1y0shhA==
X-Gm-Gg: ASbGncsDNcrjHQPCeTpXx1iRt15Z7s+ongdKhXm1LRRYAmTX+iYp/WtkaVyr5PXj51h
	7CEHc+9kVLepjkF/5xJtItJ+5Ff55QmjIx/0A6UeDWX8UsPn/XJ8G54k+l6SQBhMp4MeGGUpQAY
	Dm00gxZw0joiVlBabNX9Qx2z6h3HMzNrt/sCENjrZT8xqCd+eCS5S/OpYnO5SCiI22MdbeBzB1K
	QRsZ80h1g0+2Vhp451/8CfN0Wx0VuoPtl5aOLcJP7L75doEdUxK
X-Google-Smtp-Source: AGHT+IFlr+XPrrMU9pmd2a6+mkQHBX2vxQ4MmrVnPK44Ejn8+Wm05cQUpVrOK+YfUX8wChkzMFftvA==
X-Received: by 2002:a17:902:f549:b0:212:deb:71e8 with SMTP id d9443c01a7336-2126a372c24mr63793815ad.2.1732170323410;
        Wed, 20 Nov 2024 22:25:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::2c23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212883fd550sm5814705ad.254.2024.11.20.22.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 22:25:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/4] python3-pydantic-core: Upgrade to 2.27.0
Date: Wed, 20 Nov 2024 22:25:18 -0800
Message-ID: <20241121062518.3074722-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121062518.3074722-1-raj.khem@gmail.com>
References: <20241121062518.3074722-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 06:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113955

Add missing ptest rdep on python3-inline-snapshot

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pydantic-core-crates.inc   | 20 +++++++++----------
 ...5.0.bb => python3-pydantic-core_2.27.0.bb} |  3 ++-
 2 files changed, 12 insertions(+), 11 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.25.0.bb => python3-pydantic-core_2.27.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index 05863c870c..5480100221 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -33,7 +33,7 @@ SRC_URI += " \
     crate://crates.io/indexmap/2.2.6 \
     crate://crates.io/indoc/2.0.5 \
     crate://crates.io/itoa/1.0.11 \
-    crate://crates.io/jiter/0.5.0 \
+    crate://crates.io/jiter/0.7.1 \
     crate://crates.io/lexical-parse-float/0.8.5 \
     crate://crates.io/lexical-parse-integer/0.8.6 \
     crate://crates.io/lexical-util/0.8.5 \
@@ -56,16 +56,16 @@ SRC_URI += " \
     crate://crates.io/python3-dll-a/0.2.10 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/radium/0.7.0 \
-    crate://crates.io/regex/1.11.0 \
+    crate://crates.io/regex/1.11.1 \
     crate://crates.io/regex-automata/0.4.8 \
     crate://crates.io/regex-syntax/0.8.5 \
     crate://crates.io/rustversion/1.0.17 \
     crate://crates.io/ryu/1.0.18 \
-    crate://crates.io/serde/1.0.213 \
-    crate://crates.io/serde_derive/1.0.213 \
+    crate://crates.io/serde/1.0.214 \
+    crate://crates.io/serde_derive/1.0.214 \
     crate://crates.io/serde_json/1.0.132 \
     crate://crates.io/smallvec/1.13.2 \
-    crate://crates.io/speedate/0.14.4 \
+    crate://crates.io/speedate/0.15.0 \
     crate://crates.io/stable_deref_trait/1.2.0 \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/strum/0.26.3 \
@@ -131,7 +131,7 @@ SRC_URI[idna-1.0.2.sha256sum] = "bd69211b9b519e98303c015e21a007e293db403b6c85b9b
 SRC_URI[indexmap-2.2.6.sha256sum] = "168fb715dda47215e360912c096649d23d58bf392ac62f73919e831745e40f26"
 SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
 SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
-SRC_URI[jiter-0.5.0.sha256sum] = "02e23549143ef50eddffd46ba8cd0229b0a4500aef7518cf2eb0f41c9a09d22b"
+SRC_URI[jiter-0.7.1.sha256sum] = "07f69a121b68af57bc10f151f3f67444a64d1d3a0eb48b042801ea917a38dd25"
 SRC_URI[lexical-parse-float-0.8.5.sha256sum] = "683b3a5ebd0130b8fb52ba0bdc718cc56815b6a097e28ae5a6997d0ad17dc05f"
 SRC_URI[lexical-parse-integer-0.8.6.sha256sum] = "6d0994485ed0c312f6d965766754ea177d07f9c00c9b82a5ee62ed5b47945ee9"
 SRC_URI[lexical-util-0.8.5.sha256sum] = "5255b9ff16ff898710eb9eb63cb39248ea8a5bb036bea8085b1a767ff6c4e3fc"
@@ -154,16 +154,16 @@ SRC_URI[pyo3-macros-backend-0.22.5.sha256sum] = "ae1e3f09eecd94618f60a455a23def7
 SRC_URI[python3-dll-a-0.2.10.sha256sum] = "bd0b78171a90d808b319acfad166c4790d9e9759bbc14ac8273fe133673dd41b"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
-SRC_URI[regex-1.11.0.sha256sum] = "38200e5ee88914975b69f657f0801b6f6dccafd44fd9326302a4aaeecfacb1d8"
+SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
 SRC_URI[regex-automata-0.4.8.sha256sum] = "368758f23274712b504848e9d5a6f010445cc8b87a7cdb4d7cbee666c1288da3"
 SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
 SRC_URI[rustversion-1.0.17.sha256sum] = "955d28af4278de8121b7ebeb796b6a45735dc01436d898801014aced2773a3d6"
 SRC_URI[ryu-1.0.18.sha256sum] = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"
-SRC_URI[serde-1.0.213.sha256sum] = "3ea7893ff5e2466df8d720bb615088341b295f849602c6956047f8f80f0e9bc1"
-SRC_URI[serde_derive-1.0.213.sha256sum] = "7e85ad2009c50b58e87caa8cd6dac16bdf511bbfb7af6c33df902396aa480fa5"
+SRC_URI[serde-1.0.214.sha256sum] = "f55c3193aca71c12ad7890f1785d2b73e1b9f63a0bbc353c08ef26fe03fc56b5"
+SRC_URI[serde_derive-1.0.214.sha256sum] = "de523f781f095e28fa605cdce0f8307e451cc0fd14e2eb4cd2e98a355b147766"
 SRC_URI[serde_json-1.0.132.sha256sum] = "d726bfaff4b320266d395898905d0eba0345aae23b54aee3a737e260fd46db03"
 SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
-SRC_URI[speedate-0.14.4.sha256sum] = "08a20480dbd4c693f0b0f3210f2cee5bfa21a176c1fa4df0e65cc0474e7fa557"
+SRC_URI[speedate-0.15.0.sha256sum] = "9a5e7adf4e07e7de39a64d77962ca14a09165e592d42d0c9f9acadb679f4f937"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[strum-0.26.3.sha256sum] = "8fec0f0aef304996cf250b31b5a10dee7980c85da9d759361292b8bca5a18f06"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.25.0.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.25.0.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.27.0.bb
index 59873e8671..c721ff229f 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.0.bb
@@ -12,7 +12,7 @@ require ${BPN}-crates.inc
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "f19d3a1d8998cc2bdab9190cead6becbb3c88d10bdfad947266132f077ce349e"
+SRC_URI[sha256sum] = "f57783fbaf648205ac50ae7d646f27582fc706be3977e87c3c124e7a92407b10"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 
@@ -34,6 +34,7 @@ RDEPENDS:${PN}-ptest += "\
 	python3-dateutil \
     python3-dirty-equals \
     python3-hypothesis \
+    python3-inline-snapshot \
     python3-misc \
     python3-pytest \
     python3-pytest-mock \

