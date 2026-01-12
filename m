Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B45D2505A
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 08:36:22 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29252.1768206977036862757
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 00:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZWKWBk2H;
 spf=pass (domain: konsulko.com, ip: 209.85.208.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so8472590a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 00:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768206975; x=1768811775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgdnjSqo5ZswVlmRfH+YCujWQxdKUM/54WZa6Y4mgis=;
        b=ZWKWBk2HlqTfyK/QAfH9FVnCFi63zZprWjRWyxSwwkVVCjY8sO/5xoJDIHkGWuArEI
         XpugUkQTKICDX6TSuLpsydTUkdchlajLBIe5SAzYsEDhJU1VfiqVH5VHBO2a+UDx8oRn
         LLPQhF+CJIQeoXEhG+qDePRQdQqBlWjaea8tM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768206975; x=1768811775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GgdnjSqo5ZswVlmRfH+YCujWQxdKUM/54WZa6Y4mgis=;
        b=I8vaXAQ+zj5u1KUMOJfN4Mae60pz4mCZSLN5qUTLTo+Sji9PVQwWKe+YLLvojW5fJ2
         UaI2xjVPIsuCfvF0AJ1rroaf4eA9IlCE6S79EAxXMu+Bl6y4B+P8gc1eDQJm7pnrvZMd
         ULzNsyc067u7udXPDAqOPC9B/UO8J+hWbh7iBLqMFR12Y+A6LG7SOE6vQWgiLijiMYF7
         eUVOazX3XTJRJzcmGT3pjiPMybS0m8RV8jXHmrReTgCqT0xM6gvDEcV7YbwLwWPu0rcK
         IxoQp0lzGeBOXS4dm1lr/0MCfckWUu5pHTBXsmCT5My1v12QdCWIaYDOYpyXTOr360Um
         BoYg==
X-Gm-Message-State: AOJu0Yz/eFd12hBz8t6vbPNIU3wxWELY7w93wSaZ1k/Vs+ZE2YA8uDcY
	s2nZK+gbWrK5AodpPSu8uVt8IE1/vsjnIRicL8975eZCiiJgH6f/OsN5scYmutZj90fUNL57OZi
	3SB6U
X-Gm-Gg: AY/fxX6V/YXrmg7p6r3iCajJdBOfEUiU2QFdfVs2TT7s7KjbZGhXcHFTOH0GGkmH609
	X71mm8s00d4lwp3GuT9gPWNjekCKfo8Yo+LTTWBbSvXhYgIx0f313jGrMgXKN2an4mU0EtpBQ+a
	cXew3y0CyYwDuex7PZflvdPFF1RZ9W7iiBKPb8BsK42GI6+72gIPWaUdJ/eBXbHp21iKz4BbqGl
	R4OzXfjW8cLQe7pnmtt6gJpss5YSd87IbSmsKN7TA+IagTbyyHGNgMnULgTCYJPwlhdjekLQl1j
	Ah52PU4EN+Vn+s6S3XULGmkFEh0+4Qk3yDjgJSOIc0D08oavt2Nwe7wbZWdRYLRDLfa92FciBgJ
	EJrfz/o6sWmV138//XP39ROAEUJFyIv4NkVv+HV55T86dQtZiuF+u4WCn5CergNGcWM2no2mfI7
	g3A6K0EfQ5HmZ8KM056odR77JCzuCYOJvZhOo=
X-Google-Smtp-Source: AGHT+IGO8gYNyMft4UV4LnzpXOLqLrxhVUFRjCEiRRHOMX5C/hrlV4pzYhyMqOeZkRrfbr0C5pv7rA==
X-Received: by 2002:a05:6402:1466:b0:64d:1fcf:3ed0 with SMTP id 4fb4d7f45d1cf-65097e4d2dbmr15640222a12.17.1768206974942;
        Mon, 12 Jan 2026 00:36:14 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6648fsm16971938a12.28.2026.01.12.00.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:36:14 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-pycares: Upgrade 4.11.0 -> 5.0.1
Date: Mon, 12 Jan 2026 10:36:10 +0200
Message-ID: <20260112083611.4017493-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112083611.4017493-1-leon.anavi@konsulko.com>
References: <20260112083611.4017493-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 08:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123367

Upgrade to release 5.0.1:

- Use Literal for type
- Use CMake for compiling c-ares
- Move project metadata to pyproject.toml
- Remove gethostbyname
- Remove getsock
- Replace ares_{get,set}servers with ares_{get,set}_servers_csv
- Remove ares_init and ares_mkquery, they are unused
- Make c-ares thread-safety mandatory
- Migrate API to c-ares' dnsrec variants
- Build wheels in parallel
- Update bundled c-ares to v1.34.6
- Make callback a mandatory kwarg-only argument
- Return bytes data for TXT records
- Add support for TLSA, HTTP and URI queries
- Remove event_thread option, make it implicit
- Fix IDNA 2008 test

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pycares_4.11.0.bb => python3-pycares_5.0.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycares_4.11.0.bb => python3-pycares_5.0.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pycares_4.11.0.bb b/meta-python/recipes-devtools/python/python3-pycares_5.0.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pycares_4.11.0.bb
rename to meta-python/recipes-devtools/python/python3-pycares_5.0.1.bb
index 974f4f3ed6..968357a1c9 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_4.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_5.0.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/saghul/pycares"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1538fcaea82ebf2313ed648b96c69b1"
 
-SRC_URI[sha256sum] = "c863d9003ca0ce7df26429007859afd2a621d3276ed9fef154a9123db9252557"
+SRC_URI[sha256sum] = "5a3c249c830432631439815f9a818463416f2a8cbdb1e988e78757de9ae75081"
 
 PYPI_PACKAGE = "pycares"
 
-- 
2.47.3


