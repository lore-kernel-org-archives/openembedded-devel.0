Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA99C35FFF
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 00:57:16 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.10930.1742518633983184785
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 17:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UQ/o2Mg/;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-225477548e1so26518805ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 17:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742518633; x=1743123433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7LwvhJJLR3s1jXui5DkrW3mM6ObmmTpE6Y8mLtDMMPg=;
        b=UQ/o2Mg/RWlzxJXl1U8BbCi05oG9dS7Z28lyY912obklFfB/dm8pVuTtHqzOzsruAw
         K6moEqlesURo0qq2ZH6ogHxsjzegekSjKkun71kGloFPKvqCZkQE9kf+dNra4x2AfU0h
         4gUQmHc5H/FAiyGVzsTP8q3g34dCSaMCfgu2tnlM7iOw3ES7L0Xiy+byPmNHbfG1qoYD
         lRPiAuPcsYkgkLnlazDFaYcI7CSnZGjJAod8qUi/oN4LYQWHOUNGhW3R6c3a4cdPdnvH
         H5oCyA4CtJ+/ZAlKVlVz/pan3cE2+k8vwC96Kmr+no9Ifa05pbEdv7TOp6RZB8JPwAQ3
         lVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742518633; x=1743123433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LwvhJJLR3s1jXui5DkrW3mM6ObmmTpE6Y8mLtDMMPg=;
        b=jNofuJzHephGenwtM8gpUGl8mqXH/NyfnH69diuMHKXqJ8eFLyVP+f8jw0sqJYetxw
         MzPeWLfbCTiJkhwJSHjDKKLgDKE5DuYRybxUzwNUOgK7rFtOtVX+4Lc9f9i9f6vOoG/B
         xv8vOhbQtXQ5BZ+9HvOFStKgTBeEkuIZG0QQRLUXFDwYx9llsQOOiJ+mxgb7XCf0kl5E
         KrRch9gdtX1Bchy2MoOw5TuhmXVts6MyfLVszHNzxMPITfizeDlkzex/sAKje6tlonz5
         7/mCMma8hlRaGFftW71cN+8LV1mBksE4tA9MdtVtCNgwqgInuYTD7czMoQQR8TmGgP7j
         D5Dw==
X-Gm-Message-State: AOJu0YywmcVWeITWR25y156CRz2X2GyNJD0Ujqyj9KWYtAPen9n9auYW
	bzEh9+kC9yxXZlkf4CYZ8b7EnhCvOjNBI5yFtZMJFlcYECGlnHW8yFeg6qsl
X-Gm-Gg: ASbGncuDzT6rna5pCo/oMmpsF6G5MOcjDrzOJzHRNxj4pPDVx7F4UfOpMPb3nXaCZql
	fst1QpM+J/gs4zBViGOr1f+rebOCfrOPAKwKHaW/rkQ/gF10Px7x/cEFxKJU1dMoPR0QozXregM
	nNbuJY8+PubKUYAAiXyawpm1oJr+crw043MFfpZVpCEN9zZPfgr02YeD4I6NXCcEdlTb5OMigq7
	YjpeeKuSzNZzEG2zRtkIdB/jWyTyIC/FIr/bYaZggEAp6M9xxlBceAWt0qFN2E2VetxN0Pp+NQ1
	sV4cXGWGeDoIgbrqhRXMzH1wifU/FB+Ovy365yC/S3QhNUY=
X-Google-Smtp-Source: AGHT+IHskHFmzgZxqiZg1vjGYt/QTAQlFVDl/OXzH/twSoEBh5rzD+HhTbuA4/4emfUGQXC17FqQ3A==
X-Received: by 2002:a05:6a00:418a:b0:736:7175:f252 with SMTP id d2e1a72fcca58-739059d763cmr2655551b3a.14.1742518632549;
        Thu, 20 Mar 2025 17:57:12 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73906008299sm513594b3a.74.2025.03.20.17.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 17:57:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sedutil: Upgrade to latest on tip of master branch
Date: Thu, 20 Mar 2025 17:57:09 -0700
Message-ID: <20250321005709.1600663-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 00:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116154

- Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-include-missing-cstdint.patch  | 32 -------------------
 .../recipes-extended/sedutil/sedutil_git.bb   |  6 ++--
 2 files changed, 3 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/sedutil/files/0001-include-missing-cstdint.patch

diff --git a/meta-oe/recipes-extended/sedutil/files/0001-include-missing-cstdint.patch b/meta-oe/recipes-extended/sedutil/files/0001-include-missing-cstdint.patch
deleted file mode 100644
index 8afcb1fa48..0000000000
--- a/meta-oe/recipes-extended/sedutil/files/0001-include-missing-cstdint.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 927cd88cad7bea94c2eebecc18f7881f0defaccb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 26 Jan 2023 23:36:29 -0800
-Subject: [PATCH] include missing <cstdint>
-
-gcc 13 moved some includes around and as a result <cstdint>
-is no longer transitively included [1]. Explicitly include
-it for uint{32,64}_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Upstream-Status: Submitted [https://github.com/Drive-Trust-Alliance/sedutil/pull/425]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Common/DtaOptions.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Common/DtaOptions.h b/Common/DtaOptions.h
-index c012af1..7530a0b 100644
---- a/Common/DtaOptions.h
-+++ b/Common/DtaOptions.h
-@@ -21,6 +21,7 @@ along with sedutil.  If not, see <http://www.gnu.org/licenses/>.
- #ifndef _DTAOPTIONS_H
- #define	_DTAOPTIONS_H
- 
-+#include <cstdint>
- /** Output modes */
- typedef enum _sedutiloutput {
- 	sedutilNormal,
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-extended/sedutil/sedutil_git.bb b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
index 972a33c742..64d5111f45 100644
--- a/meta-oe/recipes-extended/sedutil/sedutil_git.bb
+++ b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
@@ -7,11 +7,11 @@ LICENSE = "GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://Common/LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 
-PV = "1.20.0"
-SRCREV = "d3de8e45e06a21d31cca0046ceb16ced1ef3563a"
+PV = "1.20.0+git"
+
+SRCREV = "6270fb0e3c110572d96936a473b5e0d21a39884d"
 SRC_URI = "git://github.com/Drive-Trust-Alliance/sedutil.git;branch=master;protocol=https \
            file://0001-Fix-build-on-big-endian-architectures.patch \
-           file://0001-include-missing-cstdint.patch \
            "
 
 S = "${WORKDIR}/git"

