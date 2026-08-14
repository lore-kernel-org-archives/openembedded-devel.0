Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C543C5DF72
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:07 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24360.1786747566817956804
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kq4fszJU;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84e507b079dso984639b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747566; x=1787352366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=my+ozzrteKNMx7bbk14xkUIy3OtQEZCJ4NhjBH4Go1A=;
        b=Kq4fszJUr51SWx4JkBXDQ1nU7FxZ9uSUDHoceqlr9zbNjr1VYCgBU/FWytHbJpD9Ld
         2qx9qiCcjrfJ9CYKQ1eij8oa9zGV78pj1GVjy3MWEilT5PU406MeLAeKFFU13Ssb5EHF
         XthIWGlEan8/hYfH83EFTloIzfpUN21+TnwTX5HN+o88R5E4KMX26jeRYyXAHbS1i3NF
         fKifC5YDqcwKWKykPy6CdAjZ58Mx47pK7jGBbWzjXcc+3QAi60A6S6Nl8VjL8WhsQ9fA
         5Nx+DgKNQCKwvt+SmH0TaHXvgFTurUBLuepwE44AVJq2GYkTmX7Fo747v5b10lBtpEJe
         vaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747566; x=1787352366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=my+ozzrteKNMx7bbk14xkUIy3OtQEZCJ4NhjBH4Go1A=;
        b=lLZCeTjSOm5QoIDInIqc2N4menzd5kve2ygQWHK1C1JhY8pXv2kk3/GOAFNZpgEk0o
         YpeTR4tZV2g9NlsUTsbPNqtvDbUZBzkDulFsC8e0tCvsscngqEbUYxeRPVvG4uYav5tk
         47TYRixFeJx+8ISKxIgLoZ2U0slA2tPpj2J/rGGrGZ/c8slqsilpl95+3S/OTSwnPcup
         p5VmjP5grcTRFrC+xC8hWoVpdPHnrV+OzduAzDkhUh3i3n//z37K5QhXmp/cYPqi0DGx
         MXezF5/SCv3lboJ5PFnHkJj1cTgHJkIAAD9mpRHIBFNQKe5fQ4rGeXJSW/SBCVinheeQ
         nv6Q==
X-Gm-Message-State: AOJu0YwdqkvgBNZ21XJLw3r+fD5gVKtyctm78sxnp78XClSIRDalNkw/
	Mv++XCnEQofcBUtwRwdb8WwuQOM5hNB2jiIVlY5vbFBGZEemwMNn8ileTOZNIDj9
X-Gm-Gg: AR+sD11CgZZ8hwj7JY7BtECvoQSkjU2i52rb3XIC4fuvYXl7wlzFpa0DFCyU8ybnX8R
	qyFUHX3tiyFJeCS3+WcrbYMwNHetLnDlX3qUdn7EJ0L4mdD7hhlqgMsiVmSC9AeHfkLGezKUcog
	gqZM21Zl3nMpKjeDHIVNyllK/o8oa2in1dwQ7CI/KV3XRA/tZwrGKSDNzIzynq2LCCgVhspmA7W
	48PB3o3//abIeIqWj5YCH7sPcX8d2C3D8AfQTdwQjOrjYfa4iSl3X7rbpIL9mJ/FRqKqq3sitQx
	FqKpsgSvg0U2ZyjAbYL0XIWioPTDK5FJsmDpcbBZXXxldwgTffcCIpkm/9e2V4OLd+0PWfVj8j8
	XrvtJlMW2bxl3pe8NvLgYaXinoIVg7tLZ6zYpudOlS7yFOXTzaW/eNqX1rM62X5g29ZNbtzf3Pd
	fV8nse+bDOwAwXCjvvz6MnhnJmmQHt3uCvmCBqZH/DdPHDHUsL/D/0WUMIrj2+3ibwD3DrmMZTq
	2wf+Z/WgoVRMptb2lcxc48tMXJmIlkKf8FdZ+GFw0EphwrXQaq6l2J2hwsFovsrT0GBABqKTEhe
	OXJpDGKBR/Tcf1nlZJJAz4IUXGJWNNX+AgspR4f5DxcUiiivktTqgWmXcsYBoIo2qcwU30VXLkg
	7nAKr7W7suNPBf9wM7ZagsjfJPkHNk9e4lCxHzk9LjTwBOkg=
X-Received: by 2002:a05:6a21:6e82:b0:3cb:9594:91b8 with SMTP id adf61e73a8af0-3cc71dc08b7mr11400440637.35.1786747566106;
        Fri, 14 Aug 2026 15:46:06 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 021/109] atkmm: upgrade 2.28.4 -> 2.28.5
Date: Fri, 14 Aug 2026 15:44:07 -0700
Message-ID: <20260814224539.1523174-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129085

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-gnome/atk/{atkmm_2.28.4.bb => atkmm_2.28.5.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-gnome/atk/{atkmm_2.28.4.bb => atkmm_2.28.5.bb} (56%)

diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.28.4.bb b/meta-oe/recipes-gnome/atk/atkmm_2.28.5.bb
similarity index 56%
rename from meta-oe/recipes-gnome/atk/atkmm_2.28.4.bb
rename to meta-oe/recipes-gnome/atk/atkmm_2.28.5.bb
index 6cfcb1147d..38d0317549 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.28.4.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.28.5.bb
@@ -2,8 +2,8 @@ SUMMARY = "C++ bindings for the atk"
 SECTION = "libs"
 
 LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
+                    file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce"
 
 DEPENDS = "atk glibmm"
 
@@ -12,7 +12,7 @@ inherit gnomebase features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "0a142a8128f83c001efb8014ee463e9a766054ef84686af953135e04d28fdab3"
+SRC_URI[archive.sha256sum] = "ae449192a582a2582a95e0602b15d792bbd639e836339b81ef916aa87540ac5c"
 
 EXTRA_OEMESON = "-Dbuild-documentation=false"
 

