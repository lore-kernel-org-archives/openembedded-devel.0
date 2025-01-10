Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32839E7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 17:40:51 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.25395.1736530846398619589
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 09:40:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cz12UY4o;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216426b0865so39418345ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 09:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736530845; x=1737135645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1p+ZNhGBcgQbcvQhDTPo4/zo9jGVskD9iymN9wdJKU=;
        b=Cz12UY4o28HCGOf55RpZFe9n/Y0DtS+adGLmIfr2r3Ba+a/st0PmhNYUGqvipue7DS
         yzphdNH0xcdDdiLEbFGzD6TKazd2yd4vZAYPcXOOXF8c4gsonSQFdoMJcGtQfs4m5X6U
         TpZsGUCo+pwsvSV9XXXXillzsXeEQ65mXJKWnevt6NBsX1loMDo5Ds7QlOtOjNxMkkxt
         0QxmnJwm73RP3kNnR1/GUjjfenACFRQpL21SxZohpr8lIysLigF5rfSf+pMvhHMMLX+G
         BXgKWj+Aq2SUc9O7l5xQY1WO0VvKD0HwcyxNpElarKJ6q1J75WAftH9m/L7XNlZQIzXH
         PuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736530845; x=1737135645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1p+ZNhGBcgQbcvQhDTPo4/zo9jGVskD9iymN9wdJKU=;
        b=QkL6zV6udLlm+1f2YMpa5gGlQUFVk7ta86JRMqpsJdzCvWLTGQts25+bI6pYyOr6ma
         SRv/PBzD6lGcI1yeX6AUnqb2Rv2CBreYkXiynGqOXIdrhJGlzfoih8dcX4h+9tfcL4IM
         aAeSIVyZeMUh2kiv7JXXReqAHeo/oHdHIcfOlqaso7X9hcqK6r6rmr12zu8Rq0DXjPpG
         IgnRy2JWPLUVMYhJDqICnMdt5/dTVI/ke9HBjcV4U5cNT7FGr7ANXGGQGohz87vtzC01
         CaFLjwxIz0fVqsTWP5BBs4jYs/NlRf/FzpHWJp6dj6UQDACfxMuSxxHE4e1O1lHIjFej
         c7Bw==
X-Gm-Message-State: AOJu0Yyv/N6dW9Yer6DY45LRriKc/He+g2++iQMYw2YG9+3ZWooOgLEW
	B20/tXIbINFxXo6YKfZEgSf9IERmpGnDlN+7VvPCGxnauYFUSno2PkMif1AO
X-Gm-Gg: ASbGncv/ibt6UD/IdhHG4RYkx82RPHvt+KBKGhPFCbhjjafQtQK88c5/e5a1YdpBe4K
	97n4Ih8AVqVoBFIbccJL1RKm3P1q2KXh8mtvcoS+mHs7uwi3QTOsWBkm4mm7q4ZfEinIHj/7Bjz
	NNhAHIekKfb+BSbRpS3lYIa0Bxj84br4Babkg+l5L544jkitCp9zAXuEQLb2M1wc7jlfOqZaIy+
	dXWOM5iVg2gRF56G3RUJVR7rZlY2465qry3AfGztiSB94Iu
X-Google-Smtp-Source: AGHT+IEaS3Dk7Xxo84RWjpOgxiWvn101LsSnYAnGG9rcvmaqDJenOHwMLCW3EhVVbJqOSvXlUxTYfA==
X-Received: by 2002:a17:902:e548:b0:216:30f9:93d4 with SMTP id d9443c01a7336-21a83f3706amr159952325ad.8.1736530845272;
        Fri, 10 Jan 2025 09:40:45 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::f739])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10de6dsm16363285ad.17.2025.01.10.09.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 09:40:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] packagegroup-meta-multimedia: Drop adding openh264 and libde265
Date: Fri, 10 Jan 2025 09:40:42 -0800
Message-ID: <20250110174042.2998115-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 17:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114784

Fixes

ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An allarch packagegroup shouldn't depend on packages which are dynamically renamed (openh264-dev to libopenh264-dev)
ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An allarch packagegroup shouldn't depend on packages which are dynamically renamed (libde265 to libde265-0)
ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An allarch packagegroup shouldn't depend on packages which are dynamically renamed (openh264 to libopenh264-7)
ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An allarch packagegroup shouldn't depend on packages which are dynamically renamed (openh264-dbg to libopenh264-dbg)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 83efaaa125..4da9de3ff9 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -53,7 +53,7 @@ RDEPENDS:packagegroup-meta-multimedia = "\
     opus-tools \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "sox streamripper", "", d)} \
     tinyalsa \
-    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "x265 openh264 libde265", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "x265", "", d)} \
 "
 RDEPENDS:packagegroup-meta-multimedia:remove:libc-musl = "projucer"
 

