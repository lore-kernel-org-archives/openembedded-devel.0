Return-Path: <danismostlikely@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id BD63C731B9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 14:02:47 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 66so11750408pfy.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 07:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=QXBg9aC/ZFxr40CI/yitzt0j7ThUi4KVd+4XfUja1sk=;
	b=mhGwkFYxR1qfohoIeNlguHrI6VyBLIfwH0ld1tHnyhk7iFcyfyaoOUBT8X2NeYQ9TV
	2TL6zB4e6sQSD9V3zXRQTdldkx8fOcar+3jvpQV4HZU5XwUe1QZro1JR8Vu3kzs9A6VQ
	yWaC5m89uZuEalRPj5gV14Nq1C0HwYATx2UuMuoqa5+d7NeHsfm3LiO0uV+rZ+y1ZL3/
	ZBiBSilXd7PW2GwZmzz0K9En2VjO5SY1LbpP3PorQr8nW7SgB0qDMkQnhu+tp5jzSVuM
	Sr0mjX7eNQNW2PoUSftEQ9GSGuk1+/TU6mZv5imL5mIjO1oSA/Gv913vgIVEpTHfZeZx
	U/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QXBg9aC/ZFxr40CI/yitzt0j7ThUi4KVd+4XfUja1sk=;
	b=Wfk14f8UApqE2Xc9vpqD/FK4agUI+xG3VbSJFjCfO+SVZqFaaViAzTdGdwUhpRp/pC
	AN9YLeJeaRotzkCahXcV0LnQXGyGgBWUFuYR8aeJetyumt/gzZDh4QY65bFXHgQ0za0w
	PsEORwXzARwc6g1FI7n4PF9ftrqIXMXOcEliToas4cTcaFiSRVdHaXLmDpyZr17JFePk
	FV6kD6JgFg8AiE29rGcrRE9FygiLZRZgDLZEOtFczCoZw7EdDZMGrm2wFdrZhLihoKfy
	jeComzNAVtrTksNp0JtWFZJWksIS5FwrHiL/M8XPkFl12Re7Kb/mz+/+97/mi1AWwDew
	kLpA==
X-Gm-Message-State: ALyK8tKF9HmSx9bJ33Dv4VrVKTTTUMUiYHvjs6XxNW+XPwDQG6UU2TUrP2SNEq0x4Qptbw==
X-Received: by 10.98.50.1 with SMTP id y1mr21749051pfy.120.1466431367636;
	Mon, 20 Jun 2016 07:02:47 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	68sm25273110pfe.65.2016.06.20.07.02.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Jun 2016 07:02:46 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jun 2016 08:02:43 -0600
Message-Id: <20160620140243.27440-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [meta-java][PATCH] icedtea7-native: make GCC 6 happy
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
X-List-Received-Date: Mon, 20 Jun 2016 14:02:48 -0000

From: Daniel McGregor <daniel.mcgregor@vecima.com>

GCC 6 sets the default C++ standard to C++14 and introduces dead store
elimination by default. icedtea7 is not ready for either of these
changes, so just set the C++ standard back to gnu++98 and disable dead
store elimination.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 recipes-core/icedtea/icedtea7-native.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index d624b7a..fa78991 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -17,6 +17,14 @@ PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xproto-native libxt-nativ
 OEMAKE_BUILD_HEADLESS_ONLY = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'BUILD_HEADLESS_ONLY=1', d)}"
 CFLAGS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ' -DHEADLESS=true', d)}"
 
+# CXXFLAGS doesn't make it to all calls.
+# Set the C++ standard version for C too.
+CFLAGS_append = " -std=gnu++98 -fno-tree-dse -Wno-error"
+# Disable dead store elimination and set C++ standard to C++98.
+# There are dead stores in the JVM that would be pretty hard to
+# remove, so disable the optimisation in the compiler.
+CXXFLAGS_append = " -std=gnu++98 -fno-tree-dse -Wno-error"
+
 inherit native java autotools pkgconfig
 
 JAVA_HOME[unexport] = "1"
-- 
2.9.0


