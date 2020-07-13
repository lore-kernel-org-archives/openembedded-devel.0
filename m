Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.11749.1594608984507952591
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Byrr+fLl;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id j19so5394037pgm.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=N5dt3sFbG8akgeByCd0/NUf0GmNmO7INZH9hZx65tCw=;
        b=Byrr+fLlA4kViaq8CBW3IOs+Uz+/LHhy+WgMgMZaWZiomq9frmXGM6syaiN6cGUGgo
         GzYUWYrS+a2V8MLhfQSiw5vxj2gKHIT5Z7s5CowD93mTZVozcutn4CaOtuf/0NOPPYyd
         L4pVrsp30ikzwPYF4b5PSXAFTM9gNcwt+Y2kLpdlHw2Og8hircffrcd5rdmV1r6ctmWu
         HNLSPOpDiNN8WDU4VW1oi4Ws+vpYI+FPAQ1LKUV0w1fQkKDsNezMAFyPMUIW7HxBT5R4
         z4J1f9I0oQMaex5sSBKNBtTOKg+clbLlW+xuwasgJIEVY71q+eiStW2wNgPPlTA8HwqU
         iNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N5dt3sFbG8akgeByCd0/NUf0GmNmO7INZH9hZx65tCw=;
        b=IrpmGk3hOp1FkEHyQ/U7T8PF9HvmS+HvPbLa0ngs8T7N6Sl6SiPeQcItfRQwjusvuX
         0RFcti4K63Faze644KIgnR7L3dDy9OVNQFOp+Ihfw9/A/7ZFBMKmMHrVimvVvWCFK7do
         dfrMl50/l8/zfqxp7/viZZN/pr9oFwOkajIbyt+ZrsitPQolIrFOt1XkFUQRnTAhqpCI
         EuZQ6vCHzS2rGEEoL1clwaqDXqi/WEApBmq5JOD6+5Nf3YR6egwI+9jJCs9b9gK8NhWV
         wY3vxHzhl9Ryk7E3sEcoKwNtK2YYootNs0sL66nrCJlRdi73qtihWSOlRqLaxj3/LW2A
         W+vw==
X-Gm-Message-State: AOAM530/K6mVssH5ueaCRP4EDr2RvP+kIsIYnR+ckT+ca92BpeHXWqgu
	RotsPCqLgB8GZ4NbBMbP/rIdJa4N3Fc=
X-Google-Smtp-Source: ABdhPJzS5A4mN1kqfWAdBCit5ebJJj/vCnLMLFDjXsZxmj0egx5J9TWOH1F/+sOMHTcVq4sX9Rw5UA==
X-Received: by 2002:a05:6a00:224c:: with SMTP id i12mr20203621pfu.18.1594608983751;
        Sun, 12 Jul 2020 19:56:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:23 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 06/18] blueman: upgrade 2.1.1 -> 2.1.3
Date: Sun, 12 Jul 2020 19:56:02 -0700
Message-Id: <c94e7930edc25fe5fe10022482915895abb12b23.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

2.1.3
Changes
  * Force cython to use python language version 3
Bugs fixed
  * Fix tooltip not updating when bluetooth is disabled
  * Fix dbus timeout in DhcClient
  * Call the right method when pulseaudio crashes
  * Handle os.remove failing

2.1.2
Bugs fixed
  * Signal bar updates with multiple adapters
  * Pairing with pincode

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d05070c7d8d1f384914b1243298b4759fd9accae)
[AK: Dunfell does not support py2 so upgrade seems resonable]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../blueman/{blueman_2.1.1.bb => blueman_2.1.3.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/blueman/{blueman_2.1.1.bb => blueman_2.1.3.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.1.3.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
rename to meta-networking/recipes-connectivity/blueman/blueman_2.1.3.bb
index 0ea7f6de97..9143a67ae8 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.1.3.bb
@@ -11,8 +11,7 @@ SRC_URI = " \
     file://0001-Search-for-cython3.patch \
     file://0002-fix-fail-to-enable-bluetooth.patch \
 "
-SRC_URI[md5sum] = "9de89abb31be45bdbf11f7884764a2dc"
-SRC_URI[sha256sum] = "f1eab2334e5a1587defa80900901048d14c2e8ffa8c0cff7240bc9937a61dbc3"
+SRC_URI[sha256sum] = "3bd02e0cc9e2c1424df1fc2015da710a280ef4c657515727e47eafabf8c2cfde"
 
 EXTRA_OECONF = " \
     --disable-appindicator \
-- 
2.17.1

