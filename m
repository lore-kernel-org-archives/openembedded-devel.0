Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EA2CAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 18:22:53 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.4777.1757614958957155872
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 11:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bOejM+GI;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b04ba58a84fso155589066b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 11:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757614957; x=1758219757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J65tdmYV44YNmPFAScmMH4MH1gOBXPuc2CZnPITvC40=;
        b=bOejM+GInzioUQQP7zvOoKEe0VNz7l78VUgvnvlJpfjgl5GJmSC4IaDPG3VX+yrm00
         p3AhQr1A3rtwenU7BcIhRvEA292OpECUrVGrpNz0Ddm1/+7ZtEvepstHELwbBKEonfTF
         uoloxAo40l7/hk0yc1Sy2bpLDmQT5lX9ZJO8OGufsRiyUidQRm4qQevi8o5B7SY3et/c
         jQurRN90Dh7YSQqCehUFOJfYvWcURJJIwLZ9ACRNRJA1iPJeIhjGgvcKB34TmLCCcjZU
         4uTEWL2f3Ysc/OYRZFbnmTiQAPqRac7cWO22Z2ekoY+rHtiPGpuzkXb7BghCY/u69zaS
         5saA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757614957; x=1758219757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J65tdmYV44YNmPFAScmMH4MH1gOBXPuc2CZnPITvC40=;
        b=u6mMymtE35x0eqyQcNGddfADR8YgdWEu7mSS41NeNvMeKwIhd2feQYJi5mz79KH3At
         n3IWlYP+pfrNPhVHhIb3y46tl9hafgGt15Mx44qyBVVUTT41dF4P2zQPJOlh0yfHPsZq
         moo0xOCNa6AqUzKK/cFQfMFCh8KDG6JYYDOI/kOnuXkg0VCxutf51tB8YzMQf57lLoO4
         HIImx08H5g48sjX/+s/ORfxUC82634VoT0g7kNZzHdNW2iLvrcKD4W7rfHIZzrTKWvS5
         TdT12Mk+4qzl3Nph7wg7aYEhdYgMLcSJYo+2wfmS6dB2/222Gm5tMvkdUs2nVnsmEpsv
         dYuA==
X-Gm-Message-State: AOJu0Yz7sR3gOdiQT6VRkZrA5Y+VPfFG3ztme3WpWAoDor5S/npuKrV1
	I7+vqOQBX/kOWLdacP2B5w8L3EKCJXzyOdR1LnAum+KmD986BZLGdwVU0Pa3zA==
X-Gm-Gg: ASbGncuhl1E071jM1Ogh41tSB1ZL1w49dbd2ut7eHw5BjerFhNCFDdqLoBHCm29S7l4
	fPvgydG/gjAHU4xfNIVGLHTfTo6iKUS46OeJA9vNNPiU9DndyK1K4fi46lxSnLwW47Fp0jOod/M
	ajQQxahYSF3dy5MR8QCdfx0B3X2CAL1SSOJ4VoqmTtm6+TBNGRsjtQ+z5WpeuWMgy+zwFTs+Byl
	Ybw+oOdOJ34LLUpLPlMRLhPARl3c4Rc9OE3vHtjFXsOoOuMuVw9uyNGf0pj2F5JtcFfcFOpg4l5
	RU5rXnAtOk/ocW96kw0fo5aVZ6AOg42d8E3f7pxYOAiFgp6+qnPO+1qFzKZ/ilFS2OXV/p0CWhn
	zM6g++DVTEaOnEeIFqnkfeOGF/narcr0=
X-Google-Smtp-Source: AGHT+IEOUYqPb52bcPVMJT0wC2YVHv7EQ4s+QuJQwy3o7xhyif2WTP1EfV32TnRP5OPGOOt9fQUbxw==
X-Received: by 2002:a17:907:7e83:b0:b04:8d69:6717 with SMTP id a640c23a62f3a-b07c3833bf7mr8741266b.43.1757614954843;
        Thu, 11 Sep 2025 11:22:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dcf77sm180118866b.64.2025.09.11.11.22.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:22:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] python3-apt: upgrade 2.5.3 -> 3.0.0
Date: Thu, 11 Sep 2025 20:22:33 +0200
Message-ID: <20250911182233.3297051-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 18:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119371

This version was not tagged for some reason - but the commit message
makes it clear that this is 3.0.0.

Changelog:
https://salsa.debian.org/apt-team/python-apt/-/blob/main/debian/changelog

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: only formatting change: move the export under the SRCREV, instead of
    having it between SRC_URI and SRCREV

 .../python/{python3-apt_2.5.3.bb => python3-apt_3.0.0.bb}    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-apt_2.5.3.bb => python3-apt_3.0.0.bb} (73%)

diff --git a/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb b/meta-oe/recipes-devtools/python/python3-apt_3.0.0.bb
similarity index 73%
rename from meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
rename to meta-oe/recipes-devtools/python/python3-apt_3.0.0.bb
index d5c440f413..561a1c619a 100644
--- a/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
+++ b/meta-oe/recipes-devtools/python/python3-apt_3.0.0.bb
@@ -4,8 +4,11 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://debian/copyright;md5=4ed7b6862ca422678b17e7d4ed592285"
 
 SRC_URI = "git://salsa.debian.org/apt-team/python-apt.git;protocol=https;branch=main"
+SRCREV = "626bf176c1844b63973d39bcceb0202ad36da797"
 
-SRCREV = "3252935b6224b3bd2e2250894b9559b47c61b2e1"
+# this is env var is used by setup.py - if not present, it
+# tries to run dpkg to get this info
+export DEBVER = "${PV}"
 
 
 inherit setuptools3

