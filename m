Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58028C433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 12:29:27 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.8251.1637324966244514605
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 04:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=wXItulcI;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id n29so17839971wra.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 04:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=INXzT33AKeITHysK7xBGcYfG7x/mQRrWI/P+p4aXRQs=;
        b=wXItulcIcKVA3KbUy0nZomXvZN6ooV1JCDYZKyhSkwSMVvEajcAOpTU57ZcQrsfIWe
         rUe5h+FojVlxvMLgFWO5a3PeboWCMmpP2MclS9wCZSfAuOacZsmd0IYi4bJv4nOGBJMW
         69L8mCeRj3XggH36vvICNT3hDfVAyGys+HiSQeAPA2LuD3wIVOp+mU6K62w1mECMhKYL
         L30B8W1U30BhskWZMGInZUFU7j1ohiUFaVjRJqUuLH4EUK4u+awVAUY1l1slJ0hlPwIt
         H4VrYrSo/ZwQmNrbBmp291qQB88hzpw6dqMzSIR2AJ6yqjnEdVv3YFtCT7RRa2cjesD8
         v9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=INXzT33AKeITHysK7xBGcYfG7x/mQRrWI/P+p4aXRQs=;
        b=OYuN5RvxbQ0m2OgboDVkmc77bTOH/1crDBCNEG3GFx4EKy4r231xNVbW16E6Hfo/sW
         35l4XdOZu4tpEAHJXJAotUK4LTXrY5MRA/3MpHUXIW1JQT9Tscq5/eQV9aYX8fTk3ESX
         DpXH/2GcuMhng2c0Xv/xkJGr4oKt3AwX8J0imrzXzsK3Vth6SzRZ6wA7StjD7JACZQkX
         Df870PZtvmzue5uJwCbDiMCKvm9UnzZNCO2/BeS1B/5FAvgxFfbco7GerKQUzVLZf9Wd
         gDf7ySYJlyB7+wFitmMcixsXGTxT5KwB5vYivM5+3VQzxpQ1oflc8emKyqFg/qYQHWsy
         X+bg==
X-Gm-Message-State: AOAM533lrklCvdxN55qKxUxuX9URGPxs58NrQfqpn6EwZ9Xw3ZlBaVfT
	p9sCeUynhk3nYCUCNihKPQiu0A==
X-Google-Smtp-Source: 
 ABdhPJyVdFPfmM16QkcAELXuVlnERuLyzDs1rXR5fE70qIh5YLYkSYkvIn42i37PlYZAiZ6gkyxqKQ==
X-Received: by 2002:a5d:658c:: with SMTP id q12mr6977506wru.34.1637324964805;
        Fri, 19 Nov 2021 04:29:24 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id
 l26sm3228379wms.15.2021.11.19.04.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 04:29:24 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH 2/2] libgpiod: ptest: rrecommend coreutils
Date: Fri, 19 Nov 2021 13:29:14 +0100
Message-Id: <20211119122914.28129-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211119122914.28129-1-brgl@bgdev.pl>
References: <20211119122914.28129-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Nov 2021 12:29:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94064

The bats test suite requires the 'timeout' and 'nl' commands to be
available. Busybox' default config doesn't include those. They are built
by default by coreutils though, so add it to RRECOMMENDS for ptest.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index 474784646..51b74ba5b 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -51,6 +51,7 @@ FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
 RRECOMMENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '', d)}"
 RRECOMMENDS:${PN}-ptest += " \
     kernel-module-gpio-mockup \
+    coreutils \
     ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-unittest', '', d)} \
 "
 
-- 
2.25.1


