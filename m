Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C891FCE79C4
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:29:26 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.34444.1695205764532561914
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 03:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BBBWa2TV;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2bfb17435e4so108010581fa.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 03:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695205763; x=1695810563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/jlRSrmzUDPXhA454VXyjvvDSJu/z2m3+zHEW44eCM=;
        b=BBBWa2TV/dCLF7bitdPNs6otipX0xquLdIFGvrpKGqq1NHtoGoTSGn0fYi67Yw4Vq8
         Ie9wdHMCWEyK8bhXehndFc83NYgfU7DRw6np+mQrxlPs15masfDfq3H+5Xn0aoFuWY76
         wiwINi8biNhCcLnDwB9xIrrO1knZ7X2YEAFqUaMmdTIchwQcZygfy2uhfOMIjCRTkAeK
         u4N4RF19HXVmlJWSjNpLS22+5b53t8xCb9HorVwXENfFcvsRKLj2B9ERqXYsi/1fsZ/K
         9RrCNXvDLr9X2q0tnJi+N3rLYWdxoLeBA7qbCnBibBORWEIWcJ23+pOBnNAm/jmK+nIl
         4rnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695205763; x=1695810563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/jlRSrmzUDPXhA454VXyjvvDSJu/z2m3+zHEW44eCM=;
        b=D85X74wijC8XNcxDckLYlO/Zllm7n9zyQWlOhTc4owVKZGjfixTcagJwDDPZEvJBk6
         3rLz1UwXvO55BENW/SdOixgLPdmiP7mj6hPFf7vLWOCLewCgLFqDkWl+ZG/CaEfMqqD2
         UD5+imftKsLhTvBO+FEYjqRkJOwmP384uK9/z2mFz1rrqtWfJHF3kW9YsAVB2Qy8gmjA
         7ZIbdX8r5CTfA2/nPw+YimeKzFsFqrK85zThzRTSiXVScSqGBMSMqtMLmBq+zyr9/PJt
         L/73LwQJKd3sWO9dKk6Ug8g2ggE+mKr72N6xifzdwXhBfPS3tGrMnsJPQN0BivyokzbE
         C1WA==
X-Gm-Message-State: AOJu0YyMNyx3W8SaWn13QbHMlljII7I8D315x/qYpzEmZ5omrYLYbYqu
	tLUWsTS7aPUjHZSF6WEQjTcFIB1tSSw=
X-Google-Smtp-Source: AGHT+IGSyxoVRm8TLGaHJIXCZtfeCOhrVoQtgzMx7WE64/3AHTz1rpouiehOLOwh/l5K/p+sW8ePsw==
X-Received: by 2002:a2e:998c:0:b0:2bf:e65d:e816 with SMTP id w12-20020a2e998c000000b002bfe65de816mr1795002lji.36.1695205762463;
        Wed, 20 Sep 2023 03:29:22 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id oq8-20020a170906cc8800b0099bc08862b6sm9342459ejb.171.2023.09.20.03.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 03:29:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 4/6] ttf-google-fira: exclude siggen dependency on fontconfig
Date: Wed, 20 Sep 2023 12:29:13 +0200
Message-ID: <20230920102915.1269280-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920102915.1269280-1-martin.jansa@gmail.com>
References: <20230920102915.1269280-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 10:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105011

* like other recipes which inherit fontcache
* fixes:
  bitbake-diffsigs \
    sstate-before/mako/all-webos-linux/ttf-google-fira/1.0.do_package_write_ipk.sigdata.65a4d1ef7525a04346503138dd1579613995abac497ff992213c540a03aafbd2 \
    sstate-before/qemux86-64/all-webos-linux/ttf-google-fira/1.0.do_package_write_ipk.sigdata.c523979f6bc293fb4f645f566585828601e752d50599788fa8b6b2fdab14a84c
  Hash for task dependency fontconfig:do_packagedata changed from efef2c575a4b1207213a7192f7291a7e22ff9679684cf4bfc663e07c00ca8b88 to c8a112d5a6af43b2108b785f0c1afdd29ad7e2fa5591e2ced3f3641276d03aaf

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index e5970cf251..b0e48dea72 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -85,6 +85,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   ttf-dejavu->fontconfig \
   ttf-droid->fontconfig \
   ttf-gentium->fontconfig \
+  ttf-google-fira->fontconfig \
   ttf-hunkyfonts->fontconfig \
   ttf-inconsolata->fontconfig \
   ttf-ipa->fontconfig \
-- 
2.42.0


