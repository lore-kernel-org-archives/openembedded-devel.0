Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D787BCC6B1D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 10:22:39 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10221.1791973353561509865
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 03:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sp8XoCNM;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab8309dcbaso2872140a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 03:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791973353; x=1792578153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBrBBaGvlLx7cs/O9JYmR82nNSWML2ymO0rqcN6BQsQ=;
        b=sp8XoCNMnoGqkAp2MKdUZmvGDZ+KdpAShw1i0J2tmh3blqFvxAGiCDKTg8xyn4ZFC1
         kdrlZqBmQc88fWtu6zlKwmjsSb+1Z1H/Tvi1nkCUpf5pSAQRltkSm6XajGwsVG01G6Fw
         xnoSwSyBUR+8czPI63Rqu53cXsVEgQCCU+lljaTtkgad7AQjmIJTHDvo2GolBzMhdSob
         LRMEV+hsPq5GB3mSGx6u2QZK2qEAPKXV6FGI9hZWIIu016SsXPprw0Dmisf6tF7vbMtT
         Y/Hlas11c2ZiEl/IJoU49hf/mnE9arNDXJ1JPL4LQvNE4WcvQavoqv8R2t0AuN4pr+pS
         utxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973353; x=1792578153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBrBBaGvlLx7cs/O9JYmR82nNSWML2ymO0rqcN6BQsQ=;
        b=asB7OuqKvvGSVQvsueolbioCvMbehrOwipGA5ho5Ujc5Hs1EmWLodtrQmTfVQQLlf+
         bM67aqSOM65PtFN6/fmBSNOmVDMDMlfcQTpxBoH4QVfTSXHftSKJBmQ/7AhXNDPXZPto
         Wl8kqqh6r57x7JAbeua9mZCgES9bwX1W5PxziXPlqBybt4QnV31WN92gpyCFKZwonfVe
         VU72ta0VF+Fb+qazm73gS469LoKytI1UwCj9gJgCNqJR9/2c+/+9e4UTt8sRaEPBrqqg
         1NaVOryHFsoIpSLmuAn8NbUtILubfUxTeqb23eiw9PXDg9s8mGmPWiARyIDievc6djZn
         t5rA==
X-Gm-Message-State: AFq9FYLgl1bCMNXBsj73BnKS4QIPZ0Ps8bwh36Zxuq2ipTTgpeTjhSHo
	jz5oi6mFEhevPq2hxzirIx0Wyqg4M02Rxl96Gz0H4uyPeHwiAbH5eAP1L4NgPA==
X-Gm-Gg: AYBFou0AR3ocCRN5bvthPq9uNwCKbNMyOblSL5rAs0uuxkCqYrUoLmOPP7Jwnyv9Daq
	RhV2RtQGhUZZKMyiU9Tc3kJlDzToQSCpsw5jCgZlEjCW3RgNGGqAB6qA9/6ulYRTPjrOsf3krpM
	zByzDWxsTa3UW5KT9i9GIInSAdqyrxgD4gVfziKrKj3XGtX125FD/1POQlpoex2MfBWFBA7Iha9
	1NaFOigKkWC4iMG6nrg4GNOOV39A47skDPIOmTaZYO896bK5GY/bRjAO8llfwKKDBetkYc8RWW2
	5IOXyLtRPXhpCINxNiCUgtsFR+/Hi8jMaX9qb8T0HN4ug5BTT3UoGezii1ouj6x6Kw6DBEmZNuz
	9BukR4o7KPkopDPnvAR6FvdQssIcGDsfjOZyUjoCE+0P8fFRNxzAa14cGUOk8Q0T3e9GqFEaJyi
	oNn3rjv13aUmmtp6aW/HLehbPOFdOecbanNGjNfy2qc0DUwufYmj7I/w5Njfc0kVLGW8muqiaDg
	uC8GcOmNKHSm+mGnwgOOsTAG2WM53pAyjZ+6hk=
X-Received: by 2002:a17:90b:4b82:b0:3ab:a09c:f858 with SMTP id 98e67ed59e1d1-3aba09d4a0cmr6260876a91.33.1791973352800;
        Wed, 14 Oct 2026 03:22:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61170b7bsm4017740a91.16.2026.10.14.03.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:22:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-python][wrynose][PATCH 4/11] python3-django: upgrade 5.2.17 -> 5.2.18
Date: Wed, 14 Oct 2026 23:22:10 +1300
Message-ID: <20261014102218.880640-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
References: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 10:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130890

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://docs.djangoproject.com/en/dev/releases/5.2.18/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 0640fa901df7783fc9f544a6bbfde5b771e22b96)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_5.2.17.bb => python3-django_5.2.18.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.17.bb => python3-django_5.2.18.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.17.bb b/meta-python/recipes-devtools/python/python3-django_5.2.18.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-django_5.2.17.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.18.bb
index 7f4ed2c92e..4e3d0b431d 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.17.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.18.bb
@@ -3,4 +3,4 @@ inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch \
             file://0001-pyproject-lower-setuptools-requirement.patch"
-SRC_URI[sha256sum] = "9d4d93be539a18ab80d058eb515900e10951e04c537c5a6b394fc49528d3251f"
+SRC_URI[sha256sum] = "461c5dd06d2ea16bd5ca37d3f46e4def1d6b0fe7588c6f4e2119517bb0af8b2d"

