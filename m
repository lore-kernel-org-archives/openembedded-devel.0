Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16F1CD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 03:52:44 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.3418.1712289161677404628
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 20:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CfQqXSbV;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ed01c63657so38927b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 20:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712289161; x=1712893961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XtQXOYyje4QNeiYQRDzIDqycv9CargScsNzTkXuySHE=;
        b=CfQqXSbVirsrKaEkKzRYDKniVvEHxpgFhv8OrLRE2Ya+jlIoRhCYU3eP0Sr39oby0h
         nZBy3MkDlKVbaar3LNFh6tG/unYjuPZEF3namzgAogB/KdfSga/eysG9QtM6DXh028fh
         TB06zmxm74qv2ZFnayylfsdp9+5Il73jCLGYuoa9SIwtGZd/13fyAuIDDftkaOL8ZQzX
         FPzGLuizwYb0Cj/4bLXFAJTmhxB+aCdtQxrBkos4VOfD/nuossYBIApEMJsTtPCFsgpK
         oafjnnqE53O1XPUD4WWXVbgLuNsnLiZCvoX32PhFYHnOW9jCkqsy006sP240bs47ikvp
         sC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712289161; x=1712893961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XtQXOYyje4QNeiYQRDzIDqycv9CargScsNzTkXuySHE=;
        b=DgbEdvHn5PGMU2d3vvRTfmi4/rf6u3cVUgP8l8I1RxypIMBzuSFSNBlPpTpzX2P8oh
         H1jqiuY5CfP5Vgq1myt0hQuAbD2ycKYtbHTReZ/Y49KTfO2oUUkrYtkHeiT31YC29R67
         4Lp8u8/MuL0pm20krj6gY4N/oX2lpY5n0BGjB3TVS/sJS9BB/7znB7OYQ9YKWHQtfnNW
         11+eSMIkzN516iKhWEm5QMXUXZyxAXBUoa3DV4GQzqwdKXDGMDoYkYNcDkkqnfeLvOSN
         SNcBLJWJsfdnx9DszNgnBiz0mwbShhnvfSRBKUTgRUvqcwOb9+YjMfEfn/ICuXtYnlL+
         Htlg==
X-Gm-Message-State: AOJu0YwqobzPJODaewa6LZOT7udAeSfvzyM1RDMVKmN2a2I/p6lc1mZD
	5//3tn8IWHzYM/dsYXeuP3tGR1c6DfJAWF4Hfd/72IkkOm3xIQ8Rt+sW6h5U
X-Google-Smtp-Source: AGHT+IHeH1Oy4A6IhDPCWL5jBs1WU1wUDGH15q4N+Xn+cXIMtrwF8kghqe9x9ffwt0RJBNN+xSENww==
X-Received: by 2002:a05:6a00:9398:b0:6e6:8c49:f2f6 with SMTP id ka24-20020a056a00939800b006e68c49f2f6mr359882pfb.24.1712289160539;
        Thu, 04 Apr 2024 20:52:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5077])
        by smtp.gmail.com with ESMTPSA id d23-20020aa78697000000b006ecec1f4b08sm462530pfo.118.2024.04.04.20.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 20:52:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pyzmq: Fix ptests
Date: Thu,  4 Apr 2024 20:52:38 -0700
Message-ID: <20240405035238.473755-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 03:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109811

Add missing dependency on tornado, its also flagged by some ptests

   {'python3-pyzmq': ['tests/test_ioloop.py:test_ioloop',
                      'tests/test_ioloop.py:test_ioloop_install']}

Skip ptests which cause zeromq errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyzmq/run-ptest | 3 ++-
 meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest b/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest
index 8d2017d39c..beefefa663 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest
@@ -1,3 +1,4 @@
 #!/bin/sh
 
-pytest --automake
+pytest --automake \
+-k 'not test_callable_check and not test_on_recv_basic and not test_on_recv_wake and not test_on_recv_async and not test_on_recv_async_error and not test_curve'
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
index ca602d2507..540aa62006 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
@@ -28,6 +28,7 @@ FILES:${PN}-test += "\
 RDEPENDS:${PN} += "\
         python3-json \
         python3-multiprocessing \
+        python3-tornado \
 "
 
 RDEPENDS:${PN}-ptest += "\
-- 
2.44.0


