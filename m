Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.5445.1619511886543632359
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Apr 2021 01:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@justinstandring.com header.s=google header.b=hQSBSWdA;
 spf=pass (domain: justinstandring.com, ip: 209.85.216.44, mailfrom: me@justinstandring.com)
Received: by mail-pj1-f44.google.com with SMTP id p17so2584617pjz.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Apr 2021 01:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=justinstandring.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FhU7/fR3RquYcF7y/nvtYI8V+O99sTvjDINTmT6LtCU=;
        b=hQSBSWdAUdL4WBy2IMvj1yxNLZjKqNQmajaPcKNdAXDnTHYGSVhLfmuumZxSdOLTl6
         HR+DnqYqL3kWmq2YjpUzBk46/zmva4HaEzrfqB67RU0jzt3VZWO55ePLy6iSZTiXj16o
         GSqJkrQDGh9ErhJpb1emFTzMxee1nNknqrVuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FhU7/fR3RquYcF7y/nvtYI8V+O99sTvjDINTmT6LtCU=;
        b=DeRaDCe3cGhXNRMnQ5LCs8Tbh6u+taQnlSDXSI4Tonxm3ZdQ1MPgBCFZ7D2ee/qNQT
         VuH2BA2GjkGDLCBB45eS7/tdtlKzOwuhAbjbso96EqLlwd5q7j0dsxM3oJ1bwHGBWb9i
         YqgIOETgd5UC1FcvDoFYZZOVUHJKoV31OXfvsDcyevaRxoWfAQ3cP6asyuftyPFnFjcW
         f8NFIoTtG7y1jyip+ta/Ufjy2Q4zfXbRVf1Etug8GF/6wC5SGoyZFT9xAqFMRD3ZEhbv
         J1KkXdwThcw1Kdk0KDqwQcePb+OWJ2Z0Xxg5XobUYchwsg7iQiHrho/sTktI3goqfr1F
         vlHg==
X-Gm-Message-State: AOAM530PWpV3skp2XCFMAxSfYDU3uDlAfUAvJVDJEylfbistYV9GQ0dl
	BhWUCt8sLGOeaFff6fi7qHgejZGIEhb8O+Bk
X-Google-Smtp-Source: ABdhPJywYDuQ0twikScwSSQ+/Z0mNgChOgEfwNRHVKsiGkaKi0NQi1ChQWZN5euUNBaSgVTSdT/oVA==
X-Received: by 2002:a17:90a:94c4:: with SMTP id j4mr3553528pjw.14.1619511885875;
        Tue, 27 Apr 2021 01:24:45 -0700 (PDT)
Return-Path: <me@justinstandring.com>
Received: from localhost.localdomain (203-86-195-211.tasman.net. [203.86.195.211])
        by smtp.gmail.com with ESMTPSA id a18sm7774817pgk.66.2021.04.27.01.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 01:24:45 -0700 (PDT)
From: "Justin Standring" <me@justinstandring.com>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Standring <me@justinstandring.com>
Subject: [meta-oe][PATCH] tslib: add PACKAGECONFIG for evthres, one-wire-ts-input
Date: Tue, 27 Apr 2021 20:24:39 +1200
Message-Id: <20210427082439.7047-1-me@justinstandring.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In configure.ac, evthres is enabled by default.

Signed-off-by: Justin Standring <me@justinstandring.com>
---
 meta-oe/recipes-graphics/tslib/tslib_1.22.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.22.bb b/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
index 5d3508857..326818eef 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
@@ -23,9 +23,10 @@ UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG ??= "debounce dejitter iir linear median pthres skip lowpass invert variance input touchkit waveshare"
+PACKAGECONFIG ??= "debounce dejitter evthres iir linear median pthres skip lowpass invert variance input touchkit waveshare"
 PACKAGECONFIG[debounce] = "--enable-debounce,--disable-debounce"
 PACKAGECONFIG[dejitter] = "--enable-dejitter,--disable-dejitter"
+PACKAGECONFIG[evthres] = "--enable-evthres,--disable-evthres"
 PACKAGECONFIG[iir] = "--enable-iir,--disable-iir"
 PACKAGECONFIG[linear] = "--enable-linear,--disable-linear"
 PACKAGECONFIG[median] = "--enable-median,--disable-median"
@@ -49,6 +50,7 @@ PACKAGECONFIG[arctic2] = "--enable-arctic2,--disable-arctic2"
 PACKAGECONFIG[dmc_dus3000] = "--enable-dmc_dus3000,--disable-dmc_dus3000"
 PACKAGECONFIG[cy8mrln-palmpre] = "--enable-cy8mrln-palmpre,--disable-cy8mrln-palmpre"
 PACKAGECONFIG[galax] = "--enable-galax,--disable-galax"
+PACKAGECONFIG[one-wire-ts-input] = "--enable-one-wire-ts-input,--disable-one-wire-ts-input"
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 
 do_install_prepend() {
-- 
2.25.1

