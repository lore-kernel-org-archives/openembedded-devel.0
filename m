Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DABC55162
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 15:15:37 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14030.1785424532081980649
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2026 08:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=drGtPUJ0;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso10264505e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 08:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785424530; x=1786029330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9doJL0kPw2BdrBh2cayf004RPRRtT6naTV7BYgl+mMU=;
        b=drGtPUJ0MehaGT6zQFpmWdWGbmC0JKqRc4AI0H0YaMsLpLRAuDYBXsNaBhdk9/Hus3
         8/U0hu5xlxXYyX9QDSvnNWtfa5tIP2qUMWa90lY48WW6Pf64vmSIvDBHF4OepGByo+pW
         zspc0ioW4bLzhuQYKflki3QYGr+fkqGIC65aY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424530; x=1786029330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9doJL0kPw2BdrBh2cayf004RPRRtT6naTV7BYgl+mMU=;
        b=AwJ6o1mFb4SGf2TPy6P4VMBLDoeXWKjBucVd/QlNmZgez2/EvniZ4fBXAYdklrzC0R
         9tzkWRWkRlxk+SiwsBmGL5ClhaBs1LRH8ky4Q1YYiJ0YYjLBdA42KoOEGGewt4Qtxbv0
         Q05USzpUOQwpQ6x+9t1vp/9eUTU/RYT4S8AQluad/XeU7AjpeefxVxrSj8Mgl3dLkkM3
         rpdEVVrZdMnRG2khHsY1P/A9Vtl78PXvwYrwXovv6dPqkH8zvxDTPQd0jb9jFDkk9bQZ
         /ZCXDlBUcw9PT7qQ2zQiNdpvfuYDPXkNR2wX+K5nnHcR+fmKVrq+1mkyXePPOfSN7g9/
         wOhg==
X-Gm-Message-State: AOJu0YygMUcEMDe5zCHL3oLmjm3m2z3in2a3pzZImNB9mvFyPTN2xaYx
	ppEiJsy7xMYOZpr3b7Pva5E9tkXoWzlkG+a3WYJ1KqBybHIqwJk9XAVpoUtqCxfFxfISdCF2yir
	DxjSN
X-Gm-Gg: AR+sD12TZZ/sfaXxFSQquNmIAU6XsxDwpOXEbtk79DyuuDky7Crdeo4NvjwUzLqH61c
	4bUhWtEQJTzuZaasUTQApRx0NPDz5UEVSNX6oB3tIRzEliiI0z9UzvhwNcObFI+P6Hxg3joXJo2
	2wNj0Sy3Xwa4Ohi+uRLC1rDGnxnPaD+ZKX/XhJWuxzlKhrIvbUcFBBvC+Z+WO7qfQvdttc03k3A
	wBV9cMgywy2fHSK+n+ONViOHZGTh9Me7hIo/mL/uCU9JMJBzx6IewsABCKxstp95RKnnMgs/Plc
	U9Q6ECkbU7jRygvHA+99DdAE8DPp9chhqU1yvy2vnr7pc9dYd8CC0hCimCMSFZwDl4EebHLRBrN
	WJVGaWWFIu4A4goWHdCVQsO+utTb5ef7mTnOkIh2kmhNs24vkeDm0LFNnCB78gzblafjhuaaWH2
	gDV50bZU9hxmnYPDNPd6DoWO0OSRCV1ggOtJ12BK7RRkSTkcGbovSGM2/VJpJl/+/tn49C4pw6s
	xyRdYeYfYfuB+MZKDmcqHNGRDMLRm6VwOZNHOLTgPYwE0V+BbJEpbX9MuMey2+qr8XkbvG7sVi+
	We4Nc4C/CxVI0g==
X-Received: by 2002:a05:600c:1d99:b0:493:c535:3934 with SMTP id 5b1f17b1804b1-49804c6d1d0mr17591685e9.36.1785424529980;
        Thu, 30 Jul 2026 08:15:29 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800f0ecd4sm64044325e9.1.2026.07.30.08.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:15:29 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-wrapt: Upgrade 2.2.2 -> 2.3.0
Date: Thu, 30 Jul 2026 18:15:26 +0300
Message-ID: <20260730151527.3241842-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 15:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128571

Upgrade to release 2.3.0:

- The __trunc__(), __floor__() and __ceil__() special methods are
  now implemented by object proxies, delegating to math.trunc(),
  math.floor() and math.ceil() applied to the wrapped object. As
  with other special methods, these are only looked up on the class
  type and not the instance, so they cannot rely on the __getattr__()
  fallback of the proxy and must be implemented explicitly. Previously
  calling math.trunc() on an object proxy raised TypeError. These
  special methods sit somewhat outside the core Python object model
  in that they are not used by any builtin operators, with the math
  module being their only consumer. They are however documented as
  part of the Python data model and the math module is a key module
  in the standard library, so supporting them is warranted, in the
  same way as the existing support for __round__(), which is
  consumed by the round() builtin. Note that although math.floor()
  and math.ceil() previously appeared to work when used on an object
  proxy, they were silently falling back to converting the proxy
  using __float__(). If the wrapped object provided its own
  __floor__() or __ceil__() special methods these were ignored and
  the result could differ from that when the wrapped object was
  used directly. These now yield the same result as using the
  wrapped object directly. With thanks to Vincent Gao for the PR.

- The __fspath__() special method of the os.PathLike protocol has
  been added to the set of dunder methods which AutoObjectProxy
  detects on the wrapped object and adds to the class it
  generates, so a proxy it creates around a path-like object can
  now be used with os.fspath(), the builtin open() and other
  standard library functions accepting paths. Note that
  __fspath__() is deliberately not implemented by the base
  object proxy, since its presence on the proxy type would
  cause every proxy to be classified as path-like by code
  branching on isinstance(obj, os.PathLike). Also be aware
  that AutoObjectProxy creates a new class for every proxy
  instance, so it should not be used to wrap path-like
  objects in large numbers due to the memory overhead. For
  high-frequency use define a custom proxy class which adds an
  explicit __fspath__() method instead. See the section on
  wrapping path-like objects in the known issues documentation
  for more details.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-wrapt_2.2.2.bb => python3-wrapt_2.3.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_2.2.2.bb => python3-wrapt_2.3.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_2.2.2.bb b/meta-python/recipes-devtools/python/python3-wrapt_2.3.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-wrapt_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_2.3.0.bb
index fbe5e5719c..c493f80f13 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_2.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=63a78af2900bfcc5ce482f3b8d445898"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "0788e321027c999bf221b667bd4a54aaefd1a36283749a860ac3eb77daed0302"
+SRC_URI[sha256sum] = "681a2d0eefd721998f90642762b8e75c2159ec531b20ad5e437245ea7b06a107"
 
 # python3-misc for 'this' module
 RDEPENDS:${PN}-ptest += " \
-- 
2.47.3


