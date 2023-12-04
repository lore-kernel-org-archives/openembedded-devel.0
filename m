Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F814C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 12:47:31 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.68476.1701694043495969640
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 04:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N1oz/cT7;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-54cfb03f1a8so140263a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 04:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701694041; x=1702298841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OZePV0hU4Z2hdkASBjV2BHEZXVJm2URPZWo8zMex0Ok=;
        b=N1oz/cT73JnGJa27cH0IUtLyFvfarcayooT4OJ34YpaHA58grIR7XVP9SbhsrM6vcy
         H+0dHVvLZPQeHPiS43GeHMoN+CzInVSa4Ruebppg8YeBhCAiku6wh+Y0F8q16eKaUgI2
         wl34Px/MDxeKjfznH+4SEtbedNQwDio97Fe7veRqyS5/25C1UHHBS+knGxunZZ1u0pGe
         4EN3VZQOe8n271HnSr19xm5At+STJc3pRTnkaEV2aHN7T5XXBtomipHSigiyb+HlvEUz
         WQSwjZVWgnLciYt76gyQIEGPtRgGGE2jopaDe7vxMZM2Rmovj2m9MR6hUf1xGeenyU7N
         tjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694041; x=1702298841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZePV0hU4Z2hdkASBjV2BHEZXVJm2URPZWo8zMex0Ok=;
        b=uT6MBlgYJrHqCERTdPzaVCj/Pr6FlemUn3DJtL3pmsY7EAJr19OiXtZ3fJOHEoEQaZ
         Ui4L5R+B4hnGDNSftYSbdW4ajqx6FjvoD4QZAepAvKk+S+JeJTKapzzJ0K/Vv1jDK+PB
         7mGgsfyBwVPNhoviZgHq/N/zZPbBBUeYhrSnJIZUy3yWLtKyvD5gR6HSmJP0nUU2LjZH
         fYvhWYUXUQU3FXxYRtGFW/dPt7uRqCDWVVxPAusLXfmZ1dKG4ATa4/wCl2ld7jbZ9o4r
         nnzUefL7clpZS8qopJoIboVBMiscLUgGii1jFvMSJoCTyAWfkh+DE6oIbpYLAyJPzvhw
         FrQA==
X-Gm-Message-State: AOJu0YyodazeqthNeXMHOYsmQNcV5aIJzBAIuHwoZKfTukM4omk1Mim6
	yvYc6kkLhGxj7LG+Q0T/r8m93XFvPhFvdg==
X-Google-Smtp-Source: AGHT+IGiaxbtSb4KbCriTbABLfsr464ssDIs/95+FzId74DZB7cN9xcRl2BNuWAobcVQabK8D7HVvw==
X-Received: by 2002:a50:8e09:0:b0:54c:4837:758e with SMTP id 9-20020a508e09000000b0054c4837758emr3594619edw.58.1701694041191;
        Mon, 04 Dec 2023 04:47:21 -0800 (PST)
Received: from localhost.localdomain ([176.33.70.43])
        by smtp.gmail.com with ESMTPSA id b17-20020a0564021f1100b0054cc6be8b0bsm1400378edb.32.2023.12.04.04.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:47:20 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] gtkwave: upgrade 3.3.111 -> 3.3.117
Date: Mon,  4 Dec 2023 15:47:17 +0300
Message-Id: <20231204124717.347203-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 12:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107202

Changelog:

* Bugfix-only release.
* VCD reader fixes for unnamed Icarus begin blocks.
* String data type crash fix in fst.c.
* Dummy release to keep in sync with gtk3 version.
* Buffer overflow fixes in FST reader.
* Fix VZT reader with -fstrict-aliasing.
* Fix use_multi_state condition in vzt_write.c.
* Fix for UNDEF vs strings at start of a vzt file.
* Fix sleep() time scaling redefine for mingw.
* Use MapViewOfFileEx for mmap on Windows (fstapi).
* Define FST_DO_MISALIGNED_OPS on AArch64 (fstapi).
* Fixed attrbegin short length problem.
* Fix manpage/odt for vcd2fst command switch documentation for zlibpack.
* Changed sprintf to snprintf in fstapi.c.
* Fix stems reader processing code broken in 3.3.114.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../gtkwave/{gtkwave_3.3.111.bb => gtkwave_3.3.117.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.111.bb => gtkwave_3.3.117.bb} (94%)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.111.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.117.bb
similarity index 94%
rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.111.bb
rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.117.bb
index eee9de749..d23d89f2b 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.111.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.117.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
 SRC_URI = "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b4e1c2f718fb3c4b4f412a220876b9da599fe11745fb6f7eb4aed107b1106233"
+SRC_URI[sha256sum] = "3cf1537586a911cbb0601af8fa18cf6da708c8a14a71f69ce3cb9118e8571db9"
 S = "${WORKDIR}/${BPN}-gtk3-${PV}"
 
 DEPENDS = " \
-- 
2.25.1


