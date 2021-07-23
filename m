Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web09.3240.1627006244768186018
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jul 2021 19:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rn7sWinc;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627006243; i=@fujitsu.com;
	bh=8M7fE8CP8Y+8634+jvoAJX2Jopyl7EHdkS1ugIXZ6rA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rn7sWincvJk6oRsFDWYKhNV3UYXm1repHxCTa63P/2ShlAtCy/6Y2NVjFWb5K8e1G
	 2BFRgMs/mbC0XHIDhDrhRncY0dGcb38OdsA2TXpQIRIOS15+D0YT1wA0A4wyEcDbdO
	 ZiFwA/MJHRrgiMgARB6Dd9VK2hMTG6J2HgItmhMA33BtHW3j5u/OsG64DA3iYEhA0J
	 blYbj8hQkFdLsQ+skc5nJR3r5K4Y4fKVMt5eyfc4o+Oo9IgvjLnYmENJS+2x7My6ID
	 7zA4LIgXD03yTy3ivj9teaZ0aFStuXBXxkCSuyAfvivtWwTKL6Q2iVx0kz1XgrNdJ4
	 8V32h+xW/n26w==
Received: from [100.112.192.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 7D/FA-07317-2252AF06; Fri, 23 Jul 2021 02:10:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxVVdJ9Ve
  CQdsrNouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN9yhe2go8iFfcX72JtYNwo1MXIxSEkMJtJ
  oudtPxOEc4JRYuGFE6xdjJwcbAJqEtNv3QCzRQT0JZbO3sMMYjMLqEi8+N3DDmILC9hLzOp/w
  AhiswioSpyZ/4sFxOYVcJRYtvc5WFxCQEFiysP3YL2cAk4Sb7/fZwKxhYBqml5sZYKoF5Q4Of
  MJC8R8CYmDL14wQ/QqSsy+3MwCYVdIvD58iXkCI/8sJC2zkLQsYGRaxWiRVJSZnlGSm5iZo2t
  oYKBraGika2gJxEZmeolVuol6qaW65anFJbqGeonlxXrFlbnJOSl6eaklmxiBAZlScKBuB+OD
  1x/0DjFKcjApifJKHf6ZIMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd4XMrwQhwaLU9NSKtMwcY
  HTApCU4eJREeEslgNK8xQWJucWZ6RCpU4yKUuK8kspACQGQREZpHlwbLCIvMcpKCfMyMjAwCP
  EUpBblZpagyr9iFOdgVBLmNQGZwpOZVwI3/RXQYiagxae6foIsLklESEk1MC1I9b92WTmR66q
  uP3dDdI712s88LElsy4/GxF/JOLIgIy9z9Wc7g03bkibfECl6Xrogat65ZWl8e34+tnpRtFH2
  GLPJJCM3Fzb15xxvd81UVsrIXn3DqLjfwlxd9YIp48t7RRsanmy6/KvAt00krCPgz87dLjt0j
  U/8nLvY3pH39Lwbrf4fuLvnqNRXW3mful93/hbLZJbmV1dWeTBkMk9Q19PTdC9IluK5rZBrul
  hyk3p4S1FKw40p/zwfpbsa7v4z+84Lp5NLmHSUWiuNrqb8zfVsrTGs2nL3ndVqi6JX82s2Grb
  ufLhEvs+u8N7SvlUftXyeODjdzWC6Ly+d8emorl7IB8urlrcDlX9pK7EUZyQaajEXFScCALUy
  LK9DAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-267.messagelabs.com!1627006241!60512!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7902 invoked from network); 23 Jul 2021 02:10:42 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-18.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jul 2021 02:10:42 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16N2AWF3013755
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jul 2021 03:10:41 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 23 Jul 2021 03:10:33 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cmark: upgrade 0.30.0 -> 0.30.1
Date: Fri, 23 Jul 2021 10:10:17 +0800
Message-ID: <1627006219-7443-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1627006219-7443-1-git-send-email-wangmy@fujitsu.com>
References: <1627006219-7443-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Changelog:
Properly indent block-level contents of list items in man (#258).
https://github.com/commonmark/cmark/issues/258
This handles nested lists as well as items with multiple paragraphs.
The change requires addition of a new field block_number_in_list_item
to cmark_renderer, but this does not change the public API.

Fix quadratic behavior when parsing emphasis (#389, Nick
Wellnhofer). Delimiters can be deleted, so store delimiter positions
instead of pointers in openers_bottom. Besides causing undefined
behavior when reading a dangling pointer, this could also result
in quadratic behavior when parsing emphasis.
https://github.com/commonmark/cmark/issues/389

Fix quadratic behavior when parsing smart quotes (#388, Nick Wellnhofer).
Remove matching smart quote delimiters. Otherwise, the same opener
could be found over and over, preventing the openers_bottom
optimization from kicking in and leading to quadratic behavior when
processing lots of quotes.
https://github.com/commonmark/cmark/issues/388

Modify CMake configuration so that the project can be built with
older versions of CMake (#384, Saleem Abdulrasool). (In 0.30.0,
some features were used that require CMake >= 3.3.) The cost of this
backwards compatibility is that developers must now explicitly invoke
cmark_add_compile_options when a new compilation target is added.
https://github.com/commonmark/cmark/issues/384

Remove a comma at the end of an enumerator list, which was flagged
by clang as a C++11 extension.

make_man_page.py: use absolute path with CDLL. This avoids the error
"file system relative paths not allowed in hardened programs."

Include cmark version in cmark(3) man page (instead of LOCAL).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/cmark/{cmark_0.30.0.bb => cmark_0.30.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/cmark/{cmark_0.30.0.bb => cmark_0.30.1.bb} (88%)

diff --git a/meta-oe/recipes-support/cmark/cmark_0.30.0.bb b/meta-oe/recipes-support/cmark/cmark_0.30.1.bb
similarity index 88%
rename from meta-oe/recipes-support/cmark/cmark_0.30.0.bb
rename to meta-oe/recipes-support/cmark/cmark_0.30.1.bb
index c52a040645..e2db8aa762 100644
--- a/meta-oe/recipes-support/cmark/cmark_0.30.0.bb
+++ b/meta-oe/recipes-support/cmark/cmark_0.30.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=81f9cae6293cc0345a9144b78152ab62"
 
 SRC_URI = "git://github.com/commonmark/cmark.git"
-SRCREV = "8800e66010214384e75f933830ca5585e1ae3060"
+SRCREV = "977b128291c0cf6c5053cdcf2ac72e627f09c105"
 S = "${WORKDIR}/git"
 
 inherit cmake lib_package
-- 
2.25.1

