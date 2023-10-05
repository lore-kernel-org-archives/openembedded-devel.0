Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDC4E936F9
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 02:35:21 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.7000.1696473312081764791
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 19:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FJgQgdjq;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-79fa416b7ffso23171439f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 19:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696473311; x=1697078111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIDAorcmO5oJBob0SAwzVEFqlmPMET+IC34Aj/ZnLU4=;
        b=FJgQgdjqdvHQo2QKuhJ3c0fjX9x5MFpbffaKqbIwqhyG1ubjONPpWwltFRD4VFIRMs
         uajmzO2AsPnIFh64Oa8bxstgI8Jc3yG4PYC7Fa9ksGuL1Pd53IOEsPr4bxI/IYqkkhFy
         ao60E94t/ldANDTc/Rzmcei3q1FQGoQMIWFuSLrL1jID7xYgPUP1pc0yhZ8QJyRAwE8S
         NgxRVbJ9zJr2ppIwfaWy9Z17kCr3ntj2fnovLHHL+JT2l5WyEAtdUPvlPNdDLbb22dxh
         dNfL/Gx6QwZaPtZ6VTbrFBFsymcGF4r1n7wfuFF1C4D9omU1aDcT+WucOko85UcMLjOh
         oJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696473311; x=1697078111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIDAorcmO5oJBob0SAwzVEFqlmPMET+IC34Aj/ZnLU4=;
        b=UXg8yT1AxFKwCFckGnWuHZf9AchU4pawD/jbjT3W+pyv14z0QZmyZbyhJwzclMZEq8
         yc9K5flWpsuz/OckxxkxqTzaIo66Ohh6dbBk7ewyREYMRsxX3Rpx8b9G9eQQZOBKKlvN
         FEnMvFU5kJxtHwPXBih2FyPhM75JgBPQzKlA7ipFUI/kf8AodCgHpDDY3prG32kY0xny
         DXvS3d2Hzk2EFVXU7xCFUs3pdrpvNnZb7P5w7Eoe1AffHys34/NWpxzVzyrVHuqlBn35
         HKbBzdypXKC+nXPMuhTgH2wvcDEFOPPkM7++Se9GNJ3D0N8cxIb0XGjgjnzJi/gSPem2
         PFig==
X-Gm-Message-State: AOJu0Yy0p6UdFdvRu3d61qYmAef2i79W2Vkkd7mCogWju2kyVUApiS3C
	eQDoUp9STCQzUnmUT6aBxztPpAkYOXw6FA==
X-Google-Smtp-Source: AGHT+IFYSxeenREIPJ8YBX5XzPjuEZHtGW1j7mQlYM7O/H/kXHR5H6vqFdj2Jh4qrVY/9LEt08wT9Q==
X-Received: by 2002:a92:c045:0:b0:34f:cd3c:e029 with SMTP id o5-20020a92c045000000b0034fcd3ce029mr3915414ilf.13.1696473311004;
        Wed, 04 Oct 2023 19:35:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id i8-20020aa787c8000000b0068fe76cdc62sm235680pfo.93.2023.10.04.19.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 19:35:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-openembedded][PATCH 3/4] images: Rename <layer>-image to <layer>-image-all
Date: Wed,  4 Oct 2023 19:35:04 -0700
Message-ID: <20231005023505.1072671-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005023505.1072671-1-raj.khem@gmail.com>
References: <20231005023505.1072671-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 02:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105351

These are test images to build all recipes in layer. Renaming them makes
them refect what they are. Moreover we can rename the ptest images to
match OE-Core naming conventions for meta-oe/meta-perl/meta-python

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...{meta-filesystems-image.bb => meta-filesystems-image-all.bb} | 0
 .../{meta-multimedia-image.bb => meta-multimedia-image-all.bb}  | 0
 .../recipes-multimedia/images/multimedia-libcamera-image.bb     | 2 +-
 .../{meta-networking-image.bb => meta-networking-image-all.bb}  | 0
 .../images/{meta-oe-image.bb => meta-oe-image-all.bb}           | 0
 .../images/{meta-perl-image.bb => meta-perl-image-all.bb}       | 0
 .../images/{meta-python-image.bb => meta-python-image-all.bb}   | 0
 .../{meta-webserver-image.bb => meta-webserver-image-all.bb}    | 0
 8 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/images/{meta-filesystems-image.bb => meta-filesystems-image-all.bb} (100%)
 rename meta-multimedia/recipes-multimedia/images/{meta-multimedia-image.bb => meta-multimedia-image-all.bb} (100%)
 rename meta-networking/recipes-core/images/{meta-networking-image.bb => meta-networking-image-all.bb} (100%)
 rename meta-oe/recipes-core/images/{meta-oe-image.bb => meta-oe-image-all.bb} (100%)
 rename meta-perl/recipes-core/images/{meta-perl-image.bb => meta-perl-image-all.bb} (100%)
 rename meta-python/recipes-core/images/{meta-python-image.bb => meta-python-image-all.bb} (100%)
 rename meta-webserver/recipes-core/images/{meta-webserver-image.bb => meta-webserver-image-all.bb} (100%)

diff --git a/meta-filesystems/recipes-filesystems/images/meta-filesystems-image.bb b/meta-filesystems/recipes-filesystems/images/meta-filesystems-image-all.bb
similarity index 100%
rename from meta-filesystems/recipes-filesystems/images/meta-filesystems-image.bb
rename to meta-filesystems/recipes-filesystems/images/meta-filesystems-image-all.bb
diff --git a/meta-multimedia/recipes-multimedia/images/meta-multimedia-image.bb b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-all.bb
similarity index 100%
rename from meta-multimedia/recipes-multimedia/images/meta-multimedia-image.bb
rename to meta-multimedia/recipes-multimedia/images/meta-multimedia-image-all.bb
diff --git a/meta-multimedia/recipes-multimedia/images/multimedia-libcamera-image.bb b/meta-multimedia/recipes-multimedia/images/multimedia-libcamera-image.bb
index bc1c52ad48..bc2e858b42 100644
--- a/meta-multimedia/recipes-multimedia/images/multimedia-libcamera-image.bb
+++ b/meta-multimedia/recipes-multimedia/images/multimedia-libcamera-image.bb
@@ -4,7 +4,7 @@
 DESCRIPTION = "libcamera image"
 LICENSE = "MIT"
 
-require  meta-multimedia-image.bb
+require  meta-multimedia-image-all.bb
 
 IMAGE_INSTALL += " \
         kernel-modules \
diff --git a/meta-networking/recipes-core/images/meta-networking-image.bb b/meta-networking/recipes-core/images/meta-networking-image-all.bb
similarity index 100%
rename from meta-networking/recipes-core/images/meta-networking-image.bb
rename to meta-networking/recipes-core/images/meta-networking-image-all.bb
diff --git a/meta-oe/recipes-core/images/meta-oe-image.bb b/meta-oe/recipes-core/images/meta-oe-image-all.bb
similarity index 100%
rename from meta-oe/recipes-core/images/meta-oe-image.bb
rename to meta-oe/recipes-core/images/meta-oe-image-all.bb
diff --git a/meta-perl/recipes-core/images/meta-perl-image.bb b/meta-perl/recipes-core/images/meta-perl-image-all.bb
similarity index 100%
rename from meta-perl/recipes-core/images/meta-perl-image.bb
rename to meta-perl/recipes-core/images/meta-perl-image-all.bb
diff --git a/meta-python/recipes-core/images/meta-python-image.bb b/meta-python/recipes-core/images/meta-python-image-all.bb
similarity index 100%
rename from meta-python/recipes-core/images/meta-python-image.bb
rename to meta-python/recipes-core/images/meta-python-image-all.bb
diff --git a/meta-webserver/recipes-core/images/meta-webserver-image.bb b/meta-webserver/recipes-core/images/meta-webserver-image-all.bb
similarity index 100%
rename from meta-webserver/recipes-core/images/meta-webserver-image.bb
rename to meta-webserver/recipes-core/images/meta-webserver-image-all.bb
-- 
2.42.0


