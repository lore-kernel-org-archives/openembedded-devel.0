Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573BFC10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 09:31:39 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.5957.1715247098506403309
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 02:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eaz02uNX;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-34e7a35d5d4so478138f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 02:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715247096; x=1715851896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pLf7ajHMyqIQN8SBUlW1sVWsWbRXdixMd83YnxcmmSo=;
        b=eaz02uNX2epDgMbardjfJiCqRSQcgkNT3HocEtbCrL30E7b57W43Q5qYCtUo1HWTvr
         cGkio2FNZvOVvkowr+QJbF8bxHXPeNzUHtGnV5Hv8YLe23YljiSvXukh+OHWCP72XUML
         VqtDVTrX9IS+sc/vCZzMCMlTCXsqQpWZT6FDT+dY4vgy2wQ1q1oe65qZZFCTEw7Nuox7
         wsABsaWRyiopT7NGu/4E9K1/msW2OB8a3i2+GaG8GN7EuoPY2bQhD8kTOql/55gXGZax
         b+4jej/mR8ktpbUVL/j3deKBT/TevYBzpiEzjiO0rTzbCBvx1DJvigcomvjK0TJUtYd6
         XjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715247096; x=1715851896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLf7ajHMyqIQN8SBUlW1sVWsWbRXdixMd83YnxcmmSo=;
        b=xF83wAQlGv6GyjFpulJQ45wJT/ZDI4xJ6CPp28AfYWcV96zBYgpoHPRaC69INq0HCG
         HSdaNEwQNhO1A+nv9yLhVu2FuefJgL3xFmHHg36E/oChOwmB8/kq6RDywRmZZfS+xGfw
         1bjPt2D1PAqXupdStoCiF6cFFprS14aH4Ac2icnhNFkyVGapz5w86WwUE6LyrgvhTn8+
         EjVhWGljfFNkaMoeFfvj3dwPb2e/ALOsMHoQ+M16ql11ZvyGbABkacd9xPwXzrVAfkvB
         xQXL0nlcUTd99yD2/K0+9/rWkgVhpBjOuouuMCgtYZ534FaUvpTXjO2Hy//E5mdK47gn
         hHvw==
X-Gm-Message-State: AOJu0YziqD8GrzaarL9lOxZ3aRP5NpAUYylB8nuFs4FlzyQhPy7XAAUr
	llc+BJjMtZxBK6x7KbhDYdvrgHNa6s8ORXM4XLUCK1y0wd+wZKNpEMKzFQ==
X-Google-Smtp-Source: AGHT+IGGKBxGE/6JFqssXbek/etdgaOdJnU1VjHgwmmrP1kxFc3BSF2fLmZoIF20zXE5PPzcNlGGCQ==
X-Received: by 2002:a5d:538b:0:b0:34d:8450:c668 with SMTP id ffacd0b85a97d-34fca81033cmr3492710f8f.59.1715247096341;
        Thu, 09 May 2024 02:31:36 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f42e74625sm62391655e9.0.2024.05.09.02.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 02:31:35 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][master][scarthgap][PATCH 1/5] composefs: remove fuse3 dependencie
Date: Thu,  9 May 2024 10:31:22 +0100
Message-ID: <20240509093126.503764-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 09:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110286

The fuse3 is only used for development purposes and the composefs uses
the kernel overlayfs and erofs on the target.

The composefs-fuse [1] tool is not even installed by default
So  all the files installed on the target are the same
with and without the fuse, this can be checked with buildhistory.

[1] https://github.com/containers/composefs/commit/f5fed9ff093ac57967a4c5253bae3ae294dd8cd9

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb b/meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb
index 7607b0a12..98eb3e1b3 100644
--- a/meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb
+++ b/meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "\
     file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
-DEPENDS = "fuse3 openssl"
+DEPENDS = "openssl"
 SRCREV = "2d5cdcb9176cfe4ccf1761ef6d78e1c48de35649"
 PV = "1.0.3"
 
-- 
2.45.0


