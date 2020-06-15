Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.16872.1592224903995080836
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2020 05:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48920 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jkoQm-0005WI-O2; Mon, 15 Jun 2020 15:41:43 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] protobuf: Upgrade 3.11.4 -> 3.12.3
Date: Mon, 15 Jun 2020 15:41:32 +0300
Message-Id: <20200615124132.5262-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 3.12.3. Update the path to the git repository
in GitHub. Update the patch for examples/Makefile.

The new release brings:

- [experimental] Singular, non-message typed fields in proto3 now
  support presence tracking. This is enabled by adding the
  "optional" field label and passing the
  --experimental_allow_proto3_optional flag to protoc.
- Allow duplicate symbol names when multiple descriptor sets are
  passed on the command-line, to match the behavior when multiple
  .proto files are passed.
- Deterministic protoc --descriptor_set_out
- Bug fixes for the supported programming languages

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...Makefile-respect-CXX-LDFLAGS-variables-fix-.patch | 12 ++++++++----
 .../{protobuf_3.11.4.bb => protobuf_3.12.3.bb}       |  4 ++--
 2 files changed, 10 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.11.4.bb => protobuf_3.12.3.bb} (96%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
index 0a2e5e2df..934c98193 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
@@ -1,4 +1,4 @@
-From a28e15092a298e0c73c6fc1ded0913275cf27cb0 Mon Sep 17 00:00:00 2001
+From e5340f816aa273cfda36998466739ca0748caafb Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 28 Jun 2019 13:50:52 +0000
 Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix build
@@ -23,12 +23,13 @@ Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix build
 
 Upstream-Status: Pending
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  examples/Makefile | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/examples/Makefile b/examples/Makefile
-index 4ad605641..31d887639 100644
+index e9f9635ae..b2fbe2de1 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
 @@ -2,6 +2,8 @@
@@ -44,13 +45,16 @@ index 4ad605641..31d887639 100644
  
  add_person_cpp: add_person.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
+-	c++ -std=c++11 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
 +	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
  
  list_people_cpp: list_people.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
+-	c++ -std=c++11 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
 +	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
  
  add_person_dart: add_person.dart protoc_middleman_dart
  
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
similarity index 96%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
index 4d6c5b255..21ad7a460 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS_append_class-target = " protobuf-native"
 
-SRCREV = "d0bfd5221182da1a7cc280f3337b5e41a89539cf"
+SRCREV = "31ebe2ac71400344a5db91ffc13c4ddfb7589f92"
 
-SRC_URI = "git://github.com/google/protobuf.git;branch=3.11.x \
+SRC_URI = "git://github.com/protocolbuffers/protobuf.git \
            file://run-ptest \
            file://0001-protobuf-fix-configure-error.patch \
            file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch \
-- 
2.17.1

