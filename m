Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
 by mx.groups.io with SMTP id smtpd.web09.22342.1627921473952498046
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Aug 2021 09:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: codethink.co.uk, ip: 78.40.148.184, mailfrom: ben.brown@codethink.co.uk)
Received: from ward-15-b2-v4wan-162938-cust156.vm18.cable.virginm.net ([80.2.64.157] helo=deprave.localdomain)
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1mAajw-0004S0-IQ
	for <openembedded-devel@lists.openembedded.org> ; Mon, 02 Aug 2021 17:24:32 +0100
From: "Ben Brown" <ben.brown@codethink.co.uk>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/1] android-tools: fix install of adb client when TOOLS is overridden
Date: Mon,  2 Aug 2021 17:23:27 +0100
Message-Id: <20210802162327.21453-2-ben.brown@codethink.co.uk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802162327.21453-1-ben.brown@codethink.co.uk>
References: <20210802162327.21453-1-ben.brown@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Overriding TOOLS with 'adb' as the only entry, or with 'adb' as the
final entry in the list fails to match the grep pattern. The current
pattern includes trailing whitespace, likely to distinguish it from
'adbd'. However since `${TOOLS}` is then passed to grep unquoted, any
trailing whitespace would be dropped by the shell.

Fixed by replacing the trailing whitespace with '\>' to mark the end of
the word, which continues to ensure we don't match against 'adbd'.

Signed-off-by: Ben Brown <ben.brown@codethink.co.uk>
---
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index e8992346b..fc91e13a5 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -133,7 +133,7 @@ do_install() {
         install -m0755 ${B}/ext4_utils/simg2simg ${D}${bindir}
     fi
 
-    if echo ${TOOLS} | grep -q "adb " ; then
+    if echo ${TOOLS} | grep -q "adb\>" ; then
         install -d ${D}${bindir}
         install -m0755 ${B}/adb/adb ${D}${bindir}
     fi
-- 
2.32.0

