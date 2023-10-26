Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4F0C25B6B
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 13:11:26 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.69986.1698325881905352077
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 06:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ayLxWBMr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5079f3f3d7aso1313589e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 06:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698325880; x=1698930680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwFx1YsdR4rHMsbfERek+MS0aCWq6PKgmDNXcH47qCw=;
        b=ayLxWBMricFSvJQQGwmRRKLi6eqtEt8OQavgDMw/UQBB4STJqKr6nOtd1Y9Ox6El9g
         oMNMayhn1Po8XoqTR/gruNH4Qjaw0oQpPY2rH2NzfjJRd+EASA4p8Od6JPFClgwf6fUR
         ShBHnFKT7Mgm5ABDGqEE8jdY4AF1ixJYrPzb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698325880; x=1698930680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwFx1YsdR4rHMsbfERek+MS0aCWq6PKgmDNXcH47qCw=;
        b=a3HSr2HTcffgFB8v7d/maBpZBUmAFrQTLHtMoNsrY2MVa7f9aCKPbLFj9HiMICCkgK
         sI39lVO2B4HjHFrvrS8axsjAPRN4jLA7bhRbq7alaYO92C7hj2kjEq89xxwGFktjs9c9
         Ex00nXRcTMVb+XlQCHkx37i/bYaZgKOvXG6fXL/hy5aiK3SSL3nF92lW7CZCyk9Bn6QM
         +DI7PvfygDTlWyWr3t3NRsScdmsYeu+EuwlNizhiisTeS+jBq3p34aubWyi6F5UIo78Q
         x0y0G26HOKG/nrPasgVUugZ7xPpJvFpPHUw8Dba7dmgeokV03iyE8Akko6WQNJwGcRnH
         mMKA==
X-Gm-Message-State: AOJu0Yy1Ind9SywiCyTsMpmKI5/ttsZSP99mOYM61eBfBvhx+Lz3oyFA
	WDlapNCP4g4Y0oBuAuNDjaqKyxs1NWjY2xI2J8w=
X-Google-Smtp-Source: AGHT+IGcTfOmy+9dWMNOrgzviy76EBDHbpiiZpMiBubl+hBkQXznITKOVROxCd8sUYVj9Hx+2Bus0w==
X-Received: by 2002:ac2:4e93:0:b0:502:a46e:257a with SMTP id o19-20020ac24e93000000b00502a46e257amr12431375lfr.56.1698325879846;
        Thu, 26 Oct 2023 06:11:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3])
        by smtp.gmail.com with ESMTPSA id q18-20020adff792000000b0030647449730sm14202024wrp.74.2023.10.26.06.11.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 06:11:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [kirkstone] [PATCH 2/3] python-blivet: Adapt to upstream branch name changes
Date: Thu, 26 Oct 2023 14:11:17 +0100
Message-Id: <20231026131118.1500868-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231026131118.1500868-1-richard.purdie@linuxfoundation.org>
References: <20231026131118.1500868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 13:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105744

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
index 29e7a267d..36ab065b5 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
@@ -9,7 +9,7 @@ S = "${WORKDIR}/git"
 B = "${S}"
 
 SRCREV = "42512ee48494cee71febf04078d9774f0146a085"
-SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=main;protocol=https \
            file://0001-Use-setuptools-instead-of-distutils-in-setup.py.patch \
            file://0002-Use-symbolic-list-add-and-edit-icons.patch \
            "
-- 
2.39.2


