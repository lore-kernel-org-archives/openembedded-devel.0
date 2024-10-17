Return-Path: <ramaxlo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40280D374B6
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 16:06:12 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.1750.1729181168903395155
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Oct 2024 09:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M8tTCz7D;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ramaxlo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e49ef3b2bso830281b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 09:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729181168; x=1729785968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=D5AnpuWcB5/K6IFjjoYQbLEeFO7XBLmJG+6kAFEwhrs=;
        b=M8tTCz7DCTO0zXpf2PHBy8s5NTr9nwJDnK6HeWoMyPefn897ZgzxpVestilUdC5USK
         NLv7WV5bfTOShQxxFluiLW6I3dKaa3miSIX28Ij5ppeRQSdwmldLA/V/GfdDRjasWryK
         oUsBIWHFBaeBVs7O6bA+8itZgXTeF0nMHDP514mhSZTKr4tIw2Kr734WleMuv/pyCe2a
         6XnFMQgggsDQw54zQXFs5o2sk3kNgze22ngKJikFIACXJooElfAmw0zZHEYX8E9rYFAM
         pw/t2x61j2Dmi0GbDc4aHNY94iOblR6lUW04hpaYap4OdGpM5+C/gmVn3HElBj9VBU5Z
         eRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729181168; x=1729785968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D5AnpuWcB5/K6IFjjoYQbLEeFO7XBLmJG+6kAFEwhrs=;
        b=sHQNf71NhPxqKUGH85EYUNfsjvS0Z5TI8sEwI+QF0d68KZKPj3wJUiKe36nY4S6Kh6
         Pm1kdn2LKjGrFKHtJbvOuVE54w9U868IMUhdp/FCZOMgBDNHOBTAOXZd3I7S/bMWICcs
         NtGhULOFsUNXwC8j18w+TNyxw28yRiQmN7J1dlN2wh6pYqi4/Gkkh4YslIAL7wsXXm/H
         1jCkPi80SZaCktB9ao8pF9hp8lnbyel4Na2VMyy5S1QgzIz3yaPpWDtmiJCFkw5ID7gY
         Zoo4BjW9TE4k8+1HhL+OlIyAwik2kSTu1XG+aKNU4itdiN0t61WPwCFBu6utesd/izLF
         D8AA==
X-Gm-Message-State: AOJu0YyOUvSz3k5TvDI1DF6Yz7C+6kBY9DwwV5ykyXGDJE8dKTnGj+ek
	1970QApyBu76maiBl0LoeawgaHV9FPcCz/w/NO3Go1lbZ6iQE4iAmrlxLg==
X-Google-Smtp-Source: AGHT+IECqteNZoAE2ZW0llzTJnf8FPievCitcbhr3cFYw5/2qvUIeYUeaslRMbERp5pTS0TL/rmvjg==
X-Received: by 2002:a05:6a00:1783:b0:71e:8046:2728 with SMTP id d2e1a72fcca58-71e80462809mr10158301b3a.17.1729181167702;
        Thu, 17 Oct 2024 09:06:07 -0700 (PDT)
Received: from localhost (39-14-10-134.adsl.fetnet.net. [39.14.10.134])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773b13a0sm4893305b3a.77.2024.10.17.09.06.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:06:06 -0700 (PDT)
From: Ramax Lo <ramaxlo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] vk-gl-cts: Fix branch names
Date: Fri, 18 Oct 2024 00:06:03 +0800
Message-ID: <20241017160603.47777-1-ramaxlo@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 16:06:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112966

The branch names of several upstream repos have been changed, thus we
update the recipe to avoid fetching failure.

Signed-off-by: Ramax Lo <ramaxlo@gmail.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 7d73bfbf3..ccf785c54 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "\
 	git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=https;name=vk-gl-cts;nobranch=1 \
 	git://github.com/google/amber;protocol=https;destsuffix=git/external/amber/src;name=amber;branch=main \
-	git://github.com/KhronosGroup/glslang.git;protocol=https;destsuffix=git/external/glslang/src;name=glslang;branch=master \
-	git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;destsuffix=git/external/spirv-headers/src;name=spirv-headers;branch=master \
-	git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;destsuffix=git/external/spirv-tools/src;name=spirv-tools;branch=master \
+	git://github.com/KhronosGroup/glslang.git;protocol=https;destsuffix=git/external/glslang/src;name=glslang;branch=main \
+	git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;destsuffix=git/external/spirv-headers/src;name=spirv-headers;branch=main \
+	git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;destsuffix=git/external/spirv-tools/src;name=spirv-tools;branch=main \
 	https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=git/external/renderdoc/src;name=renderdoc \
 "
 
-- 
2.46.0


