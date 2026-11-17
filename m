Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.723.1794955421791991144
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 14:43:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kgFl70J8;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so3515885e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 14:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794955420; x=1795560220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rDDU/xcj5xykuKvujZ64/J+H2x/I1OsLgM7SRIStZlI=;
        b=kgFl70J8e/Pr0pRlJi9K7KKEX1injx46zoZnuVEnobM5RmAUCA/2acpv6ZFoGtQKDn
         EOgoNNHR+dJ7R7iyuRnLpHZr0s9haxyqzNFljEtEOWnyWR+xcxZTZoUHz5/tXH9fb+sT
         IB6MZGLOMrNY20LQzZ4uYE0NdkwNDLmAUu58U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955420; x=1795560220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDDU/xcj5xykuKvujZ64/J+H2x/I1OsLgM7SRIStZlI=;
        b=DQlUyoO3zw+z7LkeNEuCN/Q5e73IY2heMoc2Ktqjex/3/WTdmRS2+nbD7f6c4mYJo2
         nVbi/RYhw/A2ujjeOYle8oGZHq+1u0FxpZf+ycBwiCMDMP7uIIqJVgpgny27yY4Bcj+J
         uLCe1eiAkh5UbwBHzlZZi/X53dqxNR7WAOT+irjiuuus5si2UJ6HssI8POWstpkAzJ8G
         N3Crb9DGc8hxqqrMqeaMR93D5jQCkvpO0dRmrs6/tNZexE0F2EAeihXg5Kzp9oO60zrs
         9s0mpe8MZDGqlzHmXHr3ynE39yxBQ3EWccbtW09uMU0Ac2djylq3m0kq/Cu4dHqU77Os
         7FrA==
X-Gm-Message-State: APuU4Z+O46nhgHvqTnz2WM8RFBVZK89BA1g7HNzO9vss+nCQro8fuUaT
	DhKp534h1n368q0gU7NioJqNcC159HGBpvgmFYRiktvkorzaGk16Fuzt5AvsebBY54hmLxmaX3N
	C5rFM
X-Gm-Gg: AYBFou2rTdHZroAe+Goy0iIDVV9/hxBodyRM5vbPqKtHJJy5Iycogid9wVaGNls9SfU
	mQEQpqbgm2bNaT62OdPR7uLE593zu3izP0G+sZqo3+g4rdmfufVZE9JAlC3Epf5nletuN6WJaoL
	0Ajc53x3DQnwaBaQbVDDKyycgchYarnm9V09k6eqBCHPYBEuoimhY0gABKWlTzT0T2L4ihH0CJC
	LHX3OyZN0Kk/M2DuhAcov9GA4VVhn49b3d8n6K5esvqBkGhyZVqMkGZcCcKJ+djjuCLsPbbFrk7
	6rcAEbRBIDvBtMGcMMHvxsrjFhMKtyzTxJPy1cPAgTpSPZypYJpatErbzAugF/TX1Jq0PXlLSYi
	9kAHaqVtDDZbSqiXLGEpxoZWQCcUtRtUTwEpKht5mZDA4AR53fXcgKCjcjn4kztRPY5JYfZBpH1
	VfPcZJ9hQPrlSn90Xow+QVfJbK4zBSXBB8kYioL+jn2Ks9Dj3FMDyoZzYFT93GGt6GdaPfp4A5P
	6OcKRgSeYk6tP7e9rZuRY+mtbmPRggHkQ/MRBMem8X1ES0C/ZpgQEqY/4QcsPHTQA/5+pUfPRaG
	eZfMnvgSzXC9TVzw0vsJmyVkn8jGrlJ6do5yVQRqx6WEOUh1xx0BfUUaVN5DrpceHARdiCY/5XU
	RSTEgYp6V55ve6aIWnFXLFMMaB77cRjdZf2Qun3d4ztFVvXNqFOiBmA==
X-Received: by 2002:a05:600c:46d0:b0:4bb:69b3:2b42 with SMTP id 5b1f17b1804b1-4bb7da23d03mr12789345e9.16.1794955420045;
        Tue, 17 Nov 2026 14:43:40 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2c3c93sm25012915e9.13.2026.11.17.14.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:43:39 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 01/11] cabextract: Upgrade 1.11 -> 1.12
Date: Wed, 18 Nov 2026 00:43:27 +0200
Message-ID: <20261117224337.4181772-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 22:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132591
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.12:

- cabextract -f now finds "hidden" files. There are two ways to look in
  cabinets for files, which normally have the same results, but don't have
  to. 7-Zip and Microsoft extract.exe find "hidden" files but not "normal"
  files, while cabextract and Microsoft expand.exe find "normal" files but
  not "hidden" files. cabextract -f now finds both "hidden" and "normal"
  files, if they differ.
- cabextract now prints more warning and error messages for normal cab files
  listed on the command line. For example, it now prints "WARNING; atypical
  files offset in header" if cabextract -f might find "hidden" files

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../cabextract/cabextract/fix-fnmatch.patch        | 14 +++++++++-----
 .../{cabextract_1.11.bb => cabextract_1.12.bb}     |  2 +-
 2 files changed, 10 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/cabextract/{cabextract_1.11.bb => cabextract_1.12.bb} (88%)

diff --git a/meta-oe/recipes-support/cabextract/cabextract/fix-fnmatch.patch b/meta-oe/recipes-support/cabextract/cabextract/fix-fnmatch.patch
index bd486283b6..27d1028ba5 100644
--- a/meta-oe/recipes-support/cabextract/cabextract/fix-fnmatch.patch
+++ b/meta-oe/recipes-support/cabextract/cabextract/fix-fnmatch.patch
@@ -1,5 +1,6 @@
-From - Mon Jun 11 00:00:00 2024
+From e1f0981b45923c50382e7bbbd2f581a9597d68fb Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Date: Tue, 17 Nov 2026 13:33:30 +0000
 Subject: [PATCH] Don't play with fnmatch.c replacement
 
 Currently fnmatch.c, even if it is selected, conditionally disables compilation
@@ -15,11 +16,14 @@ collect2: error: ld returned 1 exit status
 
 Upstream-Status: Submitted [https://github.com/kyz/libmspack/pull/51]
 Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+---
+ fnmatch.c | 7 -------
+ 1 file changed, 7 deletions(-)
 
-Index: cabextract-1.11/fnmatch.c
-===================================================================
---- cabextract-1.11.orig/fnmatch.c
-+++ cabextract-1.11/fnmatch.c
+diff --git a/fnmatch.c b/fnmatch.c
+index 868bdae..d2b6f05 100644
+--- a/fnmatch.c
++++ b/fnmatch.c
 @@ -49,11 +49,6 @@ static const char rcsid[] =
     it is simpler to just do this in the source for each such file.
  */
diff --git a/meta-oe/recipes-support/cabextract/cabextract_1.11.bb b/meta-oe/recipes-support/cabextract/cabextract_1.12.bb
similarity index 88%
rename from meta-oe/recipes-support/cabextract/cabextract_1.11.bb
rename to meta-oe/recipes-support/cabextract/cabextract_1.12.bb
index 96e29aef2b..41d475dbf1 100644
--- a/meta-oe/recipes-support/cabextract/cabextract_1.11.bb
+++ b/meta-oe/recipes-support/cabextract/cabextract_1.12.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     file://fix-fnmatch.patch \
 "
 
-SRC_URI[sha256sum] = "b5546db1155e4c718ff3d4b278573604f30dd64c3c5bfd4657cd089b823a3ac6"
+SRC_URI[sha256sum] = "8f39ad5f9c076b9c62c67dea4f8649e75dcc16899a2d8122ca32ba68262cb713"
 
 UPSTREAM_CHECK_URI = "https://github.com/kyz/libmspack/tags"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
-- 
2.47.3

