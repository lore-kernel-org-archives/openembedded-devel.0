Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 924A7607A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 20:31:54 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i123so3794375pfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1pEr5ISjDsHj4FR94BJxJqaSIl1QJSn1Vsb3IUSl55M=;
	b=FhQOPi/tnJEoXYcdL3X8QiOGyyK+YoCPODTkla/EAxYil8RFbGPZLjmKRxRey1uix0
	B8yLeChu4MyerO/AS+ulJWX/FjCt5TSHTJLK0k5iyfox/E6psCl8F/TKXdrFc8JNYTVN
	/3o5BvW9fiZiO0/rBOjCKxChUFV54GkUDIELawttZ6ZnZg9fr6UVobIzL3C+QtsqJ+pD
	yj3UBteDy7e3WHn0kITcUlyyQNL8Wwa+ZOjrjm5Ck6esRaCrILUHcfMfZqQ/JamWJucO
	G+jRrOj4W/q53DjMtsNJRhON0mHZXmg2QJCvRfeG/L5UGqfYcOLC41xPbtOrol/uI4Bf
	lpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1pEr5ISjDsHj4FR94BJxJqaSIl1QJSn1Vsb3IUSl55M=;
	b=kVbfwP2W1r7oCYzoHGW/WaiMacdS/jBHPfJcbYJbKq4z671toerCkasyVf+w7eHknS
	nTJAkkqi4PjOCjH2Jtmn3qe97ujWMwTtiSDBQwImuoDkehCRSRrvvR7yrRWtcX/GLufE
	d4Lpie1ur1Y4BCR28zbvVq/5uowhI7Zw3N/iBOjz+gBDYxpmcbBbMqPSiDTom58vZztS
	pkgo9kMHdUwpOfS97aNqGKyOg5sw9Ls41KEW5w/z+5Wtt1F1/URExUi5z7V4WFgPdai5
	h5mALMZyJrAlRdJEdyfsM7fugvaJy6tBRwjJTzGFHxIb3xcQZILWd47Knj/qsdHPRWRs
	LZnA==
X-Gm-Message-State: ALyK8tK4OO2F1cM9e6P1MVvhEKMIRZSitwBrMLDWiyZaMFttAOVf6/2E+mcNlujP6izaAw==
X-Received: by 10.98.58.203 with SMTP id v72mr4334574pfj.113.1466195515737;
	Fri, 17 Jun 2016 13:31:55 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	o84sm65969067pfj.95.2016.06.17.13.31.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 13:31:54 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jun 2016 13:31:51 -0700
Message-Id: <1466195511-6914-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH] vboxguestdrivers: obey LDFLAGS
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
X-List-Received-Date: Fri, 17 Jun 2016 20:31:57 -0000

From: Christopher Larson <chris_larson@mentor.com>

We need to obey LDFLAGS to get the correct hash style for external toolchains.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb
index 781e3d5..081e977 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb
@@ -40,7 +40,7 @@ do_export_sources() {
 
 # compile and install mount utility
 do_compile_append() {
-    oe_runmake -C ${S}/utils
+    oe_runmake 'LD=${CC}' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
 }
 
 module_do_install() {
-- 
2.8.0


