Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DF0C8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 22:54:29 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.5810.1751928866614657303
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 15:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nRAG8k6X;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55622414cf4so3530658e87.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 15:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751928864; x=1752533664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VCZ1yd4TAOkBQbb1t0y2RqBWYSC9Sp9JvgXhUetzGo=;
        b=nRAG8k6XXf+9JK4/hW3psivjGl/IkcWBiICrvSDG6FZYu8g4v8bsfpnvZFC/Lc74Qi
         ri6eifELDkuzeTfv5FpFQ8uxbEv5XtL504of7CUWbY9Ogc3+4RGMDZNC8DbbspVAfWrM
         oXMKhrte2s9S6voP3B4pysCguC+pH5RLrm/0uU+MoIfxeizk2Bo1442P5x70sab8eh09
         Y4jrxPR4Jne8J6NqTw7p/f+CTt2BwphSVLJ28v6Lv9uytPpJulq3X9Wx9XC/2Qy/Bwhv
         8nhhqIkrSBWeq3wrg8W6K8D9BoXshdKKwVImgR6FLcNUSzRdyGBWtIMNssr0yFhKFXer
         A/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751928864; x=1752533664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VCZ1yd4TAOkBQbb1t0y2RqBWYSC9Sp9JvgXhUetzGo=;
        b=n6rdVFIet5tl6OJAU89Gl2QOMSzKv31T1P5pfkSnAEqpdW1TYCbjYPzQzWVOQPh4qB
         MnmUzfw1YkSdalDsx4IT8sRa9kWceinFV9rweDOAHBx4+F8Voueq1+ZWtPeVCJSHgeAg
         ZwWtXCAqmNxBztx6CTiAqPTHk86vvMJAsmbKJev14NLWS58l1cSqUE3fhzGbEge/YyLe
         w6cPcFH3dhW5xTRl4os5ORGc/DCIM1B4NGK/AqXLHKkFpFOKPI7PTGMblO7NF2HjtcGd
         BCUEkqQDTrLeswTl4fKGzvW8X/ERG2iN8Ml7383hah1iINiXnMvsf+cnkcUk9b3CW4X5
         g5GQ==
X-Gm-Message-State: AOJu0YzBiyP9qPCAIpVgK94CX+1Evd/57smUl/XQ7tTpw+Dm5IsJ5bug
	WpcJKQWxPd9hdiyHz6LbhhrDwQgDzg5Z41feMkzC+kZL5o2UTiXKCd9YN5u6gQ==
X-Gm-Gg: ASbGnctXeNQHYM+Dh4begKuHdpdLRgq62ZQQjqAF0VvtkVTQMTfQNRXZ3r+znF/wyaA
	3usF/sw5Rl69nED5oOX2Oj6+covjlHPdH7Fs3X8AkIIc3fTYW4wA0EhI0eo9L/odZquZYKGYS+f
	paPSJaXOdIAez5gPk9ZoMYWdnthMMH5rPa5KhxKkqjPDmZppnIZtDOZD16N0itNqunNzK9daurh
	6rfbyS2zFxIvSTD7M0SU5Lf3N56P+fdpDA5j63BqakU+MplFwXl9EeuQeTHt/de2nXcYFbUEdlY
	CRMLIWPUPduTJslW60eQzuuDhDQi6g4QBEgpcgjGRvx2AWB9+zDwZK7kPdx26GV1IQPOHCPspLA
	eB2Q=
X-Google-Smtp-Source: AGHT+IGgDbxCqASIcKxfrOe4kZSlUgjmcam5h9GTC9U/vHao4a96ekYWC2EkTdUKb6N+tU6h1vPVfg==
X-Received: by 2002:a05:6512:31c6:b0:553:2874:8ef5 with SMTP id 2adb3069b0e04-557f830d93dmr211057e87.16.1751928864206;
        Mon, 07 Jul 2025 15:54:24 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b836dsm1476347e87.197.2025.07.07.15.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:54:23 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 6/9] json-spirit: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 01:54:04 +0300
Message-ID: <20250707225407.1558421-6-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707225407.1558421-1-alperyasinak1@gmail.com>
References: <20250707225407.1558421-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 22:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118294

Fix:

| CMake Error at CMakeLists.txt:1 (CMAKE_MINIMUM_REQUIRED):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../0002-allow-build-with-cmake-4.patch       | 40 +++++++++++++++++++
 .../json-spirit/json-spirit_4.08.bb           |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/json-spirit/json-spirit/0002-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit/0002-allow-build-with-cmake-4.patch b/meta-oe/recipes-devtools/json-spirit/json-spirit/0002-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..4aecdc817f
--- /dev/null
+++ b/meta-oe/recipes-devtools/json-spirit/json-spirit/0002-allow-build-with-cmake-4.patch
@@ -0,0 +1,40 @@
+From 046312620cbc282fcc1ad5db0acece3a3615fb7c Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Mon, 7 Jul 2025 21:51:01 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:1 (CMAKE_MINIMUM_REQUIRED):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Pending
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b292f0f..0c797fa 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
++CMAKE_MINIMUM_REQUIRED(VERSION 3.5)
+ 
+ PROJECT(json_spirit)
+ SUBDIRS(json_spirit json_demo json_headers_only_demo json_map_demo)
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
index 56ddaf59a5..001d52d597 100644
--- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
+++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
@@ -14,6 +14,7 @@ DEPENDS = "boost"
 SRC_URI = "file://json_spirit_v${PV}.zip \
            file://0001-Adjust-the-cmake-files.patch \
            file://0001-Link-to-libatomic.patch \
+           file://0002-allow-build-with-cmake-4.patch \
 "
 
 S = "${UNPACKDIR}/json_spirit_v${PV}"
-- 
2.43.0


