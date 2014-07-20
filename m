Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id F40DF7037F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 09:50:00 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so2695805wiw.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 02:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7KXXXJXhCUPKBsn9XiXr3QijfB2q5+k8e82TNB7FLGw=;
	b=Wcxgy4h8LjUmO62NeK21SyVtEdejOiXU8133MsH+NpGcm7aft+pgZUpImA19fBXQ+F
	nIir0qWm7kJfmZNI5vQsWxiAW46/7iiOdIBcw8gPbeTm4Ph4mBFv2AQhVps0YRKBx1GB
	NRI7Cd1QofQDEtyUU53VKOboYbVk7P6jKDAyP7e4wqiE1GswX3qsQzxw2WxQ7oUTWep6
	wNmfcw/u9ZJlbPAGC39dOOstU1t8q3hzLzngG4pZ0AFfhsI6qYgAD7m9wbgIA54MWHMB
	VwUeR0vR7xaMvHnMTIGY1tRywjI9qzYdAx1TGsgZN8hC88TbwEnuvhqpysN50EORVbiM
	MsSQ==
X-Received: by 10.180.92.73 with SMTP id ck9mr14722076wib.54.1405849801206;
	Sun, 20 Jul 2014 02:50:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gq4sm28278159wib.8.2014.07.20.02.50.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 02:50:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 11:50:09 +0200
Message-Id: <1405849809-30338-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1405849809-30338-1-git-send-email-Martin.Jansa@gmail.com>
References: <1405849809-30338-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 4/4] rtorrent: add ncurses dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Jul 2014 09:50:01 -0000

* otherwise fails with:
  | checking for NcursesW wide-character library... no
  | checking for Ncurses library... no
  | checking for Curses library... no
  | configure: error: requires either NcursesW or Ncurses library
  | Configure failed. The contents of all config.log files follows to aid debugging

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
index 3addf92..eb0a39a 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://libtorrent.rakshasa.no/"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "libsigc++-2.0 curl cppunit libtorrent"
+DEPENDS = "libsigc++-2.0 curl cppunit libtorrent ncurses"
 
 SRC_URI = "http://libtorrent.rakshasa.no/downloads/${BP}.tar.gz \
     file://don-t-run-code-while-configuring-package.patch \
-- 
2.0.0


