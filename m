Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25376C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 18:57:51 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.1511.1646247470567990456
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:57:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N5+MoNn2;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id t14so2427468pgr.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zm0c2hIdpp+Nx7QTWTWre8L2mbO1xXuT7rOM2vzXeOg=;
        b=N5+MoNn2jjDZk8G1Nnm4lWCeioYmciWXm/CZR6LF4ayXT40Z5h+cj8RA9ri0935951
         Bhm7QpyFwOnZs+XRXOcI95IFX9yv7StlN36a073/49LJt51k35AXnAtigLeVOAVOQ7jT
         ZfmnAnU+ixjbU3+Cd1m+dM/Ev1oYKWvtgLvTHESK6qBOztyCDkH9Iq4BaBOnozv/bzQ5
         fty0KkduVSMUR5rFepYS70RTdaFfNt1zULwBXXv9f9kb5bM/gRtZTGtJy11X2ENcaeAI
         X47hkYEoaMHngFXK3CbiosXTkp+YavK2UDeybG7nLTws2U+XVxLvw6eiuTqzuKn+zAsp
         mzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zm0c2hIdpp+Nx7QTWTWre8L2mbO1xXuT7rOM2vzXeOg=;
        b=uxz4KJEnPNKpd6UQg7dQ51pzSQqgcPU9K0GqDaidgMYo2WKxUjjrLpavQ/BZmg6eJH
         gcdKk6QcdO1aEE5WG5msbWLKN2ULhReGxjlLUCMhKdTgdqa5LMXdRTiVkI+C5ZLEQ9fc
         HXSprsi5JKNh3HRljvmHnjxZ02MnwlwwAt/RazcR+WmxKv46Xtr9JqOpJfiDyLmYi9wM
         1Ue3cMLo69wT/HwH6f34jWRy6C94h+qvhwjCXQzjThrpJPLIgHIMcuH5VNFUDF1vaJyY
         ntW97xBxUp1hjQMskSLfALgucDbggeA9ALOyKoSE1uRnAPcuzzA9PcTTC1mg0Z0vSb3u
         RqGw==
X-Gm-Message-State: AOAM531H5U4h9QyBhR5qTQnU8MsQNjyJg7letkWcslVHBtVD2aiayLMv
	XcQm+2wNf2AYS9hQR1Bt/WlnrfzXCesqEA==
X-Google-Smtp-Source: 
 ABdhPJylM9dgvbNLP4y/U3jXnsc0SlgYFkegFlC1EVa1p9FsRB/k7XorTKW/hdo4igsPzXQos1fALg==
X-Received: by 2002:a63:944:0:b0:374:5324:eea1 with SMTP id
 65-20020a630944000000b003745324eea1mr27380817pgj.366.1646247469858;
        Wed, 02 Mar 2022 10:57:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 nn10-20020a17090b38ca00b001bc3a60b324sm5560011pjb.46.2022.03.02.10.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 10:57:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/5] python3-pymetno: Define PIP_INSTALL_PACKAGE
Date: Wed,  2 Mar 2022 10:57:43 -0800
Message-Id: <20220302185746.2402043-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302185746.2402043-1-raj.khem@gmail.com>
References: <20220302185746.2402043-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 18:57:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95700

Fixes build with wheel packaging

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb b/meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb
index 02e8935f07..50b202b042 100644
--- a/meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb
@@ -9,6 +9,8 @@ S = "${WORKDIR}/git"
 
 inherit setuptools3
 
+PIP_INSTALL_PACKAGE = "PyMetno"
+
 RDEPENDS:${PN} = "\
 	${PYTHON_PN}-aiohttp (>=3.6.1) \
 	${PYTHON_PN}-async-timeout (>=3.0.1) \
-- 
2.35.1


