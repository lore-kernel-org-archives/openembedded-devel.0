Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97B0D1CDDB
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 10:51:54 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.15547.1729594311984265588
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 03:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=rC/kh2K5;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d51055097so3974936f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729594310; x=1730199110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d7n6U0qdK/zWXYF5sEVUDYPz+AATOw2r16iCOfL25Fg=;
        b=rC/kh2K5IJ38AcctNT2kNRSzRqEclP5UZXUOAaHRK2JKL6bPZT421Z52uEHOvcqY4l
         p4I5eo/ftH+o8sl1GLnd+6YMDb24afX6upU7XLmUZr4Rha7qAZ6hVALg72cZQSilNwMn
         X8UmaGnCUfbj/Zk55pdwh5iMle+R3STO/3fKEbnhIXC3UvB0kUeoDeV9TaLVXIccvqqd
         wowOlnRWXTyeExagVTPxPkp+QVEZbCVyOyhhx6fOS2+7agsb76sDmxJtxJIXqcrALjlE
         Ymj6OaZCCHUQZ4UuRLONkIgvwuhQU9y1zJnxFiEZ8qO+wSwWE1y/MGOGU0AHZISwatE9
         6g4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729594310; x=1730199110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7n6U0qdK/zWXYF5sEVUDYPz+AATOw2r16iCOfL25Fg=;
        b=Hi6n99DT3OjF0OMcrMrk8yP4lj6m4CozpBotSsbrKEt2YCqAq/HPQnfiCsox8Dq1Q2
         ESy90C43W3vC8iXP7mhBHABZ9SUvAdXvq2l3r8H1Ib3AHnP++bPOVZwKydbuOi8uQL92
         opP4gilIcINV5E8WpVUnOq3dktczAzJ+E5IlLcvWofJqTm33CVSukOppA2sjW/nTcCVg
         l9i9tmAhK6hxIPvHnvcQ1SCmwzqisvIRo3OnW1X8U2bJ+wlPyaqyxiMRDdALR2gQP8wA
         P7dEQ0v0yxBx5t2xF+sN8ZjsYB+UeFOoWJROPde68/xemqs+ooOkrVAa1zSUJ0MpThNh
         07XA==
X-Forwarded-Encrypted: i=1; AJvYcCUPdJ4ijxNZpEbl0jaH6W15R5Xh+XCvevWwbSXXH0MqEGt57F5ILsF8yExLjwU1GSWMfvCERLmHJmtLJnz8aZRrStM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyS3k+VYNpcjr9Kk1vtKxWBlJwBZpg9VJGjM+Yy4krgHLh0NU/q
	L5+wEILv9ZSnqGNZoh5BisRd6j6qITBTNtBXAz1zEe2fRuJxEOXYTeQlGwaqqes=
X-Google-Smtp-Source: AGHT+IFpahrUY1TCyCd0nBPU/bgTjf57xotKbIZlJnGEqx5olNPzLC6+GQJHTUT9LLx8TUTJBiNHOg==
X-Received: by 2002:adf:ab03:0:b0:37c:d244:bdb1 with SMTP id ffacd0b85a97d-37ea218b670mr9236862f8f.26.1729594309880;
        Tue, 22 Oct 2024 03:51:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9c8b:c7e5:66f5:b8f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a614d0sm6357371f8f.63.2024.10.22.03.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 03:51:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH] libgpiod: update to v2.2
Date: Tue, 22 Oct 2024 12:51:33 +0200
Message-ID: <20241022105134.231556-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 10:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113087

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is a big update for libgpiod bringing in the D-Bus daemon and its
command-line client. This is why the patch is pretty hefty. The majority
of the line count comes from the removed patch that is now upstream but
the v2.2 recipe also now contains a lot of bits and pieces that make the
D-Bus daemon work both with system as well as sysvinit.

The project now packages the systemd service and udev rules that allow
the manager to run under its own user in a well sandboxed environment
but the sysvsinit script is carried in the recipe as I don't want to
put support for legacy systems in libgpiod repo.

The patch also updates the ptests for libgpiod to run three new
test-suites: one for GLib bindings, one for the command-line D-Bus
client and finally one testing some daemon corner-cases not supported by
the client.

Build tested with various config options with systemd and sysvinit (the
latter with glibc and musl) on 32- and 64-bit architectures.

The complete changelog since v2.1 (taken verbatim from the NEWS file) is
below:

libgpiod v2.2
=============

New features:
- add GObject bindings with introspection
- add a D-Bus interface to libgpiod together with a daemon implementing it and
  a command-line client
- split out the common shell test code for gpio-tools into a reusable test
  harness for GPIO command-line tools
- add minutes as a new supported time unit for tools and allow longer periods
  for timeouts, line holding, etc.
- add a script for generating sdist and wheels for python bindings
- migrate C++ tests to using Catch2 v3

Improvements:
- relicense C++ bindings under LGPL-2.1-or-later in order to make the project
  more attractive to users with GPL-3.0 restrictions
- remove dependency on grep from tools' tests
- make shell scripts pass shellcheck treewide
- use ppoll() in tools to actually achieve the advertised microsecond
  granularity of timeouts
- documentation improvements
- improve typing info in python bindings
- improve __repr__() implementations in python bindings
- make reconfiguring lines more flexible in python bindings by relaxing the
  requirement to carry the ordering of the config entries from the request
- support casting of line.Value to bool in python bindings
- various new test-cases for improved coverage treewide
- align the test cases with the current kernel requirement for specifying
  direction explicitly when reconfiguring lines

Bug fixes:
- fix C++ bindings build using slibtool
- accept the new style automatic GPIO chip labels from gpio-sim in bash tests
- fix C++ tests with recent kernels which introduced stricter reconfigure
  behavior
- fix a use-after-free bug in python bindings
- fix passing the event clock property to line requests in python bindings
- fix a memory leak in tools
- make sure the string buffers in line-info and chip-info are big enough to not
  truncate the strings they hold below the size accepted by the kernel
- remove buggy and unnecessary flags sanitization from line-config
- fix python bindings installation with Makefile build
- sanitize the return values of GPIO ioctl()s which in some cases may be
  erroneously positive
- fix requesting lines by name with multiple entries in python bindings

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 ...cxx-Migrate-C-tests-to-use-Catch2-v3.patch | 530 ------------------
 .../libgpiod/libgpiod-2.x/gpio-manager.init   |  76 +++
 .../libgpiod/libgpiod-2.x/run-ptest           |  43 +-
 .../libgpiod/libgpiod_2.1.3.bb                |  33 --
 .../recipes-support/libgpiod/libgpiod_2.2.bb  |  98 ++++
 5 files changed, 205 insertions(+), 575 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-Migrate-C-tests-to-use-Catch2-v3.patch
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-manager.init
 delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_2.1.3.bb
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-Migrate-C-tests-to-use-Catch2-v3.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-Migrate-C-tests-to-use-Catch2-v3.patch
deleted file mode 100644
index ac1eff510..000000000
--- a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-Migrate-C-tests-to-use-Catch2-v3.patch
+++ /dev/null
@@ -1,530 +0,0 @@
-From 0d3e1b3923a1fac80e9d75d8b5e33cd36f4fe659 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 31 May 2024 09:03:22 -0700
-Subject: [PATCH] bindings: cxx: Migrate C++ tests to use Catch2 v3
-
-Catch2 v3.x has API changes which needs to be addressed
-in the tests themselves, hence this changeset is to fix
-those.
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-gpio/20240531184223.3949069-1-raj.khem@gmail.com/T/#u]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
----
- bindings/cxx/tests/Makefile.am              |  2 +-
- bindings/cxx/tests/gpiod-cxx-test-main.cpp  |  3 +--
- bindings/cxx/tests/helpers.hpp              |  8 +++---
- bindings/cxx/tests/tests-chip-info.cpp      | 30 ++++++++++-----------
- bindings/cxx/tests/tests-chip.cpp           | 14 +++++-----
- bindings/cxx/tests/tests-edge-event.cpp     |  2 +-
- bindings/cxx/tests/tests-info-event.cpp     |  2 +-
- bindings/cxx/tests/tests-line-config.cpp    |  2 +-
- bindings/cxx/tests/tests-line-info.cpp      | 22 +++++++--------
- bindings/cxx/tests/tests-line-request.cpp   | 16 +++++------
- bindings/cxx/tests/tests-line-settings.cpp  |  2 +-
- bindings/cxx/tests/tests-line.cpp           |  2 +-
- bindings/cxx/tests/tests-misc.cpp           |  2 +-
- bindings/cxx/tests/tests-request-config.cpp | 10 +++----
- configure.ac                                |  4 +--
- 15 files changed, 60 insertions(+), 61 deletions(-)
-
-diff --git a/bindings/cxx/tests/Makefile.am b/bindings/cxx/tests/Makefile.am
-index fbf80a1..d9284da 100644
---- a/bindings/cxx/tests/Makefile.am
-+++ b/bindings/cxx/tests/Makefile.am
-@@ -4,7 +4,7 @@
- AM_CXXFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
- AM_CXXFLAGS += -I$(top_srcdir)/tests/gpiosim/
- AM_CXXFLAGS += -Wall -Wextra -g -std=gnu++17 $(CATCH2_CFLAGS)
--AM_LDFLAGS = -pthread
-+AM_LDFLAGS = -pthread $(CATCH2_LIBS)
- LDADD = $(top_builddir)/bindings/cxx/libgpiodcxx.la
- LDADD += $(top_builddir)/tests/gpiosim/libgpiosim.la
- 
-diff --git a/bindings/cxx/tests/gpiod-cxx-test-main.cpp b/bindings/cxx/tests/gpiod-cxx-test-main.cpp
-index 11bf8e5..ec48286 100644
---- a/bindings/cxx/tests/gpiod-cxx-test-main.cpp
-+++ b/bindings/cxx/tests/gpiod-cxx-test-main.cpp
-@@ -1,5 +1,4 @@
- // SPDX-License-Identifier: GPL-2.0-or-later
- // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
- 
--#define CATCH_CONFIG_MAIN
--#include <catch2/catch.hpp>
-+#include <catch2/catch_all.hpp>
-diff --git a/bindings/cxx/tests/helpers.hpp b/bindings/cxx/tests/helpers.hpp
-index 62d9827..62bbdf5 100644
---- a/bindings/cxx/tests/helpers.hpp
-+++ b/bindings/cxx/tests/helpers.hpp
-@@ -4,13 +4,13 @@
- #ifndef __GPIOD_CXX_TEST_HELPERS_HPP__
- #define __GPIOD_CXX_TEST_HELPERS_HPP__
- 
--#include <catch2/catch.hpp>
-+#include <catch2/catch_all.hpp>
- #include <regex>
- #include <string>
- #include <sstream>
- #include <system_error>
- 
--class system_error_matcher : public Catch::MatcherBase<::std::system_error>
-+class system_error_matcher : public Catch::Matchers::MatcherBase<::std::system_error>
- {
- public:
- 	explicit system_error_matcher(int expected_errno);
-@@ -21,7 +21,7 @@ private:
- 	::std::error_condition _m_cond;
- };
- 
--class regex_matcher : public Catch::MatcherBase<::std::string>
-+class regex_matcher : public Catch::Matchers::MatcherBase<::std::string>
- {
- public:
- 	explicit regex_matcher(const ::std::string& pattern);
-@@ -33,7 +33,7 @@ private:
- 	::std::string _m_repr;
- };
- 
--template<class T> class stringify_matcher : public Catch::MatcherBase<T>
-+template<class T> class stringify_matcher : public Catch::Matchers::MatcherBase<T>
- {
- public:
- 	explicit stringify_matcher(const ::std::string& expected) : _m_expected(expected)
-diff --git a/bindings/cxx/tests/tests-chip-info.cpp b/bindings/cxx/tests/tests-chip-info.cpp
-index 717c387..2c54f53 100644
---- a/bindings/cxx/tests/tests-chip-info.cpp
-+++ b/bindings/cxx/tests/tests-chip-info.cpp
-@@ -1,7 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0-or-later
- // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
- 
--#include <catch2/catch.hpp>
-+#include <catch2/catch_all.hpp>
- #include <gpiod.hpp>
- #include <sstream>
- 
-@@ -24,12 +24,12 @@ TEST_CASE("chip_info properties can be read", "[chip-info][chip]")
- 
- 	SECTION("get chip name")
- 	{
--		REQUIRE_THAT(info.name(), Catch::Equals(sim.name()));
-+		REQUIRE_THAT(info.name(), Catch::Matchers::Equals(sim.name()));
- 	}
- 
- 	SECTION("get chip label")
- 	{
--		REQUIRE_THAT(info.label(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(info.label(), Catch::Matchers::Equals("foobar"));
- 	}
- 
- 	SECTION("get num_lines")
-@@ -52,12 +52,12 @@ TEST_CASE("chip_info can be copied and moved", "[chip-info]")
- 	{
- 		auto copy(info);
- 
--		REQUIRE_THAT(copy.name(), Catch::Equals(sim.name()));
--		REQUIRE_THAT(copy.label(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(copy.name(), Catch::Matchers::Equals(sim.name()));
-+		REQUIRE_THAT(copy.label(), Catch::Matchers::Equals("foobar"));
- 		REQUIRE(copy.num_lines() == 4);
- 
--		REQUIRE_THAT(info.name(), Catch::Equals(sim.name()));
--		REQUIRE_THAT(info.label(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(info.name(), Catch::Matchers::Equals(sim.name()));
-+		REQUIRE_THAT(info.label(), Catch::Matchers::Equals("foobar"));
- 		REQUIRE(info.num_lines() == 4);
- 	}
- 
-@@ -67,12 +67,12 @@ TEST_CASE("chip_info can be copied and moved", "[chip-info]")
- 
- 		copy = info;
- 
--		REQUIRE_THAT(copy.name(), Catch::Equals(sim.name()));
--		REQUIRE_THAT(copy.label(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(copy.name(), Catch::Matchers::Equals(sim.name()));
-+		REQUIRE_THAT(copy.label(), Catch::Matchers::Equals("foobar"));
- 		REQUIRE(copy.num_lines() == 4);
- 
--		REQUIRE_THAT(info.name(), Catch::Equals(sim.name()));
--		REQUIRE_THAT(info.label(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(info.name(), Catch::Matchers::Equals(sim.name()));
-+		REQUIRE_THAT(info.label(), Catch::Matchers::Equals("foobar"));
- 		REQUIRE(info.num_lines() == 4);
- 	}
- 
-@@ -80,8 +80,8 @@ TEST_CASE("chip_info can be copied and moved", "[chip-info]")
- 	{
- 		auto moved(std::move(info));
- 
--		REQUIRE_THAT(moved.name(), Catch::Equals(sim.name()));
--		REQUIRE_THAT(moved.label(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(moved.name(), Catch::Matchers::Equals(sim.name()));
-+		REQUIRE_THAT(moved.label(), Catch::Matchers::Equals("foobar"));
- 		REQUIRE(moved.num_lines() == 4);
- 	}
- 
-@@ -91,8 +91,8 @@ TEST_CASE("chip_info can be copied and moved", "[chip-info]")
- 
- 		moved = ::std::move(info);
- 
--		REQUIRE_THAT(moved.name(), Catch::Equals(sim.name()));
--		REQUIRE_THAT(moved.label(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(moved.name(), Catch::Matchers::Equals(sim.name()));
-+		REQUIRE_THAT(moved.label(), Catch::Matchers::Equals("foobar"));
- 		REQUIRE(moved.num_lines() == 4);
- 	}
- }
-diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests-chip.cpp
-index c5ec19b..1ab7add 100644
---- a/bindings/cxx/tests/tests-chip.cpp
-+++ b/bindings/cxx/tests/tests-chip.cpp
-@@ -1,7 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0-or-later
- // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
- 
--#include <catch2/catch.hpp>
-+#include <catch2/catch_all.hpp>
- #include <gpiod.hpp>
- #include <sstream>
- #include <system_error>
-@@ -48,9 +48,9 @@ TEST_CASE("chip constructor works", "[chip]")
- 			.build();
- 
- 		::gpiod::chip first(sim.dev_path());
--		REQUIRE_THAT(first.get_info().label(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(first.get_info().label(), Catch::Matchers::Equals("foobar"));
- 		::gpiod::chip second(::std::move(first));
--		REQUIRE_THAT(second.get_info().label(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(second.get_info().label(), Catch::Matchers::Equals("foobar"));
- 	}
- }
- 
-@@ -70,9 +70,9 @@ TEST_CASE("chip operators work", "[chip]")
- 
- 		::gpiod::chip moved_chip(moved_sim.dev_path());
- 
--		REQUIRE_THAT(chip.get_info().label(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(chip.get_info().label(), Catch::Matchers::Equals("foobar"));
- 		chip = ::std::move(moved_chip);
--		REQUIRE_THAT(chip.get_info().label(), Catch::Equals("moved"));
-+		REQUIRE_THAT(chip.get_info().label(), Catch::Matchers::Equals("moved"));
- 	}
- 
- 	SECTION("boolean operator")
-@@ -94,7 +94,7 @@ TEST_CASE("chip properties can be read", "[chip]")
- 
- 	SECTION("get device path")
- 	{
--		REQUIRE_THAT(chip.path(), Catch::Equals(sim.dev_path()));
-+		REQUIRE_THAT(chip.path(), Catch::Matchers::Equals(sim.dev_path()));
- 	}
- 
- 	SECTION("get file descriptor")
-@@ -169,7 +169,7 @@ TEST_CASE("stream insertion operator works for chip", "[chip]")
- 			    "\", label=\"foobar\", num_lines=4))";
- 
- 		buf << chip;
--		REQUIRE_THAT(buf.str(), Catch::Equals(expected.str()));
-+		REQUIRE_THAT(buf.str(), Catch::Matchers::Equals(expected.str()));
- 	}
- 
- 	SECTION("closed chip")
-diff --git a/bindings/cxx/tests/tests-edge-event.cpp b/bindings/cxx/tests/tests-edge-event.cpp
-index 19a6ab3..db387be 100644
---- a/bindings/cxx/tests/tests-edge-event.cpp
-+++ b/bindings/cxx/tests/tests-edge-event.cpp
-@@ -1,7 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0-or-later
- // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
- 
--#include <catch2/catch.hpp>
-+#include <catch2/catch_all.hpp>
- #include <chrono>
- #include <gpiod.hpp>
- #include <sstream>
-diff --git a/bindings/cxx/tests/tests-info-event.cpp b/bindings/cxx/tests/tests-info-event.cpp
-index 21c0ef0..f7ae309 100644
---- a/bindings/cxx/tests/tests-info-event.cpp
-+++ b/bindings/cxx/tests/tests-info-event.cpp
-@@ -1,7 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0-or-later
- // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
- 
--#include <catch2/catch.hpp>
-+#include <catch2/catch_all.hpp>
- #include <chrono>
- #include <filesystem>
- #include <gpiod.hpp>
-diff --git a/bindings/cxx/tests/tests-line-config.cpp b/bindings/cxx/tests/tests-line-config.cpp
-index 5e439a1..2f510fb 100644
---- a/bindings/cxx/tests/tests-line-config.cpp
-+++ b/bindings/cxx/tests/tests-line-config.cpp
-@@ -1,7 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0-or-later
- // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
- 
--#include <catch2/catch.hpp>
-+#include <catch2/catch_all.hpp>
- #include <gpiod.hpp>
- 
- #include "gpiosim.hpp"
-diff --git a/bindings/cxx/tests/tests-line-info.cpp b/bindings/cxx/tests/tests-line-info.cpp
-index 21211f2..8589da3 100644
---- a/bindings/cxx/tests/tests-line-info.cpp
-+++ b/bindings/cxx/tests/tests-line-info.cpp
-@@ -1,7 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0-or-later
- // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
- 
--#include <catch2/catch.hpp>
-+#include <catch2/catch_all.hpp>
- #include <gpiod.hpp>
- #include <string>
- 
-@@ -35,9 +35,9 @@ TEST_CASE("get_line_info() works", "[chip][line-info]")
- 		auto info = chip.get_line_info(0);
- 
- 		REQUIRE(info.offset() == 0);
--		REQUIRE_THAT(info.name(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(info.name(), Catch::Matchers::Equals("foobar"));
- 		REQUIRE(info.used());
--		REQUIRE_THAT(info.consumer(), Catch::Equals("hog"));
-+		REQUIRE_THAT(info.consumer(), Catch::Matchers::Equals("hog"));
- 		REQUIRE(info.direction() == ::gpiod::line::direction::OUTPUT);
- 		REQUIRE_FALSE(info.active_low());
- 		REQUIRE(info.bias() == ::gpiod::line::bias::UNKNOWN);
-@@ -74,9 +74,9 @@ TEST_CASE("line properties can be retrieved", "[line-info]")
- 		auto info6 = chip.get_line_info(6);
- 
- 		REQUIRE(info4.offset() == 4);
--		REQUIRE_THAT(info4.name(), Catch::Equals("baz"));
-+		REQUIRE_THAT(info4.name(), Catch::Matchers::Equals("baz"));
- 		REQUIRE(info4.used());
--		REQUIRE_THAT(info4.consumer(), Catch::Equals("hog4"));
-+		REQUIRE_THAT(info4.consumer(), Catch::Matchers::Equals("hog4"));
- 		REQUIRE(info4.direction() == direction::OUTPUT);
- 		REQUIRE(info4.edge_detection() == edge::NONE);
- 		REQUIRE_FALSE(info4.active_low());
-@@ -102,10 +102,10 @@ TEST_CASE("line_info can be copied and moved")
- 	{
- 		auto copy(info);
- 		REQUIRE(copy.offset() == 2);
--		REQUIRE_THAT(copy.name(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(copy.name(), Catch::Matchers::Equals("foobar"));
- 		/* info can still be used */
- 		REQUIRE(info.offset() == 2);
--		REQUIRE_THAT(info.name(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(info.name(), Catch::Matchers::Equals("foobar"));
- 	}
- 
- 	SECTION("assignment operator works")
-@@ -113,17 +113,17 @@ TEST_CASE("line_info can be copied and moved")
- 		auto copy = chip.get_line_info(0);
- 		copy = info;
- 		REQUIRE(copy.offset() == 2);
--		REQUIRE_THAT(copy.name(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(copy.name(), Catch::Matchers::Equals("foobar"));
- 		/* info can still be used */
- 		REQUIRE(info.offset() == 2);
--		REQUIRE_THAT(info.name(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(info.name(), Catch::Matchers::Equals("foobar"));
- 	}
- 
- 	SECTION("move constructor works")
- 	{
- 		auto copy(::std::move(info));
- 		REQUIRE(copy.offset() == 2);
--		REQUIRE_THAT(copy.name(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(copy.name(), Catch::Matchers::Equals("foobar"));
- 	}
- 
- 	SECTION("move assignment operator works")
-@@ -131,7 +131,7 @@ TEST_CASE("line_info can be copied and moved")
- 		auto copy = chip.get_line_info(0);
- 		copy = ::std::move(info);
- 		REQUIRE(copy.offset() == 2);
--		REQUIRE_THAT(copy.name(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(copy.name(), Catch::Matchers::Equals("foobar"));
- 	}
- }
- 
-diff --git a/bindings/cxx/tests/tests-line-request.cpp b/bindings/cxx/tests/tests-line-request.cpp
-index 9632ae0..af8b979 100644
---- a/bindings/cxx/tests/tests-line-request.cpp
-+++ b/bindings/cxx/tests/tests-line-request.cpp
-@@ -1,7 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0-or-later
- // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
- 
--#include <catch2/catch.hpp>
-+#include <catch2/catch_all.hpp>
- #include <gpiod.hpp>
- #include <sstream>
- #include <stdexcept>
-@@ -20,7 +20,7 @@ using pull = ::gpiosim::chip::pull;
- 
- namespace {
- 
--class value_matcher : public Catch::MatcherBase<value>
-+class value_matcher : public Catch::Matchers::MatcherBase<value>
- {
- public:
- 	value_matcher(pull pull, bool active_low = false)
-@@ -117,7 +117,7 @@ TEST_CASE("consumer string is set correctly", "[line-request]")
- 		auto info = chip.get_line_info(2);
- 
- 		REQUIRE(info.used());
--		REQUIRE_THAT(info.consumer(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(info.consumer(), Catch::Matchers::Equals("foobar"));
- 	}
- 
- 	SECTION("empty consumer")
-@@ -130,7 +130,7 @@ TEST_CASE("consumer string is set correctly", "[line-request]")
- 		auto info = chip.get_line_info(2);
- 
- 		REQUIRE(info.used());
--		REQUIRE_THAT(info.consumer(), Catch::Equals("?"));
-+		REQUIRE_THAT(info.consumer(), Catch::Matchers::Equals("?"));
- 	}
- }
- 
-@@ -380,7 +380,7 @@ TEST_CASE("line_request can be moved", "[line-request]")
- 		auto moved(::std::move(request));
- 
- 		REQUIRE(moved.fd() == fd);
--		REQUIRE_THAT(moved.offsets(), Catch::Equals(offs));
-+		REQUIRE_THAT(moved.offsets(), Catch::Matchers::Equals(offs));
- 	}
- 
- 	SECTION("move assignment operator works")
-@@ -388,7 +388,7 @@ TEST_CASE("line_request can be moved", "[line-request]")
- 		another = ::std::move(request);
- 
- 		REQUIRE(another.fd() == fd);
--		REQUIRE_THAT(another.offsets(), Catch::Equals(offs));
-+		REQUIRE_THAT(another.offsets(), Catch::Matchers::Equals(offs));
- 	}
- }
- 
-@@ -484,7 +484,7 @@ TEST_CASE("line_request stream insertion operator works", "[line-request]")
- 	{
- 		buf << request;
- 
--		REQUIRE_THAT(buf.str(), Catch::Equals(expected.str()));
-+		REQUIRE_THAT(buf.str(), Catch::Matchers::Equals(expected.str()));
- 	}
- 
- 	SECTION("request released")
-@@ -493,7 +493,7 @@ TEST_CASE("line_request stream insertion operator works", "[line-request]")
- 
- 		buf << request;
- 
--		REQUIRE_THAT(buf.str(), Catch::Equals("gpiod::line_request(released)"));
-+		REQUIRE_THAT(buf.str(), Catch::Matchers::Equals("gpiod::line_request(released)"));
- 	}
- }
- 
-diff --git a/bindings/cxx/tests/tests-line-settings.cpp b/bindings/cxx/tests/tests-line-settings.cpp
-index dc821bb..2690331 100644
---- a/bindings/cxx/tests/tests-line-settings.cpp
-+++ b/bindings/cxx/tests/tests-line-settings.cpp
-@@ -1,7 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0-or-later
- // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
- 
--#include <catch2/catch.hpp>
-+#include <catch2/catch_all.hpp>
- #include <gpiod.hpp>
- 
- #include "helpers.hpp"
-diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
-index 319012a..abd0e08 100644
---- a/bindings/cxx/tests/tests-line.cpp
-+++ b/bindings/cxx/tests/tests-line.cpp
-@@ -1,7 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0-or-later
- // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
- 
--#include <catch2/catch.hpp>
-+#include <catch2/catch_all.hpp>
- #include <gpiod.hpp>
- 
- #include "helpers.hpp"
-diff --git a/bindings/cxx/tests/tests-misc.cpp b/bindings/cxx/tests/tests-misc.cpp
-index f06dc39..33fc3fa 100644
---- a/bindings/cxx/tests/tests-misc.cpp
-+++ b/bindings/cxx/tests/tests-misc.cpp
-@@ -1,7 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0-or-later
- // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
- 
--#include <catch2/catch.hpp>
-+#include <catch2/catch_all.hpp>
- #include <filesystem>
- #include <gpiod.hpp>
- #include <string>
-diff --git a/bindings/cxx/tests/tests-request-config.cpp b/bindings/cxx/tests/tests-request-config.cpp
-index 66eb748..d71e91b 100644
---- a/bindings/cxx/tests/tests-request-config.cpp
-+++ b/bindings/cxx/tests/tests-request-config.cpp
-@@ -1,7 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0-or-later
- // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
- 
--#include <catch2/catch.hpp>
-+#include <catch2/catch_all.hpp>
- #include <cstddef>
- #include <gpiod.hpp>
- #include <string>
-@@ -33,7 +33,7 @@ TEST_CASE("request_config can be moved", "[request-config]")
- 	SECTION("move constructor works")
- 	{
- 		auto moved(::std::move(cfg));
--		REQUIRE_THAT(moved.consumer(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(moved.consumer(), Catch::Matchers::Equals("foobar"));
- 		REQUIRE(moved.event_buffer_size() == 64);
- 	}
- 
-@@ -43,7 +43,7 @@ TEST_CASE("request_config can be moved", "[request-config]")
- 
- 		moved = ::std::move(cfg);
- 
--		REQUIRE_THAT(moved.consumer(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(moved.consumer(), Catch::Matchers::Equals("foobar"));
- 		REQUIRE(moved.event_buffer_size() == 64);
- 	}
- }
-@@ -55,7 +55,7 @@ TEST_CASE("request_config mutators work", "[request-config]")
- 	SECTION("set consumer")
- 	{
- 		cfg.set_consumer("foobar");
--		REQUIRE_THAT(cfg.consumer(), Catch::Equals("foobar"));
-+		REQUIRE_THAT(cfg.consumer(), Catch::Matchers::Equals("foobar"));
- 	}
- 
- 	SECTION("set event_buffer_size")
-@@ -77,7 +77,7 @@ TEST_CASE("request_config stream insertion operator works", "[request-config]")
- 
- 	::std::string expected("gpiod::request_config(consumer='foobar', event_buffer_size=32)");
- 
--	REQUIRE_THAT(buf.str(), Catch::Equals(expected));
-+	REQUIRE_THAT(buf.str(), Catch::Matchers::Equals(expected));
- }
- 
- } /* namespace */
-diff --git a/configure.ac b/configure.ac
-index a2370c5..216007e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -206,9 +206,9 @@ then
- 
- 	if test "x$with_tests" = xtrue
- 	then
--		PKG_CHECK_MODULES([CATCH2], [catch2],, [
-+		PKG_CHECK_MODULES([CATCH2], [catch2-with-main],, [
- 			AC_LANG_PUSH([C++])
--			AC_CHECK_HEADERS([catch2/catch.hpp], [], [HEADER_NOT_FOUND_CXX([catch2/catch.hpp])])
-+			AC_CHECK_HEADERS([catch2/catch_all.hpp], [], [HEADER_NOT_FOUND_CXX([catch2/catch_all.hpp])])
- 			AC_LANG_POP([C++])
- 		])
- 	fi
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-manager.init b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-manager.init
new file mode 100644
index 000000000..e36755eea
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-manager.init
@@ -0,0 +1,76 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:		gpio-manager
+# Required-Start:	$remote_fs $syslog
+# Required-Stop:	$remote_fs $syslog
+# Default-Start:	2 3 4 5
+# Default-Stop:		1
+# Short-Description:	Centralized GPIO manager daemon
+### END INIT INFO
+#
+# -*- coding: utf-8 -*-
+# Debian init.d script for gpio-manager
+# Copyright (c) 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+# set -e
+
+# Source function library.
+. /etc/init.d/functions
+
+DAEMON=/usr/bin/gpio-manager
+NAME=gpio-manager
+PIDFILE=/var/run/gpio-manager/pid
+DESC="GPIO manager daemon"
+
+test -x $DAEMON || exit 0
+test "$ENABLED" != "0" || exit 0
+
+do_start()
+{
+	mkdir -p "`dirname $PIDFILE`"
+	if [ -e $PIDFILE ]; then
+		PIDDIR=/proc/$(cat $PIDFILE)
+		if [ -d ${PIDDIR} -a "$(readlink -f ${PIDDIR}/exe)" = "${DAEMON}" ]; then
+			echo "$DESC already started; not starting."
+		else
+			echo "Removing stale PID file $PIDFILE."
+			rm -f $PIDFILE
+		fi
+	fi
+
+	echo -n "Starting $DESC: "
+	start-stop-daemon --user gpio-manager --background --start --quiet --make-pidfile --pidfile $PIDFILE --exec $DAEMON
+	echo "$NAME."
+}
+
+do_stop()
+{
+	echo -n "Stopping $DESC: "
+	start-stop-daemon --stop --quiet --pidfile $PIDFILE
+	echo "$NAME."
+	rm -f $PIDFILE
+}
+
+case "$1" in
+	start)
+		do_start
+	;;
+	stop)
+		do_stop
+	;;
+	status)
+		status $DAEMON
+		exit $?
+	;;
+	restart)
+		do_stop
+		sleep 1
+		do_start
+	;;
+	*)
+		echo "Usage: /etc/init.d/$NAME {start|stop|status|restart}" >&2
+		exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/run-ptest b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/run-ptest
index 29ec0d102..eae172116 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/run-ptest
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/run-ptest
@@ -1,24 +1,43 @@
 #!/bin/sh
 
-testbins="gpiod-test gpio-tools-test.bash gpiod-cxx-test"
-
 ptestdir=$(dirname "$(readlink -f "$0")")
 cd $ptestdir/tests
 
+export GPIODBUS_TEST_DAEMON_PATH="$ptestdir/tests/gpio-manager"
+export PATH="$ptestdir/tests/:$PATH"
+
 # libgpiod v2 uses gpio-sim - a configfs-based testing module. We need to
 # make sure configfs is mounted before running any tests.
 modprobe configfs
 mountpoint /sys/kernel/config > /dev/null || mount -t configfs configfs /sys/kernel/config
 
-for testbin in $testbins; do
-	if test -e ./$testbin; then
-		./$testbin > ./$testbin.out 2>&1
-		if [ $? -ne 0 ]; then
-			echo "FAIL: $testbin"
-		else
-			echo "PASS: $testbin"
-		fi
+# Make sure the daemon is not running during tests.
+systemctl stop gpio-manager 2> /dev/null > /dev/null
+service gpio-manager stop 2> /dev/null > /dev/null
+
+run_one_test() {
+	testbin="$1"
+
+	./$testbin > ./$testbin.out 2>&1
+	if [ $? -ne 0 ]; then
+		echo "FAIL: $testbin"
 	else
-		echo "SKIP: $testbin"
+		echo "PASS: $testbin"
 	fi
-done
+}
+
+run_one_test gpiod-test
+run_one_test gpio-tools-test.bash
+run_one_test gpiod-cxx-test
+run_one_test gpiod-glib-test
+
+# Wait for the leftover uevents to be emitted before running DBus tests.
+udevadm settle
+run_one_test gpiodbus-test
+
+udevadm settle
+gpio-manager 2> /dev/null > /dev/null &
+GPIO_MANAGER_PID=$!
+run_one_test gpiocli-test.bash
+kill $GPIO_MANAGER_PID
+wait $GPIO_MANAGER_PID
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.3.bb
deleted file mode 100644
index 6130371e4..000000000
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.3.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-require libgpiod.inc
-
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
-LIC_FILES_CHKSUM = " \
-    file://LICENSES/GPL-2.0-or-later.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-    file://LICENSES/LGPL-2.1-or-later.txt;md5=4b54a1fd55a448865a0b32d41598759d \
-    file://LICENSES/CC-BY-SA-4.0.txt;md5=fba3b94d88bfb9b81369b869a1e9a20f \
-"
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
-
-SRC_URI += "file://0001-bindings-cxx-Migrate-C-tests-to-use-Catch2-v3.patch"
-SRC_URI[sha256sum] = "2be4c0b03e995d236c0e476e14aeb475d7b431dd1439609b6d65c540f91eaf58"
-
-# Enable all project features for ptest
-PACKAGECONFIG[tests] = "--enable-tests --enable-tools --enable-bindings-cxx --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"
-PACKAGECONFIG[gpioset-interactive] = "--enable-gpioset-interactive,--disable-gpioset-interactive,libedit"
-
-PACKAGES =+ "${PN}-ptest-dev"
-FILES:${PN}-tools += "${bindir}/gpionotify"
-FILES:${PN}-ptest += "${libdir}/libgpiosim.so.*"
-FILES:${PN}-ptest-dev += "${includedir}/gpiosim.h"
-
-RDEPENDS:${PN}-ptest += " \
-    ${@bb.utils.contains('PTEST_ENABLED', '1', 'shunit2 bash', '', d)} \
-"
-RRECOMMENDS:${PN}-ptest += "kernel-module-gpio-sim kernel-module-configfs"
-
-do_install_ptest:append() {
-    install -m 0755 ${B}/bindings/cxx/tests/.libs/gpiod-cxx-test ${D}${PTEST_PATH}/tests/
-    install -m 0755 ${S}/tools/gpio-tools-test.bash ${D}${PTEST_PATH}/tests/
-    install -m 0644 ${S}/tests/gpiosim/gpiosim.h ${D}${includedir}/gpiosim.h
-}
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
new file mode 100644
index 000000000..acb89434b
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
@@ -0,0 +1,98 @@
+require libgpiod.inc
+
+inherit systemd update-rc.d useradd gobject-introspection
+
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSES/GPL-2.0-or-later.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://LICENSES/LGPL-2.1-or-later.txt;md5=4b54a1fd55a448865a0b32d41598759d \
+    file://LICENSES/CC-BY-SA-4.0.txt;md5=fba3b94d88bfb9b81369b869a1e9a20f \
+"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
+
+SRC_URI += "file://gpio-manager.init"
+
+SRC_URI[sha256sum] = "0d72266929e5347aa939e87d3e4e9bbed2fcd0f9a0b4d73d5384505fc6344939"
+
+S = "${UNPACKDIR}/${PN}-2.2"
+
+# Enable all project features for ptest
+PACKAGECONFIG[tests] = " \
+    --enable-tests --enable-tools --enable-bindings-cxx --enable-bindings-glib --enable-gpioset-interactive --enable-dbus, \
+    --disable-tests, \
+    kmod util-linux glib-2.0 catch2 libedit glib-2.0-native libgudev, \
+    bash glib-2.0-utils libgpiod-manager shunit2 \
+"
+PACKAGECONFIG[gpioset-interactive] = "--enable-gpioset-interactive,--disable-gpioset-interactive,libedit"
+PACKAGECONFIG[glib] = "--enable-bindings-glib,--disable-bindings-glib,glib-2.0 glib-2.0-native"
+PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,glib-2.0 glib-2.0-native libgudev"
+
+PACKAGES =+ "${PN}-ptest-dev ${PN}-glib ${PN}-manager ${PN}-cli"
+FILES:${PN}-tools += "${bindir}/gpionotify"
+FILES:${PN}-ptest += "${libdir}/libgpiosim.so.*"
+FILES:${PN}-ptest-dev += "${includedir}/gpiosim.h"
+FILES:${PN}-glib += "${libdir}/libgpiod-glib.so.*"
+FILES:${PN}-manager += " \
+    ${bindir}/gpio-manager \
+    ${sysconfdir}/dbus-1/system.d/io.gpiod1.conf \
+    ${datadir}/dbus-1/interfaces/io.gpiod1.xml \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_system_unitdir}/gpio-manager.service', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${sysconfdir}/init.d/gpio-manager', '', d)} \
+"
+FILES:${PN}-cli += "${bindir}/gpiocli"
+
+RDEPENDS:${PN}-manager += "dbus"
+
+SYSTEMD_PACKAGES = "${PN}-manager"
+
+python __anonymous() {
+    distro_features = d.getVar("DISTRO_FEATURES").split()
+    packageconfig = d.getVar("PACKAGECONFIG").split()
+    pn = d.getVar("PN")
+
+    if "systemd" in distro_features and "dbus" in packageconfig:
+        d.appendVar("EXTRA_OECONF", " --enable-systemd")
+        # We need to set it conditionally or else the systemd class will look
+        # for the file that we don't install with systemd support disabled.
+        d.setVar("SYSTEMD_SERVICE:{}-manager".format(pn), "gpio-manager.service")
+    else:
+        d.appendVar("EXTRA_OECONF", " --disable-systemd")
+}
+
+UPDATERCPN = "${PN}-manager"
+INITSCRIPT_NAME = "gpio-manager"
+INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 20 0 1 6 ."
+
+USERADD_PACKAGES = "${PN}-manager"
+GROUPADD_PARAM:${PN}-manager = "--system gpio"
+USERADD_PARAM:${PN}-manager = "--system -M -s /bin/nologin -g gpio gpio-manager"
+
+RDEPENDS:${PN}-ptest += " \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'shunit2 bash', '', d)} \
+"
+RRECOMMENDS:${PN}-ptest += "kernel-module-gpio-sim kernel-module-configfs"
+INSANE_SKIP:${PN}-ptest += "buildpaths"
+
+do_compile:prepend() {
+    export GIR_EXTRA_LIBS_PATH="${B}/lib/.libs"
+}
+
+do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${UNPACKDIR}/gpio-manager.init ${D}${sysconfdir}/init.d/gpio-manager
+    fi
+}
+
+do_install_ptest:append() {
+    install -m 0755 ${B}/bindings/cxx/tests/.libs/gpiod-cxx-test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${S}/tools/gpio-tools-test.bash ${D}${PTEST_PATH}/tests/
+    install -m 0644 ${S}/tests/scripts/gpiod-bash-test-helper.inc ${D}${PTEST_PATH}/tests/
+    install -m 0644 ${S}/tests/gpiosim/gpiosim.h ${D}${includedir}/gpiosim.h
+    install -m 0755 ${B}/bindings/glib/tests/.libs/gpiod-glib-test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/dbus/tests/.libs/gpiodbus-test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${S}/dbus/client/gpiocli-test.bash ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/dbus/manager/.libs/gpio-manager ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/dbus/client/.libs/gpiocli ${D}${PTEST_PATH}/tests/
+}
-- 
2.30.2


