Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 31A1E74769
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2019 09:44:05 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id p10so5841445wrq.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2019 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=o0WEg+cOykj5AoU2x1QJOHjtL9Ds+QQJc/memDK3rfw=;
	b=LEfirAqqAFKYISHtujNq74rgrsVREYwtUOSOZCsNUFiYuyIM7O4qs1SXegJQ8jtu4Y
	V2t7BM4QwR/QcM6INu+NZRtfvhImpy686rCmqhM5x/N62+onodRWbUaguy1rTRhdqi0B
	s8ESES6R/0V1z90w9ybKqKjDrCY5TScmoAiwQ8RiWHEZNJNUtWsb2IsTgTazOm4sFdr8
	QjavWT88QO3TBJSFB1zUcu1H6druvVY/fIK807BHugU6GtTgZNgrM3JXWVvThWwOpU6w
	XvjuoeDIXqZHctx1C7kb/hTiPNNw5RrqJXlPSi0pL3IA/KVADA7asX/3d8DEnGmvldPb
	r1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=o0WEg+cOykj5AoU2x1QJOHjtL9Ds+QQJc/memDK3rfw=;
	b=IiCE6izq3k1xLhLZ9IXSuP+Luwj57thGlrxwyzcUPjOsAAb03P3iLv8AJ45XMzMd3o
	/bhEZ1oP48s6pbZo9bbCs2e8eWs7MCNRF+wlj0jcTRZ1zNe3oYjCF5QjYVqPz7zMq+l8
	V9uB/EBS9w4S0jwNZj6SyeYdyI1A52+IIP7mbnxBSIWwVHjVQIeD7kUMJRudlqDnpv9/
	Gr6p3wlpTwv6w9vA9M8vbtROH9tM4zZGdfdR52DX/U+OZkyDW97Psbly8zT1ywT6+DU0
	D7faYT1nOOeyDl3t5Y+V8nDIfMmN8XPaIaksSquEbt34kZgQkr8RMIGxpqwwcP407XLu
	6siA==
X-Gm-Message-State: APjAAAV5+deyauS1/+qKVcXIW9hACemLHEG5knK/pAuaIy+O2Jv3RobB
	Ueps/puqrFYaFLu9rh1oEREOILY9
X-Google-Smtp-Source: APXvYqxlHuROkcwpajAILUnZfnKax+Cxz27fHvn9/XMguFj51Kp0mRXFBodT2HopQHgRUbEtP5m6aw==
X-Received: by 2002:a5d:564d:: with SMTP id j13mr1803171wrw.155.1553161445517; 
	Thu, 21 Mar 2019 02:44:05 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id u2sm7107946wmc.45.2019.03.21.02.44.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Mar 2019 02:44:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Mar 2019 10:43:50 +0100
Message-Id: <20190321094350.24576-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] physfs: upgrade 3.0.1 -> 3.0.2
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
X-List-Received-Date: Thu, 21 Mar 2019 09:44:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Announcement [1] says:

This is a collection of small fixes to 3.0.1. All 3.0 users should
definitely upgrade right away.

[1] https://icculus.org/pipermail/physfs/2019-March/001280.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../physfs/{physfs_3.0.1.bb => physfs_3.0.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-support/physfs/{physfs_3.0.1.bb => physfs_3.0.2.bb} (74%)

diff --git a/meta-filesystems/recipes-support/physfs/physfs_3.0.1.bb b/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
similarity index 74%
rename from meta-filesystems/recipes-support/physfs/physfs_3.0.1.bb
rename to meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
index 18bedb892..8dc30bd5f 100644
--- a/meta-filesystems/recipes-support/physfs/physfs_3.0.1.bb
+++ b/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
@@ -9,7 +9,7 @@ inherit cmake
 PE = "1"
 
 SRC_URI = "http://icculus.org/${BPN}/downloads/${BP}.tar.bz2"
-SRC_URI[md5sum] = "359f102bcbd62accf84ef32f4863255d"
-SRC_URI[sha256sum] = "b77b9f853168d9636a44f75fca372b363106f52d789d18a2f776397bf117f2f1"
+SRC_URI[md5sum] = "dc751294aaf59d1359bbe34e693d1d87"
+SRC_URI[sha256sum] = "304df76206d633df5360e738b138c94e82ccf086e50ba84f456d3f8432f9f863"
 
 EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
-- 
2.20.1


