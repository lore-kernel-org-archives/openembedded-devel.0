Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CE1C7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:52 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9133.1685521579862116083
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=d8oX77wS;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30af56f5f52so1469888f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521605; x=1688113605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wE5SIBpn8f5449AscyCJeJO8JO+ealtR1Seph4ofLGs=;
        b=d8oX77wSIDUT3Ldjjs3R5FR2uZdr7mXvb+eeGxH5q5HB0z99FrvlM5w4qtX1dQfpu2
         2XxsSF95i3H/9Vx8wEq2+UD/q8LRCbjf/3B7AQ9CPgjc9NrqQ0BeCtTExu7qHvIBf7vh
         zsw4JzvbOPWlbkGO2dEsRuy8iUj4dxCxM2agJX/bYVyH1evsu7hPv4M0M4zv+aEeWKFz
         Xkb54wKhebiduEsrGYTxz/RaWn1Y12Lz+nGbDF+o4tpk1zIW+ofiUqz7WjJgOxFJaOxJ
         +vInDkux89aKjukIkrEwyfJe1M0Qm8VESjEAwEuu86S1frltR21XkhC1VQlw+eNIX7JP
         kTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521605; x=1688113605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wE5SIBpn8f5449AscyCJeJO8JO+ealtR1Seph4ofLGs=;
        b=f1NEwF7stQwQg/HQ4MWSvKT2tZNGeOC5m+9dk/tw7yQn/x1gcbzKNpYBZL4KBgRelJ
         HYKlHkgQobPIIdWO78Q8kwifINrONTOdpEluypzVcCqnmUcgSGbHbrOHgB0rzP+JnSfz
         0Fgw4UTxNx7mLK9M5LhAeYKBP1KWvYKIsps20V7DczNJzysBqENvWnO0uqiZNUt3E9dt
         DN15exL2xwFmBeO2hxchoZPSssBZ7aSrbNyNmA/heZhLWzLBsJlDMu2eVPMxdcH4iJXk
         NjOoK1mDQMfzb4Fe6Tx2SLB2bnJ6iTiVEcGfatgOMOA6Pnmx+Np2f5NWHrITqSpzuyXC
         bWog==
X-Gm-Message-State: AC+VfDytM0cnDMEqpBUxaAfiapw4fNRONPrkMHshQmPAMtBYFLnZJAvD
	0ZAMfEWZ9h7eZgcA/kadc5Il5aRdoYjIdPBoD6s=
X-Google-Smtp-Source: ACHHUZ7kXV8x10oz9DeKIqlS2ivX5kEgPykoxFc4F1yx1tygTvkKi4xNdZxLrKJzEmTdIZm0H+nKww==
X-Received: by 2002:adf:f005:0:b0:30a:efd2:c170 with SMTP id j5-20020adff005000000b0030aefd2c170mr3128440wro.37.1685521605182;
        Wed, 31 May 2023 01:26:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 089/149] python3-lockfile: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:37 +0200
Message-Id: <20230531082437.10646-90-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103016

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-lockfile_0.12.2.bb       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-lockfile_0.12.2.bb b/meta-python/recipes-devtools/python/python3-lockfile_0.12.2.bb
index b9dc4722a..af738e08e 100644
--- a/meta-python/recipes-devtools/python/python3-lockfile_0.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lockfile_0.12.2.bb
@@ -12,6 +12,9 @@ SRC_URI[sha256sum] = "6aed02de03cba24efabcd600b30540140634fc06cfa603822d508d5361
 inherit pypi setuptools3
 
 DEPENDS += "python3-distutils-extra-native python3-pbr-native"
-RDEPENDS:${PN} += "python3-sqlite3"
+RDEPENDS:${PN} += " \
+    python3-io \
+    python3-sqlite3 \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


