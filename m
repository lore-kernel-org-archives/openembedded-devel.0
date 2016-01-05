Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id E9078731D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 21:15:56 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id 77so168787232ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 13:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zvZ7d1FJSpWD5htOt8p1F38sSs3lkwxgv06yaPwyAv0=;
	b=0TBhwodgOhlNmOBVCL3vFI0ryXiPOLy2BPk9mzOPAGGoKl/c+tVtVfEo3wIKjV+E7q
	cakyUd8nFKuiPS16+JfPBmZA2tY+G+iECndE/Ev1JIYwnC+Bkl5frWDF55eXQaiK9qr7
	rovM34TFO37Po8iDX/N4AoCHT01rPzElb0xQh6kHcNh/miR5h2SM1IrAKmDmxTpNcfI3
	CpoXhebHCU6vznnOS4KglZ2yOHFywjZaj7KPYWeB3U8R8R5L6VHiMDrngfRt95WKWklN
	WChDBrLL0ioJUL/KNelEk7OyAmL3t6OCJAk/c/LaZZT3tp7rBhRtt+MOYY1+Fy3Ut6zQ
	t2Fw==
X-Received: by 10.107.185.214 with SMTP id j205mr61033025iof.175.1452028557083;
	Tue, 05 Jan 2016 13:15:57 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	g67sm26731272ioe.34.2016.01.05.13.15.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jan 2016 13:15:56 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jan 2016 16:15:40 -0500
Message-Id: <1452028543-30812-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.7.0.rc3
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-browser][PATCH 1/3] chromium_40.0.2214.91: API keys update
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
X-List-Received-Date: Tue, 05 Jan 2016 21:15:59 -0000

Add more information to the "disable-api-keys-info-bar" PACKAGECONFIG
description regarding another way to disable the "Google API keys are
missing" warning.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 recipes-browser/chromium/chromium_40.0.2214.91.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index 4694506..6fddcc7 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -45,7 +45,13 @@ SRC_URI = "\
 # * disable-api-keys-info-bar: (off by default)
 #       This disables the info bar that warns: "Google API keys are missing".
 #       With some builds, missing API keys are considered OK, so the bar needs
-#       to go.
+#       to go. Conversely, if Chromium is compiled with this option off and
+#       the user wishes to disable the warning, the following lines can be
+#       added to the "google-chrome" script (see patchset) before the
+#       chromium binary is called:
+#           export GOOGLE_API_KEY="no"
+#           export GOOGLE_DEFAULT_CLIENT_ID="no"
+#           export GOOGLE_DEFAULT_CLIENT_SECRET="no"
 #
 # * component-build: (off by default)
 #       Enables component build mode. By default, all of Chromium (with the
-- 
2.7.0.rc3


