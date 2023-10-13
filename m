Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47CECDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 14:24:00 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.39751.1697207038453792204
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 07:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=ddBAyiJ2;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-32d849cc152so2055670f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1697207037; x=1697811837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/RskAwLwmcxjfwSh1YBGYbjAZd1wwbJXD+hvathq3z0=;
        b=ddBAyiJ29K6+PONFTLZMmp4wV5KGk2XtQoWvnCukM6eK+a1s/d3sgRV/kbl7hekPVI
         8g+M4EItmGrQrq/K6omF6iqhSOtzrXK3GrNoCaMxAOo+aR0g7QpIZ8u/MoM2wFLHBFad
         9Od2X4wKkjNM6+qEGXYeYcADOY4aQUi5KPBRdhSXRRtKQY0cS7X5cxWtacyOuu4lbCMS
         iQM1PLKJqPNK+D4p+dHC3wqmlYHax5lVfIQQqy0ehbpBnVs2NRBDOFcpZQkkgpPDUpZy
         CSIQbHM4XutY9mqYT0SM0QfbCICQ5v8n29COwLim5PwqACKhhE3I8KdkHUshYFo2t5rg
         xLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697207037; x=1697811837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RskAwLwmcxjfwSh1YBGYbjAZd1wwbJXD+hvathq3z0=;
        b=p+NXpvwz/xoRA/6heP1xWp0QuNW9mJt/+Hm/AY/BX2osIOpeDQX/Y5GQ7EGH2ieZG8
         KZ0/0quKgEEgzzQGfhJdAdYZaLuyWJOR9u57VxmN7ZdrNC9hndUNE3Pt+At9wOdNAcMl
         SEI3x0iUF9DagRXECB/bt6HjQyZenzYWWcBn5fnNZs8XajARnr4MnV04ITMvPe/1Nif0
         OQik1KkQNzASZc/Ef47+J4BUYnSF0XcmBc9w/wTNhaC3/lEMoIOspHcDOd7tztNcE0Gn
         xkjdXGZGcqIVz4V5T5YfMU16r+Lilchw+3haBebxoK0XKbjMuWYSjD1Tjib1jo+vOWyC
         TDiA==
X-Gm-Message-State: AOJu0YxTP0k/YkYkHQCyBzVl4yXv/XRoSW9JhYrEVwyTGQLhuOEFNTZF
	p8Z6/13sfx/OagGFLMmkVp/F2wUIqmCk/vCfBJQ=
X-Google-Smtp-Source: AGHT+IEC3RrnXni8VBG0z6yjYX9BZzfaagMuGIUD5+earVOAU910P9UCz441lGKqykUpyKxpNLwszg==
X-Received: by 2002:a5d:5911:0:b0:324:e284:fab8 with SMTP id v17-20020a5d5911000000b00324e284fab8mr24858625wrd.39.1697207036682;
        Fri, 13 Oct 2023 07:23:56 -0700 (PDT)
Received: from p-nan-fatho.home (2a01cb0584747e0021d4f13fbc3604e3.ipv6.abo.wanadoo.fr. [2a01:cb05:8474:7e00:21d4:f13f:bc36:4e3])
        by smtp.gmail.com with ESMTPSA id j11-20020a05600c42cb00b0040652e8ca13sm252689wme.43.2023.10.13.07.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:23:56 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Fabien Thomas <fabien.thomas@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-initramfs][PATCH] klibc/klibc.inc : Add DEBUG_PREFIX_MAP flag.
Date: Fri, 13 Oct 2023 16:23:54 +0200
Message-Id: <20231013142354.2951123-1-fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 14:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105474

Following reproducible-builds.org recommendations, using compiler flags
like -ffile-prefix-map or -fdebug-prefix-map allows replace build-time
paths by install-time ones in the debugging sections of binaries.

Variable DEBUG_PREFIX_MAP set these flags correctly in yocto build
context to guarantee reproducible builds.

Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 113459b52..6093e19b7 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -32,6 +32,7 @@ SRC_URI[sha256sum] = "d673a294f742d59368222ff5c38462d81098c55063799de6fb8a7ba3d4
 S = "${WORKDIR}/klibc-${PV}"
 
 OPTFLAGS = "${TUNE_CCARGS} -Os -fcommon"
+OPTFLAGS:append = " ${DEBUG_PREFIX_MAP}"
 OPTFLAGS:append:toolchain-clang = " -fno-builtin-bcmp"
 OPTFLAGS:append:toolchain-clang:mipsarch = " -no-integrated-as"
 
-- 
2.34.1


