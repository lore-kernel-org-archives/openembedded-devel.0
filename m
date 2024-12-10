Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D2BE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 11:30:18 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.8047.1733830208622346537
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Dec 2024 03:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sXxXRtL4;
 spf=pass (domain: konsulko.com, ip: 209.85.218.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa68d0b9e7bso361871666b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Dec 2024 03:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1733830207; x=1734435007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sreH526niMk1KsKRmyH2ZAaRlh2ZqG5ShyktOaqG7DI=;
        b=sXxXRtL4LiF9qahV1s+2Vq1f6s9+bcHSh7wGGGRAMV7iFrW99BJAJYmAGnwglpTRPN
         gVVivBpxRvulZISvfUzmWq/Nq0kRz5R7dO5DgJ8yx1KeeHst6sA9xC5vnLKwRq0VvF4M
         Qjx8wRKbnrUuAFw/lABtlSDj2rVWI1gbG6E6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733830207; x=1734435007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sreH526niMk1KsKRmyH2ZAaRlh2ZqG5ShyktOaqG7DI=;
        b=kalzjJ36w6lOfNe4r61f80CyRlFqS9tosI2exwChBRFTz4snBX8AVWP6F2LgUM0IbG
         p8WNVdiLCiZf6pbw3RSliWS6cIh+7Tr6fUtzYXTBQtHuAxd37dSrw+Z1eWdDKw9cozfn
         TpU1ms7uDsnBl3zIFPM5kpunni9wNKwi8F5wQuGNdR5gTFCJzAFwDnc2uQrkb2UtX22n
         eS2FEUACVQPGZupIOxjOLw7XfmTBv2uDxj813AkXtl7mQDSW7LHRKA7q0M1jDWYTkWLH
         jPVz8KqSzMPlulCwKqQJ4hvIdAf7iGl1aBB/PlGdZIDVekZd42m4wGEVt+zhwRSzppSd
         mHOQ==
X-Gm-Message-State: AOJu0Yx3UztIXyXH4foL3EJ2pJc8lf6KW5VBNHdBePUTECMEZNnNZZfL
	QZAJGOgLNnnIH3IzVwbWlaxS4jCJXAMkM3jqiwAtb3F4lkYArse3uY61aW4xROctVgslifVNeAE
	3
X-Gm-Gg: ASbGnctm7Lz3pQKWNzjq901CEmimzOk0nnGrUQgLyACaXSPu43qFKloFVVmektGN8nD
	AnrdOkMi4Y66PcES7VPkNRnb/5NFCS1EwRB61uZwu1ZxWL+G2RJfpBe/NCAEzD1hMCOJMBtK0AE
	EwqL6jIk2jg5lN4+wQB8t/ldmLM0z8ZJ6QCML9aSrr3ah0Bv0VuvnuUSQrG3a2dHq/HlKfz+uaN
	uez8HGfARauCoFCadCnx/YEIBPllfH/3n5lggr9+7AtRW2Dk4QjsD2FWS/YUAnVtGZh
X-Google-Smtp-Source: AGHT+IGMpnTUHOYNOojAOgHzhDJJXhfmi6Yj+y3ueV2FRcPKjQsDS6K8nyll2y+mnTsoaW5PbkCirQ==
X-Received: by 2002:a17:907:b98:b0:aa6:8f71:1645 with SMTP id a640c23a62f3a-aa69ce336damr395919666b.55.1733830206606;
        Tue, 10 Dec 2024 03:30:06 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6975b1ed1sm207965066b.135.2024.12.10.03.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 03:30:06 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] sip: Upgrade 6.8.6 -> 6.9.0
Date: Tue, 10 Dec 2024 13:30:04 +0200
Message-Id: <20241210113004.3848691-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Dec 2024 11:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114260

Upgrade to version 6.9.0:

- Generated bindings now require Python v3.9 or later.
- Type hints now conform to PEP 585.
- The latest sip module ABI versions are v12.16 and v13.9.
- Added support for the deprecated() decorator in .pyi files.
- PyQt-specific support for registering QFlags types.
- The handling of the SIP versions timeline was fixed.
- Annotations are now only validated if they are known to be needed.
- The buffer protocol support for byte objects was fixed.
- All outstanding compiler warnings were eliminated when building
  the sip module.
- Redundant % in trace output of this pointer in were removed.

The work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.8.6.bb => sip_6.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.8.6.bb => sip_6.9.0.bb} (87%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.8.6.bb b/meta-oe/recipes-devtools/sip/sip_6.9.0.bb
similarity index 87%
rename from meta-oe/recipes-devtools/sip/sip_6.8.6.bb
rename to meta-oe/recipes-devtools/sip/sip_6.9.0.bb
index 157e40451..4a3c2f7be 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.8.6.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.9.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1d69a33480ebf4ff8a7a760826d84e"
 inherit pypi python_setuptools_build_meta python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "7fc959e48e6ec5d5af8bd026f69f5e24d08b3cb8abb342176f5ab8030cc07d7a"
+SRC_URI[sha256sum] = "093fd0e15d99ae2f8a83dd7f7dbaa3ff250c582a77eb8e0845cd9acadb1f0934"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.39.5


