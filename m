Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.542.1632375121335354457
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 22:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NIxnlf65;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632375119; i=@fujitsu.com;
	bh=eALz3YBzu6sNHCDkDuX7dlSvRjkZoq+3jQvswIPgihY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NIxnlf65qG1FGR4Byznmj0oYp7ML9cTzHn71NLicLbxAqbXS6SW6EdBvSyLCZa4mm
	 qHqYXr85Z4RMHrR2gRx7+hLDc6BU2U7sqGgDLJzpKWPYzqj5zl4fYdIOSbnS04pdeX
	 JMhE+tfReVyIu8Nmii4mJm/cgpHjg+xNRvC6CEh1a2g5zhkGwDER8h4tnkU48Y8p5m
	 rtVh47pTGJnVGQC9WcRW3nUF0OwXjjFg/q8y0ZkMv4tfJmw77Y8hUNh2D18HICoguR
	 UPqNmh5759FU6gKhi0hMmzFxbk2pK9AGpBuujywnwAufOl33OHUjLoxHdOJrSI5C83
	 5TpKjATG6OD1w==
Received: from [100.112.197.4] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 6C/22-21482-F411C416; Thu, 23 Sep 2021 05:31:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0fUX9Ek
  0WDqLw+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzdi9bB5TwRGDiiMTD7A3MP7Q7GLk4hASmM0k
  ceXTYRYIZw+jxILZi9i7GDk52AR0Jc49XgtmiwjoSyydvYcZxBYWcJKYu/4hC4jNIqAq0fVqB
  1gNr4CHRPO9+6wgtoSAgsSUh++ZIeKCEidnPgGrZxaQkDj44gVQnAOoRlFi9nR5iPIKideHLz
  FPYOSZhaRjFpKOBYxMqxgtkooy0zNKchMzc3QNDQx0DQ2NdA0tzXUNjc31Eqt0k/RSS3XLU4t
  LdA31EsuL9Yorc5NzUvTyUks2MQLDKKXgaOcOxl+vPugdYpTkYFIS5U0X8EkU4kvKT6nMSCzO
  iC8qzUktPsQow8GhJMF7hh8oJ1iUmp5akZaZAwxpmLQEB4+SCK8CN1Cat7ggMbc4Mx0idYpRU
  Uqc1xRkpgBIIqM0D64NFkeXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnz7gHZzpOZVwI3/R
  XQYiagxfwrPUAWlyQipKQamDgUxS38Xwe4rDnLI9m5fdanw0zbuA8LbTmydukmn+5krtcrdm4
  7WHZgr6PpmZ9tl+/42zd2nfsrqOfs8vOb9uRXu5vkeveJ9Mr6x/JmNuzdfT7FY+1uTteLv67O
  1fjz+/tVLiHWtiv7Dp3dPX8fzwfONRERYYIPm96YsS2+0yyatuGWSn7p6mmJwYsOqVnEVkb9m
  C+nopnG9uzGwq2THk+tc/r01IjNPEHmOZP8N7G5+bt+RG54kdT2oPZhCnOYyeMVKxlPWK1crv
  dyVpKP73+vuqyzvxj4715JllOwaPhTbPLlctJlXok/Dz5WqZyOuKcnvfnbQyfb12ut5qs8aNl
  5NShv+UQxufyVPepxF/mUWIozEg21mIuKEwGDIJw0HgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-287.messagelabs.com!1632375118!259641!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20624 invoked from network); 23 Sep 2021 05:31:59 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-7.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Sep 2021 05:31:59 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18N5Vwx6021660
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 06:31:58 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 23 Sep 2021 06:31:57 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] protobuf: upgrade 3.17.3 -> 3.18.0
Date: Thu, 23 Sep 2021 22:31:50 +0800
Message-ID: <1632407510-15664-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

C++
Fix warnings raised by clang 11 (#8664)
Make StringPiece constructible from std::string_view (#8707)
Add missing capability attributes for LLVM 12 (#8714)
Stop using std::iterator (deprecated in C++17). (#8741)
Move field_access_listener from libprotobuf-lite to libprotobuf (#8775)
Fix #7047 Safely handle setlocale (#8735)
Remove deprecated version of SetTotalBytesLimit() (#8794)
Support arena allocation of google::protobuf::AnyMetadata (#8758)
Fix undefined symbol error around SharedCtor() (#8827)
Fix default value of enum(int) in json_util with proto2 (#8835)
Better Smaller ByteSizeLong
Introduce event filters for inject_field_listener_events
Reduce memory usage of DescriptorPool
For lazy fields copy serialized form when allowed.
Re-introduce the InlinedStringField class
v2 access listener
Reduce padding in the proto's ExtensionRegistry map.
GetExtension performance optimizations
Make tracker a static variable rather than call static functions
Support extensions in field access listener
Annotate MergeFrom for field access listener
Fix incomplete types for field access listener
Add map_entry/new_map_entry to SpecificField in MessageDifferencer. They
record the map items which are different in MessageDifferencer's reporter.
Reduce binary size due to fieldless proto messages
TextFormat: ParseInfoTree supports getting field end location in addition to
start.
Fix repeated enum extension size in field listener
Enable Any Text Expansion for Descriptors::DebugString()
Switch from int{8,16,32,64} to int{8,16,32,64}_t
Java
Fix errorprone conflict (#8723)
Removing deprecated TimeUtil class. (#8749)
Optimized FieldDescriptor.valueOf() to avoid array copying.
Removing deprecated TimeUtil class.
Add Durations.parseUnchecked(String) and Timestamps.parseUnchecked(String)
FieldMaskUtil: Add convenience method to mask the fields out of a given proto.
JavaScript
Optimize binary parsing of repeated float64
Fix for optimization when reading doubles from binary wire format
Replace toArray implementation with toJSON.
PHP
Migrate PHP & Ruby to ABSL wyhash (#8854)
Added support for PHP 8.1 (currently in RC1) to the C extension (#8964)
Fixed PHP SEGV when constructing messages from a destructor. (#8969)
Ruby
Move DSL implementation from C to pure Ruby (#8850)
Fixed a memory bug with RepeatedField#+. (#8970)
Python
Drops support for 2.7 and 3.5.
Other
[csharp] ByteString.CreateCodedInput should use ArraySegment offset and count (#8740)
[ObjC] Add support for using the proto package to prefix symbols. (#8760)
field_presence.md: fix Go example (#8788)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...am-include-descriptor.cc-when-building-libp.patch | 12 +++++++-----
 .../{protobuf_3.17.3.bb => protobuf_3.18.0.bb}       |  6 +++---
 2 files changed, 10 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.17.3.bb => protobuf_3.18.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.patch
index fc7286122c..bd3a277a3d 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.patch
@@ -1,7 +1,8 @@
-From 321709837f412e2f590e36e3fe33571bb40036a7 Mon Sep 17 00:00:00 2001
+From 8515ceec5ba3e2fcdbc819b5bf10fe742d7c9d5d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 27 Jun 2019 13:27:18 +0000
-Subject: [PATCH] Makefile.am: include descriptor.pb.cc when building libprotoc.so
+Subject: [PATCH] Makefile.am: include descriptor.pb.cc when building
+ libprotoc.so
 
 * otherwise plugin.pb.o has undefined symbol scc_info_FileDescriptorProto_google_2fprotobuf_2fdescriptor_2eproto
   and build with gold fails with:
@@ -10,19 +11,20 @@ Subject: [PATCH] Makefile.am: include descriptor.pb.cc when building libprotoc.s
 
 Upstream-Status: Pending
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
  src/Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index be18ba761..57e3daec1 100644
+index d4f11ce79..96d911746 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -313,6 +313,7 @@ libprotoc_la_LDFLAGS += -Wl,--version-script=$(srcdir)/libprotoc.map
+@@ -323,6 +323,7 @@ libprotoc_la_LDFLAGS += -Wl,--version-script=$(srcdir)/libprotoc.map
  EXTRA_libprotoc_la_DEPENDENCIES = libprotoc.map
  endif
  libprotoc_la_SOURCES =                                         \
 +  google/protobuf/descriptor.pb.cc                             \
    google/protobuf/compiler/code_generator.cc                   \
    google/protobuf/compiler/command_line_interface.cc           \
-   google/protobuf/compiler/plugin.cc                           \
+   google/protobuf/compiler/cpp/cpp_enum.cc                     \
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.17.3.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.18.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.17.3.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.18.0.bb
index 4de2c93d40..9f501124a0 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.17.3.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.18.0.bb
@@ -10,14 +10,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "909a0f36a10075c4b4bc70fdee2c7e32dd612a72"
+SRCREV = "89b14b1d16eba4d44af43256fc45b24a6a348557"
 
-SRC_URI = "git://github.com/protocolbuffers/protobuf.git \
+SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=3.18.x \
            file://run-ptest \
            file://0001-protobuf-fix-configure-error.patch \
            file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
-"
+           "
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig ptest
-- 
2.25.1

