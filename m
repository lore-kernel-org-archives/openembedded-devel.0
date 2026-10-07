Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C13CA5FFC
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:08:33 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7183.1791371311474534686
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Axou4R5A;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4b62d118aso1056087a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371311; x=1791976111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nvar6mIHmE+yJT1H1gVvUfo5sTLNAACf8zEw1dWE77Q=;
        b=Axou4R5AUKDh5WQPDmPta76TbXnDN9/6Yi83nIpnRv3wT3kfan15BvgzzuwY5c+Wip
         69OFzujboMl+dZ638N5QTJQ0ZP4YjZVDsyp2+Q+KcN0UalcXa994Q+R1ZIiOr93NLJ+M
         YTuGJT5gOomOBgTATKXWMtpXEB2gkfqh5B1Q6qIjVg7BrTSrt96MtKXF2jBzXU7kfnYj
         4O3Og+/oJdwmyFBzgUasm5ztlmm7ti1gs8ry0waItrscYhUa/wlSH1c66bo5S7XBRU6U
         gIAYxMNEKi+zSXxuMevoCanX7GSJSs2WTOgv0P9py/mearf3PxOjrWrdQWZqJBmZUSxG
         ZfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371311; x=1791976111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nvar6mIHmE+yJT1H1gVvUfo5sTLNAACf8zEw1dWE77Q=;
        b=j9c6/hEwwRGOetyhQ7Ueth4kQdUw2PqAwc0eEW2CwImCnI3TwWKQ/qSSsF8EG99jJZ
         4ChcpEggbjZNiZb9ptmZ9jZ8P2JgbTrVhVuQFviUOeHKlOsCv2et2VXecDwjiF9tRBwg
         nEY8rcXjavVKpCWG0YrM+kSCc3sJymYEsCklK3mQ3gnbrYzflGTndVD7euJhO2lvWJ3w
         3w7XTw7ews66uzytcYr+ItcCqiqHAR9MSUmGj/KDsbYYu9cwUnujXYmQoxu5sQKC/qoG
         nbpe8m3Dwo5ew0ZiVHiHlMAqUZucPCQ2Iw/g72g/3qEYidKlwOSUosUdtOwUkyep9vR/
         L4Rw==
X-Gm-Message-State: AFq9FYLOVEW1M1JoTIPqcwNAg44trwE7/hHy7iIRRFYAsvSStHkB6y0T
	ZwIZ2wphYz7/vTXZbfDHGUMuLTh8Kt8lP4frQB1Pv2Orc3MONO2TX+JEWW3iV3Mr
X-Gm-Gg: AYBFou0Ogj9FncA4a5GQjrlYmdu67RdiOqrv8I3mBW1epprieutmJcKaRS9PlI3/Hqw
	6ElsZWZUvHUmNXmXM4KleTDfWXsYJBIhfNw9+LPHutn1i/HNH1G++yGvAY4c79tfVPqGxton4Ll
	FrHpvzpEp7AyjZuTPprDy534nT9C98JE58KM8GLE192eAYqmCOLc+XWTQqlwG/sUVW5p++RPUHM
	e3C7C7EhR1FKOh8Vv4Ns6OsEhvoFQqSRaPtlCV+h0f8MLJ9YmlHSXQiNOQEdJ4D/FKVXKm17OfT
	0D5l60qgMR1f5piZ6jkubWFHwrhl2foPkqBOqdiH9mL+pQVuMNwKnT06y+lcJXCzLLNNA83rJym
	h3omNL4PwtaJ5mcTrNkXpzOYBE39r6GNq/yBu+EBOShM+ndxWGPWd2aLqR2mrQI3iI/0p/0kP9k
	oG7TESN6vU7HNspSejKfF5gFvk7whW7HENffKToi0eeWKcVfw1fCj/hbIfx2UFzSNo7mer3VwsD
	YEqUYE3i5YFjLBnZoAZKlk=
X-Received: by 2002:a17:90b:264e:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3a8a15314e3mr1583729a91.67.1791371310770;
        Wed, 07 Oct 2026 04:08:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10862177a91.2.2026.10.07.04.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:08:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 15/15] fluentbit: upgrade 5.1.2 -> 5.1.3
Date: Thu,  8 Oct 2026 00:07:40 +1300
Message-ID: <20261007110740.3179543-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
References: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 11:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130657

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Refresh 0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch

Changelog:
https://github.com/fluent/fluent-bit/releases/tag/v5.1.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...rivate-makefile-targets-in-CMakelist.patch | 23 ++-----------------
 ...{fluentbit_5.1.2.bb => fluentbit_5.1.3.bb} |  2 +-
 2 files changed, 3 insertions(+), 22 deletions(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_5.1.2.bb => fluentbit_5.1.3.bb} (99%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
index a842a322ad..7110596757 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
@@ -26,30 +26,11 @@ Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
 
 Upstream-Status: Submitted [https://github.com/fluent/fluent-bit/pull/9450]
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
 ---
- lib/ctraces/CMakeLists.txt | 8 ++------
  lib/monkey/CMakeLists.txt  | 4 +---
- 2 files changed, 3 insertions(+), 9 deletions(-)
+ 1 file changed, 1 insertion(+), 3 deletions(-)
 
-diff --git a/lib/ctraces/CMakeLists.txt b/lib/ctraces/CMakeLists.txt
-index bb2c54fa6..7d59dd834 100644
---- a/lib/ctraces/CMakeLists.txt
-+++ b/lib/ctraces/CMakeLists.txt
-@@ -30,12 +30,8 @@ set(CTR_VERSION_MINOR  7)
- set(CTR_VERSION_PATCH  1)
- set(CTR_VERSION_STR "${CTR_VERSION_MAJOR}.${CTR_VERSION_MINOR}.${CTR_VERSION_PATCH}")
- 
--# Define __FILENAME__ consistently across Operating Systems
--if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
--  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__='\"$$(subst ${CMAKE_SOURCE_DIR}/,,$$(abspath $$<))\"'")
--else()
--  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
--endif()
-+# Define __FILENAME__
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
- 
- # Configuration options
- option(CTR_DEV             "Enable development mode"                   No)
 diff --git a/lib/monkey/CMakeLists.txt b/lib/monkey/CMakeLists.txt
 index 45f96d797..cc227fdb0 100644
 --- a/lib/monkey/CMakeLists.txt
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.2.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.3.bb
similarity index 99%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_5.1.2.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_5.1.3.bb
index 5862afba00..158378c8a2 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.2.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.3.bb
@@ -17,7 +17,7 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "66910c10a4d7eafa810b84229cf2dcf7b0f26f97"
+SRCREV = "d1be1ba389a481ea727462e9a4afeb4538f0365a"
 SRC_URI = "\
     git://github.com/fluent/fluent-bit.git;nobranch=1;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \

