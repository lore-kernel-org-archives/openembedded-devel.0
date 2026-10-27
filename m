Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14686.1793092911011517502
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UkT4VZQg;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so26939255e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092909; x=1793697709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBUFhDwSm8jFRae/q2DAvOdqBNdA79k0cGBAOR3h5mM=;
        b=UkT4VZQgjBTGpcvM5auAZAEn7fT/Ai3DB1C4ikjG0vZEIOSYQF70avJv5WWVC4EU3f
         Z045UI8kyHTMrtPn/7DhunmRQtcxBvVt6ZWM9Ur6JsBcjzqBN3OmDEqP089g91InHKcI
         D3fft5QNpSskjBIxF9ZXb5OM97HoXLBq2oa6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092909; x=1793697709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBUFhDwSm8jFRae/q2DAvOdqBNdA79k0cGBAOR3h5mM=;
        b=Vu2nygdtqvmyLf2h0MMHxtsM144H6kiHFsGXF2kDpYOd0UzHvCD1r1EBd6jVoZilvM
         8ykPSXy6thSNi+5R/xZatRf3wmC6/WTrzFyNWIP0PO2RWv7uLzPwRX3eaL/cVYLGGO/V
         AdhBiOSgT4HbgRlgM7LR5IJJU+IGYMfwav+nkyQ+6bDz4/Xy2rWSAP7QQlF2FVSD993M
         x6WmPAGbd3WFhUeWid0gP8/AcQh0z2NmEscYAS3v5lvDGb93qvdXP7vvIA8jCn6Kx+nB
         cXhdNDm+Bi/VSXPzL1a6M3vmeqc8TnIZs7hPeJx+0AHNSMmRuObjMcSq1IRbHmmbHiSP
         TjTg==
X-Gm-Message-State: AFq9FYKXp5zp59uO5BSrpRb6fUsDRhIv5cT4MgINS4UjGFk1pqdPTwEI
	s0r0hrOPc5zXiGcPf6Kw8ENV9QgMSjP+wKB5enw9u+XHFWQfYAr4celK5HYrDxTJXbr9+/YfSCS
	uThYQ
X-Gm-Gg: AYBFou0QcJTjstmAar3Su3mshbsDIldYphfGCYrOhHGiu8NatLKPNQG7puQIJmfE17h
	ETEpykkym+kEjN2SBmF2CKZ7PCncgdhAsEoz47RdJ8mvPFxoatr+Ew3mIpYbFRzUpODhBjPfkIK
	v1bmrLt4qDljTOnJM029oM98PAUi++B20H+S1dftwNBgu8nWFAHQKvb4IyfvJ29Ez80V6zm2T6A
	bKAZg6jMfdt+sXz4oeNrBfUQ2juDOS4YGnPT5anEkAV1rsGYvSmJI2yrfYFpTpcjXDG7+VTmNMk
	XJAks5VO/wMv3kyetDds+YFr8GoX8m0hsJiXbpEEKK0CX4wvwjUsKv7G4vIq4AnCFcRqnZPzxeK
	/AsiLJgnTjoKm3e1i8lXnTMw7x+Z16twYNBlaeNmNPFLCOZtbZCK0+ydQp/LS/6NSp809zAfLyk
	iH0oKUj1GMmGqbHIZeHGAQwJgR1B3EZjPNhCDfQ9odLQtN1CeFxFoPkL0tB8SIZaivnv0aE4GjY
	QbJ2UpNG9hNH2HNSvmz25bWoFC2dFr3dlMJPp7Sah2WVDEJQEp+fa3lkGxjWfZ6zN6a8mEEGWE9
	HPveS9aPKYSGcJTSR/pOy6oCeLoln82q8ltFN3y4zC6dpbhS101jhntknlMlRlhOpHJvVk+J/uW
	N9Boy
X-Received: by 2002:a05:600d:8:b0:4a5:ef46:1603 with SMTP id 5b1f17b1804b1-4a5ef461bc1mr90084105e9.30.1793092909266;
        Tue, 27 Oct 2026 02:21:49 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:48 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 61/61] python3-pytest-httpserver: Upgrade 1.1.5 -> 1.2.0
Date: Tue, 27 Oct 2026 11:20:28 +0200
Message-ID: <20261027092028.782979-61-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131525
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.2.0:

- Dictionary expectations must include parameters with empty
  values. A request for flag=&foo=123 previously matched {"foo":
  "123"}. It now requires {"flag": "", "foo": "123"}.

Bug Fixes:

- Preserve empty query values when matching dictionaries and
  MultiDict objects. Both flag= and flag match {"flag": ""} and no
  longer match {}. For repeated parameters, dictionary matching
  uses the first value even when it is empty. MultiDict matching
  includes every empty value.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...t-httpserver_1.1.5.bb => python3-pytest-httpserver_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-httpserver_1.1.5.bb => python3-pytest-httpserver_1.2.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-httpserver_1.1.5.bb b/meta-python/recipes-devtools/python/python3-pytest-httpserver_1.2.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pytest-httpserver_1.1.5.bb
rename to meta-python/recipes-devtools/python/python3-pytest-httpserver_1.2.0.bb
index 0c3e8f8486..d98525fff7 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-httpserver_1.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-httpserver_1.2.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/csernazs/pytest-httpserver"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7f54416ccc5478427995b27e5ef38e92"
 
-SRC_URI[sha256sum] = "dc3d82e1fe00e491829d8939c549bf4bd9b39a260f87113c619b9d517c2f8ff1"
+SRC_URI[sha256sum] = "d07744ce2efaafa0575ed3081d416b999c773b09e84aa95065138bedc3e12352"
 
 inherit pypi python_poetry_core ptest-python-pytest
 
-- 
2.47.3

