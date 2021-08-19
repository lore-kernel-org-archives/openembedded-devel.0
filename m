Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.67776.1629370978727835834
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 04:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MW54UsmH;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id q10so8482090wro.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 04:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LqEtOycEJyul8EVlxDLsgLwDQiiwlvKUs7+v05f+GHo=;
        b=MW54UsmHiwW+gr0HxZZg2ecGJ/e9Aco4G8qNK2d9gj4NqYt1iwDPsReuwOgZ7lDFmm
         IQdRbnIxd0JOjzKDR4e0/6qY73yeAV4dYhPZPhi28dUFssQZLUuPtA1S9W+Sadg3kmwm
         RxcZNbXy78e2I8CjYCODxluV5W7Ayub7iKOwQNjZyEY8MXOsE6hEywDrqZaUhf8BWWeG
         HXQVNmLuU7IGZJOZBPknFTCCpm1BEKcz6ydhVHkxVZZTxazFbhWo8Ee/gIuonAWLYnsA
         WCY95X3HTQPFu9vx5IctuA9fGdP9fWdz4Po94/Bh9XPUdGgIlsTrqFnkl/BdBvpoCjDz
         Ogog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LqEtOycEJyul8EVlxDLsgLwDQiiwlvKUs7+v05f+GHo=;
        b=CBbtunolc1W1sGhUOfSyfqlXWixeRKHWfGxnGdga9kpjKzXwFmUW/XnXM8qID+5kbn
         q9NJyjFC6vGkYQCsD/w6LZIB45Gwprc2HRwKcL74DwEXEWXvxZhXS+JLiUqDKwQnPvjI
         4cXGMKQvrXPv+CKkrzqFwmZio/m+RcHQUrsRS84Uwaxv8z4HBSG6ahl15kYJgWQIk6B8
         sIy0HxbimYtoxNNztMcggfXW6Wlq/AYwLraCWXimb3OKvxC+KDNpcx6zVkUPE0bx/XlL
         j8oD0Pjn376tomZnV39fBvbNNoqurpil2wy6+IJvEFV0korDmtOiOEbAmemm2DliRNs7
         TtoA==
X-Gm-Message-State: AOAM531tubswhQGlA9p8F4gMEFt9igKPlu2NRD1RAZITpSVtXrMOd5+3
	Kj/XCpRaAfaR6aMZ1MlscOvKtzCPiaQPsg==
X-Google-Smtp-Source: ABdhPJxIHjNiorSTW51g7kT4uJNUapSxVvNpKwz8LikGSLa3FxGZMObWbCS46lmGAq4+SgiKgDmRfw==
X-Received: by 2002:adf:dcc1:: with SMTP id x1mr3117192wrm.401.1629370977338;
        Thu, 19 Aug 2021 04:02:57 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f030860fe64da8baf3ac76f.dip0.t-ipconnect.de. [2003:f0:7f03:860:fe64:da8b:af3a:c76f])
        by smtp.gmail.com with ESMTPSA id y13sm2119642wmj.27.2021.08.19.04.02.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 04:02:56 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/5] fltk: upgrade 1.3.6 -> 1.3.7
Date: Thu, 19 Aug 2021 13:02:45 +0200
Message-Id: <20210819110248.3505349-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819110248.3505349-1-schnitzeltony@gmail.com>
References: <20210819110248.3505349-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CHANGES IN FLTK 1.3                        RELEASED: Jul 25 2021

FLTK 1.3.7 is a maintenance release for macOS only. It fixes one
regression introduced in FLTK 1.3.6 and two long standing timer
issues on macOS.

Other platforms than macOS are not concerned.

Changes:

  Avoid premature FL_RELEASE event at start of drag-n-drop operation
  Fix a timer inconsistency and prevent a crash
  Fl::add_timeout() must always create a new timer (#248)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/fltk/fltk.inc b/meta-oe/recipes-support/fltk/fltk.inc
index 403cbddbb..6e8fdc9d3 100644
--- a/meta-oe/recipes-support/fltk/fltk.inc
+++ b/meta-oe/recipes-support/fltk/fltk.inc
@@ -11,8 +11,8 @@ SRC_URI = " \
     file://0002-always-build-fluid-and-export-pointers.patch \
 "
 
-PV = "1.3.6"
-SRC_URI[sha256sum] = "20d2627c97b4485ee3eab5522303985bc22b798a878ba80239e6d43dcfed067e"
+PV = "1.3.7"
+SRC_URI[sha256sum] = "5ff1e90766ff4216e78e9a19a9bf527e6258f04accccd4429e9bb829b01d690d"
 
 inherit cmake pkgconfig
 
-- 
2.31.1

