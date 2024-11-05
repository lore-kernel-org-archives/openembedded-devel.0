Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082C1D40D04
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:10 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.30400.1730838967267385606
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:36:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OTbFv7xL;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e2e41bd08bso62380307b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838966; x=1731443766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eH+BXIpNctSRUT53z6XbzoJ4rTqESxunAD3GXV9OrIo=;
        b=OTbFv7xLN45mLaVs+u4IbMtAdSa6MC5wAOXnQ64kSSqgRFfRlCcaraHUF5ToXwF6/X
         FCpa/0+hP4OLGUN9E0+fDdDsSE40UqHBzdHvHR/Yve9bBXWbN/yXymJ8aqP6n4C9cAyb
         Nt5aWlOYQ2BizIUTBPtaYKSBOmtAO2nRLlfx2kkHJtn0qcBoTllLaVTWqcjIse4rWpjl
         O4XgmRh8rvVuou9+Rhzsw/ig709CWe8ydo0kti8tPe+3Q976S0nZDgR2yV+bTJGg8fRv
         2M+zAJQOYmojlQKCfJmif+kxgKCJbLNO+pJPoFQrWDD+tVJ4PGZAopqzAJNqleKDn58S
         juCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838966; x=1731443766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eH+BXIpNctSRUT53z6XbzoJ4rTqESxunAD3GXV9OrIo=;
        b=IwPiHSINuevSaf3y662VaU6DLg8LFXJk0+YYWFc8tITg5PHHJ0XPSmY6ueezqFhJIJ
         SMMXoA8tCUxjKdWv/hpyLHdnU3+m0aj6nFYKaec7gdvfLNMWBumemDfXDD6R3zEFpYH4
         DyUlvtpsHL+TtOUQKudOMgxwsPzVeOIaDt6sFaqDKI4NI1aF4NmcVOxLLRawjZbshVrF
         +K4NKP9w+a9GWEqd1SNfri40Ll0GGVK2FM2MAszZIP3IY4P5TNjGI/vXGeWpRM90JOGV
         BaZKNKYk0WaQKchRbylnT2Z+HfRW5HoV+yaRD+lxgUL4cR7zx40zcX/ExAu9IUMCR/2o
         ly6A==
X-Gm-Message-State: AOJu0YxXixfRzHMYHWjvdlj8uiCgcs4pVyfWGPv4AIFQqh9aiwTXkRaj
	MF/K7eZFqJ7rP19v9DjgBcwogM1R/UI5tUi89eSrE88QBkK40eOLrJQbtGE/
X-Google-Smtp-Source: AGHT+IH80CY9IEudKyATzRRVVGo0H81FJkpFEcRi9VPRx03VZZI1CFKDHeeNKgjCzdZg7yzIF1TSxw==
X-Received: by 2002:a05:690c:338e:b0:6e9:e097:7191 with SMTP id 00721157ae682-6ea64a9f4b1mr174331457b3.9.1730838965966;
        Tue, 05 Nov 2024 12:36:05 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:36:05 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 131/161] libjs-sizzle: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:56 -0500
Message-ID: <20241105202827.3104-131-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113648

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb b/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
index e639ce59d..3889b17a3 100644
--- a/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
+++ b/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
@@ -4,7 +4,6 @@ LICENSE = "GPL-2.0-only & MIT & AFL-2.1"
 LIC_FILES_CHKSUM = "file://MIT-LICENSE.txt;md5=e43aa437a6a1ba421653bd5034333bf9"
 
 SRC_URI = "http://kr.archive.ubuntu.com/ubuntu/pool/universe/s/sizzle/sizzle_1.10.18.orig.tar.gz"
-SRC_URI[md5sum] = "91477c1edeef9f8100ffd6c4d31725b5"
 SRC_URI[sha256sum] = "8e04ab84bb74b2e338dffc63cd2e52b007f1d8af01b3d25da4d2e07f2b5890f8"
 
 S = "${WORKDIR}/sizzle-${PV}"
-- 
2.43.0


