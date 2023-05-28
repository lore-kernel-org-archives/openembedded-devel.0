Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CE0C7EE23
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 00:44:04 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.21360.1685234639956502831
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 May 2023 17:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bqTyNfN1;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b01d912a76so10051325ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 May 2023 17:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685234639; x=1687826639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89DJsMo3i/DXnh/op3B6Dy7GZV3wmY5nCPG4LGoyKdI=;
        b=bqTyNfN1mn5XHafQp+TGiTz9FSNYb79zE1/zPdr707paZ+sJBtyU+MXfLgdLpLsmnp
         C1YXLrdec4yWzCw9mNjbtOtj/GE3Si80z3GcVI4vjJ/cqs39f80QKGEmh+goPYi0BUW8
         RaSaME042alQRM67tAK9S0nfkBwUG4h/xVfbkTSn32Aij1MKIqbESZIeMGez+g7hnWGi
         sjelNmhvLBaQiReMxhRV1wqplz1tmj8Sxwg77hNSHWWKR8bRmVeElQA2eZOhjDnCi7qN
         65JeGkmDP22tJcfch6s2hUArwf2qVns6gthth9hk8lKjWS+pKhozPE9Av9c8YqZ3u3Uh
         yTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685234639; x=1687826639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89DJsMo3i/DXnh/op3B6Dy7GZV3wmY5nCPG4LGoyKdI=;
        b=UWLTXma/DDxLDTTJ2Btq2981bsLZPUuRMkdSvzRjHVV4myqQhZgppDg+7O1m0o+dKO
         oDtTMrQnCkQqSFqETqF4JXnjo9cI0fOyDnxBaR192md1j91eU6cVHyVfdZiXRAYNlAB0
         a/kDhQBPYeiDkK2yxATkEgGYGdUjcMKqdt216n+3sahtF3qGzofFcuiV0QWeY3EKsJKv
         nw7CTnvwaljIADnTkpfvaUTJYllUFio7yHEA0ennQfASRjbQUSJGRjnbyxd4m8s4E4T3
         mmgcBPA57wMF4KeGLlOM+ohnx3m1aZtuAOTFknrsA0syj1XfCz2PvRdR5a0NosGbKnIh
         z6xg==
X-Gm-Message-State: AC+VfDz3B8oxu6+xOw917eOMM6zWg3BqSdpFYTNoqpwHnx6irLa/KA0V
	TvwJWlrSL9mRzzHj+r6/sHszGEbyCII=
X-Google-Smtp-Source: ACHHUZ6RelIXWsySL+i5SmRyfXdNa3VCZxIFmYE6t17fZYsPEefr2Ema9/KYXBVNifZkX78h1xFM5w==
X-Received: by 2002:a17:902:cf02:b0:1af:cd00:d4e4 with SMTP id i2-20020a170902cf0200b001afcd00d4e4mr7731360plg.47.1685234638986;
        Sat, 27 May 2023 17:43:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::89af])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709027d8b00b001ac7c6fd12asm5415735plm.104.2023.05.27.17.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 17:43:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 3/3] monkey: Remove buildpaths from generated mk_env.h
Date: Sat, 27 May 2023 17:43:54 -0700
Message-Id: <20230528004354.1655629-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230528004354.1655629-1-raj.khem@gmail.com>
References: <20230528004354.1655629-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 May 2023 00:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102886

It has paths to compiler and assembler which are technically cross
compilers in OE. We do have these names symlinked on target too but
paths needs to be removed.

Fixes
WARNING: monkey-1.6.9-r0 do_package_qa: QA Issue: File /usr/include/monkey/mk_env.h in package monkey-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index d3e22757c4..ee5dc16198 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -39,6 +39,10 @@ inherit cmake pkgconfig update-rc.d systemd
 
 OECMAKE_GENERATOR = "Unix Makefiles"
 
+do_configure:append() {
+    sed -i -e 's|${STAGING_BINDIR_TOOLCHAIN}/||g' ${S}/include/monkey/mk_env.h
+}
+
 do_install:append() {
     rmdir ${D}${localstatedir}/log/${BPN} ${D}${localstatedir}/run ${D}${localstatedir}/log
     rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
-- 
2.40.1


