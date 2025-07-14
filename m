Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C26EC83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 09:18:19 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.74189.1752484694003470734
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 02:18:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UisUJjYs;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so11152325e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 02:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752484692; x=1753089492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYga+hpZTUA0iupuRf9qlW0WXKRoIHVwloKUKAfTnLE=;
        b=UisUJjYs88JqPTh5F7760IX/67hhrVNJ7dGh5qoVoAbb4TAPYab4WgSj6SwUi+Zmbg
         FD80gejWR+NxpxawFZiL8fD7LXaq9qv4c+F9ZtTbP7YqgfTwZVoH47xFwgBd7vFQsCzm
         YKonb2F2kgs1q7Scs1o8MHOKi0sF60I/lFnLZlYIl9PSfObljY+6ZHmqE9ECTzB/dOda
         OI2DjDFdct/hf/jJ988GTu3Ccv9frqe/7tqKMeiEnde1SzeKwrdOT0Ubbks/b2XfE6eO
         FrQndPbR973/NQd1gqdBlZ33CuHvmI1emkotL0OBezTWTjtwTOUqqAkKAcCEWI9bef3k
         Me8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752484692; x=1753089492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYga+hpZTUA0iupuRf9qlW0WXKRoIHVwloKUKAfTnLE=;
        b=gE3I65nSE44Tra10Bhh7nxZMXi5soYls2vPqFByXtljdoAO3hVh38uYUT3cmrOAz5C
         mdSVY0bvQLV5j7i0x0EWM6Fmmi1OBLvV+i8PPGZ8FgEHKjxa5KfryZBVzIGcAtPCxkyB
         GlRvCyAIkYMfDgZuTXh9tKYQcn1dwI2a56W4BuBK8Nm4F3iRFY2tGoWFuTA6jqOFM2cL
         DeUG70hUTDnTct947AYRcsat7EDFaGTZPlV3XZaib6KwtDr5dVYKHDkk9e91SN0/v8xt
         QIniNYET0QzeRi6OmRZGKiPYpYJjOHpFng2v2k3seyThTUNPfrgXlnXBTdF5NIs8tpXi
         lyHA==
X-Gm-Message-State: AOJu0Yy/97D0Nf9PQoAsvpjQKelvyJNCXIh8CH60m1ehGkBSS/NNTIwa
	bKQ6jicl5dt3tbjTIzguZIaKYbkXx41CGBdm9HUbPP6G+vkq/c27A9TAgBZAZA==
X-Gm-Gg: ASbGnctdYnr5I+KWpDj2Ej2tYZ/1Nr2+jk/uIISbwJjjoHmlVg6ZHd+txgq+Di/RhYR
	JNTPHBoefi5uq/XHBs7suruBIAnuDB4ihCXfTxgIx1sSOG3Ke9O1d/y/8lKv4HPs2T4MzKzcD2s
	cNuahkGC5fidl1lNAJATf4fWodrCFQKUUKsbo/eSzrKgUJhJk60Doy4YuTSXdc0NH3lUASTbnqK
	Sp9mKBIOF0QPSLwEnIm7Fy6HN1dmCksNScNiNtKO6SGXMXh17AKEGsv5N/qdOs78mU6P/J/nQbe
	NXfzMnMNPjq0iWFWFFHlPqJRhKokJtSAXVLDXU5rAXoai+V+5nGYwsLsgTmd9gBCUS+QIb33djk
	dgHWPP0O17n8NgRTOUZ3Qy/Yq
X-Google-Smtp-Source: AGHT+IHiVlwY2axKEBt9FDLDYNAtFT+TIZZcqPPY+4ywJTm0ON+Aqnc6tNqhdYzmjDFzPkypTMhHZQ==
X-Received: by 2002:a05:600c:a00e:b0:43c:fe90:1279 with SMTP id 5b1f17b1804b1-45565ed62e0mr87604875e9.21.1752484692196;
        Mon, 14 Jul 2025 02:18:12 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8dc2087sm12053953f8f.30.2025.07.14.02.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:18:11 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] wxwidgets: enable webkit only with x11 or waylnad
Date: Mon, 14 Jul 2025 11:18:06 +0200
Message-ID: <20250714091806.297167-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 09:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118517

From: Martin Jansa <martin.jansa@gmail.com>

* otherwise webkit enabled by default in 7c3dccab64f2c1733169d6fcba56eeb139a05b45 will
  conflict with no_gui PACKAGECONFIG which is enabled in DISTROs without x11 and wayland
* fixes:
  ERROR: meta-oe/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb:
  wxwidgets: PACKAGECONFIG[webkit] Conflict package config 'no_gui' set in PACKAGECONFIG.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
index ce45d366c0..4a531f30ae 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
@@ -46,7 +46,7 @@ EXTRA_OECMAKE:append:class-target = ' -DEGREP="/bin/grep -E"'
 PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gtk', 'no_gui', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
 "
-PACKAGECONFIG:append:class-target = " mediactrl webkit"
+PACKAGECONFIG:append:class-target = " mediactrl ${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'webkit', '', d)}"
 
 PACKAGECONFIG:remove:class-native = "opengl"
 

