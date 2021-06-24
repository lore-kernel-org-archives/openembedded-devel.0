Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.1588.1624500053828952723
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 19:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VtXgVK58;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624500051; i=@fujitsu.com;
	bh=LpmaKYQ1ypBy/l94X1uqwM35zua9EcqrrWaT3t2/lIU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VtXgVK58zWG1UBsR8dps40kbwhzFB6DkKd9TZtHI82Bo5tL4+6HRhD9U0itxhsE30
	 WGi1ttGIm8W/aXwO8nsKGWg8hOEXJgdtrkxTLtCFif4Qg1dV020DruA23/Mv7mfOIa
	 Wyf8m8q74WW8QqjxjnfpvpJMfwxxE5T5q+R89FQ/PXbHJ245G0ro7qISTA94Cg4IUn
	 /LC9Lpz9oUFntrGFsnRnX8fxWRckf1/cmontvV404OcgVgqaIza9coevLHFAj3vgjo
	 uouJBIy/AZPzEhPHzVolUCf7gi0FIZuKYZf8RPS4boIwCwfJJxA/fJHjbqyej9olV5
	 PBlnh6O1MYqQQ==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 35/07-50909-257E3D06; Thu, 24 Jun 2021 02:00:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYqhv0/HK
  CwfGn2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8abFz3sBfNlKmZtr2lgvC/RxcjFISQwm0ni
  yMYuJghnD6PEi4+HgBxODjYBXYlzj9eyg9giAvoSS2fvYe5i5OAQFnCSuLgmHiTMIqAqcblnC
  RuIzSvgIfF1TxdYq4SAgsSUh++ZIeKCEidnPmEBsZkFJCQOvngBNkZCQFFi9nR5iPIKiRkztr
  FNYOSZhaRjFpKOBYxMqxgtk4oy0zNKchMzc3QNDQx0DQ2NdU10DY0N9BKrdJP0Ukt1k1PzSoo
  SgbJ6ieXFesWVuck5KXp5qSWbGIFBlFLI0rSD8ferD3qHGCU5mJREeUvbLycI8SXlp1RmJBZn
  xBeV5qQWH2KU4eBQkuCVeAaUEyxKTU+tSMvMAQY0TFqCg0dJhNfyCVCat7ggMbc4Mx0idYpRU
  Uqc9/FToIQASCKjNA+uDRZFlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ87aBTOHJzCuBm/
  4KaDET0GKF3xdBFpckIqSkGphqPM+4hbYHucYdkv/48tfOiC/lN9KdGYIZ5jepbcxy/stV7fH
  u18aQrff1Jq89v7xXXkatokn2itZW4ZTkHcs/rKowurdGP1ZAyWjCz7ySRL2XQTwOy0UTxLYv
  rkpWzX5wi2FdfCtja/rJV6q7QyWOaWYvuali9d4qYXPdL79/vDM2vi59mMiXcST3XLfPncpJI
  m8eO/DoFCy7dOvqhbqTyp15SvlvdSd/45z63fFgw+zoEFsB79RSfpvuUH4v4/w/a3r9tr5zk+
  dOqTWMnLPWQ8yaRX5p+BfndbP+fj4iddZEbq2Ye2RW7Y7grrVB3qe+f34fnXm2PFFygVuC66P
  dGxO2bHoTIu8e9jVFV4mlOCPRUIu5qDgRAOqTxMIdAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-245.messagelabs.com!1624500050!221305!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20130 invoked from network); 24 Jun 2021 02:00:50 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-4.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2021 02:00:50 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O20n9X028162
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 03:00:50 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 03:00:48 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] fwts: upgrade 21.03.00 -> 21.06.00
Date: Thu, 24 Jun 2021 10:00:41 +0800
Message-ID: <1624500041-82428-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Refresh the following patch:
0003-Remove-Werror-from-build.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../fwts/0003-Remove-Werror-from-build.patch  | 24 +++++++++----------
 .../{fwts_21.03.00.bb => fwts_21.06.00.bb}    |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-test/fwts/{fwts_21.03.00.bb => fwts_21.06.00.bb} (94%)

diff --git a/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch b/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch
index 906ec99a9d..5ccd461d9f 100644
--- a/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch
@@ -11,12 +11,12 @@ Upstream-Status: Pending
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index a26a197b..70a28174 100644
+index f8066af..6b979f8 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -14,7 +14,7 @@ AM_CPPFLAGS = \
- 	`pkg-config --silence-errors --cflags json`	\
- 	`pkg-config --silence-errors --cflags json-c`	\
+@@ -12,7 +12,7 @@ AM_CPPFLAGS = \
+ 	-I$(top_srcdir)/src/acpica/source/compiler	\
+ 	-I$(top_srcdir)/efi_runtime			\
  	-pthread `pkg-config --cflags glib-2.0 gio-2.0` \
 -	-Wall -Werror -Wextra				\
 +	-Wall -Wextra					\
@@ -24,7 +24,7 @@ index a26a197b..70a28174 100644
  	-Wfloat-equal -Wmissing-declarations		\
  	-Wno-long-long -Wredundant-decls -Wshadow	\
 diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
-index 55c52b41..b85d0101 100644
+index 55c52b4..50efa97 100644
 --- a/src/lib/src/Makefile.am
 +++ b/src/lib/src/Makefile.am
 @@ -25,7 +25,7 @@ AM_CPPFLAGS = \
@@ -32,23 +32,23 @@ index 55c52b41..b85d0101 100644
  	`pkg-config --cflags glib-2.0 gio-2.0` 		\
  	-DDATAROOTDIR=\"$(datarootdir)\"		\
 -	-Wall -Werror -Wextra				\
-+	-Wall -Wextra				\
++	-Wall -Wextra					\
  	-Wno-address-of-packed-member
  
  pkglib_LTLIBRARIES = libfwts.la
 diff --git a/src/utilities/Makefile.am b/src/utilities/Makefile.am
-index ecc25f0a..129c1036 100644
+index a7d9b9c..e1bf141 100644
 --- a/src/utilities/Makefile.am
 +++ b/src/utilities/Makefile.am
 @@ -16,7 +16,7 @@
  # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
  #
  
--AM_CPPFLAGS = -Wall -Werror -Wextra -DDATAROOTDIR=\"$(datarootdir)\" \
-+AM_CPPFLAGS = -Wall -Wextra -DDATAROOTDIR=\"$(datarootdir)\" \
- 	`pkg-config --silence-errors --cflags json` \
- 	`pkg-config --silence-errors --cflags json-c` \
- 	-I../lib/include
+-AM_CPPFLAGS = -Wall -Werror -Wextra -DDATAROOTDIR=\"$(datarootdir)\" 	\
++AM_CPPFLAGS = -Wall -Wextra -DDATAROOTDIR=\"$(datarootdir)\" 	\
+ 	-I$(srcdir)/../lib/include
+ 
+ bin_PROGRAMS = kernelscan
 -- 
 2.25.1
 
diff --git a/meta-oe/recipes-test/fwts/fwts_21.03.00.bb b/meta-oe/recipes-test/fwts/fwts_21.06.00.bb
similarity index 94%
rename from meta-oe/recipes-test/fwts/fwts_21.03.00.bb
rename to meta-oe/recipes-test/fwts/fwts_21.06.00.bb
index aa7d422f7b..21d2563514 100644
--- a/meta-oe/recipes-test/fwts/fwts_21.03.00.bb
+++ b/meta-oe/recipes-test/fwts/fwts_21.06.00.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://fwts.ubuntu.com/release/fwts-V${PV}.tar.gz;subdir=${BP} \
            file://0005-Undefine-PAGE_SIZE.patch \
            file://0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch \
            "
-SRC_URI[sha256sum] = "c22dcba2572e4237bf2fe9ab579e195cf051d3a99b2c07ab58f757cae02d24fb"
+SRC_URI[sha256sum] = "ca43439707976f6664fe3f6eb7f356a51ac7d7f8a4e246ef4d1b16305e066909"
 
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|powerpc64).*-linux"
 
-- 
2.25.1

