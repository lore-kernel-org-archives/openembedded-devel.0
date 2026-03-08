Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F75EA852E
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 15:37:04 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41194.1772984214640564811
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Mar 2026 08:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yz0+dCcT;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so8233305e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 08:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772984213; x=1773589013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fX+nCzFW1zhJWnMPIKaOrRSd7cDWI2Yxl3AtAhmiWnA=;
        b=Yz0+dCcT3TerjIVWxX+SyWbNNUG0q+ZD+Tx3Wx88S/xjexGixa02revZMYDgyNTONh
         6Q0DlXZrAEC6dHI8C1x3ouoz6gWq5yhaAhMWHEtSiXeWmSChlSdPId13v86WVsLoc93i
         Swc5VNQyDk548zxlbInwL8uwvjltL8i3hsF4LdBX1ujZy52zk5SRgnHzUZOKVX9pqoL1
         0CRCnDA/J7A8BZGB96Ee/DpUWDPMP7zy0L49s1+rkIPP2TmuRJ1u7atCe5w2Oef4zZoT
         PuTyNdrsm5zJP+A4Cjnvls3Mhu10JnioIZAr8TKhQubMHhB9mmhUBD1V5pUA8PGROJeP
         8wDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772984213; x=1773589013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fX+nCzFW1zhJWnMPIKaOrRSd7cDWI2Yxl3AtAhmiWnA=;
        b=HXsOFAYOc9p4HIDJOaQMb1kLuArwLJDUM79AQc1fIW9kZPxHaf+bB8AOHdjGPD9Hgz
         UMDZvAR+hfgdBUu5yEfZmkE8bd4m05AJxke6VumUnjN2J1Sq/fxBuO59EJCPNC28lo6F
         ptXBe1OJUkwTMOYMyrE5lMWBLv6lDEmi0/5tlQK49BF3RQrgGytYKHuTtDW6jLf4bn93
         f0gn3Vdu+M/rbpZbuEj1enlSpkUiNbKGF0WsFj08QCKBFef6eIs14Y2nAJCrQ7n/D7qf
         P3f9BdEHgFYlK+zWJQDCan1Wanx7+dI7Kvur7ybn/RLr9R+X/MdDJikGkz3nggd/WHp6
         FVgw==
X-Gm-Message-State: AOJu0Yz7WK3FpNlaBRcnro270fQb3zlcEilmhCR86ubizYvcIIjSd4NF
	oN/Hs5ig5Q11Ivm23vJ2j1Ta60UsQvY8SxQ//qwjw1Fe9J924kzq5jNppbN0ig==
X-Gm-Gg: ATEYQzzWJdNwOkq1h7LWic81BkW/0rP66JVNstmWADiGBZChg2TxPTkvPcf7bT97oDL
	xMoFd0XU6h5i3oU2zTkmiV5oot8KMzhbsNknUVudr4RpwP7z5s8exJ26HVmiW5aLjmvDNZk30E7
	mjluoLhFNtPyJvMxhY4uD00lm0URlocfj0FBysn5uJ9H9lDonE7NQ5W6UEVxBZYYbtZtXDjeG/K
	dqWKxEa3qlezAGk9N3sCAuBB/mZMcAnjbupsaNU+d6N13mRvwLbPP+JvXacixkrGoa0/1cOwByx
	n4jiTYyQwdSuLae/SbgS8M4seZo4LrKx8qvxiUT9prHon56hH44UTRB1t/1Ry8rkjcVvz5sZM2E
	trx1SuOyZuEssWUfc6Hg6ITl5z3gI/byXaLVAs/xx/EeSmDoL7TQvNWhxJFw3uipYRbDCcNZP5x
	DJQHT1Ic1V2zfBqhBOzBghogDrio5OiAU=
X-Received: by 2002:a05:600c:3b0c:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-48526979668mr144269475e9.24.1772984212600;
        Sun, 08 Mar 2026 08:36:52 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485245dc298sm67699835e9.15.2026.03.08.08.36.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 08:36:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH] python3-protobuf: mark CVE-2026-0994 patched
Date: Sun,  8 Mar 2026 16:36:50 +0100
Message-ID: <20260308153650.3416996-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 15:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124942

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-0994

It is fixed already in the currently used version, however NVD tracks
it without any version info, so it still shows up in CVE reports.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
index af30165f81..af9ff85f20 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
@@ -13,6 +13,7 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
+CVE_STATUS[CVE-2026-0994] = "fixed-version: it is fixed in 6.33.5"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto

