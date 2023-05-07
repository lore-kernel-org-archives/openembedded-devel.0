Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50350C7EE2D
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:43 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.69136.1683477206950664595
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XFutlHc6;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55a00da4e53so66332257b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477214; x=1686069214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EejXahPUYyMowT/bGEeV2Ma17AcT5oC5d2hCI4lV04=;
        b=XFutlHc6sgO5Ls+YGsPCEurWtG9+d0RdMZT3C6Nv3t3qlvSMiZ1HtU14WD44YrejMm
         YseHdo/ypAYHAawGI64BxDtv2yhLz58VKLKLttfe5YxGv7xN5nGo1kAzdBXHqujEWo7M
         jc6lSI8S8gSMOMN2ls/oAyn2u9iRkCh9GpHXmc5wBgmsBdXR1UYTUHN1jJebyZtdU2kD
         opkfsgzjJvZVjBSHpDv6+UciMeSlr2a0IfQiZHp7FN8UaSbynQQa8oYsZeUGAlBCrWk2
         23we1mAvmTSrwK/ap4Gk4gS10fWj51pbWR9R73wMmmUcBa22i20KaUhpE1enZeDRjuJA
         KFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477214; x=1686069214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6EejXahPUYyMowT/bGEeV2Ma17AcT5oC5d2hCI4lV04=;
        b=SgQuV0Hc1fAl1U8DUNmxr6V3Nvc8+Jj6f0gXG4RLjpg7/363ZHkjrEYz4/M4a1LxCL
         XfYjyhBh4sJOiFm79YvkMcG8bDLI2N08h+O0wXitt+LgyfCMW1AculStrNPX/8Yb6H5r
         EAHcwFF52o8Y1vfP2FIcPuwcu16GIb2uSLqUQZlq/5pE9cgwpI2kEk+ZeYxRMFrNVqEE
         8Xwh/f9AGC9QSolNOGe/Wz8+E2iRNp5iu6S5HX9E3I6H46ZVyC2cytxxFVXJN5HCpBqA
         7LVja1ZwiW3dyEWDE9xNv6wAyqYpVdczTQiVNrz8G6W8tE0LUPLahmD3Kkh3xVmvTbE/
         z/sQ==
X-Gm-Message-State: AC+VfDyFRzwBJ9AmEaM5mrJxXFNnH1Ka34I67My5FoxZPGer4OW5D/7G
	OxAHsrwmYLgUVAnu+1tcQtDScCf0WSM=
X-Google-Smtp-Source: ACHHUZ4wqoKVyx3n7L/+PHCMRNHJtbmLGBSkELuSlFG1gAyt2uIoKL1YlB3dmaqMadoVxTif03HsTw==
X-Received: by 2002:a81:834b:0:b0:55d:6dd4:e634 with SMTP id t72-20020a81834b000000b0055d6dd4e634mr8644417ywf.3.1683477214041;
        Sun, 07 May 2023 09:33:34 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 25/29] debootstrap: Update SRC_URI to point to valid URL
Date: Sun,  7 May 2023 12:33:01 -0400
Message-Id: <20230507163305.3261044-25-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102355

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2db438f241b966ed8a0d26f52c2fc2fe395cdcc7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
index b2a204403e..3e59af8e2e 100644
--- a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
+++ b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
@@ -4,10 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+ dbus-glib dbus-glib-native imagemagick openobex bluez5"
 
-SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz \
+SRC_URI = "https://ftp.osuosl.org/pub/blfs/conglomeration/${BPN}/obex-data-server-${PV}.tar.gz \
            file://obex-data-server-0.4.6-build-fixes-1.patch \
 "
-SRC_URI[md5sum] = "961ca5db6fe9c97024e133cc6203cc4d"
 SRC_URI[sha256sum] = "b399465ddbd6d0217abedd9411d9d74a820effa0a6a142adc448268d3920094f"
 
 inherit features_check autotools-brokensep pkgconfig
-- 
2.25.1


