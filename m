Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F943C54FB9
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 23:13:37 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.10451.1700262810667963943
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 15:13:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=u0BjsD1M;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40a46ea95f0so20754205e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 15:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700262808; x=1700867608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S3Igc/vqj0sf+BQjb3hK+T7aUHuyenlKZIl8pwOPWQI=;
        b=u0BjsD1Mf+ks9/zFWH4cgVBilvzwDFEejUsmDJudsMIFW8wr/E/TbHYvNbraFkEfUh
         rM0CIPaGaGkv/3dxEorICn7lGxBE+vZb3brCaLzyI0BX+cnyACnp6T/ymMYnoUIKAoGg
         CGbEP8XWaDcKEptoEWoQWGyswkWjjWC9aMfRyHzYl1DGLa7ZBy+h3XU4dMhe26jCVapQ
         aZWZcSaCE8mbO/OKpq2oObsgg9k1xnFQgGLwhRrzwDq5mljmaKanYtmFVk7uif0DD4hh
         X7GxLJEasSREdPvplIFDBO5uqYI6Yf20Pcof/xhzrD/WShoww19DIkCvaXi9WJwLv/bi
         4eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700262808; x=1700867608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3Igc/vqj0sf+BQjb3hK+T7aUHuyenlKZIl8pwOPWQI=;
        b=piCWtDnfee9/YDzHLpYt5DHRpkQzFe3I3tr6/xH3AHCxfZEYMyOCqiyeLUc1TiCFMo
         xSy5K5T+VQBAvhHUV8sFHSH/OVySBYEcWiDXW2Lo7xUFkQ7JrXXxsTKVibey5BcaS+AQ
         FvUi/TGxQOK59f9aC32BjfcjQYIBAgsba8a84AkEAnEEMgZHe7GWiJ0Fx395X2TtQalg
         82HTYy6+Y8J/J+oLT8VR4X+/jCeY2RcjLMucUifmyzpTmIxB3g/XS5OPn3U5D0i5YLfv
         9mHwviOykKfi8pm4XI4A8HjupSpHBeWrxNq9Q82zAJ+v0qKyxu0SJ8IO6v4oGaAUimV6
         /G1Q==
X-Gm-Message-State: AOJu0Yxw3tixUilzi/OvkhoYzuljt6mAErqmojmyrnO1Lxg2gVSJhgva
	amAcdIZeq2NrQt3lJyXHO9bb1z2Au3yuZ04oJR0=
X-Google-Smtp-Source: AGHT+IEkTq6YTxU8xGcOSk1Bj/zFpWe6a9SEg8DcJElKSlVOU65IkMQLAr7J9eNTJnB+WWNslRL9lw==
X-Received: by 2002:a05:600c:46cd:b0:405:3a65:1b4c with SMTP id q13-20020a05600c46cd00b004053a651b4cmr394020wmo.6.1700262808524;
        Fri, 17 Nov 2023 15:13:28 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id g18-20020a05600c4ed200b004068e09a70bsm4388899wmq.31.2023.11.17.15.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 15:13:28 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][kirkstone][PATCH] python3-cson: fix run-time dependencies
Date: Sat, 18 Nov 2023 00:13:21 +0100
Message-Id: <20231117231321.605621-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 23:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106881

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the missing run-time dependency on python3-json. As a result we no
longer need to pull python3 native and can drop other *DEPENDS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 40b4cf5a83098a5f1be873be5c29f26380bc7993)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/recipes-extended/python-cson/python3-cson_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-extended/python-cson/python3-cson_git.bb b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
index c4fcc61ec..1187d12af 100644
--- a/meta-python/recipes-extended/python-cson/python3-cson_git.bb
+++ b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
@@ -12,8 +12,7 @@ SRC_URI = "git://github.com/gt3389b/python-cson.git;branch=master;protocol=https
 
 S = "${WORKDIR}/git"
 
-RDEPENDS:${PN}:class-native = ""
-DEPENDS:append:class-native = " python-native "
+RDEPENDS:${PN} = "python3-json"
 
 inherit setuptools3
 
-- 
2.30.2


