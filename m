Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.3090.1624421593448454046
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jun 2021 21:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xt/eo9Rl;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id c5so1275398pfv.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jun 2021 21:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IzAg/sDBshDK3mXEDuYylp4BNxzDh2VieRqAopkBbjc=;
        b=Xt/eo9Rlt49VemEUvMwDJeLhZ6EnIZU+5SJkM8lFHR/2zhe2FYooLKZdfv9ZYTJTDD
         NfcUX2IAwBefMNz7DdiySVlHkmIJYLc0zv/fRZRL04CCZ/MAfnJ26R+fWaYD7j+5hWtO
         MlZ7WIvzIFMvfonGNjaPDsRiP18RbkUNZ5Qbw5Kr2C5iAOe4ilEoB7ZdLiaYqwBIfXsv
         UxPuwjmEecTM0LfaJDp6Kf+BV6MQUcxqM63h/9zQDhQv1aHJtU8R85iybcuhg03ATg/m
         FIzNN+I5Ane/3uPfl4LkwoQfs+ixuAqqN/UhCXfFocCrduYLUUidftkmWFXHd7lK8oXf
         3G6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IzAg/sDBshDK3mXEDuYylp4BNxzDh2VieRqAopkBbjc=;
        b=HGeZBdTNAeGerYpyESTCVjfNv/N6SLpvW8xNmo2fQwTVa5fGMYLLy8Ap3NgdB7qJ4T
         Yz4Ek42QCiYBgPjaQvmF/chm85odha3GfSU3jnEMl1sR1/AFdMfUQIRHZC978AwoE/7q
         jtFeWZBFW1KI4cROPFQdrlcA+ZUWDhALmtA7kQp78xHsacdcn2CHe4qdZdCqc9h952H7
         hDmkPhT6Pfuo04IqRHWT6M7EJP160CWf2gt14A67BM1gRi1Bg7t+CzsO53jMEuGMaLbJ
         GGNMkJ66appyqioSKdBK8bnYWXsCPHC4yNxUA0Sua4H9sm98+/GDSEc6BPypDv10/yhE
         ITgw==
X-Gm-Message-State: AOAM530piPq0g1Iqtx9JzgRQ4Uzf5wQVnNuU4JbN0LVoaLHk6HE1rIAf
	UX2Y0LkuryW4N4I+kAlZYssQWaeo7kufOw==
X-Google-Smtp-Source: ABdhPJxwH8GVorzFEt7mzkGCkV4zAXBBrO7suLcBvRZLIWisqBYJw+wuKeJ1kab//PDSAzzWU9c2eg==
X-Received: by 2002:aa7:8707:0:b029:306:7e78:ee7a with SMTP id b7-20020aa787070000b02903067e78ee7amr2076247pfo.29.1624421592574;
        Tue, 22 Jun 2021 21:13:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bfd0])
        by smtp.gmail.com with ESMTPSA id b5sm17951239pgh.41.2021.06.22.21.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 21:13:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/4] python3-process-tests: Add recipe
Date: Tue, 22 Jun 2021 21:13:07 -0700
Message-Id: <20210623041310.3976956-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Needed by ptests of other modules

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb     |  1 +
 .../python/python3-process-tests_2.1.2.bb         | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-process-tests_2.1.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 090b9802db..9c44d38ceb 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -278,6 +278,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-pretend \
     python3-prettytable \
     python3-priority \
+    python3-process-tests \
     python3-progress \
     python3-prompt-toolkit \
     python3-protobuf \
diff --git a/meta-python/recipes-devtools/python/python3-process-tests_2.1.2.bb b/meta-python/recipes-devtools/python/python3-process-tests_2.1.2.bb
new file mode 100644
index 0000000000..dccdeb7a00
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-process-tests_2.1.2.bb
@@ -0,0 +1,15 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Tools for testing processes."
+HOMEPAGE = "https://github.com/ionelmc/python-process-tests"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=37031056aff37e4b3310872a9a3d0b1e"
+
+SRC_URI[sha256sum] = "a3747ad947bdfc93e5c986bdb17a6d718f3f26e8577a0807a00962f29e26deba"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "python3-core"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0

