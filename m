Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qjrup-00072f-II
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 13:59:43 +0200
Received: by fxh10 with SMTP id 10so3488885fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 04:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Gb34Ki+zmG5pxtkcR/05U/rQHs8Srt18AXYxA6ETwzA=;
	b=X0vjG02vpj6WvSNGiCTRPry+zHfrs1u898DYCystRBqt7GAH8k2FaJ3xbmtRYDfNfU
	BQrGmaEvRbMkOe3GP5uU/b6VNmfvHQuxae9dFJk2JsVtNkRv5KJ5kiok8BOoaIhwf3TS
	yypzqA9DfDc2wibRCGRUD9x92YGmcgWItVO9A=
Received: by 10.223.28.65 with SMTP id l1mr174569fac.136.1311249334902;
	Thu, 21 Jul 2011 04:55:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 9sm1360405far.13.2011.07.21.04.55.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 04:55:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jul 2011 13:55:25 +0200
Message-Id: <1311249325-29049-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH] connman: remove if_alg.h test from configure
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
X-List-Received-Date: Thu, 21 Jul 2011 11:59:43 -0000

* we're not building alg-test and if_alg.h needs newer linux-libc-headers than many distributions prefer now

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/connman/connman_0.76.bb   |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/connman/connman_0.76.bb b/meta-oe/recipes-connectivity/connman/connman_0.76.bb
index 8257be5..cb84caa 100644
--- a/meta-oe/recipes-connectivity/connman/connman_0.76.bb
+++ b/meta-oe/recipes-connectivity/connman/connman_0.76.bb
@@ -25,7 +25,9 @@ SRC_URI  = "\
 SRC_URI[md5sum] = "59b4cfd9fa4f736f7a2d88ee0c758fe9"
 SRC_URI[sha256sum] = "bf58fa72454bb63033da8f847a4709dbdfe64c000056a93a7504240cb31c1321"
 
-# alg-test doesn't build, so disable that
+# alg-test doesn't build, so disable that and test for if_alg.h as this header is only in 2.6.39
 do_configure_prepend() {
 	sed -i 's:tools/alg-test ::g' Makefile.am
+	sed -i 's:AC_CHECK_HEADERS(linux/if_alg.h, dummy=yes,::g;
+	        s:AC_MSG_ERROR(User-space algorithm header files are required))::g' configure.ac
 }
-- 
1.7.6



