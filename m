Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3747EF588EE
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 15:49:27 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22983.1776700161969953185
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 08:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aMlueXiU;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so41881535e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 08:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776700160; x=1777304960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ycHymGGrgwOR2BCN/Fix/51ZXaM5OZSYdoIs0c04kI=;
        b=aMlueXiUWGAlaNF/HRjL4RMiEYgiFMDcSfD3OGWwBDtyM8zrczwlRElZy5s4zCyKfn
         a7+aC3QT7xvgI/hKegFFc+RAu0OJ7hGWdnHJI2QAJg88bQ7DwLVSSakm4ARLSaTcWZ+O
         sYmmfYfx/lNJVL2UD8CT5QC+GqVx2zgM0mIZ441kVGZoJ8UUyeeVmSdkf3x4HQ290TyU
         fBvc1HFqOoZUyKhBVNhxQ6aUO7KfE0WgULYGl2/C0kAFUSq5FTWOB9ASDG3s4eEkG96a
         pGHRpUKleq8V6A5Agm0ZLZTrkcoJWbCUqq0HfJMKOU3EYGq9XgUvj96E/hzqz4ywvGI7
         fqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700160; x=1777304960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ycHymGGrgwOR2BCN/Fix/51ZXaM5OZSYdoIs0c04kI=;
        b=aKIbGjE2qJbFLYYl/KP887kByojUrSp11T4/bco+cOE91Z2C1Vhz3Vs0yZuBeKA80W
         rJOLjbMGf36JGQ/4caoO+SWFIpRTGQOAEdfCS8Zmfdp1Zkqk9goOOiE31MN0g0aEy2AW
         PuPPNOCOasY2lR+TqCYPBX7cSJrDb1KcG/fn6Cxi2mErXyBaOqRuJUKo8uH1D2n9XTnO
         nwUzYnm/kuZcfmWwRKWWOdzfWiEvjA5L7w0SG2ewhoanb7BOskZo+Zms3CC64O1uIbhy
         zrDv75/IlkzZDnnarPTnGmBI2JYKuZL845RFyr0CTGOe4I5vbhDbey4HRM2bTL/mrBPH
         IEXw==
X-Gm-Message-State: AOJu0YwQIWTMQNxZA579YaO0nH/zRnrY6rOX+QEeeU/kcqXws67kAy3+
	/AbwY8HeMtrbmVdl0wQqkmuJjEuKyyN8geV4UCqBhhCwOrrY4pBE0rgvgYgRgA==
X-Gm-Gg: AeBDiet3IFsolit83QDOX24imeag6f7d3zATP4ZU8xyRhtYMefH/qXDpr6x0lC+ZXQN
	R7jsUhmO1Bp3b1xB4SZk7uaPV8aE4zv5CU4bSFOcoV3j6vaB+tpxPomNEO29L8ZowGvhl5U8Nfc
	s9rqnzIVcVqLoAxttxGStc1QZqsmqspgqrC9LsJqF3lCWymPThj3jhoWALhVlTnNlPKzIcxseoE
	TLn9aHFjVSJE7Vq/7ttyfwqtLCaA2A0DoqbxkM7k66CEbK3xEVG42VOJgbBAAykyWKs2XGySNQc
	gbGFtwj1PdYc8JE2yUutylTK4FrU8JTzAjay7oOSwhz2MaTxzqm28WSAeuP9T+of8XWEvWNh/Vi
	3SZ1EiKnPELQawLnd76H7nJTeT5Tzpoe8c3+0SOr3+WI67qCpylxSe3dTWLfhE+wk/e6tLRGvYq
	25l8vQtmFT0pGSoZam0ohgUDsRb79M6lI=
X-Received: by 2002:a05:600c:c0c8:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-488fb73d9ffmr159911685e9.5.1776700160228;
        Mon, 20 Apr 2026 08:49:20 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm85279255e9.9.2026.04.20.08.49.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:49:19 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 05/12] linux-atm: fix SRC_URI
Date: Mon, 20 Apr 2026 17:49:08 +0200
Message-ID: <20260420154915.952359-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420154915.952359-1-skandigraun@gmail.com>
References: <20260420154915.952359-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 15:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126508

The previous one stopped working

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index bb79b78568..6578f41244 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.0-only"
 
 DEPENDS = "flex flex-native"
 
-SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
            file://link-with-ldflags.patch \
            file://install-from-buildir.patch \
            file://0001-fix-compile-error-with-linux-kernel-v4.8.patch \

