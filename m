Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C352D25056
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 08:36:22 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29027.1768206975562042075
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 00:36:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ks8ulMiw;
 spf=pass (domain: konsulko.com, ip: 209.85.218.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8706ce18c0so178524066b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 00:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768206974; x=1768811774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gLBzjC9N6mZ+aD6h/cS269ICiG+n9S5hy8UsaOTqoiQ=;
        b=ks8ulMiwetDWOzMA74A1Kyq3B67jAjyLhZfuiLQH67y7iwHcg+Eg2PdXkSeeMsUBf8
         yGlc1aD8s4r2aEqULbhcTFIZCwj72/3V2vsnp0ONv7At8qa7tMNLLorh3itaVK8a5It1
         zjJ0JQj581n7F+LxRj8frxkM3xVCDs/pzSKfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768206974; x=1768811774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLBzjC9N6mZ+aD6h/cS269ICiG+n9S5hy8UsaOTqoiQ=;
        b=ZI8qH5bXTzI0k+K1jt09CcFaPxtQcrlCY2xlrfsNN9Osp15GRi7x5H0/CiHvW5ne3z
         yDUaY6pXuRUqJ2eS/JafnPclw3d5VSHx2qRK7XPcQYUrH2UdhJiMm40uMAKawsQJ6yCo
         cUooEd0gwQ1/N3mxCyE72uGW3tfF17TjvwInTi0pV+dAEgNwO5lEPWhOMmzLnIXSU3uS
         AapDBoEhJCCP93QvIXJRndxv0kkdpvAm8BtCwY3vvkH80V18sfbPUJvMi861/WXq9hQw
         8ExayImHtwb9FFym2iRRIEXqtwy2HXjEMllNNky1enGRKPYqp9+1LoxpueE0Egzm/jtM
         7SCg==
X-Gm-Message-State: AOJu0YwDjUE8CdtPFo85BpDpmmRDf67MAXVvwD6MPq5SMftP5MCx/Dq8
	LL/hbypc9o4sNi+5rTq3KJTO0zMfZJmyzplFLI4B7dO21s/5pj4xFbrrD5HSGQ2EZmp9Zlvf9/C
	ExJAs
X-Gm-Gg: AY/fxX5BtnbKbQjcBHreFubexuYSDwbGleBIMzkBiDNOnqdqbo/70aTSERlg/NnSmnf
	IFjZS4hFYpnBUtID4+dPZd4DDxVAlY0/HJsVGbI6hO4mkTEVPqWhFFgr/aI3io1t/eSnHGqlwWG
	AnHbLY9dPcEeOfFxlV9redSrpyyzSbVyDQAX7pWMMZOWOTMDUHeOKLtXG4sRm1/RCf0PBTPx8Rp
	km+Ry1aYY16jNUVZQ+2UcqoyHcTdcMKS6UzFzLp+ckesbe7wV5O++0bR4lyGolk3h4zAhgveqx/
	yhtY/TKXhjxBYRoD/0oLaZM2tmyaQLtAtactPNQNUX/4mjwxlmcvLeuF3PR9c93hZcf5kLHHyTW
	TE7qRPfPZituHlU9JsqE3X5lNLYfxU/kuhB7oR6lyJmVh3nvHNKLblU+gHHz2WPk4qbV/k7l0sE
	d/fDUMU/XdlOj9HqSflsLucwN2
X-Google-Smtp-Source: AGHT+IHZ/0SaS9/Qmi976XYLlIwRLVEJ92G/99kScFRfI1bcauA48KhlrRcA0e+BBAXpzZtxw421pA==
X-Received: by 2002:a17:907:3d42:b0:b80:46f5:cabe with SMTP id a640c23a62f3a-b8444c4d2aemr1797818166b.4.1768206973570;
        Mon, 12 Jan 2026 00:36:13 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6648fsm16971938a12.28.2026.01.12.00.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:36:13 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-identify: Upgrade 2.6.13 -> 2.6.15
Date: Mon, 12 Jan 2026 10:36:08 +0200
Message-ID: <20260112083611.4017493-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 08:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123365

Upgrade to release 2.6.15:

- Add .piskel extension
- Fix: make PKGBUILD files a superset of .bash
- [pre-commit.ci] pre-commit autoupdate

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-identify_2.6.13.bb => python3-identify_2.6.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-identify_2.6.13.bb => python3-identify_2.6.15.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-identify_2.6.13.bb b/meta-python/recipes-devtools/python/python3-identify_2.6.15.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-identify_2.6.13.bb
rename to meta-python/recipes-devtools/python/python3-identify_2.6.15.bb
index 2bc0d1aeed..c5498cf294 100644
--- a/meta-python/recipes-devtools/python/python3-identify_2.6.13.bb
+++ b/meta-python/recipes-devtools/python/python3-identify_2.6.15.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bbdc006359f3157660173ec7f133a80e"
 PYPI_PACKAGE = "identify"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "da8d6c828e773620e13bfa86ea601c5a5310ba4bcd65edf378198b56a1f9fb32"
+SRC_URI[sha256sum] = "e4f4864b96c6557ef2a1e1c951771838f4edc9df3a72ec7118b338801b11c7bf"
 
 RDEPENDS:${PN} = " \
 	python3-ukkonen \
-- 
2.47.3


