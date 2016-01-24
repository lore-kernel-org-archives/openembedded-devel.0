Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 740F976E2E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 13:18:06 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id 94so8289229qgt.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 05:18:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=OZW6FU7xddDCjzyKZFxcS27CYUVeploFf2ciAct0NfQ=;
	b=hGFA0mdMpBLvpXMquR9kiBS/odNXFxvAOHlzEJNqfXKfy5nXwVlhhb/GXNoiuDF8rl
	p1cIl9m3AqR+aXVLZivdR12cNE6idHfHJIxOJVl3UAVk4Ef2Vkn3IHSVq7mIuF4RDLpP
	DIx/I5bo7v1z/hLLsMyLQkJRsHqNwZ02CwxSuhublmvvQ7BGuNbFupExgF/kcBXSp2ah
	30Z2q9r9vuYySI36s/FinwfYd2zMT/c1VrQfrGpp7c07FnuNIsbt7mSMUoaed+zDaBFZ
	hIZbf4OqbVxkaOu7Z/sfqqA1VLsirgN0eRzCgvCzTnotup54oSrtpHrxfPq0KcQY81RS
	+p7w==
X-Gm-Message-State: AG10YORUw+sYVe8FDUZLkM5ZE1mxO85eFHrqgeLZevJouEBEQG7f1sznEwF7gIIYuiKk/Q==
X-Received: by 10.140.107.182 with SMTP id h51mr15073670qgf.53.1453641487302; 
	Sun, 24 Jan 2016 05:18:07 -0800 (PST)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	d188sm6865927qkb.9.2016.01.24.05.18.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jan 2016 05:18:06 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2016 08:17:45 -0500
Message-Id: <e85a1fb72d85bbc617b33ec8962a56136aee9126.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 12/13] python-feedparser: update to 5.2.1
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
X-List-Received-Date: Sun, 24 Jan 2016 13:18:06 -0000

---
 .../recipes-devtools/python/python-feedparser_5.1.3.bb     | 14 --------------
 .../recipes-devtools/python/python-feedparser_5.2.1.bb     |  9 +++++++++
 2 files changed, 9 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb b/meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
deleted file mode 100644
index 92d5568..0000000
--- a/meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Python Atom and RSS feed parser"
-HOMEPAGE = "http://code.google.com/p/feedparser"
-SECTION = "devel/python"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f5fbe7f8b71b4019eca5ac5f900fd8ad"
-
-SRC_URI = "http://feedparser.googlecode.com/files/feedparser-${PV}.tar.bz2"
-SRC_URI[md5sum] = "6fb6372a1dc2f56d4d79d740b8f49f25"
-SRC_URI[sha256sum] = "7f6507d400d07edfd1ea8205da36808009b0c539f5b8a6e0ab54337b955e6dc3"
-
-S = "${WORKDIR}/feedparser-${PV}"
-
-inherit setuptools
-
diff --git a/meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb b/meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb
new file mode 100644
index 0000000..fa4f97e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Python Atom and RSS feed parser"
+HOMEPAGE = "http://code.google.com/p/feedparser"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c21a7713ef6dc1b99644061c397e7c2a"
+
+SRC_URI[md5sum] = "d552f7a2a55e8e33b2a3fe1082505b42"
+SRC_URI[sha256sum] = "bd030652c2d08532c034c27fcd7c85868e7fa3cb2b17f230a44a6bbc92519bf9"
+
+inherit pypi setuptools
-- 
1.9.1


