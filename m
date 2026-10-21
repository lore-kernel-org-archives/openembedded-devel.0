Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8719.1792580491149529574
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rPFhnOtj;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e10a70540so337553f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580489; x=1793185289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4Trt78tJnW8DU79wgCd2NVMsuZLKwYahdc0MYpQ5vc=;
        b=rPFhnOtjdWJVxR4dvyOR4Cq9iGO8KJW4Bd/rB1XCJn/kFH6/hdILH1JAZWIlHFXtoH
         Ti+bUnLr+ySpE0FNMl4xVtR9QUjR3ZxJPV6hpRb3xwc4Qbpoq4Mg3ERCbfZ4zkTwun8R
         PJVolz2iP1xwoL2lvC0E+J4QnL4Puu2iL5rTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580489; x=1793185289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4Trt78tJnW8DU79wgCd2NVMsuZLKwYahdc0MYpQ5vc=;
        b=C+nzyFJQcCf6o424plEfS+VJhZCpgGy54UdpNUhXguH0g3bH+lgpx2lUx3+KxyyErL
         JU71rv/wNfX/b8U5NZJI8pV46pcQoFYHgfAoD1FHnP+xETrwTeLoohzUOIXM4bPsWTA4
         BkXhU8pe32+FHT0jtvHfZ43Gl7JHRGj+XsYb+RXUV0T2UddUp9MeVZUhxoXUI5tpDvpK
         kr90RS5/lW4G7W2siyNUj37oBQy/155zAOAYB1QUaZhpmz0MKe6/SDg+Q290SxpyngXp
         sq61Da+qRTkfv9pf8oNOJFi86Wm0mUItaqR9TIMMw4WAv6SKPvYNhJf6o2pwbPduarTX
         NOvw==
X-Gm-Message-State: AFq9FYKpp8s5chM5AQVKJH9phDOyC5NkVUk93723yc6zp+qx1kZdgi4a
	o76YWLb4Px8jNBsQnbNrMGMbFHhTksBB6pRruuh7aqYPH5kNMAvExrzCDrUzpdBL7uKOZzQ3O2O
	owjqT
X-Gm-Gg: AYBFou2poraa/HVQh2gkFTMRhYHr8f40ysW4DYsrfHapxMuoQR31WelP1CvU6ceYyOV
	8PV3pjtGiDVAwSPPN/DduH1gLpjKx95JfN3T1n8J/70WPMrQyR5k2M8q4MndBhiqb7cAOUtkh/G
	/snYDVpkps4QlN2z7Qsw0no2o4Si5iLjQim6iNzXU264Kwgt4hcVJsr2TARd0hUAwH/mV29Urrl
	zUcG8+hP9kNG8QyDJ3wSLud/tOoRkYPlDSKwIzJdBmke2tA4QL51Fa1rXBfPlMbRL3pDucOXLDA
	/yycG5A5FpqRdfB2mzlfFxyiHpKh8lFRcId+tAfzXFlUiF2GCQFOP+eCsVqOX1WMViOyxbHJcae
	Zw1t+T2cFKL9Kgm9vbl14urYa9P6ncKgqNuRZnO3Ja3ttOxhBmTv79RMAcnOhD8efc75u17y2LK
	BFHAzQs07hIcKEf/iD59ikdOlIUj2dJbvOgf8uROTdYLZfOLGeVACpHjRukE1K9VBG+PfRwuEfU
	YMpLfuR52hA8/hH8K71Lju74bpKju44ceRjUJ8z6tu+LG5w0G1WPj2TjDGEBTq9DmHJyPFMDSVA
	x5sYO10mSrFV37wnBMWzZ3Or8auzZji3TMyJ7+8hNn1o8lsHeMsQjZz+I21iWTpinQ4eVcK23BG
	91b6c
X-Received: by 2002:a5d:5f55:0:b0:48d:ca32:e90f with SMTP id ffacd0b85a97d-48e264e905cmr3386400f8f.55.1792580488799;
        Wed, 21 Oct 2026 04:01:28 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:27 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 11/36] python3-gmpy2: Upgrade 2.3.1 -> 2.3.2
Date: Wed, 21 Oct 2026 14:00:35 +0300
Message-ID: <20261021110103.1943456-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131270
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.3.2:

- Fix processing defaults for e/E format types precision

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-Avoid-do_configure-requires-check-error.patch    | 8 ++++----
 .../{python3-gmpy2_2.3.1.bb => python3-gmpy2_2.3.2.bb}    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gmpy2_2.3.1.bb => python3-gmpy2_2.3.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-gmpy2/0001-Avoid-do_configure-requires-check-error.patch b/meta-python/recipes-devtools/python/python3-gmpy2/0001-Avoid-do_configure-requires-check-error.patch
index 3c602cebe5..0fbbee8b43 100644
--- a/meta-python/recipes-devtools/python/python3-gmpy2/0001-Avoid-do_configure-requires-check-error.patch
+++ b/meta-python/recipes-devtools/python/python3-gmpy2/0001-Avoid-do_configure-requires-check-error.patch
@@ -1,3 +1,6 @@
+From b2ee22409705ee043d79550867e9002ab6e86672 Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Sat, 28 Feb 2026 17:01:58 +0800
 Subject: [PATCH] Avoid do_configure requires check error.
 
 The gmpy2-2.3.0 need setuptools < 80, but version in oe-core is 80.9.0,
@@ -14,7 +17,7 @@ Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 1f00809..3a4f3e2 100644
+index 214d656..30d3f33 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -1,5 +1,5 @@
@@ -24,6 +27,3 @@ index 1f00809..3a4f3e2 100644
  build-backend = 'setuptools.build_meta'
  
  [project]
--- 
-2.43.0
-
diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.3.1.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.3.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-gmpy2_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-gmpy2_2.3.2.bb
index 9bb3c96fbe..d1097801e8 100644
--- a/meta-python/recipes-devtools/python/python3-gmpy2_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.3.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 DEPENDS += "gmp mpfr libmpc python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "313f35e9fe6b9ddf72759b14dac25166fe5757c970403e4bbf87a70ab2be07df"
+SRC_URI[sha256sum] = "f20b7e2f8fd16f8d6846bb5b73359c3cc5aa41ec5cf266321d362f547c8fd097"
 
 SRC_URI += "file://0001-Avoid-do_configure-requires-check-error.patch"
 
-- 
2.47.3

