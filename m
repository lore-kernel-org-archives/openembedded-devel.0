Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECD8C79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 07:54:14 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8670.1789026844351143682
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 00:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Hm2gal49;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-486955ae01eso1061667f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 00:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789026842; x=1789631642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Htoc40vxsW2SIzFjSomiXzFIRmKkVOrbcFNcHq6YQE=;
        b=Hm2gal49jjNkLmch1sFGyvS7GDsrUWDwNEUIT5K9ZPSAYeP6tNSi1fWQzCv0+PUYwo
         hgcXfKnx6oKFQQ70SYKX7j4NEYU51gOlbwP8i14a2XnDhhPtO5L8RryansqC+odjkw8s
         zZqX/ZXRmGPdjwoHwE9vOGVT84mid3IDo+zRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789026842; x=1789631642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Htoc40vxsW2SIzFjSomiXzFIRmKkVOrbcFNcHq6YQE=;
        b=BHmGjwNj3SljUJ6DM9jcJ+SiCEhnTeXXL9hViwMlSqh3xk7OKDnCxCdc1dF0ndiw17
         n0V8VKstERu4z+OiKCYWPA0t2B84CG4wmekWYig0fwo1oHpSAeI+e1HU90d3zoiNQ8Bg
         wJtYThYIDpY2+Y7FlkqFYNOb6ZA7EyYWKqzzuxUJCdncnb3SjKWUEv1FdpULnGHGxndu
         4Ian1YbFCgqSlmdUoZj7mXRg69e1ywwUdM+FYmz2lWa8DZ1IU51rLH7VzOaZ1p70ncEX
         uU6Dwmo++2cGUBj1mjlYtRqyG43dgTrRaG1wYsLGxu0TWBoyHE6mfocCgqwru/Op9r5Z
         PBoA==
X-Gm-Message-State: AFuF++mvYCkHNeizaKa29c9SLZ3i6suJKx/H5Mufm1OIm9ucrIhH3u/Z
	uQiIV0nQTReZu5Rut7RlfrnJQpZBuK2MPOYhnawbGpCr6ciGNPsU6qulrTwzooYVjbuOOjV2FBy
	F/SOO
X-Gm-Gg: AYBFou1QTTmd3GflVYppI3yv0rUVTKbOtii31jU2D74wW7TeGpqVH2GZVR/rzcfCxSK
	KlHZjTU/AK+FSKuC+oaznDGF35D6vXigNwVdL0IS2QPUBH6O4rf8KA3K5mqqipq2AYT/5LWl9i7
	Lzga/lWkkq9drAbpRWEMZyqbsGvpoGQ1mes1X6yrA6SLe0XqIJGV0vGNhDNNoJk/Z19+6puuik6
	jbtbrJoPBgEMqrydIYQBmt6NlWDMRT8Eu3OyYlYRTxPk2jzjD2ra3HKob/HzNVLOmV6+e+kAp0S
	iuAy4kjuAltWEJ55ZwnPk9q60M9s97nMyHtC5Hod8LjXVjJ/Rp3nFXhCk6ehSGwCqOBRuDiQmZK
	nsZaDUNKSTHausypk+6TK24kgVmGSnRC4ka5KUBxuDA9aGP2u6/KR+/6PupuWEDvvA7+2qJlbMH
	hxkyhYx9kbWZpusnJ8nZudkrer/mC6ikhd1RN6Ug7onqj/+qoTP2gopJMANWDjcFIjgNE/z/6h2
	O7/jXc95oE7LCw7sM+XW/sw/cs4fdpTtn2A4UmRR1etXYN1thrQXnoHveM0RgjBeaOgdCHZXGsS
	hp4sB+wfh9QXWW+WmZ8lNZke
X-Received: by 2002:a05:600c:83c6:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49cf824328fmr422992065e9.8.1789026841980;
        Thu, 10 Sep 2026 00:54:01 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb02bffsm81686145e9.0.2026.09.10.00.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:54:01 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] fluentbit: Upgrade 5.0.9 -> 5.1.2
Date: Thu, 10 Sep 2026 10:53:58 +0300
Message-ID: <20260910075358.2962769-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 07:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129910

Upgrade to release 5.1.2:

- workflows: bump docker/setup-buildx-action from 4.2.0 to 4.3.0
- workflows: bump reviewdog/action-actionlint from 1.73.1 to 1.73.2
- workflows: bump github/codeql-action/upload-sarif from 4.37.6 to
  4.37.7
- workflows: bump uraimo/run-on-arch-action from 3.1.0 to 3.2.0
- workflows: bump github/codeql-action/upload-sarif from 4.37.7 to
  4.37.8
- in_node_exporter_metrics: Implement stat and thermal_zone for
  macOS
- out_prometheus_remote_write: Add 1-hour cut-off for expiring
  staled metrics
- out_splunk: add time_key support for the HEC event time
- Dockerfile: optimize layers
- config: fix startup abort when log_level set via env and config
- tests: runtime: Plug a SEGV occurrence on macOS
- out_gcs: add unify_tag option to buffer all tags into one file
- log: clamp the suppression length to what was written
- out_gcs: implement parquet compressions
- out_gcs: support application default credentials
- in_winevtlog: Plug a crash path
- in_winevtlog: fix crash when all channels are missing and
  ignore_missing_channels is enabled
- log: make consistency for suppress log feature
- es: opensearch: output: task: handle partial succeeded requests
- tests: runtime: Fix errors of incompatible types for in_ebpf
  tests
- filter_kubernetes: implement namespace exclude
- in_systemd: support capturing with namespace
- release: update to 5.1.2
- workflows: bump softprops/action-gh-release from 3.0.2 to 3.0.3
- workflows: bump github/codeql-action/upload-sarif from 4.37.8
  to 4.37.9
- lib: cmetrics: update to v2.2.2
- input_chunk: input_log: in_storage_backlog: address underflowing
  / overflowing chunk limit size
- out_azure_blob: Plug dangling pointers on exceptions
- out_azure_kusto: stop logging federated and access tokens
- out_gcs: add Workload Identity Federation support
- wamrc: Build with LLVM-17
- reload: preserve configuration path during hot reload
- out_s3: Clean up orphaned chunks
- config: config_format: address wrongly specified parameter on
  service section
- aws: compression: validate valid columnar formats
- multiline: add built-in json parser for JSON multiline objects
- engine: Plug a race on starting engine
- tests: integration: Adjust allocation patterns for Ubuntu 26.04
- workflows: bump helm/kind-action from 1.14.0 to 1.15.0
- workflows: bump reviewdog/action-actionlint from 1.73.2 to
  1.73.3
- workflows: bump docker/setup-qemu-action from 4.2.0 to 4.3.0
- out_opentelemetry: support metrics max datapoints
- AGENTS: Reflect circumstance of the current commit linter
- in_node_exporter_metrics: expire metrics for networking
- in_forward: ingest all metrics contexts in payload
- out_kafka: preserve infinite shutdown grace
- out_loki: scope remove_mpa thread-local cache per instance
- log: return NULL after flb_worker_context_create failure in
  flb_log_create
- in_node_exporter_metrics: plug possible overrun indexes
- packaging: stabilize Debian release images

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...rivate-makefile-targets-in-CMakelist.patch | 58 +++++--------------
 ...{fluentbit_5.0.9.bb => fluentbit_5.1.2.bb} |  2 +-
 2 files changed, 14 insertions(+), 46 deletions(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_5.0.9.bb => fluentbit_5.1.2.bb} (99%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
index 55fb0c7414..a842a322ad 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
@@ -1,4 +1,4 @@
-From 8d93bb7c866f88dd7f2cac81d2acfcffae9d555d Mon Sep 17 00:00:00 2001
+From 28d49e6aef1598e8391730407280cf83fd3bb667 Mon Sep 17 00:00:00 2001
 From: Niko Mauno <niko.mauno@vaisala.com>
 Date: Sun, 29 Sep 2024 12:00:00 +0000
 Subject: [PATCH] lib: Do not use private makefile targets in CMakelists.txt
@@ -18,54 +18,19 @@ stemming from
   $(subst /yocto/upstream/build/tmp/work/cortexa57-poky-linux/fluentbit/3.1.9/git/,,$(abspath $<))
   ...
 
+Note: lib/cfl/CMakeLists.txt no longer defines __FILENAME__ and
+lib/cmetrics/CMakeLists.txt already uses __FILE__ unconditionally in
+this version, so only lib/ctraces and lib/monkey required this change.
+
 Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
 
 Upstream-Status: Submitted [https://github.com/fluent/fluent-bit/pull/9450]
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
- lib/cfl/CMakeLists.txt      | 8 ++------
- lib/cmetrics/CMakeLists.txt | 8 ++------
- lib/ctraces/CMakeLists.txt  | 8 ++------
- lib/monkey/CMakeLists.txt   | 4 +---
- 4 files changed, 7 insertions(+), 21 deletions(-)
+ lib/ctraces/CMakeLists.txt | 8 ++------
+ lib/monkey/CMakeLists.txt  | 4 +---
+ 2 files changed, 3 insertions(+), 9 deletions(-)
 
-diff --git a/lib/cfl/CMakeLists.txt b/lib/cfl/CMakeLists.txt
-index 489570026..06d99cbbe 100644
---- a/lib/cfl/CMakeLists.txt
-+++ b/lib/cfl/CMakeLists.txt
-@@ -40,12 +40,8 @@ if(NOT MSVC)
-   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
- endif()
- 
--# Define __FILENAME__ consistently across Operating Systems
--if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
--  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__='\"$$(subst ${CMAKE_SOURCE_DIR}/,,$$(abspath $$<))\"'")
--else()
--  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
--endif()
-+# Define __FILENAME__
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
- 
- 
- 
-diff --git a/lib/cmetrics/CMakeLists.txt b/lib/cmetrics/CMakeLists.txt
-index a3385a8ba..80170f8e7 100644
---- a/lib/cmetrics/CMakeLists.txt
-+++ b/lib/cmetrics/CMakeLists.txt
-@@ -60,12 +60,8 @@ if(NOT MSVC)
-   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
- endif()
- 
--# Define __CMT_FILENAME__ consistently across Operating Systems
--if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
--  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__='\"$$(subst ${CMAKE_SOURCE_DIR}/,,$$(abspath $$<))\"'")
--else()
--  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=__FILE__")
--endif()
-+# Define __CMT_FILENAME__
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=__FILE__")
- 
- # Configuration options
- option(CMT_DEV                       "Enable development mode"                    No)
 diff --git a/lib/ctraces/CMakeLists.txt b/lib/ctraces/CMakeLists.txt
 index bb2c54fa6..7d59dd834 100644
 --- a/lib/ctraces/CMakeLists.txt
@@ -86,7 +51,7 @@ index bb2c54fa6..7d59dd834 100644
  # Configuration options
  option(CTR_DEV             "Enable development mode"                   No)
 diff --git a/lib/monkey/CMakeLists.txt b/lib/monkey/CMakeLists.txt
-index 3dc1ef28a..2d08fc5fd 100644
+index 45f96d797..cc227fdb0 100644
 --- a/lib/monkey/CMakeLists.txt
 +++ b/lib/monkey/CMakeLists.txt
 @@ -15,10 +15,8 @@ include(GNUInstallDirs)
@@ -101,3 +66,6 @@ index 3dc1ef28a..2d08fc5fd 100644
  
  # Monkey Version
  set(MK_VERSION_MAJOR  1)
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.9.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.2.bb
similarity index 99%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_5.0.9.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_5.1.2.bb
index 3996b22582..5862afba00 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.9.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.2.bb
@@ -17,7 +17,7 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "a1e05fc1f703fe0ab0373578896f395a04a7eeb5"
+SRCREV = "66910c10a4d7eafa810b84229cf2dcf7b0f26f97"
 SRC_URI = "\
     git://github.com/fluent/fluent-bit.git;nobranch=1;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
-- 
2.47.3


