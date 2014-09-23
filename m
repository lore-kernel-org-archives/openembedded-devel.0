Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E67B714A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 00:52:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8N0qA2e025609
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Sep 2014 17:52:10 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 22 Sep 2014 17:52:09 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Sep 2014 08:52:08 +0800
Message-ID: <1411433528-9492-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] dialog: fix the redirection of the error information
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Sep 2014 00:52:16 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Drop the error information, other than redirect them to stdout, otherwise
the error information will be included into LIBS/CFLAG

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../dialog/files/use-pkg-config-for-ncurses-detection.patch        |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch b/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
index b5b4b3c..09cdb37 100644
--- a/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
+++ b/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
@@ -21,8 +21,8 @@ index 24e28c1..c78735d 100755
  
 -CPPFLAGS="$CPPFLAGS `$NCURSES_CONFIG --cflags`"
 -LIBS="`$NCURSES_CONFIG --libs` $LIBS"
-+CPPFLAGS="$CPPFLAGS `pkg-config --short-errors --print-errors --cflags "ncurses" 2>&1`"
-+LIBS="`pkg-config --short-errors --print-errors --libs "ncurses" 2>&1` $LIBS"
++CPPFLAGS="$CPPFLAGS `pkg-config --short-errors --print-errors --cflags "ncurses" 2>/dev/null`"
++LIBS="`pkg-config --short-errors --print-errors --libs "ncurses" 2>/dev/null` $LIBS"
  
  # even with config script, some packages use no-override for curses.h
  
-- 
1.7.10.4


