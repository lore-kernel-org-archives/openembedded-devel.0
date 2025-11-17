Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B409CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 14:52:24 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11099.1763391134909149259
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 06:52:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lBFzRD+7;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-789505a2fe7so11405207b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 06:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763391134; x=1763995934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6ZAXyKoay2KeYOPj+dnyjdLELBoUbc4IL3KNbDL7g0=;
        b=lBFzRD+7mYMuZY0QNm/IUwmIeEUJdavdHat5+iT+nIm+NeSmp4r8AGRyd3jPk/1ZKf
         3KG63T1xl4/LTN8tAzdrRpyX37VL6XOzXc2QmH7HYWK66aWYHzBHmcCJr3MgBynyyuI7
         ocTmtVuM3sX80s9e2WTLia4ILAzlplZCjsIpYn/58Gl0lj3r5JUPKh7ZCXSUFHLzsOPg
         tSezOjLnM0d+rv8wevDgMVZ/am+0vaYrwfgAj3X6ZX6uL8szPHdc/uWfqjRjTXCOZtOb
         QaC5sJ7E0iHZ+pJ14qio3gJZJL61e5nbTCz9HcyR6zrahH0pWI5w92Uh/26KajQdzWLl
         4Gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391134; x=1763995934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w6ZAXyKoay2KeYOPj+dnyjdLELBoUbc4IL3KNbDL7g0=;
        b=rWmPeE1YGsBSjmkmoU1BUilBHYwGJ4hdu4Hy2uTWex+LxYwWxjys1kX/wHnngcs7Dc
         I0pirYdLVPiTcvmUCp+Frstbgwb94MG3c/SNNxxb5hx4hHG6g8W0YT0503jnZSDnCkep
         Do5tfrSN2x6HrSjE2fe5bHYs+uzkgA+UA6nOifzpDaSDxnUhZap6uB6PppxZDw3FZCqI
         4beApz9WZLHnRgiFrVlg5mMTY9/aEm92UAoDrHNORH4AV2JUpx7yvSEJfwGpRRjFBEaO
         5dw7fSm+Lt0ayBpJfdXJymrsFAdj+MeRu1CJZgw3PPGlvyMC/Iu8Pf6KuIFSn4vLjQV8
         VLrA==
X-Gm-Message-State: AOJu0YzR0BYo19ynWxkWa1uEYDCVdAvxq8eQRsb6kPjAthHybyW1DOof
	ZOZfdHgGaOl3lDC+AlZctE+H1B2GI3Yc4TQbSGiWdIertTQSbhI50tI/DBeIIWdA
X-Gm-Gg: ASbGncslOprPgbMvoN+dsFf/0wJwaCu1SGhzKGD85NWs8e+FBZuj9XXxcRuKQ1iqMWp
	Th3MGAkYOTcYRCFIo4isYrF9x34T/zeOA0c+aCdHr8dFVTdvoksP7fOuYjtGW6ZbTbFznLlUDi8
	hj7icweB2Ob7DUsg+CCVtel1eaXVZOwhBhZIJ7oLQgT0Q4/t6FxGs03nCI9U3/Rx6aH5hcQXxRf
	r/7bxmp8K7J/jfJQNuqy4oLXrcf9Tfwf0RPsLdUJCxiQtbxCl4d/zhhibR6P8WeSPcyjMEI+4ac
	UL6JoJ0/UZADrgFvVghYAFXRKzIeWNrYk3UjZpu9CjR2Hb2VnEqXfwiK5TB+3eWt9wioyssPUTc
	awyYfC2qjrRVauYAtYN8vy6IJQ6jZ3HWd+/fjQ6lLFGp3yJIIVXLg0G55G09EbaEg/YL5JtP8p7
	U4NVC2j6dR6jm7wmUUVI37UIUUTQaE2SnyKg==
X-Google-Smtp-Source: AGHT+IHs5Jr3gffMaGAKcznSaP1qkPLM4w9SpWU+TbwN63zZluFMgmRf3tuoWeaUBpXYnFi3gq0w0g==
X-Received: by 2002:a05:690c:e3c3:b0:787:f341:6b06 with SMTP id 00721157ae682-78929e80c11mr122662887b3.24.1763391133673;
        Mon, 17 Nov 2025 06:52:13 -0800 (PST)
Received: from localhost.localdomain (71-208-12-78.ftmy.qwest.net. [71.208.12.78])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78821de2bcesm42904227b3.6.2025.11.17.06.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:52:13 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 2/5] gigolo: upgrade 0.5.3 -> 0.6.0
Date: Mon, 17 Nov 2025 09:51:32 -0500
Message-ID: <20251117145136.132886-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117145136.132886-1-schonm@gmail.com>
References: <20251117145136.132886-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 14:52:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121780

Add a HOMEPAGE while we are here.
Use meson build.

Changelog: https://gitlab.xfce.org/apps/gigolo/-/tags/gigolo-0.6.0
Changelog: https://gitlab.xfce.org/apps/gigolo/-/tags/gigolo-0.5.4

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../gigolo/{gigolo_0.5.3.bb => gigolo_0.6.0.bb}             | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/gigolo/{gigolo_0.5.3.bb => gigolo_0.6.0.bb} (60%)

diff --git a/meta-xfce/recipes-apps/gigolo/gigolo_0.5.3.bb b/meta-xfce/recipes-apps/gigolo/gigolo_0.6.0.bb
similarity index 60%
rename from meta-xfce/recipes-apps/gigolo/gigolo_0.5.3.bb
rename to meta-xfce/recipes-apps/gigolo/gigolo_0.6.0.bb
index 4692f18294..25e289fbdd 100644
--- a/meta-xfce/recipes-apps/gigolo/gigolo_0.5.3.bb
+++ b/meta-xfce/recipes-apps/gigolo/gigolo_0.6.0.bb
@@ -1,10 +1,14 @@
 SUMMARY = "Gigolo is a frontend to easily manage connections to remote filesystems using GIO/GVfs"
+HOMEPAGE = "https://docs.xfce.org/apps/gigolo/start"
 SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
+XFCEBASEBUILDCLASS = "meson"
+XFCE_COMPRESS_TYPE = "xz"
+
 DEPENDS = "gtk+3 intltool-native xfce4-dev-tools-native"
 
 inherit xfce-app
 
-SRC_URI[sha256sum] = "d25984f65744665e2433335249f9547a38cead45440027af0c397ebf254d2fd0"
+SRC_URI[sha256sum] = "f27dbb51abe8144c1b981f2d820ad1b279c1bc4623d7333b7d4f5f4777eb45ed"
-- 
2.43.0


