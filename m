Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDWZE-0005IU-9c
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 10:20:32 +0200
Received: by bkcik5 with SMTP id ik5so2156766bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=nUlAyzWzt2OVF4zvvvPasxpwGQ9szO3+Ll2+G+u/zqM=;
	b=0XQtQD3NO4Nfa17QF4w3VCgTck8CNHbQ4aQJPCfYOflOLO+SpnP8wTXRswDOUvxvC/
	tfzxFO5fFVYcahJSLULI8AXlvelu5hIqwCIETaeuwX7Y5FSU98ds+1o51TvGmv+RoK6l
	u+HGEmCmD+mDvu7z22ffddyljOr7JDCdJrGlLbRXY65l5KL8U8ieHLPQd+3KMCzwXdh9
	FyizRUiz1F4SdSqjPpBUcgs7eYEvrLbdDTTCFOUBYzm8RyNXifgH1Y1e1005Y0Je8M/k
	jEpgXIa9fl15CIZ0RJCuoBGmVItHQPmDIreBe58GX1TmeYmWYyzymOU9IydFU7PNK1Ap
	RYPg==
Received: by 10.204.148.78 with SMTP id o14mr3936603bkv.38.1347869274073;
	Mon, 17 Sep 2012 01:07:54 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1A7D.dip.t-dialin.net.
	[79.223.26.125])
	by mx.google.com with ESMTPS id a17sm1387041bkw.5.2012.09.17.01.07.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 01:07:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2012 10:15:41 +0200
Message-Id: <1347869747-14271-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1347869747-14271-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347869747-14271-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 1/7] gnome.bbclass: remove to use oe-core's version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 08:20:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* suggested in [1]
* build tested from scratch with my working image [2]

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-August/041157.html
[2] http://gitorious.org/schnitzeltony-oe-meta/meta-misc/blobs/master/recipes-image/xfce-full-image.bb

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/gnome.bbclass |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)
 delete mode 100644 meta-oe/classes/gnome.bbclass

diff --git a/meta-oe/classes/gnome.bbclass b/meta-oe/classes/gnome.bbclass
deleted file mode 100644
index 0a32a77..0000000
--- a/meta-oe/classes/gnome.bbclass
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit gnomebase gtk-icon-cache gconf mime
-
-EXTRA_OECONF += "--enable-introspection=no"
-BBCLASSEXTEND += "native"
-- 
1.7.4.4



