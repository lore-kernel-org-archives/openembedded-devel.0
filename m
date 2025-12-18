Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD042D6D227
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 13:47:14 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42290.1766065624950242843
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 05:47:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RpnziDy+;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42f9ece6387so220881f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 05:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766065623; x=1766670423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agbgfvc51hcsi0x5WyCOekFYtBuz6OHp/vH6wgDjtJY=;
        b=RpnziDy+/iL1es0VM6ujv10xzZnhMy8tZWYgl5iPFzAYTKOr9KI/MkD1kgTKdYv/Is
         HXs000icJim55t68z65Cc3342IB/pYM3lGY/k3W3yASRURUL7GYH8TWklcA2VHXtzTUG
         vJtCbpVSfGtb7SzH7mq9OeQGoRVnRQmEnbn8O5ewarYKLGIpLYeNTTyEMP9VYtB18UFf
         YYcuMtVzVN5FB+shSfbeO0oVURT3AxnnrPhko5559O0MNqnkMsF/dqPfzH5L6Qq7FV0W
         eczArgPlo1mYitbsBQG/jSLtfonSJTJBdUh0zMOTxap9LwiZc+tbg4eXtlorNAbEQMIY
         zlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766065623; x=1766670423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=agbgfvc51hcsi0x5WyCOekFYtBuz6OHp/vH6wgDjtJY=;
        b=KnrX5xLZ8KVEo0DwdlQEPUyIjEM4lcwbvwik3ThbKhMwICMqDZP04fzzHiym/vQEZa
         E6aoLUFAArTDCMRFfoy9Ugn0lMPwGGoKvw7RbpWSvu9tagt4PQWtueT9Gq7+RUxW0zCK
         grBytzfzzgALSuNLWxrkyjWUJDEmUGsBFbaEsDRvZEftYpI1O/r1f/7V19G/jcQ11khg
         vu7pNoJOqpINHfi/FtLXU6UaYdUb/Ac/sJI5Eu84K8oqBASowJ3SqzGnMYcnCXkvppzW
         a8u0kAGQqT9jf+jvbYdGRdCZ0+kZGYa3btKWxhtyafNT6SV50N5IpCa4ztMZxedtJfQ7
         M/mw==
X-Gm-Message-State: AOJu0YzYApNk/yxsu/ghqYpisSpu72NBVhDb/IdgJtDgsfEtrLczNlIT
	XvJ2eid6QZC4GCyTIc5VCvsn5T1dvmcg+xuBt5CbnbTPBxpmXRE60GF0azIBgA==
X-Gm-Gg: AY/fxX4mn1/Ov96IVvQL9kVbX4s8W8OO/g3CBFf4Rwq4U9tTa05BbC6EMZNjJsBqsQ2
	LaX/l3cMm8Dikd3UJ1F7MTWlB+Gr8IZw3fLkpVdvGrDxqBJjqqF7idmwMeiAOQUlHrA3yI2lGRe
	lYa7PtcUBqueQgosAsTTEjIsmuFppRNTxelhoD0KDk98mosBfQRrbo5rTMxNXduOoEwU64dYNpx
	Cr5iKFwCwQRjst/29fJGho+powrAc/l1s2YrUuVKjXKjFn0repSBDcrgHqZCOtU8nOZaXY+47ZD
	aWW0lI1l5P3Mjq+0HasOQUHHNYblr32RaJ2Wja8As0NIzPJXfFLFzrnCRQmvUZdF4VFKqos9kn3
	j9wFBteJnbFWNN8mI1JN7nM2a12RBiotAVM152JJZoTS96JZic1QKNuimTC+EFdY4/a589+p9Ew
	Jr1wUAdpbx
X-Google-Smtp-Source: AGHT+IHBUk0HQdaZPI+v0HmQa5U5sVmPl/2+PNLfOFehPOX8V0UmkOTir2C6p6yOwLl+vvZrPeSrbA==
X-Received: by 2002:a05:6000:4010:b0:430:f325:435e with SMTP id ffacd0b85a97d-430f325442bmr18424907f8f.16.1766065623163;
        Thu, 18 Dec 2025 05:47:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324493fda5sm5272239f8f.17.2025.12.18.05.47.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 05:47:02 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][kirkstone][PATCH 4/4] xdebug: upgrade 3.1.1 -> 3.1.5
Date: Thu, 18 Dec 2025 14:47:00 +0100
Message-ID: <20251218134700.3509105-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218134700.3509105-1-skandigraun@gmail.com>
References: <20251218134700.3509105-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 13:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122767

This update contains many bugfixes.

Changelog: https://xdebug.org/updates#x_3_1_5

3.1.5:
- Install documentation gives wrong arch for installation on M1 Macs
- phpize --clean removes required clocks.m4 file
- Constant defined with an enum case produce double "facet" attribute in context_get response
- Crash when used with source guardian encoded files
- Segfault in __callStatic() after FFI initialization

3.1.4:
- Removing second call breakpoint with same function name
- XDebug breaks the Symfony "PhpFilesAdapter" cache adapter
- Possible use after free with GC Stats
- Can't inspect ArrayObject storage elements
- Segmentation fault in symfony cache
- Debug session can be started with "XDEBUG_SESSION_START=anything" when xdebug.trigger_value is set
- Warn when profiler_append is used together with zlib compression
- Code coverage misses static array assignment lines

3.1.3:
- evaling broken code (still) causes unhandled exception in PHP 7.4
- Memory leak when a trace file can't be opened because xdebug.trace_output_name is invalid
- Slowdown when calling a function with long string parameters
- Debugger creates XML with double facet attribute

3.1.2:
- Segfault on fiber switch in finally block in garbage collected fiber
- Crash when profile file can not be created
- __debugInfo is not used for var_dump output
- Segault on xdebug_get_function_stack inside a Fiber

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-php/xdebug/{xdebug_3.1.1.bb => xdebug_3.1.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.1.1.bb => xdebug_3.1.5.bb} (91%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.1.1.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.1.5.bb
similarity index 91%
rename from meta-webserver/recipes-php/xdebug/xdebug_3.1.1.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.1.5.bb
index 580ae7e89a..4c9ea54c7d 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.1.1.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.1.5.bb
@@ -6,7 +6,7 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[sha256sum] = "9be3ae0fdb4dc4a4c68084626cddc56f12396487e309a8c8dd318f0f900d1a68"
+SRC_URI[sha256sum] = "55f6ef381245da079b2fc5ce1cfbcb7961197d0c0e04f9d977613cf9aa969a79"
 
 UPSTREAM_CHECK_REGEX = "xdebug-(?P<pver>\d+(\.\d+)+)\.tgz"
 

