Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46459C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 11:45:59 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9508.1785239149301595190
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 04:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kIuFaqcy;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso21686465e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 04:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785239147; x=1785843947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=325cvXDbn0sHzAK5L5KujeBUwVE3G8Mqq0PV8Hx+3xk=;
        b=kIuFaqcyn4DVi7LiPTbYylmO9TKP2tp5WmUV14ZDll9MaenONSwCVUbNgPK+FM6jDx
         b0mDaQAK3pP6jGpHywOjNgvznTYQ8GVvzSX5/NnnguQ0Fm5LOQkB6MLgocbXjlbq1uZJ
         9wIbrH750YNI+gLfZugdavti1rM1KpzxaZ2Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239147; x=1785843947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=325cvXDbn0sHzAK5L5KujeBUwVE3G8Mqq0PV8Hx+3xk=;
        b=oftJXLnX0WviFh9V+nY7cth41uAm8Qd01F/5HaHNUawC/upnYIrsCtmS3z7uLXoZLo
         8Oyod4Qt1abmn1wZC+INxoSL6+kuDrGH+jQb2PUuqC1r923tFEj+fX7ZR9UgLuCagPAf
         m52umu+vHHEYoZRrUDWqJ4vw1OJWYgh2EHVXwlZm2xoR1aEZntolOoJFdHIjhyzEORS3
         Y7rMFaEZH00LD8eW+FpA34zfmJslmxXZ72sp1aBanHAvnRGFUDcxaJhoy+bdsgLfFMo9
         FjSnMsfkAAisZvHWMSBIBe6D5UJm08evSpvzEqL359GFZ6AHluHfTpr2wj4ZkP+0Lqlg
         AHsg==
X-Gm-Message-State: AOJu0YzlYJ6if/931wKuTfRavYjzl0041nrgs1A4pBJBm/+PGvHFLsCo
	ck2F4NvCoD1/8UCbjAwgrNNpZaPe2jdIA9id5akdzQZJCwSOJVyAMepQPTvAb2W6cQ/II30oQbj
	2gYK2
X-Gm-Gg: AR+sD12g13eskEj6R2UZpEkhqFq9uEFB7eybxMiZd2p5Z402HmX0apUtGGo8rRBiogR
	s5JFeO9xHRt5FckSGp2bvrlXzTPxVMwTIbUjxatCsnhTh1svxSJo3oykUyvkUK8CBhMO+pRRt2o
	jdqBkixhdJAGLX+JEsFH2uGsXZROH3bRHVj3XAC1b64384d+AR3g6rm2eB4xRfgyG1PjHxsr9/0
	04/XHqWhl6Wgy9NSrkNPtnleYVBLf4EZvSO+me10qdAy3mSy/HYOiTRFS4YzeO9Z6Mbbf4U6Ka0
	QFbl1prC8UwlepoB5If60rarwvQ6LDWy71DslljXm/dOi6cRtu2hhbuHGBsCbGvidQpxZxrAEcN
	W1dGF79220s2SVzdN4NVWHOT1clHBzNaXsMCd7GT9LAKN3+ddQSMGEj7zIsDf32rnvesMXQ00vs
	biyswMSJOgLtny+otY+0FLOqDmwjN6jC2Bqs9TTI3JHpDv+1DcrpWL8/Xj+IKjukksEKAGtjBBM
	mcPTdJVMQncbppFYk1KILFSmz4Ojjc=
X-Received: by 2002:a05:600c:e549:20b0:495:71f8:7325 with SMTP id 5b1f17b1804b1-496c6586a5amr14790595e9.32.1785239147564;
        Tue, 28 Jul 2026 04:45:47 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f96b9abc0sm37021654f8f.32.2026.07.28.04.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:45:47 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-textparser: Enable tests
Date: Tue, 28 Jul 2026 14:45:33 +0300
Message-ID: <20260728114533.1775490-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728114533.1775490-1-leon.anavi@konsulko.com>
References: <20260728114533.1775490-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 11:45:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128512

Inherit ptest-python-pytest and include tests for textparser.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-textparser_0.26.2.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-textparser_0.26.2.bb b/meta-python/recipes-devtools/python/python3-textparser_0.26.2.bb
index 40276038a3..f36308f843 100644
--- a/meta-python/recipes-devtools/python/python3-textparser_0.26.2.bb
+++ b/meta-python/recipes-devtools/python/python3-textparser_0.26.2.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "A text parser written in the Python language."
+SUMMARY = "A text parser."
 HOMEPAGE = "https://github.com/eerimoq/textparser"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fe9942a8bba5458a9dbd11277bc347ad"
@@ -9,7 +10,13 @@ PYPI_PACKAGE = "textparser"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-inherit pypi python_setuptools_build_meta
+RDEPENDS:${PN}-ptest += "\
+   python3-mypy \
+   python3-ruff \
+   python3-coverage \
+"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 CLEANBROKEN = "1"
 
-- 
2.47.3


