Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi5X-0002oS-Gz
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:18:23 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kvoymjHbHVraFxcQJuB0t875BqOB3mn1hx3IYaP2wnM=;
	b=OdVZaz6iNlGsWJY1LELCskcCdxU6aNq5QxE4eFmUyF0qqnOYVeU5TNAFuNgCWAWBmk
	BIfthL791pf7cWtzvJ6R1Fj+tuZWtXfJ64PCWc7RcJDyPMhY50+hkwStkcSA4JrjHICu
	7P9xlBXKcadh2zYpdNpDiRl0nCQpYvqRF1+9377708UNCGPMarfecxwW2z8LHoF2YPwy
	2tQrCcJ0qM82xhlg4zK9s7rqCX9LTkfZqydIH3yEpwAv2XftjhqpFwoWveKiz72uSQok
	YAE0SL+EF0CNLak8oG+j4M8GXjxyDokfKuLAB5yB7aGQQkQ2Rj0HWvZ8Yy5CQ6n/Pz10
	C0hg==
Received: by 10.14.207.6 with SMTP id m6mr42829154eeo.10.1354586643927;
	Mon, 03 Dec 2012 18:04:03 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a44sm34808246eeo.7.2012.12.03.18.04.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:04:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:05 +0100
Message-Id: <c1daa099ec2fc074e7e779b083946218c2f582ab.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 32/58] notification: remove recipe, notification module is now part of e-wm
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
X-List-Received-Date: Tue, 04 Dec 2012 02:18:23 -0000

* merged to e in r64475

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/notification_svn.bb | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/notification_svn.bb

diff --git a/meta-efl/recipes-efl/e17/notification_svn.bb b/meta-efl/recipes-efl/e17/notification_svn.bb
deleted file mode 100644
index 1f4567a..0000000
--- a/meta-efl/recipes-efl/e17/notification_svn.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-LICENSE = "MIT"
-PV = "0.2.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-
-require e-module.inc
-
-do_configure_prepend() {
-    sed -i -e /po/d configure.ac
-    sed -i -e s:\ po::g Makefile.am
-}
-
-
-
-- 
1.8.0



