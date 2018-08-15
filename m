Return-Path: <nickaein.i@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 365D179179
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2018 10:06:57 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y2-v6so908612wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2018 03:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EFnarzq0tI4KviIhPbGeuLUY1eADgcx5rK28qNtXX2I=;
	b=iPCjSJpBRUfOotDG+QELRpV75gV4kUsjVBjk5U9nFkfGF7JWY3JOclr180Wlii2MRs
	rD5OSTEQBcwIB8kN2APXrO2RzFe7Cq2allM5S1tRPLC0V9oL8ADvLHpBSULnLrHwh+aJ
	jLG1xl3TVb7x2CBwITnowZTxGq1aA5C8Ve140EprdL1tvxLw6xkI54YISzWZMXZO1oaG
	SIXQj7xBC90p43vBbrPczpsuqxriTrUx/UndvV8cu5GBZrZV4bN0nBoy46uxf8bA9g4d
	Vn6+lv/KgWg10ka2Lyca+Rt0an/MSv9OLRwlzwej/eDpZz7xvBsT5aXsHYzEM0q+zJd4
	jofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EFnarzq0tI4KviIhPbGeuLUY1eADgcx5rK28qNtXX2I=;
	b=Oi5Pkneom0IFx/3TBZ6MmjvxoHkFAb65cgo26p23BiuTituSYTljts1KnBkIgac1vz
	5aKOGXJv1OYFH1fOW5+BDECvYIBkjm+CZTSQYXFUds/0yTkkdQ7CFJhhEDZkMAwRCN9m
	ry4af75ZPfneKuGO1WR7DG51AfPWhu05azpqw/li0/QU/ohWuwQ95sBDb8/RTKjtCO2V
	S/iMToMCXz00s0IJVZKefi2wBUAdS9UFO4BZucpTsyTsrLRiA0wI01AMJHQ9MvRCrLWD
	v0JLaf8UmfXncQLMtV5drWO9ITQfWeEIjxBrYCsduE1FTGE3aqTZwhNpTJgA5W6/Wwy1
	F2kw==
X-Gm-Message-State: AOUpUlFeqb6kWZ+D5qDvRKryTL9VRMaF+YiHBr4x9jLygfCKer7Cf80Y
	fORgm+WGpi2/3VVfovYWrt5gOQKAFTc=
X-Google-Smtp-Source: AA+uWPxhqWSG+eXLtmACcJDukgAcTofAHiLL2uz4uIYd1uAxhIfutM4NTWE+3QcTbUtHllhCoVOC/Q==
X-Received: by 2002:a1c:4004:: with SMTP id
	n4-v6mr12725081wma.83.1534327618435; 
	Wed, 15 Aug 2018 03:06:58 -0700 (PDT)
Received: from localhost.localdomain ([91.92.208.25])
	by smtp.gmail.com with ESMTPSA id
	w204-v6sm1888566wmw.5.2018.08.15.03.06.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Aug 2018 03:06:57 -0700 (PDT)
From: Isaac Nickaein <nickaein.i@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Aug 2018 14:36:49 +0430
Message-Id: <20180815100649.55872-1-nickaein.i@gmail.com>
X-Mailer: git-send-email 2.17.0
Cc: Isaac Nickaein <nickaein.i@gmail.com>
Subject: [PATCH] iotop: Add missing dependency: python-subprocess
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
X-List-Received-Date: Wed, 15 Aug 2018 10:06:58 -0000

This adds python-subprocess as run-time dependency for iotop.

More info:
http://lists.openembedded.org/pipermail/openembedded-core/2018-August/154111.html

Signed-off-by: Isaac Nickaein <nickaein.i@gmail.com>
---
 meta-oe/recipes-extended/iotop/iotop_0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/iotop/iotop_0.6.bb b/meta-oe/recipes-extended/iotop/iotop_0.6.bb
index 5dcae98b1..45c2ed01f 100644
--- a/meta-oe/recipes-extended/iotop/iotop_0.6.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_0.6.bb
@@ -21,4 +21,4 @@ do_install_append() {
 
 RDEPENDS_${PN} = "python-curses python-textutils \
                   python-codecs python-ctypes python-pprint \
-                  python-shell"
+                  python-shell python-subprocess"
-- 
2.17.0


