Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC883CC6B1A
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 20:44:52 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8308.1791924286472241599
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 13:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Sqr5A+9e;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso24560855e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 13:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924285; x=1792529085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OOxm+zxHqjihH7WtmJbKtiN94Vgg32WieTEtC4NW780=;
        b=Sqr5A+9eSjzmilWLHv2QVKBWIlluM3bCkRYYQllAMKl1LqnBvvz3I+BAzfeTyi3QW2
         YqBdd+jC+fX5Dcbmpdb5lUU/7FFAd8IcFqqnUTvK0mKowUX4D6JoVTl+6TwX7KHBr4oY
         DY4yCEe8ZD2+A68o6h6f/Wm82Hv0L8ZJbhizywxwcvlDDxp14G6skLGbV+ezD4/LmlD4
         jnzHnp8pm8RVUby7C89spSrK7wbCwIyWU1oF/vl/g8qAs6Um0Yl8vZmKmCcODegWqgeX
         DQg9n5tOzM6Og/DccUy7JBH9/npp1FynajaDrocORtgH54CaomX341Etjn7KGl+kqRn/
         ZeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924285; x=1792529085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOxm+zxHqjihH7WtmJbKtiN94Vgg32WieTEtC4NW780=;
        b=Sl0K6QPPn//dx/KaFzHu/bV0AlovnuCicwt57kqOjVjd0QUfrpa1WSb1bj4NUmOiJb
         wMy2QZKt4t6nIJgDV7QoBlCJ5tB3P2skQrcRu5kdyLp6IF5mFm+hbSOu+5KErXaEK3mu
         Nj7v+dsnm4st+DYKuiP9p/t+BIuYUavsx8JMD8hottvEJjM2DS7tC7ZrjZ9fxzHZuJwx
         nTJMz5icjyOlQpp5MgHazmClNpBG8pfY22/Q/DE+ZRIPRMcIPLbJnmlpX7elujsRdeaa
         M5/zO4nKO8fC3lZ+wBnOfCvO8Xn6F6GYl/xo+4yX1cJQ2jIscZ3/pucXbCKDLhLMVHON
         PY9g==
X-Gm-Message-State: AFq9FYJErRQ4txgMvrrjT15SDCNWDBN5+2iHfRxXn07xjVUJWsfEiwah
	DH+UJmxSGh3//7QX5TUlwdEz2JKv6dNdu8+9IshJ70S2FpBYcmm+f06Ef9omtw==
X-Gm-Gg: AYBFou1W9UoboeFVmgqvjSWF3JdEK0qkNYWJFNUiPO+yDOR+yluGfL7uj17V+aBWrGB
	v8b5c+9U/k2RpzL2hq9JVcJrKJzcMi7rKIb38YAfAmTMJNXTNijFdH46LIgucw9u3Ax82aR1Fq7
	pHPHh61Fii4UdjmjzRqSnmNg6UXiwddOnTrU0Rt4PUVUmQKQM+GjdYPBVA74tFoGBX6UtTtZ44T
	Supp0tdvIxgvRVe/u9SgPsdbvZz722IZdvlA8rHJVsNF/Npnv2VYquWQd12e0Dm0KwsRe2oulsS
	qCs3lmNSLBkBmv5KtKEp6QvmOBWyhMWutSDvrfOM3UFoWqK9LWFqiu3j0CGJrDCo9yVL/0nVvtY
	ehhxAme78CAy1VXAC2OEjDBx793sCHSBAbRboIn7ucv2FHUulHV7gwfZ+PJJXNF80qHfcBnNbEs
	0u6V4BcI8UZDD8GOscaX5oRqjwSfyFCGmL/98bjg+QAqQI9sfE3zMPcNuToZrYFB0m4n/DKTUqI
	ipQsTaCwxreZdsHs1oMprBJqhJarDY81KqC/jYRUlkXDEmneZ+MIrnPmLI=
X-Received: by 2002:a05:600c:3ba2:b0:4a1:acab:234c with SMTP id 5b1f17b1804b1-4a1acab23acmr81693815e9.10.1791924284285;
        Tue, 13 Oct 2026 13:44:44 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm353802425e9.3.2026.10.13.13.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:44:43 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-python][PATCH] python3-asyncvarlink: upgrade 0.3.2 -> 0.3.3
Date: Tue, 13 Oct 2026 21:44:33 +0100
Message-ID: <20261013204432.2568606-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 20:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130866

Alex Kiernan (2):
      VarlinkTransport: stop reading after a failed peek
      VarlinkTransport: treat a failed read as a lost connection

Colin Watson (1):
      types: return NotImplemented from __eq__ for type errors

Helmut Grohne (37):
      varlinkmethod: allow overriding the return type
      reduce contents of the main import and avoid star imports
      CI: tune certification socket timeout
      CI: fixup certification timeout change
      document that it is uploaded to PyPI
      docs/structure.rst: finish truncated paragraph on file descriptors
      pyproject.toml: document development packages
      VarlinkTransport: send correct data on partial send
      validate_interface: fix acceptance of garbage at end
      create_unix_server: actually make the socket non-inheritable
      docs: adapt documentation to pause_reading/resume_reading rename
      __init__.py: improve language of initial __doc__ string
      GenericVarlinkErrorReply: provide a __str__ method
      connect_unix_varlink: fix resource leak in error path
      VarlinkTransport: delay eof_received call
      VarlinkTransport: remember the readable handler function
      VarlinkTransport: turn a magic number into a class attribute
      expand ci coverage to Python 3.15
      VarlinkTransport: fix association of messages and file descriptors
      correctly determine whether typing.override exists
      fix result type of wrapped varlinkmethod
      github: allow manually scheduling workflows
      test_protocol.py: fix missing import
      VarlinkTransport: tighten assertion
      test_protocol.py: close the transport, not the connections
      VarlinkTransport: harden resume_reading against concurrent closing
      TransportTests.test_send_socket: avoid exceptions in callbacks
      VarlinkClientProtocol.call: avoid failing future with no consumers
      test_certification.py: delete unused import
      test_protocol.py: delete unused import again
      tests: add StrictAsyncioTestCase helper class and use it
      tests: another type hint improvement
      test_conversion.py: increase precsion of two type annotations
      varlinkmethod: clarify that the type annotation must signal generators
      add a HACKING.md file clarifying development processes
      add the justfile promised in HACKING.md
      upload to pypi as version 0.3.3

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...3-asyncvarlink_0.3.2.bb => python3-asyncvarlink_0.3.3.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-asyncvarlink_0.3.2.bb => python3-asyncvarlink_0.3.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncvarlink_0.3.2.bb b/meta-python/recipes-devtools/python/python3-asyncvarlink_0.3.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-asyncvarlink_0.3.2.bb
rename to meta-python/recipes-devtools/python/python3-asyncvarlink_0.3.3.bb
index 66c69df5a8f5..8872cf67a876 100644
--- a/meta-python/recipes-devtools/python/python3-asyncvarlink_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncvarlink_0.3.3.bb
@@ -7,10 +7,9 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9ec28527f3d544b51ceb0e1907d0bf3f"
 
-SRC_URI = "git://github.com/helmutg/asyncvarlink.git;protocol=https;branch=main"
-SRCREV = "3e16139f72c7374f2ca3640045ef7162c98e7a4c"
+SRC_URI[sha256sum] = "0270e352d5c8d5348b90f547a4215bfb37a6b829b84341822f80273e830dadd4"
 
-inherit python_flit_core ptest-python-pytest
+inherit pypi python_flit_core ptest-python-pytest
 
 RDEPENDS:${PN} = "\
     python3-asyncio \

