Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860F0C52CDA
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 17:09:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.61520.1722272973560876154
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 10:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O0KCOWTt;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42819654737so13696115e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 10:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722272972; x=1722877772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBa2ruW5MRocRVcleAUM1y57JQ+jqorllPEELcsIL9k=;
        b=O0KCOWTtkxjFGquTnzklLbhA6jN2OUwkUesLXCaj1a9MGW1ixSHzIikrmldA8kPSw9
         aQd3UTEHLcCMiwBdO/AJcPa7euAAzA7dpL4boLVM9b8xm7uKKE9UW0/Rx3D+zECHlVxd
         KyNmBwJqRw3EUL8Fna5YHyBUgOQL2DAFJjwKEirM+k1X3zch9mE7YxL6QQRp5EvsdNq8
         kS7QHfVSFHAxHhxVpTYzrnNuwmOI3mcjbjtRXtfeRqloXH5oGhzKCLKJKCh0/sLPIpTN
         MOTdiFX2woKV5VaUFhFFyL1htdZnEjzRLPt/YGLPYHSN1U4JNCogFz23l5Bs4zinxFHh
         sYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722272972; x=1722877772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBa2ruW5MRocRVcleAUM1y57JQ+jqorllPEELcsIL9k=;
        b=B7tsRpYsYYL6HbEw3X1CUCPcbAUMrymcOsAC92fDT68/GcHJhh8fQ8/Kbao16ceQgX
         fmQ0/OFh/QrKTDjSmc69pemnl8MVB14mSjSuXev4OpTmw6zaxJcYC6ufaZr0Om3RZjEf
         jRJ0/E5qxgLj99iJRz3IIrz1xmdEGqNHxPotQwRRMm0ieJT4+qtqM3eaV4xT+ieMwzXb
         FmrBoAWYXYKEGO84sLEogmkQ/4CCjlEMbj3QhPbpaqNydHNTkm5rokiZ2zFZVjTEPSMS
         1362wV2hpFbM1Mt3htHpg/LEbIRKSiSN5XxSLR3z4Al2p+p39MQ0ZFf9vRORyqxPrc/U
         Ndqw==
X-Gm-Message-State: AOJu0YyT8P7CqXaC22KfoqgpXXeBymUvaNuqXRnEsw0ai7He3cBU5XaO
	b9/HXrNW2IR3A/uIyoD/JCikfCMMebxRpr8KTZacf9cdZcaojiUR/qds4Q==
X-Google-Smtp-Source: AGHT+IEl3eJeoYA7nhbS+IRa2za0BtAT1DVd/gqb1v+AHjryV5GEi2EMH8IkTfrvyU6dsYYfMGA6zQ==
X-Received: by 2002:a05:600c:5022:b0:426:6158:962d with SMTP id 5b1f17b1804b1-4281ed406d8mr17639515e9.23.1722272971633;
        Mon, 29 Jul 2024 10:09:31 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280fa9a30csm115340725e9.30.2024.07.29.10.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 10:09:31 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 3/7] composefs: refactor
Date: Mon, 29 Jul 2024 18:09:06 +0100
Message-ID: <20240729170910.2670446-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729170910.2670446-1-jose.quaresma@foundries.io>
References: <20240729170910.2670446-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 17:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111467

From: Jose Quaresma <quaresma.jose@gmail.com>

- add recipe DESCRIPTION
- remove the PV as it can be taken from the recipe name
- specify some EXTRA_OECONF configuration to avoid host contamination

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4acfcfb234d3307ce5c72fb6a9358b5f918db5af)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../recipes-support/composefs/composefs_1.0.3.bb   | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/composefs/composefs_1.0.3.bb b/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
index 98eb3e1b3..76c85ce93 100644
--- a/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
+++ b/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Tools to handle creating and mounting composefs images"
+DESCRIPTION = "The composefs project combines several underlying Linux \
+features to provide a very flexible mechanism to support read-only mountable \
+filesystem trees, stacking on top of an underlying "lower" Linux filesystem."
 HOMEPAGE = "https://github.com/containers/composefs"
 LICENSE = "GPL-3.0-or-later & LGPL-2.0-or-later & Apache-2.0"
 LIC_FILES_CHKSUM = "\
@@ -9,10 +12,8 @@ LIC_FILES_CHKSUM = "\
     file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
-DEPENDS = "openssl"
-SRCREV = "2d5cdcb9176cfe4ccf1761ef6d78e1c48de35649"
-PV = "1.0.3"
 
+SRCREV = "2d5cdcb9176cfe4ccf1761ef6d78e1c48de35649"
 SRC_URI = "\
     git://github.com/containers/composefs.git;protocol=https;branch=main \
     file://0001-musl-basename-use-portable-implementation-for-basena.patch \
@@ -21,3 +22,10 @@ SRC_URI = "\
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
+
+DEPENDS = "openssl"
+
+EXTRA_OECONF += " \
+    --disable-man \
+    --without-fuse \
+"
-- 
2.45.2


