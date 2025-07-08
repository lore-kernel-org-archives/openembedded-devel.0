Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EC3C83F16
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:38 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.5746.1752004651718458628
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kz2++U2A;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32cd499007aso36336711fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004649; x=1752609449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAvCRwep7kzbIY12k8wK84q34NsrrpjlU7COJ7gid3s=;
        b=kz2++U2AyfSq0ebkDqp67RrJkeeL2ZHubB6tSMOOCp2NNi903H4eQAZi56QlaDpuBV
         8N2cC/Pc4rSelfSrjTELx017Zs20u6ayYYcnDvDYS/rDrky88tGeB7DeJ/3oxrEv7APB
         obUbagLgY9iOvWnOvVYfNy22snDX6H/nty07k8BTRZF2COSW/Bd/LmkC0Ttk9rCjKLR4
         gLB8Q87u2BxxkiXtzy/auvd/q6+2cjuzhxbO35Zb6TqkIZrW7HEe7hARPklrJq+Airwc
         C4iB7PuJMV+YaXc9KKMu9xOxSYRCxCH0ezs2IekkWSplu4Qxz/mWaK9sueIO5GRJ4K/x
         z/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004649; x=1752609449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAvCRwep7kzbIY12k8wK84q34NsrrpjlU7COJ7gid3s=;
        b=D6Tz41nEjVExhevjW1qygNIZCkSYKQ8x3CEzSfqyyND3QdJEF92EZcgsJNALAWWcUm
         KFBb6EPZUaLwDgJIt/703kOjNsk6MFCKJ2vqYaG32FzgDdEUpOXfKkdTiTXYxJvPK6uS
         V0LnUxhzNn0VD3ONJyxQNsyywo4bhRejv5Maa6xo8esDvIoYJ/OnRakftK9D6WXa+fs4
         yfPJIoWUei0MZs8jAAPNwAkHla6nSPPn1xsA/nKnUNfGBUe6nf4fJyJhq7/42dFBUiPh
         0gfS8qcgBFBYuGYFeVs2eNQYMbYx877BI4MihBrjo3YqhZdc6h5SAt3DjZIosoSapE8/
         nsfg==
X-Gm-Message-State: AOJu0YzGn6Ie6NqEvAKmRJ0flDVFKANunW2/Uz7nA2QsassaK2CLz3fi
	AeIBcrT1jo3txDIJYMCviXStyRE22ITu0jwCaCdh7l8bTZiR3D0iNSChIOLD4g==
X-Gm-Gg: ASbGncvJNPRbOvoI/0Z9kLap/4b6bvQCpCLgCkmjdUNodB4f7MpLSkbOg2i3rPmhfe7
	Zg/c1m/Gsn5RECAUnipUHqxrN58PlXIeV7HGe6OEdHMhyR8hteKpYlSO32TZWTfpvuZStSWGeAW
	b7jFBlLNhmu7tRH+SS8U7lWv9qok5JguRkhxGXki4ZOTyVpZhMxao5dVKx7X1atwMErJGZhELQ6
	3CY08rK0kXXZXprvqaX7yrHAKt3eq23WNQaz/YHqIKhmXv7m+pC6Kgyru0wg/QXi66FT7/xDTYb
	oYL1E7ja9toFwx/uoCaIBpQozvewoJRTRk8NgelqRlgGWQy/JN1PA2ONaUoKbziF/s5NsFhuFBu
	vagQ=
X-Google-Smtp-Source: AGHT+IH4XhwXaxQzthckFfF40XD58+Sgx7/3xQ3Xyq12bYflMNgyNnRJglpb7HLVsKyPIfS6XhvB5A==
X-Received: by 2002:a05:651c:1108:10b0:32b:9220:8023 with SMTP id 38308e7fff4ca-32f42d32ef2mr1757571fa.12.1752004649043;
        Tue, 08 Jul 2025 12:57:29 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:28 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 02/20] jansson: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:18 +0300
Message-ID: <20250708195636.1678606-2-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118324

Fix:

| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
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
 .../0002-allow-build-with-cmake-4.patch       | 38 +++++++++++++++++++
 .../jansson/jansson_2.14.1.bb                 |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-extended/jansson/jansson/0002-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-extended/jansson/jansson/0002-allow-build-with-cmake-4.patch b/meta-oe/recipes-extended/jansson/jansson/0002-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..5264f26f81
--- /dev/null
+++ b/meta-oe/recipes-extended/jansson/jansson/0002-allow-build-with-cmake-4.patch
@@ -0,0 +1,38 @@
+From 5d7b2ced666b4fbccd0da6e06d504ae2960575c8 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 14:54:08 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
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
+Upstream-Status: Backport [https://github.com/akheron/jansson/commit/96d160df90016066d04d493d1d69639474ba4f20]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 72f9762..d07412e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required (VERSION 3.1)
++cmake_minimum_required (VERSION 3.5)
+ project(jansson C)
+ 
+ # Options
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/jansson/jansson_2.14.1.bb b/meta-oe/recipes-extended/jansson/jansson_2.14.1.bb
index 715b1af5c5..e0916759c6 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.14.1.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.14.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d9911525d4128bee234ee2d3ccaa2537"
 SRC_URI = "https://github.com/akheron/${BPN}/releases/download/v${PV}/${BP}.tar.bz2 \
            file://0001-Honour-multilib-paths.patch \
            file://0001-Only-export-symbols-starting-with-json_-and-jansson_.patch \
+           file://0002-allow-build-with-cmake-4.patch \
            "
 SRC_URI[sha256sum] = "6bd82d3043dadbcd58daaf903d974891128d22aab7dada5d399cb39094af49ce"
 
-- 
2.43.0


