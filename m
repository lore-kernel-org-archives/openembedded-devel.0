Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id B9363731CC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 19:35:48 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id q21so12330826iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 11:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zvZ7d1FJSpWD5htOt8p1F38sSs3lkwxgv06yaPwyAv0=;
	b=ojAodzBqqVJ89cTJCRUg356ro6syyAxUS/xxEatqhkScDT0sijP3Sq/AofM97t9UfC
	3bC435rBh+h5kfC9yVCZQIWgXokMeHJq4SeynyKKvBIZYnbe9oOpmcF0k4Xr4R6UO23X
	ehBR+UFpO6WtZaWYOwUw5bnl9OEr6ppsdfL8t/6Uw4oQ4lVw+SkzhOMj0cNuBLT7zSHV
	cQnctX8oskuo9OBkjdY0Es3hsGUNvE3lI9I0I4Qgkn5CYvluWUVoHHtwtNmiPkTSYUUG
	oN9293mx2FNnO6kWQmkSKBf98ijkROJK6/aOlA9XmhAG9V+MqGgeSho5Obc2Om3ljtSG
	K+Ng==
X-Received: by 10.107.12.22 with SMTP id w22mr98078271ioi.8.1451936149118;
	Mon, 04 Jan 2016 11:35:49 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id e3sm39684igx.0.2016.01.04.11.35.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jan 2016 11:35:48 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Jan 2016 14:35:19 -0500
Message-Id: <1451936119-27515-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.7.0.rc3
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-browser][PATCH] chromium_40.0.2214.91: API keys update
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
X-List-Received-Date: Mon, 04 Jan 2016 19:35:49 -0000

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


