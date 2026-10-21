Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8725.1792580496964050025
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BXueuise;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so465123f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580495; x=1793185295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rj9brpuq2Kt423dFpizpQxARqifgZK2uU3gGXqiCNHI=;
        b=BXueuise9u5lCx4H/GdTJhlkaFHtUtqxeTz0FiQwpHhWgfWDyG8FOfEmuWx79mJVsZ
         wMeTcb3mjLHEm0xTeo0esiUcAFwqOaCVuHiFrcPK+aD8o66J/7T1WN8LljlaqH+kOgTp
         4Cc4dC0NZ5ohqe/olHXg3lG172SYL560vxFRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580495; x=1793185295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rj9brpuq2Kt423dFpizpQxARqifgZK2uU3gGXqiCNHI=;
        b=BOvO2uulr6qXaRCy6iU75unViAN2U4R3qm6z3T0MGKizF3RojxFkm2PMwxrBmpocES
         zPfOq61ljKJnJpI4BKB2LhhWnVGxt4FNYAzT58X0p7mzR1j+6icaeBlNCAy/caN907uE
         BuixJagTojIdtuJChQutzkyowwUOeh9sjtQ1W1fCfUa5ct4QBatAGKFns+xX44zCE4nQ
         OdFrYQ3HpM4ugHHmUVwu1buzim4mTzqUXVwAJREjEQrsu5P8CKECyEKirgxSuiceyguK
         AL68U7NOrKGAlHsG5GRV4//68QjIc1FjugXBq/CssSzMHbD/VQRzx4GPNAA/ChDxv3V3
         acBQ==
X-Gm-Message-State: AFq9FYJSmRtAQO2ZgRv2FJZZkH0U0jqu34gpPpuJAuDTpom8Ju/ULI3S
	qRwniyePD/lZInP+IbcdzWlbcRjChqf6IL8GjSxIyVU1h1Xu1E/jM8XWevUAePB5L1ZIHLGb4Ji
	3XLnP
X-Gm-Gg: AYBFou32C6e57sdHw/08yN+/3Hl6/cDDQ1urvxAIG+VXKacHujV0KVpOSsYbM9UnMvT
	qpPOs5x1sU4TSWTPsT3Tl7o6m32tNtxSIXLGRGENLwfEq/ndGPGQYRt7Z1EAmY+0saineAqPZc8
	KDWFu05c8q4+O7C+2i7jP3DG0F3ERNmhGb234jVj2W/kVJcHm4Y2qngnC/117idFDptwGdHc3FW
	eFf8CAe9zQrpjy06ohHpZdSV2R7GFofQkRqtJKyMcNk1SlUPwGA7QlwgZxIANp5TniIdkAlmQpS
	NUd8NZZ/ToGjCWVPp0c17+9WlBUhm8lz5ryi3oM1OjO9xAO9EYxwDipLE3RpRRwqhNhBx5GT9BO
	JrkPRYeINHJ1gzXF7b6UsXPtnqvafVUgPgiXT16JRV5m4w6KSmdJx9LEJRNazlnTfHYTK54IJob
	Fr73Zu0nCOoPbFAJD9m91TCp4JDHyAzW+wDiK/cLEMM9L1wN15L9R0r64dIqqVm4e78A3g4GFHZ
	/wdHEgbheFfh/Vr2sMe0KZtUvmRSFkQvN3AovDWRrWuzqwEGgTN8ERW96fb0+G/EAqYIWEa17zY
	M7vl0Vs5dnPLlUQOsTEIjk1joZTcqxSzFGGnDMoq3OMPX8Bw2GTWwNfV8rVXv+58MTW/D7BZWwc
	RoYvM
X-Received: by 2002:a05:6000:490f:b0:48e:23e1:35ec with SMTP id ffacd0b85a97d-48e264db0b6mr3280269f8f.47.1792580493466;
        Wed, 21 Oct 2026 04:01:33 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:32 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 13/36] python3-google-auth-oauthlib: Upgrade 1.4.1 -> 1.5.0
Date: Wed, 21 Oct 2026 14:00:37 +0300
Message-ID: <20261021110103.1943456-13-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131272
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.5.0:

- declare Python3.15 support
- google-auth-oauthlib: prevent ipv6 address reuse

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-google-auth-oauthlib-Skip-failing-3PI-creden.patch | 4 ++--
 ...authlib_1.4.1.bb => python3-google-auth-oauthlib_1.5.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth-oauthlib_1.4.1.bb => python3-google-auth-oauthlib_1.5.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib/0001-python3-google-auth-oauthlib-Skip-failing-3PI-creden.patch b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib/0001-python3-google-auth-oauthlib-Skip-failing-3PI-creden.patch
index 1309896b19..d956d6ba3b 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib/0001-python3-google-auth-oauthlib-Skip-failing-3PI-creden.patch
+++ b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib/0001-python3-google-auth-oauthlib-Skip-failing-3PI-creden.patch
@@ -1,4 +1,4 @@
-From 7612367e4bd2a366365bf527c6672be55a133ee6 Mon Sep 17 00:00:00 2001
+From c1f52a2283c93151fe6455bfa61a0c74ac9418fe Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Nov 2025 12:55:48 -0800
 Subject: [PATCH] python3-google-auth-oauthlib: Skip failing 3PI credentials
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/tests/unit/test_helpers.py b/tests/unit/test_helpers.py
-index 9df49de..6ec19f5 100644
+index fb49421..f1f5682 100644
 --- a/tests/unit/test_helpers.py
 +++ b/tests/unit/test_helpers.py
 @@ -123,6 +123,7 @@ def test_credentials_from_session_granted_scopes(session):
diff --git a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.4.1.bb b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.5.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.5.0.bb
index 2be37a7c77..b618c5f033 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.5.0.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI += "file://0001-python3-google-auth-oauthlib-Skip-failing-3PI-creden.patch"
-SRC_URI[sha256sum] = "1a83f5f2a8421dedadaa3caf25b3a710dddf85a33a63144be41c2fc79174b106"
+SRC_URI[sha256sum] = "b351107c7dd9017f426cbb0272ea1bc04f469020fd18f4443c7d40362e0b1510"
 
 inherit pypi setuptools3 ptest
 
-- 
2.47.3

