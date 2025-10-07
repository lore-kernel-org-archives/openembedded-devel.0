Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA19CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 09:59:12 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.14923.1759831144027991770
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 02:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O/PZatPO;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3e44f22f15so896747566b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 02:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759831142; x=1760435942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STtHOzC+/uhyw5CN/JjEUBQIdVzTkLIfJcTmImKt098=;
        b=O/PZatPODStX6CNx7/FD4eCncnuvJhMDpWE5keNP4XqzR33MyEeJ2Yu9OUUVwnYTSZ
         8R42yh4prKaV5KoItm7Dnp7EocSomCdxpPH7EXSqwXvARFJBylC2X8E1K7GOyRBC73XN
         nvTnWEKSFFLvHPMbrEtdnRUnmQScm078bIYXm3KVYeWjjSofjjrJKTnnKcs6/JeD8BIR
         UO4qcbFHsuE/BJxoCj2/OCVY6lROxHMRVhVCVjUrQjkwJDJBlBmXaKDeRLe5Iv4o1jSO
         Qc/+Tb0XamRYNfmvRRcg89SxbRXUnOvwDeaEc8xqFQGT0ULjwyg3+r9zwEm3GfTeZcLT
         YRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759831142; x=1760435942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STtHOzC+/uhyw5CN/JjEUBQIdVzTkLIfJcTmImKt098=;
        b=PYaCfck5HPJU21Wz6wP8YkMzGqYY1apH2e2GBNsG6WpAM6H9L9NVYnIUSwCnoV9Fc6
         0wg84iq2vcPhcNPCNY84qq03Aq0jMUIjWD4LCL1+vjJCQdw2OBI1GfPgcj254zKGPctS
         S54PlL1QRaNJXWzppmbGwiP3ygJEPew5XU6Ztpt6qSPzHNyC6a/gfjurhRBX2kqJOCB8
         aqI4FQOoMb8ZKGX/6ZxX9XCUabKEJI/ONxRrFmPVyiWTqOtqhGqno2KxxccEAIf3Al64
         GeNMV/2u9+jtvFtp5XNH9RNgOclvwEYZVb61h+wGYmJOvcRUgIfbTs5JIlqUlCJMjjWC
         iDuA==
X-Gm-Message-State: AOJu0YwZ0SuCNI1MinujtBQr+XUWgwmLgWxoy2KZoqYbWZK10guvzkIM
	fYnjkOMfCulebGUeB/n/SEnwMeUPtwBB6xRybsvqm7wO6ksDDEPrYW7VNCAl7A==
X-Gm-Gg: ASbGncvLgIAUS7cTAj8Xd6O+vGfSqemStCcCyWA3uZgiBmX4IGnZVqO4UmeA9wzOXez
	yDI70d9OJvlysgVIszJhuELJaJqbVAm7yJ6w6OCqiR8HHMNvCbN9rEPBMz5uvBcWiKUmuMMLqsh
	A/pgHPKtEbOrzIgE3BjYD383qWq3KG4CBIQRlf/NWkqqQ3IbcHIwJnQLHuHuDtZS+Y6ZIDl7PBq
	CfKLP5Q79DmwBAhtF8IIcJyd+BxrT7yRexmX250GO3n2uCCJpQ6AWtHlB/1Mv8X5wJy3RmEWmUq
	rcc2l7g4O7fq6ISCjaQBxMZ+KSjeHBFxe5OoA69dfrqpRE7p61KO0g4yHjofw1Uo2HcQyJvcF1p
	FYWwu3yfnWsjOLDM18ekFC3MqXyGlLIGTGBBfMmHD2uBJ
X-Google-Smtp-Source: AGHT+IFH3UiV5B1kcrLzhPIB1697nCiwLflSyex6/SRUG3HooeNErLRmyC3d7WpNWwXDf3UCjR1E6g==
X-Received: by 2002:a17:907:86ab:b0:b47:c1d9:51c9 with SMTP id a640c23a62f3a-b49c3f7d31emr2007005166b.62.1759831142015;
        Tue, 07 Oct 2025 02:59:02 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3aaf87sm11822073a12.4.2025.10.07.02.59.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:59:01 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] python3-django: upgrade 5.2 -> 5.2.7
Date: Tue,  7 Oct 2025 11:59:00 +0200
Message-ID: <20251007095900.57445-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007095900.57445-1-skandigraun@gmail.com>
References: <20251007095900.57445-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 09:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120330

This contains a fix for CVE-2025-32873, CVE-2025-48432, CVE-2025-57833 and CVE-2025-59681.

Drop patch which has been incorporated by upstream in this release.

Chagelog:
https://github.com/django/django/blob/main/docs/releases/5.2.1.txt
https://github.com/django/django/blob/main/docs/releases/5.2.2.txt
https://github.com/django/django/blob/main/docs/releases/5.2.3.txt
https://github.com/django/django/blob/main/docs/releases/5.2.4.txt
https://github.com/django/django/blob/main/docs/releases/5.2.5.txt
https://github.com/django/django/blob/main/docs/releases/5.2.6.txt
https://github.com/django/django/blob/main/docs/releases/5.2.7.txt

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ated-setuptools-to-normalize-package.patch | 27 -------------------
 .../python/python3-django_5.2.7.bb            |  9 +++++++
 .../python/python3-django_5.2.bb              | 13 ---------
 3 files changed, 9 insertions(+), 40 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fixed-35980-Updated-setuptools-to-normalize-package.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django_5.2.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_5.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-django/0001-Fixed-35980-Updated-setuptools-to-normalize-package.patch b/meta-python/recipes-devtools/python/python3-django/0001-Fixed-35980-Updated-setuptools-to-normalize-package.patch
deleted file mode 100644
index 4e28f59d8a..0000000000
--- a/meta-python/recipes-devtools/python/python3-django/0001-Fixed-35980-Updated-setuptools-to-normalize-package.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3ae049b26b995c650c41ef918d5f60beed52b4ba Mon Sep 17 00:00:00 2001
-From: Nick Pope <nick@nickpope.me.uk>
-Date: Fri, 6 Dec 2024 18:32:39 +0000
-Subject: [PATCH] Fixed #35980 -- Updated setuptools to normalize package names
- in built artifacts.
-
-Upstream-Status: Backport [https://github.com/django/django/commit/3ae049b26b995c650c41ef918d5f60beed52b4ba]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index f10d15d20d..b9e82334cd 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["setuptools>=61.0.0,<69.3.0"]
-+requires = ["setuptools>=75.8.1"]
- build-backend = "setuptools.build_meta"
- 
- [project]
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.7.bb b/meta-python/recipes-devtools/python/python3-django_5.2.7.bb
new file mode 100644
index 0000000000..a0589d9916
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.7.bb
@@ -0,0 +1,9 @@
+require python3-django.inc
+inherit python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "e0f6f12e2551b1716a95a63a1366ca91bbcd7be059862c1b18f989b1da356cdd"
+
+RDEPENDS:${PN} += "\
+    python3-sqlparse \
+    python3-asgiref \
+"
diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.bb b/meta-python/recipes-devtools/python/python3-django_5.2.bb
deleted file mode 100644
index 8a20448e22..0000000000
--- a/meta-python/recipes-devtools/python/python3-django_5.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require python3-django.inc
-inherit python_setuptools_build_meta
-
-SRC_URI[sha256sum] = "1a47f7a7a3d43ce64570d350e008d2949abe8c7e21737b351b6a1611277c6d89"
-
-SRC_URI += "\
-           file://0001-Fixed-35980-Updated-setuptools-to-normalize-package.patch \
-"
-
-RDEPENDS:${PN} += "\
-    python3-sqlparse \
-    python3-asgiref \
-"

