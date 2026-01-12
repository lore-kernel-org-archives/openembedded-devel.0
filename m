Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBA3CF45BB
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 17:40:05 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38967.1768239604744763177
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 09:40:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UKbDMhQb;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4775ae77516so72778965e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 09:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768239603; x=1768844403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ijKLo32zo3qUarO1BQ7o2QUAEMYWK1f2aPJ92bdndC8=;
        b=UKbDMhQbrRrpLz9MWfK3Bf2zlaeRCm/32zUKAuy3x8PXcocPNlVDPc0Il2snnjaHaj
         IP4wBkuKys8U972CJ1MEO3AB8apWkigrniXJqZiWmWdYxzuKIXSPA/+pQTO+WBhVSbRe
         csVtFVN9fQWfjuBKvoEEwUrudabl2gop1ww/f1kWosUAdmUzr16zgHhEWYxS0YqVlwSs
         bIPt+82MjFw+11Wd4SPr6wUzrhOZoTUIgFoBSZ3x2VVvuBDgQnXWmEsrKhHvLTK0Qk/z
         TnDA/0+AeJUGXGA0YCYbZTwnvNIWItToTRcxwp1k1O7lTdIa//Vg7eZ2kGk16F6WMI5J
         xIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239603; x=1768844403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijKLo32zo3qUarO1BQ7o2QUAEMYWK1f2aPJ92bdndC8=;
        b=j/OqDIQ2QV6x5uiN7lD5MHkwW4mKLX2CPfZsonK8cdirFXopDc11pvvKQ1kYlzVo7i
         Otv0aLT4ukuM/W+EwjYBTnDP3vWVQgXEuyOeHrWTY/5qiLO/04rHbqXGuQSb9ah40fJM
         CwBrEjx7P2SOOROKWJlkwtG+IMSYcU5FK0XQr4NqcDuX95sRgV5nOqAzkX8Pbfglv6Wc
         +WqUTOlj8GolC8bQloGhOjY7Da6ZX42VpwcFKrpsT3U7UNV1ZMmWI5+KDy8uUbbnj+aW
         HlCg04P5ILQAzJjVOenA/XEOtDktGLb2L07MCUr/7L+8JRID+AYuWoD1JKDdL88ntLAj
         Y/3Q==
X-Gm-Message-State: AOJu0YyX3OtCZpN0g8iX24xuDkG5x+zliDGHsZWTm56Uw5eBEeo3fSSZ
	4T8gj56X/QZCfIeu55FowtEYjvwT+LaN2xikepOLo6+sbyJG6cy5fOXnrgWblA==
X-Gm-Gg: AY/fxX7dlIGWR6LhYop4ivx3RG7BaS0I6cLkPtPm5G2w8AjSUmHFZiV6QWC1DjnWZ9u
	Df6sZHATCOEIzIhh/LyUFSqG5oQK0UAmO9ZqITEZ2Wz2NPjndzcHxK+GRUizXiNBYNcKnfQh//a
	5vRTTBQj9C4HdbGeWXLiV1L2PCM/Bu5AhW6r91PxjvmIWBMiGP09IuFZws8AGtEUsvq1tjUOXzp
	jiAt0MKOG0IlicIRK4eVP43XWPnlo3Zc6JVQGC28imfPp4zft20oJM9DEzzzIh8mgn7FZAMVK8Z
	zijtFdUkSslAFYfdMO/aakSjTANvjklEMmv4twSMP8COfXZrXC+LHJwtyFMFZ9Fg9Plet+Mi9F2
	RD8kRfmZp1Zz9MAwTMmo0oQ0sFhFFw80TqAkdEOrrzUr0naGM889avCCq7ac4tKRZ+jl+3e07i4
	ZfWtOk9qJB
X-Google-Smtp-Source: AGHT+IEAyXexEseq2ETWX94batX9OeFgIfKbcBalNWfQdi9he8K1bgR7/V2H/oG+C+kBYut9xMz9mw==
X-Received: by 2002:a05:600c:1392:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-47d84b3b724mr238132535e9.30.1768239602562;
        Mon, 12 Jan 2026 09:40:02 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e6784sm40523083f8f.19.2026.01.12.09.39.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:39:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] acpitool: update SRC_URI
Date: Mon, 12 Jan 2026 18:39:57 +0100
Message-ID: <20260112173957.1415569-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 17:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123387

The old SRC_URI stopped working (its certificate expired), and the recipe
defaulted to OE mirrors.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb b/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb
index 2a9ba574ef..8bdc657fce 100644
--- a/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb
+++ b/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "http://freeunix.dyndns.org:8088/site2/acpitool.shtml"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BP}.tar.bz2 \
-    "
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}.tar.bz2"
 
 inherit autotools
 

