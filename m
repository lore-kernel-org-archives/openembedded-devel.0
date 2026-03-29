Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D519FC9804
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 21:39:06 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37389.1774820338711811186
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 14:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VPLTyqA0;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b980c65b97aso573430066b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 14:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774820337; x=1775425137; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVFyUXQ8akpDTZLixYW1wOz0qFUPKCL6m9ZKfFD7mLo=;
        b=VPLTyqA0k42Opw96LPhQwVoY9uIKO3BKeyDJ2lm/nA2v8rnw8MlCMHd9V/ap0QwLyF
         /hSrULDk4CeqeXOaHXuy4doMj4U8rXkbD6cUBKOMKzsfbxCLwkmcKNLP71u50Q0UyEux
         RUdwt+zeCf1iB4LWB/aTdIIr/lnFhXQdHDBZO2LE7n8+0ldbtY+rzAJtqgkLesjNGjil
         FkufQPrG95mmczZKRsaTjFna/U6tSch5M1MfTpP29FtYcjOO+hIHhq2p7qmrR5uMKtg6
         xY4S3VE2OCuVRT7mIva7okCjF4/1flRA8jc+eUGDsNmJcPxrwv8SXRORHLodL+E/r2Pb
         FHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774820337; x=1775425137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IVFyUXQ8akpDTZLixYW1wOz0qFUPKCL6m9ZKfFD7mLo=;
        b=UZZpCp3xNlL4NGpAoVefP+ATF3Z+tm0S4iKlQl2tJ8KgLeX1dIL8nzMxiH4Py0FUsh
         u+wIrp9eSjseHdmjfSHxlQqUfdHR53fd5szAkkZcjFuzM2uhlsBUj8x729eDnDqkQ7KU
         7MkbpbfwNysgeqFGzCKZ+R1TUGiE9mn7w0fmkJh6Y48uvNYC0ViX4Qbw6uYWT9if+dNZ
         ArR0qmNF8mDdUGEf+539THx63uX11fytWuNKIPULkr32ls1jR77vWpctvsCaZaXFOzpb
         jHcgbT3zi1gFQ8NRKlcwr4V0Xe1bYZ8NoVo4/WeQmY3pwI1B035w981VWngW0oj2RahS
         0Dsw==
X-Gm-Message-State: AOJu0YxtsmpnTXzFOAgE1DwsEwsVtgtm19sVAR3hbM6G+cZtthXQ41vk
	BfFxULZMY04RuvdSBRqjtv8A/keR7uBlsp/XNGT23YdPGHDXAhs7Mfbt
X-Gm-Gg: ATEYQzy+uft1J/aWxHDOSC32AsSCzdfPq+NX3K85ehaNYpEE6uTgSHIvsQaS3YIEQxS
	yGPuOhHez9qQ8j/YQtOcJ8CyMKQr0cA0haAgBTnOTuKWusmf2llsLA3JDXYGoGaQ8PrXH0XYu3e
	TPzX/wEcUx9rFgXza4vJ6hVszlWbdLZb5mQ/+MV9Ne1VjDir6CeBXkrfxUmdVYtWJ6WORoXr37f
	JmrFiuOIF547qRRL4d1CV4OOMbog80aDM4LjhRpAu0OUVcu/MxuG4wvpylAgvq+komVxrQfl+et
	kytRhjtlT4+aUmnh2oWAOfjR663OQw/pKC5NHRXfgq7ATnEN+68W1cfMNkrNCV8G33+1OYRsmDT
	BX8D/zVKF6iZoE0tupQz4PLuu+ET26y5m/bvIckb9xkRTGDfFeD+3C7vMk9+rv0NWeqsfB39Fvb
	QYnyKCqYnsJLwnXLGtB2dr2pFVJkP7fy70pr+IWKgeoOu3He9iFw218T2WvXlc2sb7Yh3w4QI=
X-Received: by 2002:a17:907:6d09:b0:b98:33c5:1ba6 with SMTP id a640c23a62f3a-b9b5035907fmr653311466b.17.1774820336916;
        Sun, 29 Mar 2026 14:38:56 -0700 (PDT)
Received: from [127.0.1.1] (185-72-185-220.cgnat.inetia.pl. [185.72.185.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae57679sm202102866b.25.2026.03.29.14.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:38:56 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Sun, 29 Mar 2026 23:37:08 +0200
Subject: [PATCH 07/13] libgusb: Convert confusing append to assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-fix-confusing-appends-v1-7-df7e87b8b879@gmail.com>
References: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
In-Reply-To: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 21:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125816

While in this case override caused by `EXTRA_OEMESON:class-native +=` is
desirable, the `+=` can be confusing. Let's avoid that and use explicit
assignment.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb b/meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb
index 9007574fc6..25750247f8 100644
--- a/meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb
+++ b/meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb
@@ -10,7 +10,7 @@ inherit meson gobject-introspection gi-docgen gettext vala pkgconfig
 PACKAGECONFIG:class-target ??= "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vapi', '', d)}"
 PACKAGECONFIG[vapi] = "-Dvapi=true,-Dvapi=false"
 
-EXTRA_OEMESON:class-native += "-Dtests=false  -Dintrospection=false"
+EXTRA_OEMESON:class-native = "-Dtests=false  -Dintrospection=false"
 
 GIDOCGEN_MESON_OPTION = 'docs'
 

-- 
2.53.0


