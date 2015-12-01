Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0F74F6B6EE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 17:16:38 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so11862015igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2015 09:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CN9/oMhY2e7Qek1X+Y2soIomRBJNCHGMPast5zWKB7I=;
	b=is9Skkg4lc52z/k/vJCPF4ikN63EhPIqmMJFrMVflshtY+/HQ04RV0nZiXsju8vzjw
	V2wuy0z+WrusTb8JYN5+2REbWyBl7Kk6ZR4W9xkgZo2Ol4LR270UT5y5PL1nsT0T4EF1
	kbjVAumwx4rPmHW11pizOc9D4s2k1QVDw7eHKT/nPN3/mHCQ0/9CTMVzC/Ks8iIZxr7q
	EJx8fsk9YGnO6yDS9hbJhXsEbnfIk3IZTZYiD0+FuR6h+TrPhmuzeKBvJZRghvU5Ugwd
	2wr1G1o2qjFDEfH7H7R+VL12Xh6+4u++jSw6WtAOgwtn98Hox0CcRRUccFpvfVse/3nY
	JFQg==
X-Received: by 10.50.17.74 with SMTP id m10mr28375271igd.8.1448990199392;
	Tue, 01 Dec 2015 09:16:39 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	qb7sm288509igb.8.2015.12.01.09.16.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Dec 2015 09:16:38 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Dec 2015 12:15:51 -0500
Message-Id: <1448990151-27720-3-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.6.3.368.gf34be46
In-Reply-To: <1448990151-27720-1-git-send-email-twoerner@gmail.com>
References: <1448990151-27720-1-git-send-email-twoerner@gmail.com>
Subject: [meta-oe][PATCH 2/2] nodejs: add recipe for latest stable
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
X-List-Received-Date: Tue, 01 Dec 2015 17:16:41 -0000

The latest stable version of nodejs is 4.2.2; add a recipe to make it
available.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_4.2.2.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_4.2.2.bb

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.2.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.2.bb
new file mode 100644
index 0000000..7572625
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.2.bb
@@ -0,0 +1,9 @@
+require nodejs.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ee90ba97d933fc8d56e97812b7dd62e9"
+
+SRC_URI = " \
+    http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
+    "
+SRC_URI[md5sum] = "7c46c158e4c9a44cfbd039951c13dfe6"
+SRC_URI[sha256sum] = "00e709353435b436b5bbf5e62272ebb15fe801065422c4c2afe2b93456210cb1"
-- 
2.6.0.rc3


