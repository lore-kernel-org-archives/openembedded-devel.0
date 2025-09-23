Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5098CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 16:50:21 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.2595.1758646220221476754
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 09:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DR8y5+p3;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b2ee3c13aa4so268367766b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758646218; x=1759251018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WUOJcE/ow6iQ/3mCy/OX30/TCIoXCGaR6i8UF0ivMTo=;
        b=DR8y5+p3TGRosbXNp9sXZR0D9AMDmVoCIenSSVo0Vi0C/BOMEok12bpxnFRmJQeo5/
         SHj2tuxUpcJcDzpTBHye1RR7uKAi6mu0VYHfVWzz6wfRTeyQJLrhRgG/rTizHY0D49ey
         r55LpHaWYMAkwZdndEybrIKFFWSQmpNuw+D9K7HswwZOithK1iNZn+RMMVUAIy27t50Z
         w1naTKVdtnyeW1HIHcVuLCL/Sx3mVCw2R5eD+bn4d1etDWD4A4Z7pd7YN4NlxWsVHFYt
         8/jUhn7YSN2PI08bL15rmrXJJDz5SsnAHe6TEiqfzTK3wEY82aASkLq4Aen93w1UxmQ/
         hY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758646218; x=1759251018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUOJcE/ow6iQ/3mCy/OX30/TCIoXCGaR6i8UF0ivMTo=;
        b=Yo8VQi/dVYnD8FlDdaQ3o80oKXN9cnLEm8Z8rg9eAoGyR7rWF9baWPoX+XnKRDIkOU
         0xPR8Rc/FqRFAattZFxW3D7UJiC78tB/oNV/R2OWiar6yq3PFpBLVgYH33qneNMjvrDM
         KT0KJd53JQrAByIkk/e2LmpsovhT/VaTO1M6hN54aK1kAbHILH5nSQtCX5ooSyu7A6dE
         12LfMGjGMOKOEyEW+TIg+QmTdfP4jRgtPGQvFA34jilpoCjfjzTbQjCsdejgtItYx8iY
         hXAQcr5B9lcj7rgpnoUC8JkOLG4CEUa0waePVkdoNc9luKooyIODhA8C4/uEb3kAIHFB
         Fw8g==
X-Gm-Message-State: AOJu0YxER61TSo92JAHRE5/mgtTRymxxRIiG4/EoRVJbFj6Gz2WALCQI
	3eo4CIsMBZoHScftC08l6HD3pqpLEJPwapVqfeHDbYA2ukjai9DtsKib3nn7swNo
X-Gm-Gg: ASbGncs9GFCb/sdd9zK7vGmwlP7gXzFHlLlos5n5/n5TrnZps+U/BtQhQCcnXtnyQIq
	4W4bJlLjEAtMfvctN2hCPbGJokd1dD4NQ3ENcCDEOXW8QV0YI4wwftNwkmy+RRMtCDnnrzFWK2f
	qeeYvKOEUqLopX8ls59N/31LtidBUqj4TjyVrBMgcN+l1+nF4hxkyvgZOcIc7oydIaROXv3jgyv
	dTqepI78Q2f6B1v6JMtzNcVD7AvEUS8Ez6B54ufVPgyQyKoj8zaPtv3s11m08QlVHyXrErEeBhB
	ez/sKeRSjmLSvmnTgjr5fLn1PUu0mCWyU7Wd5FDDSS7WYHxQjpApz0IZ5K58BpGvUcfKaTQX/l2
	/tYNccB7b6Z0Vaxac8XtGJeb2tdi/7Zg=
X-Google-Smtp-Source: AGHT+IH7wTcR4zF53VckDu6TPwnaJIQVbI4o6HtZpZTN+oYxJ78vPNASiDVRalgnYCyQ5WRIFTXtfA==
X-Received: by 2002:a17:907:75dc:b0:b04:3c93:21f9 with SMTP id a640c23a62f3a-b302802dec3mr262135066b.24.1758646218199;
        Tue, 23 Sep 2025 09:50:18 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a0967fa54sm721797566b.8.2025.09.23.09.50.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 09:50:17 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] trompeloeil: upgrade 47 -> 49
Date: Tue, 23 Sep 2025 18:50:16 +0200
Message-ID: <20250923165016.2185809-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 16:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119718

Changelog:

v49: https://github.com/rollbear/trompeloeil/releases/tag/v49

Highlights:
- Added mocking macros that infers function arity from a trailing return
  type syntax signature.
- Added .RT_TIMES() to exceptations, which works like .TIMES()
  but where the limits are only known at runtime.
- Added several new composable matchers.
- When an expectation is constrained by several .WITH() clauses, a
  violation report will only include the first failed condition,
  short cirquiting the logic.

v48: https://github.com/rollbear/trompeloeil/releases/tag/v48

Highlights:
- Fixed memory leak when adding an action (.RETURN, .SIDE_EFFECT, etc)
  throws.
- Dropped older compilers from CI builds (gcc <= 6 and clang <= 7) since
  GitHub actions now require node-20, and no build environment is
  currently available that both supports node-20 and older compilers.
- Support for STDMETHOD functions for COM.
- Fixed issue with std::expected causing compilation error.
- Silenced gcc -Weffc++ warnings.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../trompeloeil/{trompeloeil_v47.bb => trompeloeil_v49.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-test/trompeloeil/{trompeloeil_v47.bb => trompeloeil_v49.bb} (83%)

diff --git a/meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb b/meta-oe/recipes-test/trompeloeil/trompeloeil_v49.bb
similarity index 83%
rename from meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb
rename to meta-oe/recipes-test/trompeloeil/trompeloeil_v49.bb
index 3f2f07c28f..adb3237621 100644
--- a/meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb
+++ b/meta-oe/recipes-test/trompeloeil/trompeloeil_v49.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://trompeloeil.github.io"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/rollbear/trompeloeil.git;branch=main;protocol=https"
-SRCREV = "ad9bc41b1e01ae92802de59a12d19cf7c8683d6d"
+SRC_URI = "git://github.com/rollbear/trompeloeil.git;branch=main;protocol=https;tag=${PV}"
+SRCREV = "eaeb89c1ce9d354b0ba7eb921fd5712cdbd78adf"
 
 
 inherit cmake

