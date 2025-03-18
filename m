Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C434C35FFA
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 14:03:05 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.12593.1742306576514069410
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Mar 2025 07:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ja6cvu/5;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so22667495e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1742306575; x=1742911375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++w2iPKIpLG4zbpMrWrrHHtHv8P7dK6PGP0lCxjqMYE=;
        b=Ja6cvu/57aqY684dsaGtMdwnmJ1KD8hiVL5UItr2J6fM35IxIm5GQeOTHrwj3SjuJT
         tWP5BKlStXsxOjK/Xfw+ytIyj81LiIQhs6M+MB43XsJ9u49ZklARKzhdyWCqafUC+sZy
         0f6TGOddeZ+lNTHF3MF5nhS/JKk7NJ71Fakt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742306575; x=1742911375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++w2iPKIpLG4zbpMrWrrHHtHv8P7dK6PGP0lCxjqMYE=;
        b=LcZV0COnvWRvKSG8WelD988gD6dA11IqUGTuuG5KMnALED3FPE5OrBFdD34nKt2H6g
         VN6cuZYJUrjMIKvPQLAy5cL9PhFVkVoY1M1o6LSxDQCCR+C3Yh0HlF7YeWrg8DqIOYv/
         skVYvc8J9q28P2b80F1kKQDcricAJUMQr2epu/w2NJ7xpph5gAwtOkYW5vprFZiY0I6z
         fbeJvEAkVzUdJhh4Wzn/MDEOoQs1sNgCgz8YITLqake4vrAMQB1EiL3ZyEfvJ0cpw4TS
         QVKDNya5D2+2iHqE5ysQnmlEtL1ukTUZKlQI9ukD1Ikkcno/n1ncROEgzXyVCj34+hVP
         AUww==
X-Gm-Message-State: AOJu0YxlqtLLDXlE/OtpnsObqDG9f7CWa81MJ2OTv3OU0PEEf/L5jPIT
	mGMc+iU31jH7UDOnCOmgt6k/Az6+8RdMqpi705rLNyCJodPnig5qZ6fsfeCg9dzDEy/cD4li5Jc
	E
X-Gm-Gg: ASbGnctVShYl0PHg4F74wGP20WrkIyakEt7fIqPvj1b1JC/vSurtUOF1TjSrD9/ByQZ
	Hcev5g5f0gGRHlAWIqT2VX68RinWuX4TJ+F9tm7sn5HJpCMBe9b0iTdaefMtXVYZcw5Ox1Je16H
	O8xvXPJhBnA7mAymwManHIEFs/dWJHtDRK0Yp6vNXHpZlbpGw2YUd4DgRTVJ/FVzrwEOmNcn6Jj
	V89YlhOypmA3BYIIybleYpj+fF9EcpEVM096hvPBXZFKHbPal6cq0SClqApQB1wS8KNVRHul0bf
	RlknME4jUIl4rcQ5UaU68on6SgtgiBUng95lnKyG3SiSDH5kx2/lv1QADy1N52+V4ngvSw==
X-Google-Smtp-Source: AGHT+IHgoZz31u3jW2by/8/l6laPkiXIYlWyq/O2rjPkncmI9nzq4vbYJQFUppp2/Lr5SQ9Zn1ShxQ==
X-Received: by 2002:a05:600c:5106:b0:43b:c857:e9c8 with SMTP id 5b1f17b1804b1-43d3ba2a07fmr26151845e9.31.1742306574314;
        Tue, 18 Mar 2025 07:02:54 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d20e29a38sm131345035e9.37.2025.03.18.07.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 07:02:53 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-anyio: Upgrade 4.8.0 -> 4.9.0
Date: Tue, 18 Mar 2025 16:02:49 +0200
Message-Id: <20250318140251.522768-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 14:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116057

Upgrade to release 4.9.0:

- Added async support for temporary file handling
- Added 4 new fixtures for the AnyIO pytest plugin:
  - free_tcp_port_factory: session scoped fixture returning a
    callable that generates unused TCP port numbers
  - free_udp_port_factory: session scoped fixture returning a
    callable that generates unused UDP port numbers
  - free_tcp_port: function scoped fixture that invokes the
    free_tcp_port_factory fixture to generate a free TCP port number
  - free_udp_port: function scoped fixture that invokes the
    free_udp_port_factory fixture to generate a free UDP port number
- Added stdin argument to anyio.run_process() akin to what
  anyio.open_process(), asyncio.create_subprocess(),
  trio.run_process(), and subprocess.run()
- Added the info property to anyio.Path on Python 3.14
- Changed anyio.getaddrinfo() to ignore (invalid) IPv6 name
  resolution results when IPv6 support is disabled in Python
- Changed EndOfStream raised from MemoryObjectReceiveStream.receive()
  to leave out the AttributeError from the exception chain which
  was merely an implementation detail and caused some confusion
- Fixed traceback formatting growing quadratically with level of
  TaskGroup nesting on asyncio due to exception chaining when
  raising ExceptionGroups in TaskGroup.__aexit__
- Fixed anyio.Path.iterdir() making a blocking call in Python 3.13
- Fixed connect_tcp() producing cyclic references in tracebacks when
  raising exceptions
- Fixed anyio.to_thread.run_sync() needlessly holding on to
  references of the context, function, arguments and others until
  the next work item on asyncio

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-anyio_4.8.0.bb => python3-anyio_4.9.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.8.0.bb => python3-anyio_4.9.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.8.0.bb b/meta-python/recipes-devtools/python/python3-anyio_4.9.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-anyio_4.8.0.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.9.0.bb
index c103eba46d..9cbe26a6d5 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.9.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1d9fe889df5212298c0c0723fa20479d1b94883a2df44bd3897aa91083316f7a"
+SRC_URI[sha256sum] = "673c0c244e15788651a4ff38710fea9675823028a6f08a5eda409e0c9840a028"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.39.5


