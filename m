Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD22C52D73
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 08:52:44 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.79829.1723193562184372177
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 01:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ez1sZ+he;
 spf=pass (domain: konsulko.com, ip: 209.85.218.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7aa4bf4d1eso226884666b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 01:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723193560; x=1723798360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXx/2O0pCnVYvmnps9qsAdUCXjFD1t2iUQdk4CXmaqs=;
        b=Ez1sZ+he+Wln1wkx8EJ36QIjI0FbNjhxN35Ndo2ei78BIpJ4cKXLSeMDK2DSlvm4th
         ttqIaQjxMFnB1KcZNfXbcEuHFUSh/mRvhrawi2jDjEOEtTWcUyVA17rplTfzq1lxChk+
         SV0716RrTM+E4ulqenTOm7/8GyXq3Gz3fOk60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723193560; x=1723798360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXx/2O0pCnVYvmnps9qsAdUCXjFD1t2iUQdk4CXmaqs=;
        b=YXHSJk4wD0vakJa9DYefxOF9sG62F330v8B+Clyy4UY4JqaBgJzw/0gSJazxUqjeGV
         +4IvdbkXEuWCvBrMtxMtCKccoEsuFqsY2nMVZS1oJKfNo7kIrh+HexaZpyYvaCDyLYWg
         BzY/U+LwXBJrzRrRukPd4qBEeVQQRi4Xq+5IejCt4p7e/TCd+vsF4zb7O0+upeWJtj+1
         0XfUEPdORplz4KtlmB4bO1V/xphiOELWkTdnl0Ypj9sSXP8+19WdU6nzQmTDUitDagW1
         POOYu2peJMIVQJm/1PSQOCeIXebW2KtFGrs3Zq9K0owkUqmAdrtsx3IhWEF2RPvbfiVO
         jUzw==
X-Gm-Message-State: AOJu0Ywg6QZK9sOtlaOwrJJPfES4sqzaAJANZjgZoQbYN8dPcbsDGF+h
	+IjkitGBdhK79WMs3Oqd6QHelUqZGwLIH7cdJ9XAG4nYapgDXumzXvANj3/RJOAKAa1JRaPnBpW
	p
X-Google-Smtp-Source: AGHT+IF8sytQ/pb0zNULe++IIEyZM82R0aSo+iA8vG7m1dlCtwBnrWWQ181w2/TlsuXqFDPaGh3oqw==
X-Received: by 2002:a17:907:96a6:b0:a7a:a06b:eebe with SMTP id a640c23a62f3a-a80aa55b7camr74582066b.9.1723193559739;
        Fri, 09 Aug 2024 01:52:39 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3c4fsm823286366b.33.2024.08.09.01.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:52:39 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-itsdangerous: Upgrade 2.1.2 -> 2.2.0
Date: Fri,  9 Aug 2024 11:52:31 +0300
Message-Id: <20240809085236.1828180-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111685

Upgrade to release 2.2.0:

- Drop support for Python 3.7
- Use modern packaging metadata with pyproject.toml instead of
  setup.cfg
- Use flit_core instead of setuptools as build backend
- Deprecate the __version__ attribute. Use feature detection, or
  importlib.metadata.version("itsdangerous"), instead.
- Serializer and the return type of dumps is generic for type
  checking. By default it is Serializer[str] and dumps returns a
  str. If a different serializer argument is given, it will try to
  infer the return type of its dumps method.
- The default hashlib.sha1 may not be available in FIPS builds.
  Don't access it at import time so the developer has time to
  change the default.

License-Update: Renamed from LICENSE.rst to LICENSE.txt

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-itsdangerous_2.1.2.bb => python3-itsdangerous_2.2.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-itsdangerous_2.1.2.bb => python3-itsdangerous_2.2.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.2.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_2.2.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-itsdangerous_2.1.2.bb
rename to meta-python/recipes-devtools/python/python3-itsdangerous_2.2.0.bb
index 5af1d594b..f4d8d5296 100644
--- a/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-itsdangerous_2.2.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Various helpers to pass trusted data to untrusted environments and back."
 HOMEPAGE = "http://github.com/mitsuhiko/itsdangerous"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=4cda9a0ebd516714f360b0e9418cfb37"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4cda9a0ebd516714f360b0e9418cfb37"
 
-SRC_URI[sha256sum] = "5dbbc68b317e5e42f327f9021763545dc3fc3bfe22e6deb96aaf1fc38874156a"
+SRC_URI[sha256sum] = "e0050c0b7da1eea53ffaf149c0cfbb5c6e2e2b69c4bef22c81fa6eb73e5f6173"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 CLEANBROKEN = "1"
 
-- 
2.39.2


