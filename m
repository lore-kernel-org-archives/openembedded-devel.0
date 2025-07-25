Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B70C87FCA
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 19:20:07 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.27419.1753471203670580033
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jul 2025 12:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wMFCH/dF;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4561ca74829so26183885e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 12:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753471202; x=1754076002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqjQixvCW65x1MKpj9yvPWkoJqk2AL+p2uMvoPp0Se8=;
        b=wMFCH/dFdsqfXUa5mcO7oa5li9GxfGRneHzVjKXKvPll86EQXl8zDSfu9lbEjID/KU
         pdEDCNFxQgpqmqfqQ8cq59yapjPVezfMCZ2ZKdnmxEEgrFxpY3Z1mYtO9yL6kO2se/0Q
         I8RAeWKm3fyl3hZWfNwlcMmGOE4JcAvHath7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753471202; x=1754076002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqjQixvCW65x1MKpj9yvPWkoJqk2AL+p2uMvoPp0Se8=;
        b=SSHhdNsRsdDjn74mtaipekiI4vq7TSbvxegtS5m3hnkZDNgVsJm/8B4lpEGlHL0IGO
         QKaG3EjpbtA12JCoP/dVO3Quy6gmvh2Hn/9lLssZW1RNJkRnkwHpjyWZTcetMl7EubiW
         lR621GUhDgIoYGdA6bXFk7VqzqGaue4SbYDEGFUF4jf9oqG7B1J2+dSWp4qLXMAWJyK0
         z3YFSYvdERcQD6wI7kzrzSVmNtAhxoDpX3vAB51jQGfODoA6BBhRlgLkdcEhS6xEERk5
         TgziNXbp5piBMtzsD0K36OVdD5mKLi1cfEr+4eDBAGcmMcLOgQtbjWW5uUOuFtk5BWKt
         i5Zw==
X-Gm-Message-State: AOJu0YwzDGrbV0POtGDKWAdyzmpbC6/M1UyO/cAwdM92N14kcMGWDxb6
	vLlkdMOCWD/fqQRkignLavtb8jY4J1f2JT3940h5qw+WUBZ4FJMkkYa0STmtQGSQ8fJ1/xcMDUw
	j9Ynet9ZFjczk
X-Gm-Gg: ASbGnctthFTF9hbN7QE+vtV/pXAd1yLl178By6E1e4mD6buCs6K2vqDTMLTibJYCsgr
	VkkTizO2ui4MG/7MvP8HL+YLLRuBUomnOTrsTZ8cQI0CzTiSAiiT6oUZEDMNfkWb+WdRg9acchU
	4+xwXxi7mpMloISdtDVUXCC67WEpq591k0WIAHMLYIRPT/99FBdz7to7A4/TdoGqAq3lLzEUuaE
	yv3QCcuTm3f/9nHIDM6ear2bnujEXr1hRVLNetXwej0hmVxdRbjm6ZpMHhkoqCnh1gUdLwK2kpT
	LnmxSpmJ47LOa/URyBsX5MK+JsnjGE3Zsq+af7pecEH2nvNCsCSGdh9mYqsDfctXcXwkTFL8WhH
	r7yE5qsbM6K1Nn0sS1V4KyyXSwRaCX0aRJ7jmCgQTVw==
X-Google-Smtp-Source: AGHT+IFbO8//gVKBRfZW8De78Ln8o6F/pnMpYNdTNN1mxEk5yxLNkldUofuw/FYTlMN+cuDjDnqDBw==
X-Received: by 2002:a05:600c:45c6:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-458763091f5mr28827065e9.2.1753471201812;
        Fri, 25 Jul 2025 12:20:01 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.207.175.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705ce685sm62067035e9.30.2025.07.25.12.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 12:20:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 2/2] qhull: add native variant
Date: Fri, 25 Jul 2025 21:19:58 +0200
Message-Id: <20250725191958.1696481-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250725191958.1696481-1-yoann.congal@smile.fr>
References: <20250725191958.1696481-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 19:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118735

From: Yoann Congal <yoann.congal@smile.fr>

Since commit 4042e529b9cf ("python3-matplotlib: Upgrade to 3.10.1"),
python3-matplotlib depends on qhull and has native variant, so qhull
does need the native variant as well.

Fixes this warning from AB[0]:
WARNING: Nothing PROVIDES 'qhull-native' (but virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/python3-matplotlib_3.10.3.bb DEPENDS on or otherwise requires it). Close matches:
[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/377/steps/12/logs/warnings

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-extended/qhull/qhull_2020.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/qhull/qhull_2020.2.bb b/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
index 9efadbc7f4..3e3d1007e9 100644
--- a/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
+++ b/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
@@ -25,3 +25,5 @@ inherit cmake
 SYSROOT_DIRS:append = " \
     ${bindir} \
 "
+
+BBCLASSEXTEND = "native"

