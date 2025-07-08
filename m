Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9174C83F10
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:48 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.5594.1752004659277978668
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z4rKjGn9;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32ca160b4bcso54554371fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004657; x=1752609457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMPKJgL1djg+o+3/P7bOUAumHWKef1WsebK0BJuq7M8=;
        b=Z4rKjGn9Zn/wcMSGE2tW3YxXPqqccKfNVhUW5HinrJHff9XlRdGpXbgh2P2x9uAD6N
         hHkqPyos9BUElbpga3THKqQCZvR2WwaKFSWNNd3XkvftC5URqhC1eg91Zte/PyEd/XUy
         3kqviWcpppzAnYMTNSoqMUCibpVafagLHe/jki76yVSqYF7Q03LjBa3uKaWTFXcFRSXV
         s+kktCLfeLYWfp4JXLeBPFNEaH0fgBMLE1muWO2G0Frs/T7R3vSa5GNz7LzBybC3AJsS
         KDpfvshbgwBfmFZjfy7/VTraTWVPfu5GTWC6GIPWsG1hsFW1jHi9uLBXZymH3tLWylUz
         aqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004657; x=1752609457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMPKJgL1djg+o+3/P7bOUAumHWKef1WsebK0BJuq7M8=;
        b=bHUbfyDi37LqCRPPSPKZmL6pAHRagCvK8FvP3dMEtCxoh10LCfRHm6fox/+ljTnSfo
         EGgg/+Uqt/QOwd/0gzZvGm5BgtGUtZos6xPQB4iazPeyQG0Vw/T9bRI2A872bdPvaIFl
         IylNqSMHdYiTZ41PTSWQuA7WSka4O7yRDga7l2aJAGSjf8LtfWumIqZTUM93XHTJtEn4
         tVgeoFKF5Nitw96BDRU5pQbKie5EMqJARYc/LFWgxONfSaycUhsDocD5+1h7Jqw9TzwF
         KNDW3RwF+UvtKQYBT9KMbbfH0FOAdmIwwKTZwMtEwqZcHJ0FotGvK3SZihxLWVnGDajY
         TKCw==
X-Gm-Message-State: AOJu0Yz0fDd961CPYOnyR3CQ76eRSTDKhrZiwipkzGwFmvAVbE5dmKjU
	4CBbL4U696cp6YZNgmQd+Nav+rmX6ke302b9cehEQidXIHTU+xitbyrcLkRN3Q==
X-Gm-Gg: ASbGnct7mi69ZdjEYDyO3TKIm+/2P0as2rlCV/Wsv6ORaKvKQgjrZm1OCOq4KZiJZMx
	/i1NCkQarCsKWWr7V4vSp+9gGUlR5xJNr3ned1cXZ/QHbZaB0puerffoy5tEXvVTTWNnOxl3Kin
	wTYiKfYawXmxLaj0JkI2pKR1/5EunIW0b3Gb46oeIhoaRKsF5Txp7cHDoPIW7BFrO3Xm7NP+YR2
	4zMrt02mx/MvNA+J9xZbWfsxA6l7T8Gh7niqOMCN385c+c2w4dEcnt/lEX5Dll98h50Jgk4hbv4
	NM5Gsu0bHCY/f/9zImPAf3sGEk4Cx9Kp9c28DSYanP9teLrdfWLZHNEa6vKwlEHhp5oPN9Tmcm8
	raZY=
X-Google-Smtp-Source: AGHT+IEWQ46P6/n2J84xXBV4MosQohXyOXpMzZ5yQWXSCUPEZblYG9mPsz3nMp2c6uHGYvUrQ1HMUw==
X-Received: by 2002:a2e:b8d3:0:b0:32a:80bc:1755 with SMTP id 38308e7fff4ca-32f4254ce1cmr3169511fa.0.1752004656857;
        Tue, 08 Jul 2025 12:57:36 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:36 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 08/20] portaudio-v19: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:24 +0300
Message-ID: <20250708195636.1678606-8-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118330

- Since recipe uses a fixed release version and not a git snapshot, the "+git" suffix in PV is unnecessary and has been dropped.

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
 .../0001-allow-build-with-cmake-4.patch       | 40 +++++++++++++++++++
 .../portaudio/portaudio-v19_19.7.0.bb         |  6 +--
 2 files changed, 42 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/portaudio/portaudio-v19/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-support/portaudio/portaudio-v19/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..d6b17ce2be
--- /dev/null
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,40 @@
+From ff000097d226f21cf05a94c22459e55cf1f5c5c6 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 18:06:03 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
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
+Upstream-Status: Backport [https://github.com/PortAudio/portaudio/commit/ccd16c85e64d8c1a5462541388b6fbcaedbb1cad]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 87d0bb8..eee16fd 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1.0)
++cmake_minimum_required(VERSION 3.5)
+ project(PortAudio VERSION 19.8)
+ 
+ #
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
index 4451e96307..7376f7ca77 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
@@ -3,12 +3,10 @@ SECTION = "libs/multimedia"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
 
-PV .= "+git"
-
-SRC_URI = "git://github.com/PortAudio/portaudio.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/PortAudio/portaudio.git;branch=master;protocol=https \
+        file://0001-allow-build-with-cmake-4.patch"
 SRCREV = "929e2e8f7af281c5eb4fa07758930d542ec43d97"
 
-
 inherit cmake pkgconfig
 
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
-- 
2.43.0


