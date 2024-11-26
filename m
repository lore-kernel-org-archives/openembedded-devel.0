Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A7FD3B9A1
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 15:12:33 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.48329.1732633945289627841
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 07:12:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=H4a8zgoO;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3823eb7ba72so3868023f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 07:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732633943; x=1733238743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E2JNnbXMbS5QRGn0H8EnVHdRLgRPYraJJNgoHO6nsNA=;
        b=H4a8zgoO1MWk/pOvGmQ0ChurqjyqYhuiAjy8i4xorz8E+WhFZKTbVQ028xAM4BgNDG
         EhDwqWW/GiVM1jCT2OEupLGqonOiHmQyOFr7yG09vE2UX/VZbb319mgn0ZZQqDAba0eu
         AiTZI+ft4as0+RcVbvDiim/93IH9FleaCB9FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732633943; x=1733238743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2JNnbXMbS5QRGn0H8EnVHdRLgRPYraJJNgoHO6nsNA=;
        b=Ab6ZMQCWF3JDH95acyzYtgyRZn4phzzrNSo9kbfEhs17fBziNFsVAHgbHAoFCF/QT/
         +f3vzc+12vWSsFbnHeOOAqUWl3Ecodj6GtgMxU4XHenXxfgmfDc3rRfvXPu9CFWOktpK
         Vd2w9bZeR/Bz4WZdVuGMxcALEQ2Ky7LPVsMXUbGZ93xeDSbRfbRK0rKcjvkMc0bR0y86
         +x1dqYcCdLKr8m2LPQh47M40mJJ3v1Zp10SOrMjuhehJFHp+WeBmi81/1bPIhRAudh5f
         YecC3mMKCCdSuXkC93+rMzRa70HmYJAJNwaUHWXsiAzlBGUGOuRRFBSR1kyr/oQAFy7r
         0gmQ==
X-Gm-Message-State: AOJu0YyFDxUfztbja0EKY4W8BwCBms6cpSCDhYJa6qNeiBIg5vKp6qV2
	bzimzfEbOZp2DjENUtyf+C0a/LxyslXxhJg9cW9AGGx6hm5GiZroLU29PFdRziUFCH1G4FEU09S
	X
X-Gm-Gg: ASbGnctMCstBMzsDqVdoByetHSBWfpEnLwf3qc897Loqb3/2v45vPKhYXjiJ9QDgeq2
	+HCIVIPbnZizo0YCAz0Oj1Uf+Z2zOF/5BJOYZbRmlQdm+GincqtEcm2PfzQvE4zq4PibgE6VX9+
	qE938x13OtlvAqbmpp/3K5bVHJ/rKJQYluEse1Zb4rHvg1Z7jc6uSE+2fA1IvjB/SG0bG/2MKwI
	ppDRO/d3BABZK5LetzBabYvUzYmYu70GY1A8Sifray1+WlT/fI03y1DervzfOZq
X-Google-Smtp-Source: AGHT+IENjz94nA7f0EaEL2tNRJv5WuxW7uMFxz6QulNOCoSfq1tplj8enYHPt5ZRWJkHwmlXiECz8Q==
X-Received: by 2002:a05:6000:1449:b0:385:bf96:d7ae with SMTP id ffacd0b85a97d-385bf96d7f3mr3689204f8f.14.1732633913540;
        Tue, 26 Nov 2024 07:11:53 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedad6sm13499791f8f.91.2024.11.26.07.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 07:11:53 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-scikit-build-core: Add recipe
Date: Tue, 26 Nov 2024 17:11:48 +0200
Message-Id: <20241126151150.95784-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 15:12:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114073

Add new recipe with version 0.10.7:

- Avoid modifying the input dict
- Avoid providing prepare-metadata methods if `failed` in overrides
- Support negative envvar values correctly

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-scikit-build-core_0.10.7.bb      | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-scikit-build-core_0.10.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.10.7.bb b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.10.7.bb
new file mode 100644
index 0000000000..8259f90aab
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.10.7.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Build backend for CMake based projects"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b4e748e5f102e31c9390dcd6fa66f09"
+
+PYPI_PACKAGE = "scikit_build_core"
+
+DEPENDS = "python3-hatch-vcs-native"
+
+inherit pypi python_hatchling
+
+SRC_URI[sha256sum] = "04cbb59fe795202a7eeede1849112ee9dcbf3469feebd9b8b36aa541336ac4f8"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


