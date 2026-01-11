Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1169FD2502D
	for <webhook@archiver.kernel.org>; Sun, 11 Jan 2026 01:27:43 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2978.1768094861031783870
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 17:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NdItTeL6;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29f30233d8aso36658625ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 17:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768094860; x=1768699660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Kh8jpfK78zQkjN6c3pwORYZtewxnVMURa5tZovi+w4=;
        b=NdItTeL6Ru5T5WjCOoNnuGz/MlGfmpRlSQuFBty6nAcl0tjcaVf6jSyMWMLZJ91khr
         4H5RWs+zTbiE7bM2ooySWYSBwSjE1U+fvNnYmhsx3CgHtJG+axkMxrBj3/r9pMX1hYUL
         gs97ptc1tl5l1DuBwhHAyXa6OY6EdrmMq2tZSw8fvWIGa5UfLQUrHULk+h7tstsUa9ir
         UIXxOA0XGEYfhsX/aEDWn0y57EnspyYmrOD+V7NWzeOVuScvSDhCo6apEnuieak7RPae
         UIHj++1hTOlCZ2/KVQbUSW4tLkkirqroGsdDObgYS3LzgyL2kKrkJl/yr3drFX2LwrcW
         QoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768094860; x=1768699660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Kh8jpfK78zQkjN6c3pwORYZtewxnVMURa5tZovi+w4=;
        b=qpbcavO5DCPBBLJPFsJBOCJXWgQ03x4gc51To+sjODl3QecABV3MvSxfKQ41SZAugv
         TJ+6Rpw8c5E+7zZxiwAc+TwsIUlaxKU02GSfC2ks8DnQK3KzDMy0ViB0E60Wr7f2Zzst
         KuQmreMWAseRAOWTv3eNkoUO2TWHHnBqEb5148VvUmWjF+nLJxGrrNLaSa8j5TQZEgF4
         M4Qt49cOVBlrwC7PvMqPQd+y97zMFuwTOops2HuoW2rTygyF7EXRUVT4PYG+InMeQPpt
         E8NCC5ZsQhGaWyA/maLbvyZRNlQ/G6MMrH6a6s4zXQWjtJsYohkQ1janKNSEWvb73hef
         BdvA==
X-Gm-Message-State: AOJu0YxfM6+7zKdbV6FD+fdXTmZ/BcMW0l9M3OY5WqIb4Ei+bkyYbV+Z
	A5K1py9qNswd936Ao5hWTKIX8HM9PvLmAyu+EqoHIVEcahZH58PBdFxwArN5nA==
X-Gm-Gg: AY/fxX5nJD2NmF+6Vg6epFcAJrHSwJcJnMaJDlZDcx0qgK0qdik5IVtzGCp+RQn/qzM
	0XDh9Y2OW8+9xzOtIsBFhKTMKOahu8XO5iCMXzelJ/c9dNCNBZ2bk+VFgGJRMzTMI7PtrCEjJtb
	uaQ5nHnTdSvduBhB1u18eHag6FO/EcqcAJL5Hvvw9CFRVamIUjx8D1knuOqsJlh6MAPji1bPVEU
	xqNPI0l6ZAmE4d79GJtWhdRPe7Has0jFceCn9urqjNqbHHAnSCFCoA9l3d6Dqk3QkFnPgIUzKr/
	lgB7ULRfxMB7hw6vQ6fiUnBJGP0oOAS7vzTXnBqUu5rPVHkjJCjHOE7kgGF+SgeIHidX9M7BkAy
	aHpfIfvmuSMqxC8zwuqHWGEGxS56zGduIJhZNrsGtIu+8bNQo8XVGa5QIWUdczMeTLMDnP9Sf+b
	KdrFOOlzwbtWUhkmBZgK/Tto4=
X-Google-Smtp-Source: AGHT+IFOOUiHL5DIWy4TOG2sF3y0y/X3CZupLTv+SR8Hq6uL98k7vcB59hAgKn7SBfMXjpqYkI1CdA==
X-Received: by 2002:a17:902:c947:b0:295:888e:9fff with SMTP id d9443c01a7336-2a3ee456a50mr129549915ad.20.1768094859912;
        Sat, 10 Jan 2026 17:27:39 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a303sm137185265ad.5.2026.01.10.17.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 17:27:39 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/2] usb-modeswitch: upgrade 2.6.1 -> 2.6.2
Date: Sun, 11 Jan 2026 14:27:30 +1300
Message-ID: <20260111012731.247895-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 01:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123338

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

2.6.2:
- Bug in C code (with gcc 1.5) fixed

https://www.draisberghof.de/usb_modeswitch/ChangeLog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{usb-modeswitch_2.6.1.bb => usb-modeswitch_2.6.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.6.1.bb => usb-modeswitch_2.6.2.bb} (91%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.1.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.2.bb
similarity index 91%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.1.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.2.bb
index cd3840feab..af2b5b6491 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.1.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=091556bd6d0154cd4c2d17a1bfc7380a"
 DEPENDS = "libusb1"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "5195d9e136e52f658f19e9f93e4f982b1b67bffac197d0a455cd8c2cd245fa34"
+SRC_URI[sha256sum] = "f7abd337784a9d1bd39cb8a587518aff6f2a43d916145eafd80b1b8b7146db66"
 
 inherit pkgconfig systemd
 

