Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55A2CD98D6
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 15:34:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73415.1781278465500574008
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2026 08:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fgwDPT5D;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490afc47455so5147965e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 08:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781278464; x=1781883264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMXkFpe15PVG0duP8n0LRAXWIaoscEabKivphg+ccTE=;
        b=fgwDPT5DXRIbl0YzmV+ga8YoSkNmKU7uEXLP6LQQx8zMRizfsH8UMzLX0M7bdQDIUa
         gBgVBFCh5UzXjU3kVJifktWziPdf3oRCeSViqhB1TKIbRnDHWpJR0vyVkh4OxC1++fp/
         1ylGNCVm8kYkfh1/39lyzqKPN24MjSpT/uMto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278464; x=1781883264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iMXkFpe15PVG0duP8n0LRAXWIaoscEabKivphg+ccTE=;
        b=PNMr9asgXsdEDrbH0HF/KHqWe5AhdJ6hf/e9rxd3NIDjMnKuRhUu0rJ183YAWbBMpS
         XhZg0wEdyvMkpaJuJOoFNkhhsz012B17XK0bpnWPi7aYTRTbLtPvNeGkJDYWLIK5FJ8g
         CYGPJUhKCpcKPZsU+PYyzZSIUu+7A9B6w1VvnJeVQeYYNFSU2Mqol9mH0IXMQ8Z3NcpY
         DtK4CWigzOsyQXN1PYGXkNJaGCfuZRnHIbWbDKB8kBK7wlRn2yBAIOQh4juoIw5sOYv7
         8UtmvXjJl2bYd0wE/1YJ9YSjk+GPfLf+ul4SjebzM18UkIf45T/iHkXTDdBeLME/fH1G
         y0KQ==
X-Gm-Message-State: AOJu0YxoXHNL7YMuXs4TsoU6b/aihUUmNdsEJsmlma1+yMLU/Lasty8F
	Dflchh8LTiX0rXV+DRj6cleR+tqpzymuDeiL5djzrQKL53KBCFIkIoYVFdUWsDlfboDZ7ViMsSh
	4Ok+b
X-Gm-Gg: Acq92OGjdX1js4pWoKQUxRyHDZS/QE8kMyD491LKGFMUT2ileGlh8QBUrkut5ASLzd7
	NKdn96bHVWe5cRdQljiqW4bwjoqv/77CA4pnBt24sDq5f9BqASwIj1AV2rLpuCbcU3ySBXWko4K
	F9M/Leaw8q+UI/squ/u+Nu4F7qJSrA3+qtgxRuvVRF2DUzmVDqJC0tOwVW4MUGtjkGFwEkx+LOV
	Z+g6TbQhfx6IyVznyYY7jQPwNz3D1Q0XjmY7Ae8lS09lMrcgb1neVdZJBvkcnzUKMeEn9m97OVf
	Pay7rhVd78ElkUc0c2fdW4+Bkm/uZVHmctCtWxgbNkz9N2b6f7s5aakolvhOT1dU7Fe+14/A9HU
	UFvP44UjPvnsgyR2CoIw+lVhobjgTs1upiRmdc8eGXsGkST6mJ+76isui1ruvXGKpnasiRxUqh7
	iZSrxNgGGHBlZpnOio9yDXbIvQEEwDhhCnwi5H
X-Received: by 2002:a05:600c:4fc5:b0:490:e5c1:b8b9 with SMTP id 5b1f17b1804b1-490ec3388c8mr45382065e9.0.1781278464011;
        Fri, 12 Jun 2026 08:34:24 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea961f18sm61187095e9.2.2026.06.12.08.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:23 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/8] python3-uv-dynamic-versioning: Add recipe
Date: Fri, 12 Jun 2026 18:34:01 +0300
Message-ID: <20260612153404.3213552-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260612153404.3213552-1-leon.anavi@konsulko.com>
References: <20260612153404.3213552-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 15:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127547

Add recipe for release 0.14.0:

- Improve Version Source Docs
- ci: update actions
- docs: update README
- feat: support highest-tag option
- docs: update tips

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-uv-dynamic-versioning_0.14.0.bb    | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-uv-dynamic-versioning_0.14.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-uv-dynamic-versioning_0.14.0.bb b/meta-python/recipes-devtools/python/python3-uv-dynamic-versioning_0.14.0.bb
new file mode 100644
index 0000000000..0abe25ce70
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uv-dynamic-versioning_0.14.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Dynamic versioning based on VCS tags for uv/hatch project"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=14d953809f6381e54162e13c2c846fbc"
+
+SRC_URI[sha256sum] = "574fbc07e87ace45c01d55967ad3b864871257b98ff5b8ac87c261227ac8db5b"
+
+PYPI_PACKAGE = "uv_dynamic_versioning"
+
+inherit pypi python_hatchling
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


