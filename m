Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF7BCCF2CC
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 17:20:29 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18252.1792344020374564002
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 10:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DBtkGgDI;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso698748f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 10:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792344018; x=1792948818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eurJ+O4E0tVz985Sy9s3pbXbVn3mdd9I+1kjRrFuY8=;
        b=DBtkGgDIDNqDkuAJ/yeYqPjmRl1hsMdSVhqZIWxMGHJr1dIIATlC77ojpUVfxLfUcC
         Fd0YXYAYy+a/XjLjqkGwmR8/esNJKu4RwQjGxtKfMbHwP1jkc1yPvyq4FXNyyMbDFEX4
         TS67aZ+/XokAq9ttQPkOFwVIcpg0UKcm1IAwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792344018; x=1792948818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7eurJ+O4E0tVz985Sy9s3pbXbVn3mdd9I+1kjRrFuY8=;
        b=U/Ph1gNV1Toy00U+epHge0aNTtH8zfDM2nD6IQ8MA3xv9qk8uNWd3Mp0bCSRM/2f3H
         ybEcePdReGIQqtiyzb36WCovpH3kPmJQGhvjgoJicwGxKNY3gzP/Fvekj+4EIu24yZVa
         y8pOHUzQqRUahn4lX50TRZmmklcb/J/HiSC5cpsoIG/rGspH0JiopP5mIkT8MhF9p5pw
         ulIov3gqi82TCukiaOUjTxVc27rgUACchxh0bnIiuBf9cOkJ116GCbstItx7NIk4my9r
         OCflaCDVVckGmC16D8EcmcyTG4JpJ8QRSFJ+V3E4qTD+j2NMirb0jM7QDwP5WOStbxWT
         XYwg==
X-Gm-Message-State: AFq9FYJS0NDwLRRx003g5w3M5Hcyp+AHLQb3SXWj1+3XYakA8z1SqX98
	35WcErm2w87jZmWXmrj+suBD/p4mStIWSe1aAwntrzHjkIUIYXGw2p51Ttq0J4aAOQrCS7M1cZc
	+0b/c
X-Gm-Gg: AYBFou34orSbl3Ji2VUOwClGoM+BLSPn+7cknFMBlM6TamVvLO3UVQCCKSRnCkS9CD8
	ANfoTUZQJaLv0Uq0vjtGf55ErUSEB79wKBfwlABkmTDh8DYCvk7C+plhznwI+L/8bhxIb4hSfQ6
	7p3DolwtzW2OifmHoNd/Y+Gdwpza8JTh93eQOxU0PeFXFqSsAjeA0C9ehllceIptyxGqezEOFqy
	JfG4Oo9SS7E1I4YX7N+A2+gZG/4Dq0aNMzUObsccWsLkHMOOS33e3vbuaiS5Uk8Vwz9LQAAN6Zy
	83jK1bz0JBVUOObbldx0fYLUxSHBEioUAmzB6h4WoH/fzBA0iiIMXFdxzx2UPiKXVR6eM3ktwbx
	KY01iS9MS5pShvJJNlnemt4u+5dCdDO0hRTHBU+zXgmx/qFaakeD0zfxAqgpmQVmSj6a62HeQpp
	qL1Mv/M6BvEPom/En8uqjiPM8Ibf4rNQwwMgAJ0SpStVq0rphe0HRmfwsW4Nf9cVGjQnBluIEte
	c0d5pbnY2ApSJNLS9R2n86d8tAgmhEN3+6aYfJbGUWNw0ha5mCZC5rp095K8Jmt/k55R+Mi4j7h
	zxagOnqbQKYl7oy/XnaLjlg=
X-Received: by 2002:a05:600c:1f8d:b0:4a0:1b14:d00c with SMTP id 5b1f17b1804b1-4a1d75ab306mr137743225e9.3.1792344018270;
        Sun, 18 Oct 2026 10:20:18 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dc952d63sm156755155e9.2.2026.10.18.10.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:20:17 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pybase64: Upgrade 1.5.0 -> 1.5.1
Date: Sun, 18 Oct 2026 20:20:11 +0300
Message-ID: <20261018172013.925046-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018172013.925046-1-leon.anavi@konsulko.com>
References: <20261018172013.925046-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 17:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131097

Upgrade to release 1.5.1:

- fix: swap PyBuffer_Release and PyErr_Format to prevent
  Use-After-Release

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pybase64_1.5.0.bb => python3-pybase64_1.5.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybase64_1.5.0.bb => python3-pybase64_1.5.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pybase64_1.5.0.bb b/meta-python/recipes-devtools/python/python3-pybase64_1.5.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pybase64_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pybase64_1.5.1.bb
index a07c5042d5..19a8e094a3 100644
--- a/meta-python/recipes-devtools/python/python3-pybase64_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pybase64_1.5.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5042ea9bdb8e0560ebab12bceefcd3f7"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "545ab2a433769e3b8e1ce2b4f7b07218bbde202f4954fbfe52948b2522120727"
+SRC_URI[sha256sum] = "aa924f7c2e90349d472d7d57c3680de8d222a32c2d3d07f922ab2f60516e478d"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


