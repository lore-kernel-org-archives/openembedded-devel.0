Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F428C4167D
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 14:29:20 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.37965.1699885754330175785
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 06:29:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ADqNMbjF;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-32f70391608so2553743f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 06:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699885752; x=1700490552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKvDryGaPwdR5A7/h2qfnI9/FpKKnbN5VQwulP92NfA=;
        b=ADqNMbjFieXqJ4KCP2MicCg1SB9nHtUDXNkIB0svgWayRRCokDJTkdq48Mjm8Mpkq0
         1mw83NciNfF8u/1mINc9n5Z3UetD68rFJeIvPb0TpKmuqiyEy6qsGEH7L0TUKFJmPLZs
         vhuQVojCTDFn6xAVkNpx2fyqxUBVrJHz9Gjn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699885752; x=1700490552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKvDryGaPwdR5A7/h2qfnI9/FpKKnbN5VQwulP92NfA=;
        b=JiBrpx5WELpwf3vMcJWTPd4MfAoQ9RGnd59MWkk1AnVbKgX0X3Kll2kDxPhUf5I1ZT
         Jw9a/lGztfL7j9vDT/EDktwt/rsXV1Mmb8ITfwFmU3irsKq6oZIBCSoARWPtfRUHdwtk
         pF0+F3chZRgnH0RMht8a/ax3RkuBzhiB8JhjtS5kvQwo96gJKGT3GPMrnzb0/Yd9Omql
         jvOZLIo/7N3MbecGNBgbRZCFBJlBRj6BuBPqpbQ9Fkn8N4ALsSYGNH/26WACVFVyoQ3y
         4MX5o2qQfiBzE18I0PoP39/hK7LQPIGHiFaDgakVCyX1IN//+Md0qqhlNUcHBX8i6m33
         G4Fw==
X-Gm-Message-State: AOJu0YxM3LaGydvZcSzwwERECj2DkVb8sRdRVzsgUUnwm+wA9zbXma9Z
	l872ZhFf5lnTp0RKzRIba00m/Q8unilUkJZd3c0=
X-Google-Smtp-Source: AGHT+IGlgJvYj3eNdgRuFMh4CqVCYlJbemG61logAlJXeRt7szRbBESuuKXAZ/9d/piuUr9HyxGW1w==
X-Received: by 2002:adf:f191:0:b0:327:e073:d5fe with SMTP id h17-20020adff191000000b00327e073d5femr4639072wro.38.1699885752651;
        Mon, 13 Nov 2023 06:29:12 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a15-20020a5d456f000000b0032ddf2804ccsm5535042wrc.83.2023.11.13.06.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 06:29:12 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-wrapt: Upgrade 1.15.0 -> 1.16.0
Date: Mon, 13 Nov 2023 16:29:08 +0200
Message-Id: <20231113142909.3093632-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231113142909.3093632-1-leon.anavi@konsulko.com>
References: <20231113142909.3093632-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 14:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106643

Upgrade to version 1.16.0:

- The patch_function_wrapper() decorator now accepts an enabled
  argument which can be a literal boolean value, object that
  evaluates as boolean, or a callable object which returns a
  boolean.
- The import hook loader and finder objects are now implemented
  as transparent object proxies so they properly proxy pass access
  to attributes/functions of the wrapped loader or finder.
- Code files in the implementation have been reorganized such that
  the pure Python version of the ObjectProxy class is directly
  available even if the C extension variant is being used.
- Bug fix: it was not possible to update the __class__ attribute
  through the transparent object proxy when relying on the C
  implementation.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-wrapt_1.15.0.bb => python3-wrapt_1.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_1.15.0.bb => python3-wrapt_1.16.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb
index e35e1f7a7..f99b552c6 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dc34cbad60bc961452eb7ade801d25f7"
 
-SRC_URI[sha256sum] = "d06730c6aed78cee4126234cf2d071e01b44b915e725a6cb439a879ec9754a3a"
+SRC_URI[sha256sum] = "5f370f952971e7d17c7d1ead40e49f32345a7f7a5373571ef44d800d06b1899d"
 
 inherit pypi setuptools3 
 
-- 
2.39.2


