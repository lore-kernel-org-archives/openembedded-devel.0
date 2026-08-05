Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675D8C56207
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 21:37:21 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6413.1785965834518538884
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 14:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E/3MMbl3;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8487088510aso2006532b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 14:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785965834; x=1786570634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UcGIIIVfmUp5QrntSnaZ/zqAM1VaZUvH8bhIq7ajcLU=;
        b=E/3MMbl3uNy63SHXXk39ZFPF/uJwpbAnQZAOaQoBS95LFI8OXZZFE2XLNZQ18yVaCD
         UCxuC9DxOeaDGP6OYL7F3sXcbWSV+fK7TwuvEkD/BkKPx97H2EwJJH7VJsSSlmHpPYJS
         eeow9DZhaOJRu1rIeF8guWXVw+PbWg26RfnK8/SY/Hr3/RJis6eS+JGhC94MZNWBxy3t
         FPrrYCG0OhW5l+Qo7azwP9XptU3NXN89i4ivMKdNsALOFa07KEMt189QnnCOpcGWRoXG
         hQkRcYpvhcgQ9m4ffM9HOHIlLlkTI4avfDZZs2KZeTdg/s31J6gPR5d9VU7cJrKFZjcx
         OzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785965834; x=1786570634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UcGIIIVfmUp5QrntSnaZ/zqAM1VaZUvH8bhIq7ajcLU=;
        b=EXKRW4ArP1F63NhNolHxgxBeTAMotvW8elAzGutOrGbjAVdzIJKMN0Xnq4ejN5pU98
         rvWfH8FWTUYdAN2xTEw/B2Os9HFD92usJVZH/sTDdiI+L3XMNexfiC4ibNWBT1FUSFuV
         NQ9JffDwnzao9KE5I4noyQa0nJ9DFyScPEUlBunmIUVrZ17BgoP1zDgpe2XhPQ/KM9xm
         6C5VnPB/I2EP42r2dultSew2MFbwnXfGmG96pJzK/OdBdFc9K3pCUx5byoQ+y/2UiN6Z
         n739puV2Bdvq/4Valo8XsuyVPOZQE5iV/cNuahpwssPkmbHPYgM7kVq4pvAdJQWTQBmZ
         1v9w==
X-Gm-Message-State: AOJu0Yyku+EC6T0TvNfGESLGHYG5sgXuizKWq/wlwvpeyMV3gLzTAs8G
	U9klSErSnZPjMgiLsUOA947HdM299XXwUwtdnkJGAIpldnpRj9TzTIkOpuI+2w==
X-Gm-Gg: AR+sD13sH4CeBK1+zPER2j2DFcv7lDMfSTHZv5/V6CJrtMIxo+kdLXPgUcpFPL1702P
	solC7FgOs9aiWMpZ+2RF+ReE3R8FEWbS9P5aFqqd2kVzM9/J3YfZib4mq2PSQaA4kSi+5F0srXA
	RpT8cgvIfdus2kTP1H3YBjlVPB4F9hoELfGd5HfJ8NtxrQTpLcpU+R2HVKKawOtmCTXB8Ur3ejG
	wukiAuozGKN1lBHUw4LyyPBSV7GMn9h1t29ZAVKXVKxzVBj0T/iApQx+HmhcDOnf9jRuwvzhfCZ
	xdxc6WVBAGMVX3jaJzQn/BIsEDXY4+NKjkgEbYMH6KqfdPsKRvGWXJpjDs4zPuTzFsWJZ4e2rf8
	sWXQ48iVtZxvSdCjsrm5ZZFaYVi0XyP44E2zYkrE2vM45B43HjghbNYlMOKe0U8dm5uw+44XIvS
	WVbjPpQRZFj5XJW0BRCkPhSNTYVTws96KB0IENmUDC2q2kS85XfhvsETru9G/YZF4+4SaUseqhT
	1C/KzKTPBXkYg==
X-Received: by 2002:a05:6a20:a114:b0:3c4:397a:69aa with SMTP id adf61e73a8af0-3cb85f4e1bbmr11947708637.31.1785965833805;
        Wed, 05 Aug 2026 14:37:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158644a195sm18339715eec.13.2026.08.05.14.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 14:37:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 4/5] python3-argcomplete: upgrade 3.7.0 -> 3.7.1
Date: Thu,  6 Aug 2026 09:36:57 +1200
Message-ID: <20260805213658.2896903-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805213658.2896903-1-ankur.tyagi85@gmail.com>
References: <20260805213658.2896903-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 21:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128829

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/kislyuk/argcomplete/blob/v3.7.1/Changes.rst

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ython3-argcomplete_3.7.0.bb => python3-argcomplete_3.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.7.0.bb => python3-argcomplete_3.7.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.7.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.7.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.7.0.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.7.1.bb
index 21b12ded49..eb03e039d0 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.7.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "afde224f753f874807b1dc1414e883ab8fe0cda9c04807b6047dcb8e1ac23913"
+SRC_URI[sha256sum] = "6926a3a70ae70dce1f3dfb5cf1fc984278cd163e78ec18ad2ed7fa4fabd8f281"
 
 PYPI_PACKAGE = "argcomplete"
 

