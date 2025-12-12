Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BB5D49215
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:58:24 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11042.1765540699530454212
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 03:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hVKMIM5d;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso1433117b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 03:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765540699; x=1766145499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMHgYp+j2iMeLZduSrXV00WqT1UyJm+qDSfNy1jzNUI=;
        b=hVKMIM5d8BVYezqOIaWPJ2b22Ymv6shBEAAqLxPej9ghUTN3Ryz+EF6uJLNUpD871H
         jjNq5H2e/LhNfojdlVLJbf7riVIoLAe5EK1oodntl+y+rLcOhxxQk7KgWgsH3XOQmEbq
         xI7xDASJJFDbya8hLDWdOPauE+txN+GTNiS7t31ej8ZOmXytInMrLIzgr6LYVufgTYYN
         hmZuMQ7ngvACi+tKZ16zNnDZmzgeAP2DVvzHEDRergh9BGMB5TEZ9xlpICDJ5RWopszW
         gpZsSlhoPAhjxViNHVSUo+6pDGiJ6s/bOSw7ncRBhUmkYooA7OchrGFy1lfIPKrdFMOg
         PbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765540699; x=1766145499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uMHgYp+j2iMeLZduSrXV00WqT1UyJm+qDSfNy1jzNUI=;
        b=Mi7PZgoaYV+H/ptbp8Gu0DCo2oWOEUluE6yoChwJL386mORxY03iaybBd+i/zxwsWx
         fi6mCIF+I16lvCD8xF3iXcMTqxZfym+cbrg1w04qOzh68QV8E+0xE4CBUqrG1y1qIyHc
         E4wbJBR2uIkZEneyqTdgcSDlmBZPQPD8E5CoSsxdqZDZ8sD9eG/3W4vf5pJma4SDfY/y
         KuOKNwuoaB4zRpZDTkg6fYffxtEap0lArt2hreyPhXfMTnZ6S1idmyJOhtizbZBNokv9
         qh40LXc4jd0O2InnKtD8X7gCAjDLil6dDhhXnN+94LWPDFTRggeJ2BP7V9BsUrfXTaXe
         WrvQ==
X-Gm-Message-State: AOJu0YygBEBe1v59D56CkmBlwAcbIwnl8CbHsUyaMf0Rpw5EewjS39Kf
	g49mJ6wjt+xb9a2zvKaobZSlQspKIZm9cBrmM5VxUQevH681Aar/WEgvfoinSQ==
X-Gm-Gg: AY/fxX719eOaOjJMm2KW6OumzQlL7oButvfL1455c5jylrHO665xvm0i371lyzL4q35
	BEK24t+NCW3X6mZwi3uzsX3alsdi0KJ1x0GcyCAseDn9RnEGkr0NJlGrOmrBymXIUKhZT/2T5PQ
	BRqBA9Bh8AIOOf/rXd15TUGgwPg0/eysn5Rx69o+Lr32UDG1lZ0WIFLW47T6Sxh7+wi4EM8jiu2
	f7vSUo1K+jZxMgZvH0DYGs2TAvedJK64CnnVxRPMeYIJuBM9ej2yrAZZVeoGAO6BzR2LEj9/S2p
	Fd88gRclRmv6IRZ6nx/xXNNmrJcUl/dQ2wUysG+Tlmg3kCf8tsBSC9lpN383a6FrVX7iHwg+7uq
	B/dTWyLCXYBDiJT7J0zBo6XJbOMd+TcLW2Lr4sfwuOpEDOCZVF4/Xe+wNHPtS77lWrlTpFnX1uW
	BnQBOKnzCAwZt++5KkbNf2RdU=
X-Google-Smtp-Source: AGHT+IGJYqYyGm7D2PfD3h9soxfVKBrbLwAmSpLVVJADPVWM5g0c77C90VLh8gYa0C5VZzJJf0n8NQ==
X-Received: by 2002:a05:6a00:bb84:b0:7e8:4433:8fb4 with SMTP id d2e1a72fcca58-7f66a07d2d5mr1740551b3a.60.1765540698658;
        Fri, 12 Dec 2025 03:58:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27771b3sm5163198b3a.27.2025.12.12.03.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 03:58:18 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 13/15] python3-cloudpickle: Upgrade 3.1.1 -> 3.1.2
Date: Fri, 12 Dec 2025 17:27:42 +0530
Message-ID: <20251212115744.569676-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
References: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 11:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122613

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 3.1.2:

- Fix pickling of abstract base classes containing type annotations
  for Python 3.14.

License-Update: Use file LICENSE

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b428f675752f1f83bed691cb9b58adf48212aaea)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...cloudpickle_3.1.1.bb => python3-cloudpickle_3.1.2.bb} | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cloudpickle_3.1.1.bb => python3-cloudpickle_3.1.2.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.1.bb b/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.2.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-cloudpickle_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-cloudpickle_3.1.2.bb
index 7e2fadda1c..9c285bf80c 100644
--- a/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.2.bb
@@ -8,11 +8,8 @@ data."
 HOMEPAGE = "https://github.com/cloudpipe/cloudpickle"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${UNPACKDIR}/LICENSE.cloudpickle;md5=b4d59aa5e2cc777722aac17841237931"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b4d59aa5e2cc777722aac17841237931"
 
-inherit pypi python_flit_core
-
-SRC_URI += "https://raw.githubusercontent.com/cloudpipe/cloudpickle/v${PV}/LICENSE;downloadfilename=LICENSE.cloudpickle;name=license"
+SRC_URI[sha256sum] = "7fda9eb655c9c230dab534f1983763de5835249750e85fbcef43aaa30a9a2414"
 
-SRC_URI[sha256sum] = "b216fa8ae4019d5482a8ac3c95d8f6346115d8835911fd4aefd1a445e4242c64"
-SRC_URI[license.sha256sum] = "3029ea34173e9fdc233ad315dc6b100bd1ea71f529b1c1af97664a272fdc55f5"
+inherit pypi python_flit_core

