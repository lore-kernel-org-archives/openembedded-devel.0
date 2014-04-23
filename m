Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB01.domain01.net (STOEXHUB01.domain01.net
	[83.145.59.142])
	by mail.openembedded.org (Postfix) with ESMTP id C49CF65D91
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 11:24:38 +0000 (UTC)
Received: from localhost (2.71.147.210) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.279.1; Wed, 23 Apr 2014
	13:24:38 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Apr 2014 13:24:33 +0200
Message-ID: <01a958aab060f2a674e5c382b0ae8272c9c9bb4d.1398252166.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.0.0.rc0
In-Reply-To: <cover.1398252166.git.anders@chargestorm.se>
References: <cover.1398252166.git.anders@chargestorm.se>
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH 1/2] breakpad.bbclass: set includedir in CXXFLAGS
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
X-List-Received-Date: Wed, 23 Apr 2014 11:24:46 -0000
Content-Type: text/plain

Previously this was only set in CFLAGS.
An build issue was discovered while convering in internal application
from Qt4 to Qt5. As a result of this, the required header files were
no longer found, until we also set CXXFLAGS.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/classes/breakpad.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/classes/breakpad.bbclass b/meta-oe/classes/breakpad.bbclass
index 8c49ca7..e4d6808 100644
--- a/meta-oe/classes/breakpad.bbclass
+++ b/meta-oe/classes/breakpad.bbclass
@@ -5,6 +5,7 @@
 DEPENDS += "breakpad breakpad-native"
 
 CFLAGS += "-I${STAGING_DIR_TARGET}${includedir}/breakpad "
+CXXFLAGS += "-I${STAGING_DIR_TARGET}${includedir}/breakpad "
 
 BREAKPAD_BIN ?= ""
 
-- 
2.0.0.rc0


