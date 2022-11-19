Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8FB8C4321E
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:57 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.23560.1668873526007968465
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L7Vcxw6y;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id x18so5426959qki.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkosJMZxKDAt1Os6KO5fKMFWmYXv6YCxRvf5HMdBo/k=;
        b=L7Vcxw6yZQ+EGAN3lP9q6UzUVBxyEem9Vg76OLVPRVKOy5Szqlx9LY7NnV1RulIBQC
         1+mzCOPwJKbD+S9GJwWHiPf541JHNcmbBkIJiDBOkmoJR1diwtcAky6nKEI3yZL5vGT5
         5zl3AKWXkBxn27qkV7go1opLP0/Rd9sV8V5brypqVasrKWWLIdS7h8J4fRpNZzlps8iJ
         +76PXLf73+4OvySoCFDcEAH3OwlobvtpuURy8Sx6wTS288yDnTvvZMXrQ0aikP76Pdvk
         Uts172nGoPD0G6FqkyVBIn9mO0l6ldw0PBjLp+0p+ijcs/aoeI41sa0xUjutnuvUYFN8
         LBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GkosJMZxKDAt1Os6KO5fKMFWmYXv6YCxRvf5HMdBo/k=;
        b=kxUa7U6vwuBH7TZwT41nzJbGjJuoKAG7KI/FepuTmK7Xd+JuqzwxInjbptIF0fGDqw
         pXB2sSPhge1yIVDOWiRvd8jKGPg2XdViL6/zTNwBUyBZpWDyICJ33C268QNw44hZ5mNS
         ksTHAuCIq/LeQs+zPMMVy9HxyAPodUU2nvRc2Issg0AUdlUCmEcoYxxWO53VA0qkpZLr
         gYZV+hqIZovyijFs2weW3mokfMbWotx3zpJlYBWc3aC20bKYNu5YwICHjnJPf4FN4oNa
         nQFRGsnHKMNEqPgkNIZrnOXk04P43Ssk0NxjRAlaMMLeolorDiiz5blhao6GKxB4KImb
         DelA==
X-Gm-Message-State: ANoB5pkoH1zPkFDqj/ZFvPmFkW3C4mE7LoB2wMS7FyjKGPenLZGfikOv
	V7U8m6H5EXOvE4efRzVR2JN7z4hvmSIUdg==
X-Google-Smtp-Source: AA0mqf6/sbQmwoWW9uCUn1qBumem8VillgQwdq/7Bhhr+llvcEE2IvojrxSy5mClHylaTh50qRYaAw==
X-Received: by 2002:a37:4ca:0:b0:6fa:312d:96a8 with SMTP id 193-20020a3704ca000000b006fa312d96a8mr10398295qke.350.1668873531484;
        Sat, 19 Nov 2022 07:58:51 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 32/35] meta-oe][PATCH] gst-editing-services: fix typo in LICENSE field.
Date: Sat, 19 Nov 2022 10:57:56 -0500
Message-Id: <33815d38f427234b4158fbbcf79e873710774d6d.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99671

WARNING: gst-editing-services-1.20.4-r0 do_populate_lic: QA Issue: gst-editing-services: No generic license file exists for: GPL-2.0-on-later in any provider [license-exists]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 29f49bb36ad1ad369d7ae70c688df9cb144853d3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../gst-editing-services/gst-editing-services_1.20.4.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.4.bb b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.4.bb
index 37f7746846..6f76013dbd 100644
--- a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.4.bb
+++ b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.4.bb
@@ -4,7 +4,7 @@
 SUMMARY = "Gstreamer editing services"
 HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-editing-services/"
 
-LICENSE = "GPL-2.0-on-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d"
 
-- 
2.25.1


