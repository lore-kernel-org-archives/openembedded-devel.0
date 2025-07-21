Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB52C83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 10:10:02 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.36997.1753092592006591756
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 03:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=j5tUAReY;
 spf=pass (domain: konsulko.com, ip: 209.85.218.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae3a604b43bso695690966b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 03:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1753092590; x=1753697390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c9i5J+1E52R/VSByoXvYVhQ/rl34j8oQZgR/GPFHHDA=;
        b=j5tUAReYM0GVuXIQ4PVuXQzLtMXAQOP3MxVtl8TSwIXGKKgqMnAGEyXqSK/5frTXYr
         NWns0r2k5v49ZRQlQX20LCTPriHe+rCpaO8aV6SXv7PpqNgQEjxdN014G2FDdTH+BYKA
         scPkHD3lL7jfMnFjDMDrRTPp1WURCKQKMDHtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753092590; x=1753697390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9i5J+1E52R/VSByoXvYVhQ/rl34j8oQZgR/GPFHHDA=;
        b=jIYOORLAXDuCBiLjHUIFS4F/RRQ0DH+1MJhBfFdLoxSGsFxWsG+I+NDUIfv3BqF2HZ
         QXnxuCN3Wn0DnKEkkL0HJjnttfFGNTavA0P84icnvNzjppBOMXMGvbM06SxOyhSbbfLz
         Hhluklr0zXHDQmemNbu1IInqgGdV6+w6TXxVq4aiePaRxZlp/kVxfRbfptLRpS8OYIxb
         EjUvTsoT72+3KT4nLMwyrwTZZAx9OpPlMRal3AujT6RkLSEpBB39LRXnJUlIHrIt/YXA
         OX6ArZVjjt37uDeMdX4tJauLQPe9rZJdNl6MR6mAXPteGZ3NT2XYemvGItrBr37WfH4e
         cWHA==
X-Gm-Message-State: AOJu0YyoJY3JhjSqDs2JjyzocQLedyvzaeP0mew+y/xkc2ks/hz4eBa+
	T1l4x7sVqluu4pRB+hytYF3Xr91ye6lMXZ4YRthlJTrcyenIF2tXsIotW5ji/YpT8M2EBVXptW2
	KyhUd
X-Gm-Gg: ASbGnctv1HoY/KHNXQHzIIdhTq2NkOe2cLL6Bv6D1mbttPr46NOS815PjhMRPi4ErOG
	GealS+ZIyeEJFSb/W/jx9qIqNeP1ghQeJuGwu/72DhtItu9TrCZkem8ubDY3qkFHQrvAf5Cfy9d
	dyEmo9JIG776N7nBBLbtyTlsABRf4PSL9nB5u05/udcbGchhYGF0cJqUskfGBxSZuqpNbr5J/T4
	GdtoxlzXhef10/3/0ZXaAgBdJjZ+waSehnjaHVg9Ms9vPOQs1ka8ppj66N3PUhPqvCJ0FqeGgR/
	hBEZwPxcR5f0uvupBJFcydIkQS8sJoD4oZU/cx8SCpsDmjlY30KIXbQBSX1g2rsUwb8fpi2+ent
	236bKnVSmUiXEnTTYGoe0Lk8tZ3szaAg81f4q
X-Google-Smtp-Source: AGHT+IGlXfnqcNb5GYnc5LJes7Gi+hclBTY4+YHneWFwauxzm45s1lZeWcepeHkW8oP2AFWhvdWQ4w==
X-Received: by 2002:a17:907:8dc6:b0:ae3:75e5:ff7a with SMTP id a640c23a62f3a-ae9cde02beamr1888486066b.19.1753092589928;
        Mon, 21 Jul 2025 03:09:49 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c903fbecsm5238184a12.42.2025.07.21.03.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 03:09:49 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-nanobind: Upgrade 2.7.0 -> 2.8.0
Date: Mon, 21 Jul 2025 13:09:45 +0300
Message-Id: <20250721100947.1181063-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 10:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118656

Upgrade to release 2.8.0:

- Added :cpp:class:`nb::fallback <fallback>` wrapper type, which is
  a :cpp:class:`nb::handle <handle>` that always requires implicit
  conversion during casting. This is convenient when adding
  catch-all overloads that must handle arbitrary Python objects,
  without interfering with implicit conversion of arguments in
  other overloads.
- The nanobind::literals namespace now includes _s to create a
  Python string from source code literals.
- Added :cpp:func:`nb::dict::empty() <dict::empty>`,
  :cpp:func:`nb::list::empty() <list::empty>`,
  :cpp:func:`nb::set::empty() <set::empty>`,
  and :cpp:func:`nb::tuple::empty() <tuple::empty>` convenience
  methods.
- Added a :cpp:func:`nb::dict::get() <dict::get>` function to
  perform dictionary lookups with a fallback value in case of
  failures.
- Nanobind now uses multi-phase (as opposed to single-phase)
  initialization API when registering modules. However,
  multi-interpreter extensions remain unsupported.
- Added :cpp:class:`nb::frozenset` that wraps the Python frozenset
  type.
- Miscellaneous fixes and improvements.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-nanobind_2.7.0.bb => python3-nanobind_2.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nanobind_2.7.0.bb => python3-nanobind_2.8.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-nanobind_2.7.0.bb b/meta-python/recipes-devtools/python/python3-nanobind_2.8.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-nanobind_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-nanobind_2.8.0.bb
index 3cb75cba09..370130af69 100644
--- a/meta-python/recipes-devtools/python/python3-nanobind_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nanobind_2.8.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/wjakob/nanobind"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7646f9ee25e49eaf53f89a10665c568c"
 
-SRC_URI[sha256sum] = "f9f1b160580c50dcf37b6495a0fd5ec61dc0d95dae5f8004f87dd9ad7eb46b34"
+SRC_URI[sha256sum] = "94e7bf6aa1d7dff9566eddc15252aba94fdadbf67a99a169bfab34b708427cd8"
 
 inherit pypi python_setuptools_build_meta cmake lib_package
 
-- 
2.39.5


