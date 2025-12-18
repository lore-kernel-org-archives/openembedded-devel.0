Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F95D6D22E
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 15:09:35 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44292.1766070567046982548
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 07:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cEUtQ3aS;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47a8195e515so6587775e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 07:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766070565; x=1766675365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Cg5TBLpy2YEMwcgSMspXzQQ/N2xAZDs8o9WBtsEN+U=;
        b=cEUtQ3aSyyzGP9W0g3oN0ut9tDg90cf7CqRfx0Nc6ojfOhfiUFqB/mSnOhp+Y5+9O5
         Dc4ZWH8Ken+f4jFkZTd6tmvrbtV5vh/rIktfyFBIx+6pWdKdeLVa/kCIU3lTPKIFNEUl
         PN2jyJm2IkoOA0bIG5g3gcsnQqFEh6nD4RKlpY0+PHYs5v9DMuRpYT9AU9XSTkW4dPlk
         ctxsYGkay6mP/dcMKjb0pTVOtGgrkd/uGtqgR/S/D2Mf5Frq4jGuumTub55HrCEjWxq8
         qGR23X/+H9En/BJ8ieMTkoU20JloaK3zEBCrBjqsEvPDqwQUAPHDhXaDRMkgBoW9Ue+z
         9Csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766070565; x=1766675365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Cg5TBLpy2YEMwcgSMspXzQQ/N2xAZDs8o9WBtsEN+U=;
        b=jt7l2q+jbhtz0b+Vzhtbqu1b4MAoBt8fIZQczR7smuEJApfbn3M/xLO9BMkLIVW2J2
         fhFVIRfySzJx1xZt+wYMGLkMxhZBBsIV0pfx1P8/Hh2mCG17YfvAVV8eGIImHAr3+99y
         iIKNomLP4YL1WlO7Pn0b4hzOfTbeiJPLdD8OYuAYpikJALrZw9686nBcGUrP8sIr/3el
         AymY5MddeT1Mhdnpwi4TQ6GuKw3t0CM39d10a6usCZGRBXjlDCdcN54sx+BtCyemNoUF
         eMzhhPCApsnBXfIbRKV/yqMC+WzwtdUYyddBuU9+ICKNejXnoBdEvaemYu8xxsYi0ZUc
         xARg==
X-Gm-Message-State: AOJu0Ywxxu77fjJpsCL3NpO50Wf54AQvLWaCjVEtzUWE8NTnuUCde9dk
	XWWudrbOH1OTjkhUEMQDyMyFdWqMYu0gGlO6Cn6y05XHVITpK4tyt7wyS3mAhw==
X-Gm-Gg: AY/fxX5/QWeHoUIM3VMfmPYkS2BCyy5aUK5M5aVaUW79Gx+wvMklvP0xJvzF8zUq9/V
	OSIrd/M2jpc+dOYvIgubbpUCb4+dUoqngi0jqLqso+Pk6T3ODKOeD85izH1GnvpVXwRs9Du96OO
	kznrEzAgsJAO8Wh1LyoCFb5OUL9UHPl32K9g5oK1he+76lp+MkqjiJ+yvxdQgFPwESe5G+jNx1z
	+CdCCU9sv31ftuYU5pgWm7U8OEtxODYO1eiJEvEhL4WdrfKgTqHKG6a2Yreej4sK2XEjKFRBF6p
	n1Z/4d9/4P7PK+6PLVjc7io1VSgZfoeuq05vP0CpoD1rKfox0eUbuwUpIWppCinS3jHKu7JlatU
	dsYFRvSzOxcs0yMarBs5P0ZgWhOnl9gFdwj0ftTWbOrseWcSErysi+dQ5m5SYBdqsRcbCIx9CIW
	g4IGxdHGlp
X-Google-Smtp-Source: AGHT+IHP1IpJFtAO38OEE00ZLNAUJsKYi65NYDBKNfT7ZyNYEYJzuKRtoO59sgdzstLdCySVO9QDxQ==
X-Received: by 2002:a05:600c:a00f:b0:477:97c7:9be7 with SMTP id 5b1f17b1804b1-47a8f8a6adamr229046925e9.1.1766070565299;
        Thu, 18 Dec 2025 07:09:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3aa9971sm15075315e9.13.2025.12.18.07.09.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:09:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/2] srt: upgrade 1.4.4 -> 1.5.4
Date: Thu, 18 Dec 2025 16:09:23 +0100
Message-ID: <20251218150923.3597632-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218150923.3597632-1-skandigraun@gmail.com>
References: <20251218150923.3597632-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 15:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122769

Release notes:
1.5.4: https://github.com/Haivision/srt/releases/tag/v1.5.4
1.5.3: https://github.com/Haivision/srt/releases/tag/v1.5.3
1.5.2: https://github.com/Haivision/srt/releases/tag/v1.5.2
1.5.1: https://github.com/Haivision/srt/releases/tag/v1.5.1
1.5.0: https://github.com/Haivision/srt/releases/tag/v1.5.0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../srt/0001-don-t-install-srt-ffplay.patch   | 22 ++++++++++++++-----
 .../srt/0002-allow-build-with-cmake-4.patch   |  2 +-
 .../srt/{srt_1.4.4.bb => srt_1.5.4.bb}        |  4 ++--
 3 files changed, 20 insertions(+), 8 deletions(-)
 rename meta-multimedia/recipes-support/srt/{srt_1.4.4.bb => srt_1.5.4.bb} (93%)

diff --git a/meta-multimedia/recipes-support/srt/srt/0001-don-t-install-srt-ffplay.patch b/meta-multimedia/recipes-support/srt/srt/0001-don-t-install-srt-ffplay.patch
index 5b76b16328..cb211655df 100644
--- a/meta-multimedia/recipes-support/srt/srt/0001-don-t-install-srt-ffplay.patch
+++ b/meta-multimedia/recipes-support/srt/srt/0001-don-t-install-srt-ffplay.patch
@@ -10,6 +10,9 @@ So remove it because there are no option to disable the instalation.
 Upstream-Status: Pending
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
+Rebased on latest version.
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 ---
  CMakeLists.txt | 1 -
  1 file changed, 1 deletion(-)
@@ -18,11 +21,20 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index ed6e603..ef53dc5 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -1224,7 +1224,6 @@ if (ENABLE_UNITTESTS AND ENABLE_CXX11)
+@@ -1548,16 +1548,6 @@ if (ENABLE_UNITTESTS AND ENABLE_CXX11)
+ 	enable_testing()
  endif()
  
- 
--install(PROGRAMS scripts/srt-ffplay DESTINATION ${CMAKE_INSTALL_BINDIR})
- 
- 
+-
+-if(NOT NEED_DESTINATION)
+-	install(PROGRAMS scripts/srt-ffplay TYPE BIN)
+-elseif (DEFINED CMAKE_INSTALL_BINDIR)
+-	install(PROGRAMS scripts/srt-ffplay DESTINATION ${CMAKE_INSTALL_BINDIR})
+-else()
+-	message(WARNING "No location to install scripts/srt-ffplay")
+-endif()
+-
+-
  if (DEFINED SRT_EXTRA_APPS_INC)
+ 	include(${SRT_EXTRA_APPS_INC}.cmake)
+ 	# No extra variables expected. Just use the variables
diff --git a/meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch b/meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch
index ba281a3a53..8c91e3919b 100644
--- a/meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch
+++ b/meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch
@@ -35,7 +35,7 @@ index 328a433f..448d6254 100644
  
 -cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)
 +cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
- set (SRT_VERSION 1.4.4)
+ set (SRT_VERSION 1.5.4)
  
  set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/scripts")
 -- 
diff --git a/meta-multimedia/recipes-support/srt/srt_1.4.4.bb b/meta-multimedia/recipes-support/srt/srt_1.5.4.bb
similarity index 93%
rename from meta-multimedia/recipes-support/srt/srt_1.4.4.bb
rename to meta-multimedia/recipes-support/srt/srt_1.5.4.bb
index e72a36f657..72e9ff658d 100644
--- a/meta-multimedia/recipes-support/srt/srt_1.4.4.bb
+++ b/meta-multimedia/recipes-support/srt/srt_1.5.4.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "https://github.com/Haivision/srt"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRCREV = "8b32f3734ff6af7cc7b0fef272591cb80a2d1aae"
-SRC_URI = "git://github.com/Haivision/srt;protocol=https;branch=master \
+SRCREV = "a8c6b65520f814c5bd8f801be48c33ceece7c4a6"
+SRC_URI = "git://github.com/Haivision/srt;protocol=https;branch=master;tag=v${PV} \
            file://0001-don-t-install-srt-ffplay.patch \
            file://0002-allow-build-with-cmake-4.patch \
            "

