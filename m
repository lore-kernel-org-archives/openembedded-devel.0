Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5051DD185C8
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:53:31 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3994.1767869608734036160
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:53:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=akPkwWMd;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso32791015e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869607; x=1768474407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RwdlO5A+pt/aNd7E6rAamNFNADjpc/ZY00NwjZBez2E=;
        b=akPkwWMdvcR5H1WGqBneKFQ81/QKuD5LGS33zRxuEkpRCKDsWKz7S1JJmzvNddbRN7
         d1Cq3pMQp67YeIlCd/lgHEJBmUHFN3he1nzKKfWlPnyx+Cwy1BB4GERLrcp+0hADIf7x
         3FFoFYgcLNdknEW8+jncEKPMy7fqNlD7grrqVXvFztTXGIK72KdqUPr6taxxHVY7xi04
         69DDwAB23QlY3FFWQY6V79gOq/5nOUQ5DnJrfvYF9Opsy+xbjnvLriov7hoQMllDv9ut
         3enY+Z/5pn+e4MAd+dN0tLzcG2PI/IicpQX4EmIjFYsuObo9PjxMtllw/wkIypbtgtR+
         FLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869607; x=1768474407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RwdlO5A+pt/aNd7E6rAamNFNADjpc/ZY00NwjZBez2E=;
        b=fYmWUydlj8Ps1zqdVaXyDBaAUKU3k7VGKrTTfgQ0LnqbxAQLBBGn//bUr557Ppbszi
         V+J1dmHkMLxlOsi8/M6dKbhhFRRVwdyR6FeWh9o0IUc242WF5WSt0VbIi8jpNdPCrqcf
         dLuUwMXl/IAMSz61UN6l697neGZneg0dtluQyQgXqQ3alfGJm6x0tYWoMAGsPGu3DoGa
         OAgk+gkGRgc3VX2VeL8OiVGcHZs5+BokY0YQiHJRp4thsBzIUOwS2SZPRARIwIQJKhwq
         y76tS9b/nuoRcRojK8TkAD4+p/iAeL7+oyG68YI/yhwp0atgzCtmHm2JRUEEQKaR6UfX
         gtRQ==
X-Gm-Message-State: AOJu0YyXVHaVjFm17FO0GtFSQTQkqTwytsBkyF+/IObaaSmXGTUzhPyA
	/w9nwAVYtPTbTJRzMcsC4BitsydS7tPNJBmWCQc8UBB+B9/kcBZEzYI5ejAvcA==
X-Gm-Gg: AY/fxX7DcGVADwIRugCfeCtZxxw8u3WRK2b2BxYi+jkfXttI+ruhwkF+/W+bhnbbjxy
	1USmvylURmAdlCDZH1J5qCttHFoEMI2Tk9OY9M1C1Q0NZlv5zQb7aD3DbMdyEhvB7mUAGjZbJn7
	3Ex+EGN5SFMSxOsM+ZsiEmKM27UJSFdObSXw2TMV9Ho2NTGtMS/EiOTX70NcfEAOI/dGhGgjYz4
	SIpe3Xh/3p70Iq61jFGwaIp3+X/zWKUfexEyjz87JpKud+zAkzEN43I/dr09wP4j8WIDNsXUp0S
	7O9muaJvmjuUi/WMe0b11oWM3hFN+lJAHx+Z820kMCWVD0dqY4jG78oh/MNl7TS5y7FXsMPVeb6
	ZncUYHO14Aqa0VvLW3zqaslVxPBEpdECnzrrAJj9mhvkK7ihRH7rN2P4HTw83RYaFsqQf0pZsUf
	DXURSAaOGyxkhXQU8tRds=
X-Google-Smtp-Source: AGHT+IGtXTIHHPO5cyHPc0PpRzEFsa7U/422SCSYoX3Ef0T2WAf8xfPQmhgWIAPB8LTaxftT3AKwmA==
X-Received: by 2002:a05:600c:470c:b0:477:557b:691d with SMTP id 5b1f17b1804b1-47d84b39d1cmr62817405e9.25.1767869606822;
        Thu, 08 Jan 2026 02:53:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm148656615e9.1.2026.01.08.02.53.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:53:19 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 01/15] imagemagick: upgrade 7.1.1-26 -> 7.1.1-47
Date: Thu,  8 Jan 2026 11:53:03 +0100
Message-ID: <20260108105317.460246-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 10:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123255

Contains fixes for CVE-2024-41817, CVE-2025-43965 and CVE-2025-46393

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 752fef303b..a8029426da 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2f9de66264141265b203cde9902819ea \
 DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
 BASE_PV := "${PV}"
-PV .= "-26"
+PV .= "-47"
 SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
-SRCREV = "570a9a048bb0e3a5c221ca87be9408ae35f711e2"
+SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 
 S = "${WORKDIR}/git"
 

