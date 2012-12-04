Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi4N-0002oS-Sl
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:17:11 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=NrfZkzKOW78/tVemHUePgRQkp9aiOfRHlybfp+t76Oc=;
	b=lu1/oKBOGlx+wEe/MWSm5auh11qYNj+Tj0ktjBpzcveI1m0qetHZ5/og3oQoMOuvWX
	iXeesiTkzoO7dL+zhkKBgww/GRvw5QwXEoVqNgGug9LcTqOH3WX2CCSYzKF+YRmmXyEv
	qBhBVuOUES8+sMvx/h4xKJvSEFCN+UGkaF1dvBxrg2AIKRgr3ea6T2KM7hKn9Xja+tJ3
	Eieo3DNctMRlei574taRTI/aITDjiVEmlsj7kF3mAqcGT1PECgYtXRJ+yxhx75zpGk+R
	BJ+AKSNhJ0F6oQYZUixrVnEaGJNqGL/KfIGcofyGqYWnS6fGIQ9tFwLG81HgsTE7nq2S
	ZJoQ==
Received: by 10.14.175.133 with SMTP id z5mr42868627eel.15.1354586572276;
	Mon, 03 Dec 2012 18:02:52 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm34802566eeo.8.2012.12.03.18.02.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:02:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:56 +0100
Message-Id: <6cbc1401adde16926cce33c66cc81a28b9d1017a.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 23/58] news: fix LICENSE and add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 04 Dec 2012 02:17:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/news_svn.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/news_svn.bb b/meta-efl/recipes-efl/e17/news_svn.bb
index e45cd44..9b89d80 100644
--- a/meta-efl/recipes-efl/e17/news_svn.bb
+++ b/meta-efl/recipes-efl/e17/news_svn.bb
@@ -1,4 +1,6 @@
-LICENSE = "MIT"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
 PV = "0.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 
@@ -8,6 +10,3 @@ do_configure_prepend() {
     sed -i -e /po/d configure.ac 
     sed -i -e s:\ po::g Makefile.am
 }
-
-
-
-- 
1.8.0



