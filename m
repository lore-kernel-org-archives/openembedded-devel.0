Return-Path: <mcfrisk@kapsi.fi>
X-Greylist: delayed 1839 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 12 Jul 2019 11:57:50 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 73F827F0F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 11:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3s6usaLGwokGAfsWByAv52M8WCfMxShDWvV9zMRxijw=;
	b=WEABdMmuB0SHFz8AQ0b89ttr/i
	fdi+oWSIV3Nfx5EEciYDJhz9YE1PsUA0DuvoM2sDem4f+XeevRhhO+aosgNRLLIekdqP5Jhc+GsDR
	UWx7poA+OUbe0xcctl8KHGjaWqQ05QQYH5gDVtQJDZV3VLotTd1pKjxizC4R6YFAiYqV/a7e8prXE
	GRWNRZGFO04EFrKADGbPOGLmBU7418nSiglDvAbr0kbdPFis4JBSB+EW122eaXG1y/SQMStlwYHtP
	rKxVX8rrYacq0MFmqo4V/NiyJfjilrNOj6dQ6ABFLGYOA1MSnFhgJo0J+IekL5pmHfHRhyBrTuA9H
	J/rgfvfw==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1hlthl-0000f4-AY; Fri, 12 Jul 2019 14:27:10 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1hlthb-00081k-5D; Fri, 12 Jul 2019 14:26:59 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jul 2019 14:26:47 +0300
Message-Id: <1562930807-28919-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-Rspam-Score: 1.2 (+)
X-Rspam-Report: Action: no action Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: R_SPF_NEUTRAL(0.00)
	Symbol: FROM_HAS_DN(0.00) Symbol: TO_DN_SOME(0.00)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00) Symbol: MIME_GOOD(-0.10)
	Symbol: RCVD_TLS_LAST(0.00) Symbol: NEURAL_SPAM(0.00)
	Symbol: IP_SCORE(-0.09) Symbol: RCPT_COUNT_TWO(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf neutral
	Message-ID: 1562930807-28919-1-git-send-email-mikko.rapeli@bmw.de
X-Rspam-Bar: +
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [meta-oe][PATCH] protobuf: fix ptest compilation with hardening flags
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jul 2019 11:57:50 -0000

Build fails when conf/local.conf has both hardening and ptests enabled:

require conf/distro/include/security_flags.inc

DISTRO_FEATURES_append = " ptest"

Use CXXFLAGS for examples too to avoid hardening warnings
about using O0 optimization.

Then change linking order to avoid linker failures:

aarch64-poky-linux-g++  -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=form
at-security -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
--sysroot=/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/recipe-sysroot
 -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/builder/src/base/build/tmp/work/aar
ch64-poky-linux/protobuf/3.8.0-r0=/usr/src/debug/protobuf/3.8.0-r0                      -fdebug-pre
fix-map=/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0=/usr/src/debug/pr
otobuf/3.8.0-r0                      -fdebug-prefix-map=/home/builder/src/base/build/tmp/work/aarch6
4-poky-linux/protobuf/3.8.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/builder/src
/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/recipe-sysroot-native=  -fvisibility-inlin
es-hidden -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong -Wl,-z,relro,-z,now -fstack-p
rotector-strong -Wl,-z,relro,-z,now -pthread -I/home/builder/src/base/build/tmp/work/aarch64-poky-linux/p
rotobuf/3.8.0-r0/git/src -L/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r
0/git/src/.libs -L/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/re
cipe-sysroot/usr/lib -lprotobuf ../src/google/protobuf/.libs/timestamp.pb.o add_person.cc addressbook.pb.cc -
o add_person_cpp
/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/recipe-sysroot-native/usr
/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/9.1.0/ld: ../src/google/protobuf/.libs/timestamp.pb.o: in function `google::protobuf::Timestamp::SerializeWithCachedSizes(google::protobuf::io::CodedOutputStream*) const':
/usr/src/debug/protobuf/3.8.0-r0/git/src/google/protobuf/timestamp.pb.cc:279: undefined reference to `google::protobuf::internal::WireFormat::SerializeUnknownFields(google::protobuf::UnknownFieldSet const&, google::protobuf::io::CodedOutputStream*)'

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 .../0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
index 029abfd..0a2e5e2 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
@@ -45,12 +45,12 @@ index 4ad605641..31d887639 100644
  add_person_cpp: add_person.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
 -	c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
-+	$(CXX) $(LDFLAGS) $(PROTOBUF) ../src/google/protobuf/.libs/timestamp.pb.o add_person.cc addressbook.pb.cc -o add_person_cpp
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
  
  list_people_cpp: list_people.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
 -	c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
-+	$(CXX) $(LDFLAGS) $(PROTOBUF) ../src/google/protobuf/.libs/timestamp.pb.o list_people.cc addressbook.pb.cc -o list_people_cpp
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
  
  add_person_dart: add_person.dart protoc_middleman_dart
  
-- 
1.9.1


