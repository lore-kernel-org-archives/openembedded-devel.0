Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2MZv-0007PA-1k
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 13:54:51 +0100
Received: by eekc1 with SMTP id c1so738408eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 04:46:23 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.124.69 as permitted sender) client-ip=10.14.124.69; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.124.69 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.124.69])
	by 10.14.124.69 with SMTP id w45mr11303181eeh.6.1330433183849 (num_hops
	= 1); Tue, 28 Feb 2012 04:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=SkcrMz+k8LZOUg/xlf735E3iTxwVCb7ABAbF79Td+z4=;
	b=UOVwCIyuPcBiUw1IpkbHPP8iTKi/9ENpkoSJ1TkndvwCJGSrlk8KV7jXErrn6LNbl3
	Es62mXiZ5LjGwdrJrn9JQbEi7EyI0xenjdeVDbRCGr2mULiUmdg2mLGVpA30WCqTJvnn
	lXWuzEfR3v/Z6Mj+tJyet+FWfAky3xgSl+YXY=
Received: by 10.14.124.69 with SMTP id w45mr8406485eeh.6.1330433183767;
	Tue, 28 Feb 2012 04:46:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u9sm69988378eem.11.2012.02.28.04.46.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 04:46:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 13:46:15 +0100
Message-Id: <1330433175-11880-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [meta-oe][PATCH] tiff: rename bbappend to match new version from oe-core
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
X-List-Received-Date: Tue, 28 Feb 2012 12:54:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/libtiff/tiff_3.9.5.bbappend |    1 -
 .../recipes-multimedia/libtiff/tiff_4.0.1.bbappend |    1 +
 2 files changed, 1 insertions(+), 1 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libtiff/tiff_3.9.5.bbappend
 create mode 100644 meta-oe/recipes-multimedia/libtiff/tiff_4.0.1.bbappend

diff --git a/meta-oe/recipes-multimedia/libtiff/tiff_3.9.5.bbappend b/meta-oe/recipes-multimedia/libtiff/tiff_3.9.5.bbappend
deleted file mode 100644
index d3267ac..0000000
--- a/meta-oe/recipes-multimedia/libtiff/tiff_3.9.5.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-multimedia/libtiff/tiff_4.0.1.bbappend b/meta-oe/recipes-multimedia/libtiff/tiff_4.0.1.bbappend
new file mode 100644
index 0000000..d3267ac
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libtiff/tiff_4.0.1.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native"
-- 
1.7.8.5



