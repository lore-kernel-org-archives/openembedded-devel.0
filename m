Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 79D58700FD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:34:27 +0000 (UTC)
Received: by pfbo64 with SMTP id o64so28453634pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=m5ZEHjr06WiY9/JXFy+KXGftUs4HVx1tTLUlRwTsnfw=;
	b=y1LSMTOma4YbKdDLIxdEbqgRkv9Kv20fIR9pRb8PvS1VGht6SNX80MhveqShCmgy0a
	CCH2pEZFC6VEg4s7/QMLQ98pZhu2lDWtX+RZCpymi/kBo25RMqF3z9N5Cq0RJadk47fy
	tEFlOTnvXrqPjNeRA2dMdhT6SYVP20xBNsiHdW+ofTrPd9Y1L92T4c+yRpCKeWjPx6ha
	id8zXl0zyjTq2lI+MD0LzdlCk4L3sKJm1EzY7Bmp5dEqbn1zQO7fW8UKc/jhbgeuTF42
	wM42N+2vcXSBGS+GUx0G2S372x93JSkFM7yP+uMEOLEJDfNzIH51wZ02GyxOT8LpkVpu
	4w2Q==
X-Received: by 10.98.16.67 with SMTP id y64mr33931678pfi.152.1450107268830;
	Mon, 14 Dec 2015 07:34:28 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	yn8sm43762155pac.32.2015.12.14.07.34.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 07:34:26 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id AE27DFCC83D; Mon, 14 Dec 2015 07:34:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 07:33:54 -0800
Message-Id: <f4d869b71d52509d21561fad8c1cf060dddee7b1.1450027640.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
Subject: [PATCH 01/14] netcat: add DESCRIPTION
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
X-List-Received-Date: Mon, 14 Dec 2015 15:34:31 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/netcat/netcat.inc      | 10 ++++++++++
 meta-networking/recipes-support/netcat/netcat_0.7.1.bb |  2 --
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/netcat/netcat.inc b/meta-networking/recipes-support/netcat/netcat.inc
index 9cb243d..91a24a1 100644
--- a/meta-networking/recipes-support/netcat/netcat.inc
+++ b/meta-networking/recipes-support/netcat/netcat.inc
@@ -1,3 +1,13 @@
+SUMMARY = "GNU Netcat"
+HOMEPAGE = "http://netcat.sourceforge.net"
+DESCRIPTION = "A simple Unix utility which reads and writes data across network \
+connections using TCP or UDP protocol.  It is designed to be a reliable \
+'back-end' tool that can be used directly or easily driven by other \
+programs and scripts. At the same time it is a feature-rich network \
+debugging and exploration tool, since it can create almost any kind of \
+connection you would need and has several interesting built-in \
+capabilities."
+
 SECTION = "net"
 inherit update-alternatives gettext
 
diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
index 8710c36..d961af5 100644
--- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
+++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
@@ -1,6 +1,4 @@
 require netcat.inc
-SUMMARY = "GNU Netcat"
-HOMEPAGE = "http://netcat.sourceforge.net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-- 
1.9.1


