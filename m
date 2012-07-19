Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrtPV-0004Ew-U7
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 18:17:05 +0200
Received: by bkcik5 with SMTP id ik5so2153382bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=U8wAX3HDd8rV+coZvss1fZpRTDC4B0peg0AM5Ni2/r4=;
	b=jhzU1fYaYzDKPJlnxRcAxKukZTkpKFC79T5lIi8XbJ3RyOW78MgjbEIb95Lh4r0Nnw
	LHBIf82H127TY0kjzXFeaJpd/AdQoEbt6ey4FV8JQzClLdlv4a/kqE7XBX5oCRo0qZUG
	80SOwtsHqGchzFeVoehnJYhK/7EsOk7J3qPFOrPFgJzHTba39C8AstD0hZKvCA5WPsot
	k8mJnqC2PTM4h30VPgqS/DzltJSS+fowEDl2jnr8HNZDEg7IogwfWzB18ZAFyh2WnT4y
	80IGeObaxdTzFrq2+JlFy9J5FddfRWCVBZVRRXKMOjzCQ6G7p09qgbZIoqvX2CYhtmzV
	F7tA==
Received: by 10.205.128.3 with SMTP id hc3mr1495575bkc.29.1342713943929;
	Thu, 19 Jul 2012 09:05:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gq2sm1506682bkc.13.2012.07.19.09.05.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:05:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 18:05:52 +0200
Message-Id: <1342713953-13000-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH 1/2] eina: do not remove bindir, it's not created with new automake
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
X-List-Received-Date: Thu, 19 Jul 2012 16:17:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/eina.inc |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/eina.inc b/meta-efl/recipes-efl/efl/eina.inc
index 8c9a0df..4a77de3 100644
--- a/meta-efl/recipes-efl/efl/eina.inc
+++ b/meta-efl/recipes-efl/efl/eina.inc
@@ -11,7 +11,3 @@ inherit efl
 AUTO_LIBNAME_PKGS = ""
 
 FILES_${PN} += "${libdir}/eina"
-
-do_install_append() {
-  rmdir ${D}${bindir}
-}
-- 
1.7.8.6



