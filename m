Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C957C77B7A
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 04:27:17 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.13654.1684816027673640770
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 21:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=AKotogX/;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-64d5f65a2f7so1632060b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 21:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684816027; x=1687408027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hw46HGVOB4YNwmJPNLnR41rhkGmJJDAhxFvSO6ieAlQ=;
        b=AKotogX/i5RoKuxJ23VPqcgSffLhj8nXQRwi7AZK+1ZJqqWEDTWPOD4zJhuiwKvnGv
         jfI4dT+pJM5LmTMSviVpRMl6FJNu/v+5S+vvfvekR74LZ/v2voIMO6f10T2s13rdCB7s
         bjG9dIxq2TxEpQEeQJVIlvQwpy2lM5hbPzgzdpSXuXkkfNQnuJWrfQmrtwzl4sTZ3as2
         UOR9ejCj0fAE3Rf/mloZKRjo12CkJPw7qtjPttHcpTkcQsEEyFFJSXJ9PLmS6Yaoe4/C
         IvTELyEv+2GPn6GL9nhwoMnlZbQnAdjVRHXpwhZocVKknXK8ZsMoFjT3f+4b6pENpHRi
         w9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684816027; x=1687408027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hw46HGVOB4YNwmJPNLnR41rhkGmJJDAhxFvSO6ieAlQ=;
        b=O7WlhquGHZpwXQOOEzklf6Z0MMuPbPTkhX/FxcyT6L0hPMxwBanTBItC1D4J2kcLBW
         K24dDiyjlfxEk52pEdXkPKYl7rXKsYjqi23qTO8wvEDCFBNiM1KAlEkn1DOu2LrgPZ9b
         X3JLFhG6GOQwlVUnqS/bGjHe/+mGkE90PW2CcoDMtuFsOwBEn+DXy9Yz3JbZD8uImKI3
         EHoFAUU27wLgt60oUUbQ9DB4CdjJXGurAl57MMRMzrliYNgEJh2L2mmNVGkv5uzIqGUk
         wuSAiPDwaw2XKw71EWdcAeuHkapdYRpoyKFaG6JFWyj3BQTdVsRKi1+rz1lzbULx2Bp0
         lW6Q==
X-Gm-Message-State: AC+VfDwr+z8UgS0o4FPJxauVTh+fqOxz3vUwwnbyK/ruJV2h21vf80dW
	5NiqJOHUNvS6VkTFImHlHpLDxLV5QvE=
X-Google-Smtp-Source: ACHHUZ4kh5n+SCpzrtkpwvYL8BN5ZIIIC11ng98Gjw90eI43AiewsxMJSpZ/B1IpyZP7wWWVJgFYMw==
X-Received: by 2002:a05:6a00:893:b0:647:e45f:1a4c with SMTP id q19-20020a056a00089300b00647e45f1a4cmr15525305pfj.11.1684816026780;
        Mon, 22 May 2023 21:27:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id n7-20020aa79047000000b0064d2c7ac49fsm4844332pfo.31.2023.05.22.21.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 21:27:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 11/11] unbound: Remove references to buildpaths
Date: Mon, 22 May 2023 21:26:58 -0700
Message-Id: <20230523042658.4159559-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523042658.4159559-1-raj.khem@gmail.com>
References: <20230523042658.4159559-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 04:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102726

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/unbound/unbound_1.17.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.17.1.bb b/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
index 24ac6012b5..9855a557a4 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
@@ -29,6 +29,10 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[dnscrypt] = "--enable-dnscrypt, --disable-dnscrypt, libsodium"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 
+do_configure:append() {
+	sed -i -e 's#${RECIPE_SYSROOT}##g' ${B}/config.h
+}
+
 do_install:append() {
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${B}/contrib/unbound.service ${D}${systemd_unitdir}/system
-- 
2.40.1


