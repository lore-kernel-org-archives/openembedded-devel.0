Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E16DD58B37
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 12:21:43 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48916.1773663692939377271
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 05:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DRyGTLF5;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso3201584f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 05:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773663691; x=1774268491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BIA2DJH87YvAmFcDRA/5KDUvfXbGQlf/ldYAS2rhaxg=;
        b=DRyGTLF5xvtV10wZcj0lbDRWB1fZ4cSA/AValwg3bg3F2yIrr9Nh2Oam0TKwrSeEX4
         cQdp7ExiHCDZQxNbZWJOwZEac8HyeWZ/0tGFwgLNz13RTIM6CJg0pUTnOOzjGyzaicVZ
         wz5x7NVz7nS0NouJ76IEikwtGBbZIl6gNYRxFWCXJWnGlL+07A9VbNHTZTB7GfR72EjU
         LQm0b3/p7qZ1qe1Yp/FSXFa5IkwRTvCjon05VL+B64aFCTyGcS2vorvUtkpAqBLXJtWQ
         4uvSJ76+0RKBkcMGC+/ZA/cADzcLysASbdiVa8GntIYNlTZYHUnlTviu2r0ddDcTqt60
         Ea3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773663691; x=1774268491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIA2DJH87YvAmFcDRA/5KDUvfXbGQlf/ldYAS2rhaxg=;
        b=glbUKhrOlmIBMEMnaG76pd6FhNJBIUJDp6ekzGOPuII3Fl+wF+l/JYwoX8qHOAo22P
         4oZEO90VvBgcsYTDaw9FRUCsJp1Nf3dXNMSXPp30FdnjUJrBnk3Lttjk9RcSQfdcqpeF
         jxvdr/j8gCk97EP9Gt7PY0BE+5jFWp5nxg9ovDg1OxWEaSHrKCtN9NSg5qKQ02fjQwuM
         BHpcdzjhH6881cCMkay4BGF2VzH2cSdsoZnNbl6nTh1IZqrG0BM1AGFH8nU0t3vfArn4
         bgucywFCQE4VacsQs+PPdZkh05OdITld1LiIemOmaZK51q/ztmDtpPiyJ9C5gNE59Ww7
         eluA==
X-Gm-Message-State: AOJu0YyOwPlw/Qj2w9SpvuezTGbRsxogTk7NdccKXhQWGU1SldhAMtny
	qk5t1J0sEyu81AVYrKC/5gIZDy1/B1AwTKs+ES3mUrCZwuAaKfIA/YZF6jlPvQ==
X-Gm-Gg: ATEYQzwVOAETejkV1rcOp7uNWnTmWgE0CsmuMyujH5XbRrTUOh13oXVWg+UPghakCRz
	A5QIUuZtcgnYB604Cv3aJYLZmWVfq/MfttBDUlBpXuUJED+jeHg7FEU1TKyZmJGnhx9sl+/5yBs
	0bph/2LH+Vg6OwNQ0b42H89W4C37IfcTrhssHYjaiDk7YkcmBNW427nxy/Mk/ENx4cJsOgA5Znw
	ecaD0aBAQG/FKVJ5eCUI0kJ6z1Nh7UoPUPIm2izP5ywYb2iq/fPIqY/i0WbrSyD1dy8bOX0E+dK
	S0e1Kx+toUnJiHkGrkGFG14EgnZXo+zktyrqmCJFlnv8Jubg2RFx//X0YlxVAGmFRd/iFE8t+Ke
	qIXPk/nwOWYkjvkVwCIV3IfZHnEyVSmofm82QbJDndsX6HFp2sC68JomcZdfFL3caPNPiu0l2Al
	fvh9BPoSPAXNSu7c+ieinlJxwa+PPb2cw=
X-Received: by 2002:adf:f8c4:0:b0:43b:4468:b114 with SMTP id ffacd0b85a97d-43b4468b49bmr3789486f8f.23.1773663690958;
        Mon, 16 Mar 2026 05:21:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b45e5c233sm6586607f8f.33.2026.03.16.05.21.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:21:30 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] capnproto: upgrade 1.0.2 -> 1.4.0
Date: Mon, 16 Mar 2026 13:21:29 +0100
Message-ID: <20260316122129.1146050-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 12:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125273

Contains fix for CVE-2026-32239 and CVE-2026-32240

Also, mark these CVEs explicitly patched, because NVD tracks them
without version info at this time.

Shortlog:
https://github.com/capnproto/capnproto/compare/v1.0.2...v1.4.0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../capnproto/{capnproto_1.0.2.bb => capnproto_1.4.0.bb}   | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/capnproto/{capnproto_1.0.2.bb => capnproto_1.4.0.bb} (79%)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb
similarity index 79%
rename from meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
rename to meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb
index 0ea243fd20..948ff80345 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb
@@ -5,9 +5,9 @@ SECTION = "console/tools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
-SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https \
+SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https;tag=v${PV} \
            file://0001-Export-binaries-only-for-native-build.patch"
-SRCREV = "1a0e12c0a3ba1f0dbbad45ddfef555166e0a14fc"
+SRCREV = "8b892a8a11a632f5d52b877a49728808a142379a"
 
 S = "${UNPACKDIR}/${BP}/c++"
 
@@ -29,3 +29,6 @@ PACKAGE_BEFORE_PN = "${PN}-compiler"
 RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2026-32239] = "fixed-version: fixed in 1.4.0"
+CVE_STATUS[CVE-2026-32240] = "fixed-version: fixed in 1.4.0"

