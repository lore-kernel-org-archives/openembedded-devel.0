Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.60152.1622563223169754157
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jun 2021 09:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MlFJYIOY;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id h16so4857325pjv.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Jun 2021 09:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O1xoK5Q4ZKtPDAWP7URbonAhaZaz11guFq6XbG3KtZo=;
        b=MlFJYIOY7zJopyBfGTZCsmcvg6lysbktNxSqZPaNZivg+0HqO6uC56BjHgCjSits+G
         VoHSWL9/ujKeLhdRxSAMm5dghe5Y8gFNE4esfurmKo1hU6bYF2nmJBS9lIddRT05udpN
         p74YmZBoIvDR76jEgBNTDIiA1lfRyebtyZU8yqs9bTTGgbJmLdQ2BwMp4b6dtBqI+Sif
         Tj4kMNLIZ3JYZ3PE2G8skAR8BGKOGY6iH2hoAHVmu+hcwT8lAKzpM9TPiFd7e96saz3j
         +/ANfzA3/NZr/06LHUCk9z6QJjRDPW7YmDw/d19jkTBwoG1x9irHPs3R7MYm9GdDpLjU
         063w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O1xoK5Q4ZKtPDAWP7URbonAhaZaz11guFq6XbG3KtZo=;
        b=SkHXD11PU59quciIW0QfUmw7hZx+ci42r7dQbJpCB9nZMZS+1ni5Le9Dyfx7q6BdPs
         9+aJ8le96WX6I2s47mWu0PQJwKAtFbrSzv7ZYSLcjvsRIiEAhcWu96quoJVTOQl5eufn
         2d23M8IoYTw56SvHjOPt3XnVN/HQVzlowQIyDzMTdwJxh9Q72aoY6zMScgAl75BK2OVj
         hHbKkkryrY9UNJ+A/gO4lA+IM+uz+OM9c+Tt3MhcsWNFxJOlfY9fXWXTyYPK86Z84BEt
         wxp8Cfku+DMzbTNTECh+ZwFgsmmSmiJ9xAJUZaM7ngHfr+4Zcl0hP8sciVKJq9oZExWq
         Misw==
X-Gm-Message-State: AOAM533gdi/O7mPH/jCyiMOrheQ7YoRiSk5lSyc4VGA3TphYFSCQr+Sk
	kq3hQaE5C3bcSK9VgoDa7IwhD+e2TZzARA==
X-Google-Smtp-Source: ABdhPJyTg+E5ffWgAiGYag7NHeWzxXA7MAFO/kmGqcx3uli9u1WoR7FENdfLt3ywhrm6UUJEN9Cj+Q==
X-Received: by 2002:a17:902:6b8c:b029:ea:f54f:c330 with SMTP id p12-20020a1709026b8cb02900eaf54fc330mr26923621plk.10.1622563222237;
        Tue, 01 Jun 2021 09:00:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id f9sm13211752pfc.42.2021.06.01.09.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 09:00:21 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mongodb: Fix -Wc++11-narrowing warning on 32bit
Date: Tue,  1 Jun 2021 09:00:17 -0700
Message-Id: <20210601160017.3005343-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Use-explicit-typecast-to-size_t.patch | 35 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-explicit-typecast-to-size_t.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-explicit-typecast-to-size_t.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-explicit-typecast-to-size_t.patch
new file mode 100644
index 0000000000..5b724ff8aa
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-explicit-typecast-to-size_t.patch
@@ -0,0 +1,35 @@
+From 6fdb2d304e05a17e57b2efd7f8252794a8722dbe Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 1 Jun 2021 08:25:36 -0700
+Subject: [PATCH] Use explicit typecast to size_t
+
+maxMemoryUsageBytes is size_t type which may not match long long value
+internalDocumentSourceGroupMaxMemoryBytes.load() returns, so typecast it
+to avoid narrowing warning from clang
+
+document_source_group.cpp:378:22: error: non-constant-expression cannot be narrowed from type 'long long' to 'size_t' (aka 'unsigned int') in initializer list [-Wc++11-narrowing]
+                     maxMemoryUsageBytes ? *maxMemoryUsageBytes
+                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/mongodb/mongo/pull/1405]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mongo/db/pipeline/document_source_group.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mongo/db/pipeline/document_source_group.cpp b/src/mongo/db/pipeline/document_source_group.cpp
+index c7bf44e72e..a52906a940 100644
+--- a/src/mongo/db/pipeline/document_source_group.cpp
++++ b/src/mongo/db/pipeline/document_source_group.cpp
+@@ -376,7 +376,7 @@ DocumentSourceGroup::DocumentSourceGroup(const intrusive_ptr<ExpressionContext>&
+       _doingMerge(false),
+       _memoryTracker{pExpCtx->allowDiskUse && !pExpCtx->inMongos,
+                      maxMemoryUsageBytes ? *maxMemoryUsageBytes
+-                                         : internalDocumentSourceGroupMaxMemoryBytes.load()},
++                                         : (size_t)internalDocumentSourceGroupMaxMemoryBytes.load()},
+       _initialized(false),
+       _groups(pExpCtx->getValueComparator().makeUnorderedValueMap<Accumulators>()),
+       _spilled(false) {
+-- 
+2.31.1
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index ba6d052e43..95e0cf7a88 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4 \
            file://disable_runtime_check.patch \
            file://ppc64_ARCH_BITS.patch \
            file://0001-Do-not-use-MINSIGSTKSZ.patch \
+           file://0001-Use-explicit-typecast-to-size_t.patch \
            "
 SRC_URI_append_libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
-- 
2.31.1

