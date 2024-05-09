Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A323C25B4F
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 09:31:49 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.6141.1715247099809599003
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 02:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hp+hDOo3;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41fd5dc0480so1891975e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715247098; x=1715851898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQiSupC+sHN6PTNccImGB7glVx2W5zvv4NFmhqLFa0A=;
        b=Hp+hDOo3QSB24qsxmtQxwV+fUWjzp2+RLx/Eeh0A7YQ+iR2huzBJTwDQnGpcwKK4IH
         bZsEtENItKxfSVXwW8SSQ75Yrof4gml6lHOKWc0b/vo/s6gijj6V17+F5jY+qwZjA707
         BEK+Jc+pjG+r9epKJ2TTNlY4/V1FSCpkta4/Jj3+aKjkTpu8r4DM1lmz5Jyyfn7JfrKs
         KUg3+H0HzRUtdJbEtBYsIcagvC6mC+sCFSpIBXPzTONCtuF5j7BEVlw1OcTWSz/dMnRl
         2e6ZEffRBHzgUrG5VxFNOO7mhN4h4yOAWO20u8+27u8dQJ/V5Z2gSoB6XNvnttBizMPI
         RkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715247098; x=1715851898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQiSupC+sHN6PTNccImGB7glVx2W5zvv4NFmhqLFa0A=;
        b=AeAps47FMnWuVengS70Antmg1eoOfSPPdpX1E1sHtxdOv/EIpodC2vxvC2M8i8d7Uj
         PjNFr0HOeV0BkbAdmsd1T+8ZjcYPvBQabbUn/H4mIocQ6KiwF9Q5mrnCL97zV7q80Jh0
         rb3ArmiPP9phbKOLyJLwfeUgOduGUHzHA+xPfMQzdMpinnLZqF/aHjlRuU13P3HF6QHW
         9x82ngEWMniWKLlCxuq7ZFWsEhs+T6bBNHaTDQTZxYTVTpTsz+818ApnKFPGljaNdIin
         VUTWEjP5WU/67qZUdqRUXcM31MEmw7s4F8GIcSTFrf0SGwmeY+O7i4+kyM1x2uJrseUT
         iRrQ==
X-Gm-Message-State: AOJu0YzHinwOTnEu1k44T9vavwI+ynqk9FNgH/XoeaRI3uXX2qhtUROe
	VdKyNtd/Adn88MEQd3EEms0ucH9Y2cs72VYj/wSoDwxzpkqPhelCJXH0Rw==
X-Google-Smtp-Source: AGHT+IEahE1BV9jRjziboIHqTKQl9bjRmqaCrHte66ATBy+s6Iza/iShyrYEJbY7pVR1i7q7Y0KyZw==
X-Received: by 2002:a05:600c:4449:b0:418:d6f2:b0c1 with SMTP id 5b1f17b1804b1-41f71ecb218mr40425825e9.26.1715247097817;
        Thu, 09 May 2024 02:31:37 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f42e74625sm62391655e9.0.2024.05.09.02.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 02:31:37 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][master][scarthgap][PATCH 3/5] composefs: refactor
Date: Thu,  9 May 2024 10:31:24 +0100
Message-ID: <20240509093126.503764-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240509093126.503764-1-jose.quaresma@foundries.io>
References: <20240509093126.503764-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 09:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110287

- add recipe DESCRIPTION
- remove the PV as it can be taken from the recipe name
- specify some EXTRA_OECONF configuration to avoid host contamination

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
2.45.0


