Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.314.1623866381004618640
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 10:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RPYbWATo;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id m2so2620108pgk.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jun 2021 10:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xVTbPc0Vqn0z4qvheGDzazNiTtVbTbCCwyGFaOAZxXA=;
        b=RPYbWATo1TFeE7f/OhKdJZ0huTxkCO5xLhVvlcK/2QCWHxJya30eL94W3+UeTXHbwQ
         z1KDck0lkDEYS6IuM/E0nKShmeyJ/1k0kfCm5qC4GL2JJs66UnfUZSoY4ncYCdeuLOIP
         n0nRQ5PdCXlNFOCWL2550zE0Z4hym77D5uf0qgoNyVGGWx1UnijzmwpIzo5POKqs+ZtR
         Zy3Tox2hoNX/MALa4UF7IKY9kCbRf9TFzcknlyBlZkCZ+96BhPz0jL+wycZQp1GyrAW6
         fK++iblDVUYDDIl9CCJB7aarxyBMLUAgtAWVEd+ueQpAKBSiKDKg29NYis6MNltzi3DQ
         nolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xVTbPc0Vqn0z4qvheGDzazNiTtVbTbCCwyGFaOAZxXA=;
        b=pWh9BOqetOg+8YFxle3hWOTbNgb45FIOqSUkZy5BBdH+W+OF+YgOfvBaMOmh3DmSf5
         RSG1TPWMa0hjwrxCZcnEvRyquPQfk86rXNEUqwoZX7FsAhB+bHBZlSsQnh7kJ6MvBfFM
         lqKotrsDm/Fo4rT7aAd3aQ5Z17d0Bk9hwQsKzlGCC/FvqYUR1ms7rnXlmY65HGH3C5Cd
         sbq3siLup94x4Yazehvb9kX7Nkm02EYCJnpLc12vCtWQCmgFuEVx49odQS1ULiKKvjSu
         lOxt2pma9LjuCfHIIGFrWSjI6Wfa+VH1g2zHEcQeHtWlNUiQZBYAk1Mep7k8iUOmNNXN
         EnGA==
X-Gm-Message-State: AOAM530hV3894HChoeNIKUUhY+8KExEUW1nCgnNHMZL3DGVwObtFZLkj
	+UasjZy8MQeabYI9z+lxS5jYG9luC7sweQ==
X-Google-Smtp-Source: ABdhPJyUSTFcXcuWvupy6S/gv+ZS63OC1INmMDfe/X5qjS9OlxHqHNvWoK067YrDzR52qDDFmfVtJQ==
X-Received: by 2002:aa7:9578:0:b029:2e9:dec0:bef4 with SMTP id x24-20020aa795780000b02902e9dec0bef4mr916134pfq.29.1623866380395;
        Wed, 16 Jun 2021 10:59:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id y7sm2872982pfy.153.2021.06.16.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:59:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/9] ltrace: Remove unused static function
Date: Wed, 16 Jun 2021 10:59:30 -0700
Message-Id: <20210616175937.323664-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210616175937.323664-1-raj.khem@gmail.com>
References: <20210616175937.323664-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...emove-unused-host_powerpc64-function.patch | 37 +++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-ppc-Remove-unused-host_powerpc64-function.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ppc-Remove-unused-host_powerpc64-function.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ppc-Remove-unused-host_powerpc64-function.patch
new file mode 100644
index 0000000000..39e1f77a0a
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ppc-Remove-unused-host_powerpc64-function.patch
@@ -0,0 +1,37 @@
+From 4517bf59838f40eb6e3f46e39adb5e5090c59df8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Jun 2021 18:14:36 -0700
+Subject: [PATCH] ppc: Remove unused host_powerpc64 function
+
+This function is dead code, remove it which avoids compiler warnings
+with clang
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/linux-gnu/ppc/plt.c | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/sysdeps/linux-gnu/ppc/plt.c b/sysdeps/linux-gnu/ppc/plt.c
+index 5f81889..9d1838b 100644
+--- a/sysdeps/linux-gnu/ppc/plt.c
++++ b/sysdeps/linux-gnu/ppc/plt.c
+@@ -142,16 +142,6 @@
+ #define PPC64_PLT_STUB_SIZE 4
+ #endif
+ 
+-static inline int
+-host_powerpc64()
+-{
+-#ifdef __powerpc64__
+-	return 1;
+-#else
+-	return 0;
+-#endif
+-}
+-
+ static void
+ mark_as_resolved(struct library_symbol *libsym, GElf_Addr value)
+ {
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 17264cef5e..b81093aa24 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http
            file://include_unistd_nr.patch \
            file://0001-Bug-fix-for-data-type-length-judgment.patch \
            file://0001-ensure-the-struct-pointers-are-null-initilized.patch \
+           file://0001-ppc-Remove-unused-host_powerpc64-function.patch \
            "
 SRC_URI_append_libc-musl = " file://add_ppc64le.patch"
 
-- 
2.32.0

