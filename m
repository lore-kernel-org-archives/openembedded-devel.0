Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4DEC71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 10:40:42 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.4978.1750502441383862835
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 03:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jcgfl62H;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-711a3dda147so28329327b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 03:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750502440; x=1751107240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FpexM9+v7hYMU1ip5TSAdAYImQ08Y5ILBCU/+Yjxk4=;
        b=jcgfl62H2ErD3pwaHW7A1PsWjw7pMTKnu7LnMVGQRGLmUO/IMb3cWBKnx9VAT12cHa
         bAfFzF1gv+VtdEcb9u1Ntbm7TMkvjus0kMrhgIZ1AMMMs+I1H/LcCkgcGOYBTnWXRCyT
         rrvzhuDbLEo22WGZJQHAjll1f/Wf3qincRzUD5i2mLOy7wNARfcUPorSZbJueR+2fVHf
         kagBGFkDpAQOGn0bqSRXOR6AWZlvqvVXVU4EkufZwoG8HWcip0VdKx26XirDApkzw0vz
         n2ivoyrNa6SX+2zkz3rsCoYhD/ceEmiHgus0M9hQRcz/WD8CEm1GjvP/PCtOl2GLhlPK
         h+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750502440; x=1751107240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FpexM9+v7hYMU1ip5TSAdAYImQ08Y5ILBCU/+Yjxk4=;
        b=V3AYLl/z4eBw92r9vBaFAkPvLeYkSHNnlhi6+CWzMswzQAFWBAIcYn9UqxJVfo+m1k
         /ywjLU8O89D7dci1sWQ9GE+rb9/B39PfSerXLdq9iEVgeMTgP2bu/5svSnQTMApL9qju
         9albozalBM10YLrZnHQf8r1qXqgITEoiiqb7pH7+hn824f2ETPD9G+c4ftyJuRwR1thD
         FV/bXbcupcNKEfMREXWjp0bLrHmJRZef7RL00CdLEvDsgx71eXs5rNHonHIzdoChWRTr
         aE14BbspEY6FFQxjssmWf7+3kJaXDtWJsEE/o1cjDMr0H6CGY1g+/jm8Z7H0qDlh23tg
         NcDA==
X-Gm-Message-State: AOJu0YztoKpnMXQRABvW+3o8KEAOaermF7Sy7eBswi22R56BLWHtd4BC
	+7yx0R7eAg3a4djiZWkWs8nuCW6f2LtYLNWvyfiY+TZxiORFIk2c3aEk4zJdZn+D
X-Gm-Gg: ASbGncsxnpP9KvDh4JstBzRJaTXLoFQMvRGIadzucSiHaJ+IvTgZxBh3mp2v2ZyObl7
	Ww1sYtrRs9psg+EP4ahH9CIfkZ4rTt82NFhfTPb7hOSPIN1eWU8TnBQjOzcIErX3f8Sk7oK+0An
	0rTaJAubTZbn0IaIwgs234T5Qgumj/wD7O28OWmvJiJBblYo9R6SHWOZ4Ovty+lpnZRJQa447Da
	P+J6Jgmp9FCIN8DWdDA9Ef1HcrsuT2KMzs5oQsnQyaoIUe3BYXslinRLIqu6Zz2xBLNHi8TzOxH
	Ap+rd9KzoF1XvbA/LYH4zalaWmyRaT3Yv4jdIqPULxx6Cu9GQ22ie3raZZvd9dLpe7VaMWO63m6
	zWVxJdm2jmGPghpK4LkXB
X-Google-Smtp-Source: AGHT+IHoil6XOPbwd8sdpbq1T0M+kk+YVGPUku6IqQ4RNMWJ4OV2E7Xeqi6YGqJ0UHSgbYlvj2kOSQ==
X-Received: by 2002:a05:690c:4d81:b0:6fb:1c5a:80ea with SMTP id 00721157ae682-712c654c904mr92023477b3.32.1750502439974;
        Sat, 21 Jun 2025 03:40:39 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4be2c76sm7792147b3.102.2025.06.21.03.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 03:40:39 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 5/5] xfce4-dev-tools: upgrade 4.20.0 -> 4.21.0
Date: Sat, 21 Jun 2025 06:40:09 -0400
Message-ID: <20250621104010.766706-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250621104010.766706-1-schonm@gmail.com>
References: <20250621104010.766706-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 10:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118001

Changelog: https://gitlab.xfce.org/xfce/xfce4-dev-tools/-/tags/xfce4-dev-tools-4.21.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-dev-tools_4.20.0.bb => xfce4-dev-tools_4.21.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.20.0.bb => xfce4-dev-tools_4.21.0.bb} (83%)

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.20.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.0.bb
similarity index 83%
rename from meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.20.0.bb
rename to meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.0.bb
index f4e88c4aa0..3338126557 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Xfce4 development tools"
-HOMEPAGE = "http://www.xfce.org"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfce4-dev-tools/start"
 SECTION = "x11/libs"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
@@ -11,7 +11,7 @@ SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BP}.tar.bz
            file://0001-m4macros-Check-for-a-function-provided-by-libX11-in-.patch \
            "
 SRC_URI:append:class-target = " file://0001-Run-native-xdt-csource-on-tests.patch"
-SRC_URI[sha256sum] = "1fba39a08a0ecc771eaa3a3b6e4272a4f0b9e7c67d0f66e780cd6090cd4466aa"
+SRC_URI[sha256sum] = "36059f48bbb196645f6514ab5a356e55cdd9bc917edcaf6afd86adfc28d7a358"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


