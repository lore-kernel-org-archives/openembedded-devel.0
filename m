Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1935.1795162107952172687
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2026 00:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wPZPMuts;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so1566230eec.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 00:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162107; x=1795766907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c85qtLK3V6Sccv35+irbuNDwbA9OD8/a+6mOtL9chRs=;
        b=wPZPMutsdmJqhFCndWDIN5GcoQX2kKa/SxTAaetw4+xaRQ5YvSvu2KjcTHX9ZFCZls
         5xYBKD9YsApU8reHUKQSFQv9vZcpl00T94KOLbjGkDGv7NgTou5hu8Z7gCtRDPIys7b9
         ozCvTw4/GCbIJCzcctDeT6YASCtyths3cpR1X6UN8ZhAAX/YfEiYTOBLDM2WOq3WzdEt
         u0zbjWFGXXBp7hYG7TVKnp+BezXNF9sVkcytr14clU1ekshOI/fNYeoZBz75V/+g9IpA
         ySDtrbvrSSsQ4PjNmGJSco/yzEhBOeoq21rKM02dcLE3Mof0gsKNFEqBFR9Hvp9W3NNh
         YWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162107; x=1795766907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c85qtLK3V6Sccv35+irbuNDwbA9OD8/a+6mOtL9chRs=;
        b=VJnM6lwNlVaIcT+/vaAWgPx6kt9+tqu6NewzaVDlweQCST86StJW/jtk5nyt8B5/7s
         dmJ5xnJLTMsPMIRw+eISF2G5dzqhYnIKcZYCBjcTXHDNiNuE1ZLrByZEMmyfEg+YOXJJ
         w05ChyHa7bpO75dL0BfzHy/Bg42md45AUhJLmPD6LaikY1vQTGBlJtzDYD53RLak3rWV
         cfbeVFdLB9Njo+8DnYylbpUY10KXlHBbRFBh8rMQtX3LdVmUE6q24DGXK0Aq6idnWq0T
         Z4Lyc98UYknUb8kgaY1uvw9lVBzltTieSZ+KtHSm2zqFtcMJ62LS4Jmd4lZDRd2l19X3
         jaNA==
X-Gm-Message-State: APuU4Z/u4xnYChARiutBPxq3QbLJV3nPCXUdWTM7GzDoX7CFZYWtZZMO
	LL3/UY12QeAE5GJ3dBqef3wSiDlUThAcVhcaapf/SqqvKnwNsI+bnYIGL4piHvqs
X-Gm-Gg: AZFdTZcRLGn5kvbZAXVm3xGbbEnt6DsOOteXJd2Ax3txc8dkw6yWRo6ClUfxkjg+ifP
	R04qJVyHL+A2jwxeo9PpPQx3GBYgkA7tUkacesOwan2bk3Nc5JAzaZf0ot2cJBoEk2pYAdrg+R7
	tmY41DjKsjpfPeFgjqzwwakIFEVVr5qw9YUlVXU3lLrZCXRrGrkIgeAOmWXwW+ba+DB3RMYoXWe
	fMuXbUNSsr250d7Lzbj6hyWW1TDzUuWYKWpetvcCO4IkvKZfHMyy+BpSFmCOzYdYMdp7naePJIo
	EWnVo/3h6HAI47Cp2XigJwF5fDcWOSNdyoWwLsPQ6fMgw+kTHfAkcp6jIQ3lfhyFJyTyleaf4UD
	OOOsld5SsE8HJn5wehqJydu0wrL5tWXUXgk9Twr5RGrwDDJhjSucvS2h0FzqVuLoCkj1OxXYFBq
	xu/n09o/WR7YBxJWOeRe7BMoz7tCXLcbu9LdzMgrJ6WB25SIwLSvk5QrBFHLI4yl5HNJ8ei9KCB
	VfDJ/it+pbVi40NVjQ6aO/YcDd/58z+hYQvjxiJ+W5ZOSyCP9loZ/zbciH3aDOS0BsIYmVvXZDc
	hav4eUkOjU6NnSd598nP3fy1WNhHkQZHHcF39EwokzJm0uZFnChi5pGFUhhZ5Ijhkahzp1Vwq6O
	tHBiBc3FD7Od14TyCsDncs8kIxQCF7hSoElLxGZabJptzAi2j6yqXYEe8NMylN9pd2zdclh5NLF
	jlsT6RNR5Jjp1idI2m57WRkSH8f0Gtju9hOh9c9IlsYi7damWWpY/j7TvuoQq0M5bBnSsF5uaDk
	+rufdJUV2o4oVM9z0q3Ke81jAYqayZGeixkIVIgJGAE3Esn4K3iUlOicTEDdrTSgNmbsl1gYEA9
	ssnJfZkCRGb0Wh0JFOiS5sri1w==
X-Received: by 2002:a05:7300:ce8d:b0:386:3817:354c with SMTP id 5a478bee46e88-38638173aa7mr258291eec.13.1795162107005;
        Fri, 20 Nov 2026 00:08:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm5947954eec.14.2026.11.20.00.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:08:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/5] perfetto: Fix generated header build order with newer GN
Date: Fri, 20 Nov 2026 00:08:19 -0800
Message-ID: <20261120080821.1085842-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120080821.1085842-1-khem.raj@oss.qualcomm.com>
References: <20261120080821.1085842-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 08:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132767
Content-Type: text/plain; charset="utf-8"

gn was upgraded in oe-core, and the newer GN no longer forwards private
dependencies on header generators through targets with public headers.
src/ipc:common then stops depending on the wire_protocol code generator
and tracebox fails at random with:

  fatal error: 'protos/perfetto/ipc/wire_protocol.gen.h' file not found

Backport the upstream fix, minus three trace_processor hunks that do not
apply to v59.1 and are not part of tracebox.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/perfetto/perfetto.bb |   1 +
 ...erated-header-build-order-with-newer.patch | 726 ++++++++++++++++++
 2 files changed, 727 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perfetto/perfetto/0003-perfetto-fix-generated-header-build-order-with-newer.patch

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index 02db461783..0f1d1c3d47 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -28,6 +28,7 @@ SRC_URI:append = " \
            \
            file://0001-Remove-check_build_deps-build-steps.patch \
            file://0002-Avoid-getprogname-macro-clobbering-its-own-fallback.patch \
+           file://0003-perfetto-fix-generated-header-build-order-with-newer.patch \
            "

 SRCREV_bionic = "a0d0355105cb9d4a4b5384897448676133d7b8e2"
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto/0003-perfetto-fix-generated-header-build-order-with-newer.patch b/meta-oe/recipes-devtools/perfetto/perfetto/0003-perfetto-fix-generated-header-build-order-with-newer.patch
new file mode 100644
index 0000000000..8b0ffd7d53
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/perfetto/0003-perfetto-fix-generated-header-build-order-with-newer.patch
@@ -0,0 +1,726 @@
+From acafa5dedfd6fb10a6bd04fd9426e42db51c1a3f Mon Sep 17 00:00:00 2001
+From: sashwinbalaji <sashwinbalaji@google.com>
+Date: Wed, 11 Nov 2026 15:57:37 +0000
+Subject: [PATCH] perfetto: fix generated header build order with newer GN
+ (#8631)
+
+Debian builds fail because wire_protocol.gen.h is missing. Newer GN
+enables check_includes_strict by default [1], so targets with public
+headers no longer forward private dependencies on header generators [2].
+
+Use public_deps for header generators and dependencies exposed by public
+headers so consumers wait for generation.
+
+Failing Debian build:
+
+https://buildd.debian.org/status/fetch.php?pkg=perfetto&arch=i386&ver=59.1-1&stamp=1794323950&file=log
+
+[1] https://gn.googlesource.com/gn/+/526295467b
+[2] https://gn.googlesource.com/gn/+/9fe99e2621
+
+Co-authored-by: Ricardo Ribalda <ribalda@google.com>
+
+Upstream-Status: Backport [https://github.com/google/perfetto/commit/acafa5dedfd6fb10a6bd04fd9426e42db51c1a3f]
+
+Dropped the hunks for src/trace_processor/{sorter,importers/common,importers/proto}/BUILD.gn,
+which do not apply to v59.1 and are not used by tracebox.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gn/proto_library.gni                                  | 19 +++++++++----------
+ gn/standalone/proto_library.gni                       |  4 ++--
+ src/protovm/BUILD.gn                                  |  2 +-
+ src/protovm/compiler/BUILD.gn                         |  6 ++++--
+ src/trace_processor/BUILD.gn                          |  6 ++++--
+ .../importers/android_bugreport/BUILD.gn              |  2 +-
+ src/trace_processor/importers/etm/BUILD.gn            |  2 +-
+ src/trace_processor/importers/etw/BUILD.gn            |  2 +-
+ src/trace_processor/importers/ftrace/BUILD.gn         |  2 +-
+ src/trace_processor/importers/json/BUILD.gn           |  2 +-
+ src/trace_processor/importers/perf/BUILD.gn           | 16 ++++++++++------
+ src/trace_processor/importers/syscalls/BUILD.gn       |  2 +-
+ src/trace_processor/importers/systrace/BUILD.gn       |  2 +-
+ src/trace_processor/metrics/BUILD.gn                  |  2 +-
+ src/trace_processor/perfetto_sql/generator/BUILD.gn   |  2 +-
+ src/trace_processor/plugins/ancestor/BUILD.gn         |  2 +-
+ src/trace_processor/plugins/connected_flow/BUILD.gn   |  2 +-
+ src/trace_processor/plugins/strace/BUILD.gn           |  2 +-
+ .../plugins/video_frame_importer/BUILD.gn             |  2 +-
+ .../plugins/winscope_importer/BUILD.gn                |  6 ++++--
+ src/trace_processor/rpc/BUILD.gn                      |  2 +-
+ src/trace_processor/storage/BUILD.gn                  |  2 +-
+ src/trace_processor/types/BUILD.gn                    |  2 +-
+ src/trace_processor/util/BUILD.gn                     |  4 ++--
+ src/trace_redaction/BUILD.gn                          |  6 ++++--
+ src/traced/probes/ftrace/BUILD.gn                     |  2 +-
+ src/traced/probes/sys_stats/BUILD.gn                  |  6 ++++--
+ src/traced/probes/user_list/BUILD.gn                  |  8 +++++---
+ src/traced_relay/BUILD.gn                             |  6 ++++--
+ 29 files changed, 70 insertions(+), 53 deletions(-)
+
+diff --git a/gn/proto_library.gni b/gn/proto_library.gni
+index 640b3ff2..736b5acd 100644
+--- a/gn/proto_library.gni
++++ b/gn/proto_library.gni
+@@ -79,11 +79,11 @@ template("protozero_library") {
+       component_build_force_source_set = true
+     }
+
+-    # Convert deps to link_deps: the proto_library rule requires that C++ files
+-    # are passed in as link_deps wheras in Perfetto, we always works with deps.
++    # Generated .pbzero.h headers can include headers from proto dependencies,
++    # so those dependencies must be public.
+     link_deps = []
+     if (defined(invoker.deps)) {
+-      link_deps += invoker.deps
++      link_public_deps = invoker.deps
+     }
+
+     # omit_protozero_dep is intended to be used when protozero_library
+@@ -241,11 +241,10 @@ if (enable_perfetto_grpc) {
+       link_deps = [ "$perfetto_root_path/buildtools/grpc:grpc++" ]
+       public_configs = [ "$perfetto_root_path/buildtools:grpc_gen_config" ]
+
+-      # Convert deps to link_deps: the proto_library rule requires that C++
+-      # files are passed in as link_deps wheras in Perfetto, we always works
+-      # with deps.
++      # Generated .grpc.pb.h headers include .pb.h headers from proto
++      # dependencies, so those dependencies must be public.
+       if (defined(invoker.deps)) {
+-        link_deps += invoker.deps
++        link_public_deps = invoker.deps
+       }
+       forward_variables_from(invoker,
+                              [
+@@ -385,8 +384,8 @@ template("perfetto_proto_library") {
+       }
+     }
+
+-    # The distinction between deps and public_deps does not matter for GN
+-    # but Bazel cares about the difference so we distinguish between the two.
++    # We make both deps and public_deps public in GN, but tools/gen_bazel
++    # needs to distinguish them.
+     if (defined(invoker.public_deps)) {
+       foreach(dep, invoker.public_deps) {
+         all_deps_ += [ string_replace(dep, expansion_token, gen_type) ]
+@@ -444,7 +443,7 @@ template("perfetto_proto_library") {
+         proto_in_dir = proto_path
+         proto_out_dir = proto_path
+         generate_python = false
+-        link_deps = all_deps_
++        link_public_deps = all_deps_
+         cc_generator_options = "lite=true:"
+         propagate_imports_configs = propagate_imports_configs_
+         import_dirs = import_dirs_
+diff --git a/gn/standalone/proto_library.gni b/gn/standalone/proto_library.gni
+index 728c38f6..8d7b9cf3 100644
+--- a/gn/standalone/proto_library.gni
++++ b/gn/standalone/proto_library.gni
+@@ -293,7 +293,7 @@ template("proto_library") {
+         configs += [ ":$config_name" ]
+       }
+
+-      public_deps = []
++      public_deps = [ ":$action_name" ]
+       if (generate_cc) {
+         public_deps += [ "//gn:protobuf_lite" ]
+       }
+@@ -301,7 +301,7 @@ template("proto_library") {
+         public_deps += invoker.link_public_deps
+       }
+
+-      deps = [ ":$action_name" ]
++      deps = []
+       if (defined(invoker.deps)) {
+         deps += invoker.deps
+       }
+diff --git a/src/protovm/BUILD.gn b/src/protovm/BUILD.gn
+index 91a55e2e..911c465a 100644
+--- a/src/protovm/BUILD.gn
++++ b/src/protovm/BUILD.gn
+@@ -42,9 +42,9 @@ perfetto_component("protovm") {
+     "vm.cc",
+     "vm.h",
+   ]
++  public_deps = [ "../../protos/perfetto/protovm:zero" ]
+   deps = [
+     "../../gn:default_deps",
+-    "../../protos/perfetto/protovm:zero",
+     "../base",
+     "../protozero",
+   ]
+diff --git a/src/protovm/compiler/BUILD.gn b/src/protovm/compiler/BUILD.gn
+index c54e4d9d..c23806ad 100644
+--- a/src/protovm/compiler/BUILD.gn
++++ b/src/protovm/compiler/BUILD.gn
+@@ -23,13 +23,15 @@ source_set("compiler") {
+     "instruction_emitter.cc",
+     "instruction_emitter.h",
+   ]
++  public_deps = [
++    "../../../protos/perfetto/protovm:compile_config_zero",
++    "../../../protos/perfetto/protovm:zero",
++  ]
+   deps = [
+     ":gen_cc_compile_config_descriptor",
+     "../../../gn:default_deps",
+     "../../../include/perfetto/protozero",
+     "../../../protos/perfetto/common:zero",
+-    "../../../protos/perfetto/protovm:compile_config_zero",
+-    "../../../protos/perfetto/protovm:zero",
+     "../../base",
+     "../../protozero",
+     "../../protozero/text_to_proto",
+diff --git a/src/trace_processor/BUILD.gn b/src/trace_processor/BUILD.gn
+index 39dca8a0..a52f6ffe 100644
+--- a/src/trace_processor/BUILD.gn
++++ b/src/trace_processor/BUILD.gn
+@@ -66,14 +66,16 @@ source_set("export_json") {
+     "../base",
+     "containers",
+     "importers/common",
+-    "storage",
+     "tables",
+     "types",
+     "util:args_utils",
+     "util:cold_sort",
+     "util:json_value",
+   ]
+-  public_deps = [ "../../include/perfetto/ext/trace_processor:export_json" ]
++  public_deps = [
++    "../../include/perfetto/ext/trace_processor:export_json",
++    "storage",
++  ]
+ }
+
+ source_set("metatrace") {
+diff --git a/src/trace_processor/importers/android_bugreport/BUILD.gn b/src/trace_processor/importers/android_bugreport/BUILD.gn
+index 5848a593..9240eefb 100644
+--- a/src/trace_processor/importers/android_bugreport/BUILD.gn
++++ b/src/trace_processor/importers/android_bugreport/BUILD.gn
+@@ -55,6 +55,7 @@ source_set("android_bugreport") {
+     "chunked_line_reader.cc",
+     "chunked_line_reader.h",
+   ]
++  public_deps = [ "../../sorter" ]
+   deps = [
+     ":android_dumpstate_event",
+     ":android_log_event",
+@@ -64,7 +65,6 @@ source_set("android_bugreport") {
+     "../../../../protos/perfetto/common:zero",
+     "../../../../protos/perfetto/trace:zero",
+     "../../../base",
+-    "../../sorter",
+     "../../storage",
+     "../../tables:tables_python",
+     "../../types",
+diff --git a/src/trace_processor/importers/etm/BUILD.gn b/src/trace_processor/importers/etm/BUILD.gn
+index 393baf49..50bc57a3 100644
+--- a/src/trace_processor/importers/etm/BUILD.gn
++++ b/src/trace_processor/importers/etm/BUILD.gn
+@@ -66,6 +66,7 @@ source_set("etm") {
+   public_deps = [
+     ":etm_header",
+     "../../../../gn:open_csd",
++    "../../storage",
+   ]
+
+   deps = [
+@@ -73,7 +74,6 @@ source_set("etm") {
+     "../../../../gn:default_deps",
+     "../../../../include/perfetto/base",
+     "../../core/dataframe",
+-    "../../storage",
+     "../../tables:tables_python",
+     "../../types",
+     "../../util:build_id",
+diff --git a/src/trace_processor/importers/etw/BUILD.gn b/src/trace_processor/importers/etw/BUILD.gn
+index 2b0299c2..ce6337c0 100644
+--- a/src/trace_processor/importers/etw/BUILD.gn
++++ b/src/trace_processor/importers/etw/BUILD.gn
+@@ -23,6 +23,7 @@ source_set("minimal") {
+     "file_io_tracker.cc",
+     "file_io_tracker.h",
+   ]
++  public_deps = [ "../proto:proto_importer_module" ]
+   deps = [
+     "../../../../gn:default_deps",
+     "../../../../protos/perfetto/trace/etw:zero",
+@@ -31,7 +32,6 @@ source_set("minimal") {
+     "../../types",
+     "../common",
+     "../common:parser_types",
+-    "../proto:proto_importer_module",
+   ]
+ }
+
+diff --git a/src/trace_processor/importers/ftrace/BUILD.gn b/src/trace_processor/importers/ftrace/BUILD.gn
+index 474eb01f..b231de45 100644
+--- a/src/trace_processor/importers/ftrace/BUILD.gn
++++ b/src/trace_processor/importers/ftrace/BUILD.gn
+@@ -65,6 +65,7 @@ source_set("full") {
+     "virtio_video_tracker.cc",
+     "virtio_video_tracker.h",
+   ]
++  public_deps = [ "../../storage" ]
+   deps = [
+     ":ftrace_descriptors",
+     ":minimal",
+@@ -76,7 +77,6 @@ source_set("full") {
+     "../../../../protos/perfetto/trace/profiling:zero",
+     "../../../protozero",
+     "../../sorter",
+-    "../../storage",
+     "../../tables",
+     "../../types",
+     "../common",
+diff --git a/src/trace_processor/importers/json/BUILD.gn b/src/trace_processor/importers/json/BUILD.gn
+index 51f71ccd..abbc6aa9 100644
+--- a/src/trace_processor/importers/json/BUILD.gn
++++ b/src/trace_processor/importers/json/BUILD.gn
+@@ -21,6 +21,7 @@ source_set("json") {
+     "json_trace_tokenizer.cc",
+     "json_trace_tokenizer.h",
+   ]
++  public_deps = [ "../common" ]
+   deps = [
+     "../../../../gn:default_deps",
+     "../../containers",
+@@ -32,7 +33,6 @@ source_set("json") {
+     "../../util:json_parser",
+     "../../util:simple_json_parser",
+     "../../util:trace_type",
+-    "../common",
+     "../common:parser_types",
+     "../common:v8_profile_parser",
+     "../systrace:full",
+diff --git a/src/trace_processor/importers/perf/BUILD.gn b/src/trace_processor/importers/perf/BUILD.gn
+index eddd12a7..c59c8c1e 100644
+--- a/src/trace_processor/importers/perf/BUILD.gn
++++ b/src/trace_processor/importers/perf/BUILD.gn
+@@ -26,17 +26,19 @@ source_set("record") {
+     "reader.h",
+     "record.h",
+   ]
++  public_deps = [
++    "../../../../protos/perfetto/trace/profiling:zero",
++    "../common",
++  ]
+   deps = [
+     "../../../../gn:default_deps",
+     "../../../../include/perfetto/ext/base",
+     "../../../../include/perfetto/trace_processor",
+     "../../../../protos/perfetto/common:zero",
+-    "../../../../protos/perfetto/trace/profiling:zero",
+     "../../storage",
+     "../../tables:tables_python",
+     "../../types",
+     "../../util:build_id",
+-    "../common",
+     "../common:parser_types",
+   ]
+ }
+@@ -80,14 +82,17 @@ source_set("perf") {
+     "time_conv_record.h",
+     "util.h",
+   ]
+-  public_deps = [ ":record" ]
++  public_deps = [
++    ":record",
++    "../../../../protos/third_party/simpleperf:zero",
++    "../../sorter",
++    "../common",
++  ]
+   deps = [
+     "../../../../gn:default_deps",
+     "../../../../protos/perfetto/common:zero",
+     "../../../../protos/perfetto/trace:zero",
+     "../../../../protos/perfetto/trace/profiling:zero",
+-    "../../../../protos/third_party/simpleperf:zero",
+-    "../../sorter",
+     "../../storage",
+     "../../tables:tables_python",
+     "../../types",
+@@ -95,7 +100,6 @@ source_set("perf") {
+     "../../util:cold_sort",
+     "../../util:trace_blob_view_reader",
+     "../../util:trace_type",
+-    "../common",
+     "../proto:minimal",
+   ]
+ }
+diff --git a/src/trace_processor/importers/syscalls/BUILD.gn b/src/trace_processor/importers/syscalls/BUILD.gn
+index 2576f8e0..3f0aab31 100644
+--- a/src/trace_processor/importers/syscalls/BUILD.gn
++++ b/src/trace_processor/importers/syscalls/BUILD.gn
+@@ -19,13 +19,13 @@ source_set("full") {
+     "syscall_tracker.cc",
+     "syscall_tracker.h",
+   ]
++  public_deps = [ "../common" ]
+   deps = [
+     "../../../../gn:default_deps",
+     "../../../kernel_utils:syscall_table",
+     "../../containers",
+     "../../storage",
+     "../../types",
+-    "../common",
+   ]
+ }
+
+diff --git a/src/trace_processor/importers/systrace/BUILD.gn b/src/trace_processor/importers/systrace/BUILD.gn
+index aacb1593..85c420bc 100644
+--- a/src/trace_processor/importers/systrace/BUILD.gn
++++ b/src/trace_processor/importers/systrace/BUILD.gn
+@@ -27,12 +27,12 @@ source_set("systrace_parser") {
+     "systrace_parser.cc",
+     "systrace_parser.h",
+   ]
++  public_deps = [ "../../types" ]
+   deps = [
+     "../../../../gn:default_deps",
+     "../../containers",
+     "../../storage",
+     "../../tables",
+-    "../../types",
+     "../common",
+   ]
+ }
+diff --git a/src/trace_processor/metrics/BUILD.gn b/src/trace_processor/metrics/BUILD.gn
+index 63d317b9..93bd9e6d 100644
+--- a/src/trace_processor/metrics/BUILD.gn
++++ b/src/trace_processor/metrics/BUILD.gn
+@@ -44,7 +44,6 @@ source_set("metrics") {
+     "../../../gn:sqlite",
+     "../../../include/perfetto/trace_processor",
+     "../../../protos/perfetto/common:zero",
+-    "../../../protos/perfetto/trace_processor:metrics_impl_zero",
+     "../../../protos/perfetto/trace_processor:zero",
+     "../../base",
+     "../../base/regex",
+@@ -56,6 +55,7 @@ source_set("metrics") {
+     ":gen_cc_all_chrome_metrics_descriptor",
+     ":gen_cc_all_webview_metrics_descriptor",
+     ":gen_cc_metrics_descriptor",
++    "../../../protos/perfetto/trace_processor:metrics_impl_zero",
+     "../util:descriptors",
+     "sql:gen_amalgamated_sql_metrics",
+   ]
+diff --git a/src/trace_processor/perfetto_sql/generator/BUILD.gn b/src/trace_processor/perfetto_sql/generator/BUILD.gn
+index 112a08a4..30d95dd6 100644
+--- a/src/trace_processor/perfetto_sql/generator/BUILD.gn
++++ b/src/trace_processor/perfetto_sql/generator/BUILD.gn
+@@ -20,9 +20,9 @@ source_set("generator") {
+     "structured_query_generator.cc",
+     "structured_query_generator.h",
+   ]
++  public_deps = [ "../../../../protos/perfetto/perfetto_sql:zero" ]
+   deps = [
+     "../../../../gn:default_deps",
+-    "../../../../protos/perfetto/perfetto_sql:zero",
+     "../../../base",
+     "../../../protozero",
+     "../../sqlite",
+diff --git a/src/trace_processor/plugins/ancestor/BUILD.gn b/src/trace_processor/plugins/ancestor/BUILD.gn
+index 28bd24ea..62c11bc0 100644
+--- a/src/trace_processor/plugins/ancestor/BUILD.gn
++++ b/src/trace_processor/plugins/ancestor/BUILD.gn
+@@ -29,8 +29,8 @@ source_set("ancestor") {
+     "ancestor.h",
+     "ancestor_impl.h",
+   ]
++  public_deps = [ ":tables" ]
+   deps = [
+-    ":tables",
+     "../../../../gn:default_deps",
+     "../../../../include/perfetto/trace_processor:basic_types",
+     "../../../base",
+diff --git a/src/trace_processor/plugins/connected_flow/BUILD.gn b/src/trace_processor/plugins/connected_flow/BUILD.gn
+index 795da08b..f5feb089 100644
+--- a/src/trace_processor/plugins/connected_flow/BUILD.gn
++++ b/src/trace_processor/plugins/connected_flow/BUILD.gn
+@@ -29,8 +29,8 @@ source_set("connected_flow") {
+     "connected_flow.h",
+     "connected_flow_impl.h",
+   ]
++  public_deps = [ ":tables" ]
+   deps = [
+-    ":tables",
+     "../../../../gn:default_deps",
+     "../../../../include/perfetto/trace_processor:basic_types",
+     "../../../base",
+diff --git a/src/trace_processor/plugins/strace/BUILD.gn b/src/trace_processor/plugins/strace/BUILD.gn
+index 0e65b46b..cca75ec5 100644
+--- a/src/trace_processor/plugins/strace/BUILD.gn
++++ b/src/trace_processor/plugins/strace/BUILD.gn
+@@ -27,6 +27,7 @@ source_set("strace") {
+     "strace_trace_tokenizer.cc",
+     "strace_trace_tokenizer.h",
+   ]
++  public_deps = [ "../../sorter" ]
+   deps = [
+     "../..:storage_minimal",
+     "../../../../gn:default_deps",
+@@ -34,7 +35,6 @@ source_set("strace") {
+     "../../containers",
+     "../../core/plugin",
+     "../../importers/common",
+-    "../../sorter",
+     "../../storage",
+     "../../types",
+     "../../util:clock",
+diff --git a/src/trace_processor/plugins/video_frame_importer/BUILD.gn b/src/trace_processor/plugins/video_frame_importer/BUILD.gn
+index 0ee9603b..09834575 100644
+--- a/src/trace_processor/plugins/video_frame_importer/BUILD.gn
++++ b/src/trace_processor/plugins/video_frame_importer/BUILD.gn
+@@ -29,6 +29,7 @@ source_set("video_frame_importer") {
+     "video_frame_module.cc",
+     "video_frame_module.h",
+   ]
++  public_deps = [ "../../importers/proto:proto_importer_module" ]
+   deps = [
+     ":tables",
+     "../../../../gn:default_deps",
+@@ -42,7 +43,6 @@ source_set("video_frame_importer") {
+     "../../core/plugin",
+     "../../importers/common",
+     "../../importers/common:parser_types",
+-    "../../importers/proto:proto_importer_module",
+     "../../perfetto_sql/engine",
+     "../../sorter",
+     "../../sqlite",
+diff --git a/src/trace_processor/plugins/winscope_importer/BUILD.gn b/src/trace_processor/plugins/winscope_importer/BUILD.gn
+index d4df2975..8f2e1db9 100644
+--- a/src/trace_processor/plugins/winscope_importer/BUILD.gn
++++ b/src/trace_processor/plugins/winscope_importer/BUILD.gn
+@@ -70,6 +70,10 @@ source_set("winscope_importer") {
+     "winscope_transform_tracker.cc",
+     "winscope_transform_tracker.h",
+   ]
++  public_deps = [
++    "../../storage",
++    "../../types",
++  ]
+   deps = [
+     "../../../../gn:default_deps",
+     "../../../../include/perfetto/ext/base",
+@@ -92,9 +96,7 @@ source_set("winscope_importer") {
+     "../../importers/proto:minimal",
+     "../../importers/proto:packet_sequence_state_generation_hdr",
+     "../../importers/proto:proto_importer_module",
+-    "../../storage",
+     "../../tables",
+-    "../../types",
+     "../../util:cold_sort",
+   ]
+ }
+diff --git a/src/trace_processor/rpc/BUILD.gn b/src/trace_processor/rpc/BUILD.gn
+index a9e4c3da..4189acf9 100644
+--- a/src/trace_processor/rpc/BUILD.gn
++++ b/src/trace_processor/rpc/BUILD.gn
+@@ -34,7 +34,6 @@ source_set("rpc") {
+     "..:metatrace",
+     "../../../gn:default_deps",
+     "../../../include/perfetto/trace_processor",
+-    "../../../protos/perfetto/trace_processor:zero",
+     "../../../protos/perfetto/trace_summary:zero",
+     "../../base",
+     "../../base:version",
+@@ -43,6 +42,7 @@ source_set("rpc") {
+   ]
+   public_deps = [
+     "../../../include/perfetto/ext/trace_processor/rpc:query_result_serializer",
++    "../../../protos/perfetto/trace_processor:zero",
+   ]
+ }
+
+diff --git a/src/trace_processor/storage/BUILD.gn b/src/trace_processor/storage/BUILD.gn
+index 2d23be4b..26e081c8 100644
+--- a/src/trace_processor/storage/BUILD.gn
++++ b/src/trace_processor/storage/BUILD.gn
+@@ -21,13 +21,13 @@ source_set("storage") {
+     "trace_storage.cc",
+     "trace_storage.h",
+   ]
++  public_deps = [ "../tables" ]
+   deps = [
+     "../../../gn:default_deps",
+     "../../../include/perfetto/ext/base",
+     "../../../include/perfetto/trace_processor",
+     "../containers",
+     "../core/dataframe",
+-    "../tables",
+     "../types",
+   ]
+ }
+diff --git a/src/trace_processor/types/BUILD.gn b/src/trace_processor/types/BUILD.gn
+index de219512..f2ef9790 100644
+--- a/src/trace_processor/types/BUILD.gn
++++ b/src/trace_processor/types/BUILD.gn
+@@ -28,12 +28,12 @@ source_set("types") {
+     "variadic.h",
+     "version_number.h",
+   ]
++  public_deps = [ "../tables:tables_python" ]
+   deps = [
+     "../../../gn:default_deps",
+     "../../../include/perfetto/ext/base",
+     "../../../include/perfetto/trace_processor",
+     "../containers",
+-    "../tables:tables_python",
+     "../util:trace_type",
+   ]
+ }
+diff --git a/src/trace_processor/util/BUILD.gn b/src/trace_processor/util/BUILD.gn
+index 17b73c11..baf72051 100644
+--- a/src/trace_processor/util/BUILD.gn
++++ b/src/trace_processor/util/BUILD.gn
+@@ -129,10 +129,10 @@ source_set("clock") {
+     "clock_synchronizer.cc",
+     "clock_synchronizer.h",
+   ]
++  public_deps = [ "../../../protos/perfetto/common:zero" ]
+   deps = [
+     "../../../gn:default_deps",
+     "../../../include/perfetto/ext/base",
+-    "../../../protos/perfetto/common:zero",
+   ]
+ }
+
+@@ -427,12 +427,12 @@ source_set("profile_builder") {
+     "profile_builder.cc",
+     "profile_builder.h",
+   ]
++  public_deps = [ "../../../protos/third_party/pprof:zero" ]
+   deps = [
+     "../../../gn:default_deps",
+     "../../../include/perfetto/ext/trace_processor:demangle",
+     "../../../include/perfetto/protozero",
+     "../../../protos/perfetto/trace_processor:zero",
+-    "../../../protos/third_party/pprof:zero",
+     "../../base",
+     "../containers",
+     "../core/dataframe",
+diff --git a/src/trace_redaction/BUILD.gn b/src/trace_redaction/BUILD.gn
+index c381dd05..49155d41 100644
+--- a/src/trace_redaction/BUILD.gn
++++ b/src/trace_redaction/BUILD.gn
+@@ -85,13 +85,16 @@ source_set("trace_redaction") {
+     "verify_integrity.cc",
+     "verify_integrity.h",
+   ]
++  public_deps = [
++    "../../protos/perfetto/trace:non_minimal_zero",
++    "../trace_processor/util:clock",
++  ]
+   deps = [
+     "../../gn:default_deps",
+     "../../include/perfetto/protozero",
+     "../../include/perfetto/trace_processor:util",
+     "../../protos/perfetto/common:zero",
+     "../../protos/perfetto/trace:minimal_zero",
+-    "../../protos/perfetto/trace:non_minimal_zero",
+     "../../protos/perfetto/trace/android:zero",
+     "../../protos/perfetto/trace/ftrace:zero",
+     "../../protos/perfetto/trace/perfetto:zero",
+@@ -101,7 +104,6 @@ source_set("trace_redaction") {
+     "../../protos/third_party/android/frameworks/native/tracing:frameworks_native_trace_packet_zero",
+     "../base",
+     "../trace_processor/util:blob",
+-    "../trace_processor/util:clock",
+   ]
+ }
+
+diff --git a/src/traced/probes/ftrace/BUILD.gn b/src/traced/probes/ftrace/BUILD.gn
+index 6ac420cd..3eb926cf 100644
+--- a/src/traced/probes/ftrace/BUILD.gn
++++ b/src/traced/probes/ftrace/BUILD.gn
+@@ -108,6 +108,7 @@ if (enable_perfetto_integration_tests) {
+ source_set("ftrace") {
+   public_deps = [
+     "../../../../protos/perfetto/config/ftrace:cpp",
++    "../../../../protos/perfetto/trace:zero",
+     "../../../../protos/perfetto/trace/ftrace:zero",
+     "../../../tracing/core",
+   ]
+@@ -117,7 +118,6 @@ source_set("ftrace") {
+     "../../../../gn:default_deps",
+     "../../../../include/perfetto/ext/traced",
+     "../../../../protos/perfetto/common:zero",
+-    "../../../../protos/perfetto/trace:zero",
+     "../../../../protos/perfetto/trace/interned_data:zero",
+     "../../../../protos/perfetto/trace/profiling:zero",
+     "../../../android_internal:lazy_library_loader",
+diff --git a/src/traced/probes/sys_stats/BUILD.gn b/src/traced/probes/sys_stats/BUILD.gn
+index ceeaaf58..551daea4 100644
+--- a/src/traced/probes/sys_stats/BUILD.gn
++++ b/src/traced/probes/sys_stats/BUILD.gn
+@@ -15,7 +15,10 @@
+ import("../../../../gn/test.gni")
+
+ source_set("sys_stats") {
+-  public_deps = [ "../../../tracing/core" ]
++  public_deps = [
++    "../../../../protos/perfetto/trace/sys_stats:zero",
++    "../../../tracing/core",
++  ]
+   deps = [
+     "..:data_source",
+     "../../../../gn:default_deps",
+@@ -24,7 +27,6 @@ source_set("sys_stats") {
+     "../../../../protos/perfetto/common:zero",
+     "../../../../protos/perfetto/config/sys_stats:zero",
+     "../../../../protos/perfetto/trace:zero",
+-    "../../../../protos/perfetto/trace/sys_stats:zero",
+     "../../../base",
+     "../common",
+   ]
+diff --git a/src/traced/probes/user_list/BUILD.gn b/src/traced/probes/user_list/BUILD.gn
+index da0bf0f2..53bb50d5 100644
+--- a/src/traced/probes/user_list/BUILD.gn
++++ b/src/traced/probes/user_list/BUILD.gn
+@@ -15,15 +15,17 @@
+ import("../../../../gn/test.gni")
+
+ source_set("user_list") {
+-  public_deps = [ "../../../tracing/core" ]
++  public_deps = [
++    "../../../../protos/perfetto/config/android:zero",
++    "../../../../protos/perfetto/trace/android:zero",
++    "../../../tracing/core",
++  ]
+   deps = [
+     "..:data_source",
+     "../../../../gn:default_deps",
+     "../../../../include/perfetto/ext/traced",
+     "../../../../protos/perfetto/common:zero",
+-    "../../../../protos/perfetto/config/android:zero",
+     "../../../../protos/perfetto/trace:zero",
+-    "../../../../protos/perfetto/trace/android:zero",
+     "../../../base",
+   ]
+   sources = [
+diff --git a/src/traced_relay/BUILD.gn b/src/traced_relay/BUILD.gn
+index 0eddfdda..6790fd36 100644
+--- a/src/traced_relay/BUILD.gn
++++ b/src/traced_relay/BUILD.gn
+@@ -26,7 +26,10 @@ executable("traced_relay") {
+ }
+
+ source_set("lib") {
+-  public_deps = [ "../../include/perfetto/ext/tracing/ipc" ]
++  public_deps = [
++    "../../include/perfetto/ext/tracing/ipc",
++    "../tracing/ipc/producer:relay",
++  ]
+   sources = [
+     "relay_service.cc",
+     "relay_service.h",
+@@ -44,7 +47,6 @@ source_set("lib") {
+     "../base:version",
+     "../ipc:perfetto_ipc",
+     "../tracing/ipc:default_socket",
+-    "../tracing/ipc/producer:relay",  # For relay_ipc_client.h
+   ]
+ }
+
