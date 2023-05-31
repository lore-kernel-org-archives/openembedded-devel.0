Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1EBC8300C
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:40:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.8606.1685518841201011183
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="107157352"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="107157352"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:38 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DFC3DDC60
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 926A4D4BEC
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:35 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 06B0C68957;
	Wed, 31 May 2023 16:40:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] flatbuffers: upgrade 23.1.4 -> 23.3.56
Date: Wed, 31 May 2023 15:40:03 +0800
Message-Id: <1685518820-20028-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10--8.255900-10.000000
X-TMASE-MatchedRID: uhFBvrq0w1ajz0nOeth/yT9B1SHosSXQpxAd6mi1Ga0KSGyyqv6Ld2MW
	vMMU24Z73xN6jyfnVfrrk99lX4xY0aAuExYkDrItEhGH3CRdKUUJlr1xKkE5uY4QQ2CxQC5iCxx
	hLccI2f841A/NAwxwhskPHL8didq28TjCRfuqbuwzoDR4ZVO2DARryDXHx6oXqkkl46a3pf8uvM
	3al7XprqPqtfMu/XV9eAacBpwAyaCeG9KQ5Wu+dY6MisxJraxHjlQQ+MHi1dP+Aw16GgqpO3w6H
	06bMgivm/wHATPa79O+rmoWoCO4vi+3xqQ44pFWL7p//vLv4bMYH39vFLryE14GeysNk6/P4xu5
	XN3JhhoTxXC00El2lo/6Rc/0HDBb+KuH5yWJFSMgFhzkd+/gE58is3CIa4wBH6Ejmoo8xtaIRPb
	howI7e2kAV5uM9WKLxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+ATJDl9FKHbrn+pGLSU84AkoRMyN
	/ppM4nVqoJ1kPduDwuoUhLjLSg4+lmfBv88VITaDCzqDR7DPauLG21Eb4T84Fum2PEjqt1o8WMk
	QWv6iXBcIE78YqRWo6HM5rqDwqtM9TnFIX+JZA06JyRVK95iXaLs8sS6P4AcDOnjSm2vKNnbo0z
	QlwljA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102910

From: Wang Mingyu <wangmy@fujitsu.com>

License_update: Rename LICENSE.txt to LICENSE

Changelog:
==========
    Mostly bug fixing for 64-bit support
    Adds support for specifying underling type of unions in C++ and TS/JS (#7954)
    64-bit support for C++ (#7935)
    add key_field to compiled tests
    Add golden language directory
    Rework cmake flatc codegeneration (#7938)
    remove defining generated files in test srcs
    Add binary schema reflection (#7932)
    Migrate from rules_nodejs to rules_js/rules_ts (take 2) (#7928)
    flat_buffers.dart: mark const variable finals for internal Dart linters
    fixed some windows warnings (#7929)
    inject no long for FBS generation to remove logs in flattests (#7926)
    Revert "Migrate from rules_nodejs to rules_js/rules_ts (#7923)" (#7927)
    Migrate from rules_nodejs to rules_js/rules_ts (#7923)
    Only generate @kotlin.ExperimentalUnsigned annotation on create*Vector methods having an unsigned array type parameter. (#7881)
    additional check for absl::string_view availability (#7897)
    Optionally generate Python type annotations (#7858)
    Replace deprecated command with environment file (#7921)
    drop glibc from runtime dependencies (#7906)
    Make JSON supporting advanced union features (#7869)
    Allow to use functions from BuildFlatBuffers.cmake from a flatbuffers installation installed with CMake. (#7912)
    TS/JS: Use TypeError instead of Error when appropriate (#7910)
    Go: make generated code more compliant to "go fmt" (#7907)
    Support file_identifier in Go (#7904)
    Optionally generate type prefixes and suffixes for python code (#7857)
    Go: add test for FinishWithFileIdentifier (#7905)
    Fix go_sample.sh (#7903)
    [TS/JS] Upgrade dependencies (#7889)
    Add a FileWriter interface (#7821)
    TS/JS: Use minvalue from enum if not found (#7888)
    [CS] Verifier (#7850)
    README.md: PyPI case typo (#7880)
    Update go documentation link to point to root module (#7879)
    use Bool for flatbuffers bool instead of Byte (#7876)
    fix using null string in vector (#7872)
    Add flatbuffers-64 branch to CI for pushes
    made changes to the rust docs so they would compile. new_with_capacity is deprecated should use with_capacity, get_root_as_monster should be root_as_monster (#7871)
    Adding comment for code clarification (#7856)
    ToCamelCase() when kLowerCamel now converts first char to lower. (#7838)
    Fix help output for --java-checkerframework (#7854)
    Update filename to README.md and improve formatting (#7855)
    Update stale.yml
    Updated remaining usages of LICENSE.txt
    Refactoring of flatc generators to use an interface (#7797).
    Removed legacy cmake support and set min to 3.8 (#7801).
    Reworked entry points for Typescript/Javascript and compatibility for single file build (#7510)
    Removed go.mod files after some versioning issues were being report (#7780).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb         | 2 +-
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc        | 4 ++--
 meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
index f4a8b020a8..6573916362 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
@@ -2,7 +2,7 @@ SUMMARY = "Memory Efficient Serialization Library"
 HOMEPAGE = "https://github.com/google/flatbuffers"
 SECTION = "console/tools"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 require flatbuffers.inc
 
diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
index a85c74c128..7533f7c758 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
@@ -1,3 +1,3 @@
-PV = "23.1.4"
-SRCREV = "af9ceabeef1a10c1004e2741f8c0c090ca59e5af"
+PV = "23.5.26"
+SRCREV = "0100f6a5779831fa7a651e4b67ef389a8752bd9b"
 SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
diff --git a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
index fb5b86ddea..5d3c73fd9a 100644
--- a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
@@ -2,7 +2,7 @@ SUMMARY = "Memory Efficient Serialization Library - Python3 Modules"
 HOMEPAGE = "https://github.com/google/flatbuffers"
 SECTION = "console/tools"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://../LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 require flatbuffers.inc
 
-- 
2.34.1


