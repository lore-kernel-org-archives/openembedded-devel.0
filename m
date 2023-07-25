Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74CBC04A6A
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 19:09:55 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web11.28964.1690312193369534691
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 12:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=oE+J18yR;
 spf=pass (domain: baylibre.com, ip: 209.85.217.44, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-440bb9bad3cso2065317137.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 12:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690312192; x=1690916992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJhGqsj/skYMmyG0B0OTXupV2ChtaDSFWJjBullVk3k=;
        b=oE+J18yRLUFisyTh8cYy4I5KljCG2RWZV2s5W5Fdkr1G4Bl80UrJxfViHWTxzNCNs7
         5E9BrOsUhu70Dv6+rhySV1SR1KdKqXEOiYZyHPAWWrgqNmTwF+3Cxd7QyLnzJ52+HAoV
         znjBdVfVGMKrg0bhErLT/JcbMYcuvAqqKQHmijLe2Lx66m+7b9G6sr/BNgfRtJYgINax
         LKj/dEPg8y4Bv5BED7MVAMdRrUqwvv+hSU1xLivb9siKYfKrVUGI+WsIvUQm/HcBWp85
         tgyMplVX/XkUUgs2WOezd6iQHyDXB35v4UWgU03UCqJ/ZkLeNao+/dwhpkzO4VktUpwx
         CmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690312192; x=1690916992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJhGqsj/skYMmyG0B0OTXupV2ChtaDSFWJjBullVk3k=;
        b=UfP2w7vOru6IuN0YB5ehWTI7jut16c11VP/0NedQX4oQvDpZuBcfo9VYJHophsbpsh
         bswSnQzMUZVgkZ3ZazOpbWQceU5R0NWr6rPjFbNWjLjPqp7CPo21NPSvyAT3ctyZlwlJ
         53J5DmuF9OOBCgeEDjs4YQkeOjSGqdLMAlfTKf5MgFxtEau6lm+Y/nrHrzwNjmilk9I6
         6loqHEFXrYkHN0Xjr9G8hKs5Xw31jVbr/FfPtEH+S5TvfVkCKsBZLUcqHJkNoYjrZ6Kb
         +rdjaLhvHN48vc5h6LVZKxi+iOmtjNhp+7rVbJh8+FCVR5S4OeN2CaEgEDELLF3jPsM9
         IslQ==
X-Gm-Message-State: ABy/qLb4rQ5dT+kM6w5czHnYLeEKPGUd/ZBMTRdlX7a1JYpQNlu4HHV+
	bccdHUVFGRXXMPIiUjIqv0unheyjvJsW1iA1HgY=
X-Google-Smtp-Source: APBJJlF6ASbP9AWPo9TuR5H2Vx/omDI6BDRx/KlKtW3KYuiMZuH5xWlOaRIp8W6DQpLLFVitZuz44A==
X-Received: by 2002:a67:e8d0:0:b0:443:853c:bd51 with SMTP id y16-20020a67e8d0000000b00443853cbd51mr4675865vsn.29.1690312192192;
        Tue, 25 Jul 2023 12:09:52 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id z9-20020a0cf249000000b005ef81cc63ccsm4526109qvl.117.2023.07.25.12.09.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 12:09:51 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/7] python3-pyaudio: upgrade 0.2.11 -> 0.2.13
Date: Tue, 25 Jul 2023 15:09:41 -0400
Message-ID: <20230725190947.660933-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725190947.660933-1-tgamblin@baylibre.com>
References: <20230725190947.660933-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 19:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104022

License-Update: Move to LICENSE.txt

Changelog:

2022-12-26  Hubert Pham  <hubert@mit.edu>

  PyAudio 0.2.13

  * Move pyaudio.Stream to pyaudio.PyAudio.Stream.
    The pyaudio.Stream class is now pyaudio.PyAudio.Stream, nested under the
    existing pyaudio.PyAudio class. This should not affect existing code, as
    directly accessing the module-level pyaudio.Stream class has always been
    unsupported (use PyAudio.open instead). Accessing pyaudio.Stream
    directly is deprecated and will raise a DeprecationWarning.

  * Deprecate PaMacCoreStreamInfo's get_channel_map() and get_flags() methods.
    Use the channel_map and flags properties, respectively, instead. Also
    deprecates internal method _get_host_api_stream_object. Calling
    deprecated methods will raise a DeprecationWarning.

  * Package PyAudio as an actual package (directory).
    Previously, the library deployed a single pyaudio.py file and a C
    extension module to the root of site-packages. Now, the library deploys
    a Python package.

  * Add default shared library path for Homebrew installations on Apple Silicon.

  * Refactor and cleanup.
    - Refactor C extension for better maintainability.
    - Add more unit tests.
    - Update and modernize examples directory.
    - Improve C and python style conformance, plus many cosmetic updates.

2022-07-18  Hubert Pham  <hubert@mit.edu>

  PyAudio 0.2.12

  - Modernize build process for Microsoft Windows, using the native toolchain.

    Setuptool setup.py and INSTALL instructions are more streamlined.
    Building from Cygwin/MinGW is no longer supported nor tested.

    Thanks to Sean Zimmermann for the patches and general help!

  - Change default frames per buffer size to paFramesPerBufferUnspecified.

    Previously, pyaudio.py set a default frames per buffer size of 1024,
    which can lead to dropped frames on some systems.  Now, by default,
    PortAudio selects the buffer size based on host and latency
    requirements.

    Thanks to Jason Hihn for the suggestion!

  - Minor fixes and refactoring for compatibility with Python 3.7+.

    Updates include:
    * Remove call to deprecated PyEval_InitThreads() for Python 3.7+
    * Use Py_ssize_t types in appropriate places (for Python 3.10+).
    * Remove the min macro to ease compilation for Windows.

  - Use the locale's preferred encoding to decode device names.

    Thanks to Eiichi Takamori for the patch!

  - Unit tests: add skipIf decorators to skip tests that require hardware.

    Set the PYAUDIO_SKIP_HW_TESTS environment variable to disable tests that
    require sound hardware, useful for (automated) test environments without
    access to audio devices.

    Thanks to Matěj Cepl for the suggestion and patch!

  - Documentation, examples, and unit tests: various fixes.
    * Add more unit tests and repair a few that test the GIL on macOS.
    * Remove examples/error.py, which is redundant with tests/error_tests.py.
    * Fix type documentation of return value types in docstrings.

    Thanks to Vasily Zakharov for pointing out the return-value type errors!

  - Modernize packaging: add LICENSE.txt, pyproject.toml, and classifiers.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...{python3-pyaudio_0.2.11.bb => python3-pyaudio_0.2.13.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyaudio_0.2.11.bb => python3-pyaudio_0.2.13.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.13.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
rename to meta-python/recipes-devtools/python/python3-pyaudio_0.2.13.bb
index 802ca35100..dbeed9c2d8 100644
--- a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
+++ b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.13.bb
@@ -1,12 +1,12 @@
 SUMMARY = "PyAudio provides Python bindings for PortAudio, the cross-platform audio I/O library"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README;md5=288793c2b9b05bd67abbd2a8f5d144f7"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7c3152b432b96d6dc4a1cb35397da9ec"
 
 PYPI_PACKAGE = "PyAudio"
 
-SRC_URI[md5sum] = "7e4c88139284033f67b4336c74eda3b8"
-SRC_URI[sha256sum] = "93bfde30e0b64e63a46f2fd77e85c41fd51182a4a3413d9edfaf9ffaa26efb74"
+SRC_URI[md5sum] = "41199ffd2abbdaf1ce6b88cf8af48cc5"
+SRC_URI[sha256sum] = "26bccc81e4243d1c0ff5487e6b481de6329fcd65c79365c267cef38f363a2b56"
 
 inherit pypi setuptools3
 
-- 
2.41.0


