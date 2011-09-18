Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYY-0004IK-JH
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:29:07 +0200
Received: by fxi1 with SMTP id 1so3592449fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=vwnhL4PQiw5Z+ImbfbsedA0Vqa+tNGEsd0q9t1/Vy2g=;
	b=hOWxWOt0thqwUK0HFPYQqW0pbXTPgxKTNk0m0CezfbU/Dj5sXNarcWqXTFuynT8EiB
	riJ0oQKDazWwGCzGBoCEMOxVDZPinWmsAbBxz4k5PGjY1o3Uq3YYz6kX2d/G0WDdQHSR
	Cj72gjWYV3VmolSkEc2lsGQ5wf2jn9OF9qSjY=
Received: by 10.223.29.69 with SMTP id p5mr1447030fac.35.1316345030665;
	Sun, 18 Sep 2011 04:23:50 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:50 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:15 +0400
Message-Id: <1316344999-26642-14-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 13/17] qmake: do not try to regenerate moc
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
X-List-Received-Date: Sun, 18 Sep 2011 11:29:08 -0000

There is no point in regenerating moc constantly. Add no_mocdep to the
oe qmake config. Also bump PR for this change.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-qt/qmake/files/linux-oe-qmake.conf |    2 +-
 recipes-qt/qmake/qmake-native_1.07a.bb     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qmake/files/linux-oe-qmake.conf b/recipes-qt/qmake/files/linux-oe-qmake.conf
index 205b693..4b7db70 100644
--- a/recipes-qt/qmake/files/linux-oe-qmake.conf
+++ b/recipes-qt/qmake/files/linux-oe-qmake.conf
@@ -4,7 +4,7 @@
 
 MAKEFILE_GENERATOR	= UNIX
 TEMPLATE		= app
-CONFIG			+= qt warn_on release
+CONFIG			+= qt warn_on release no_mocdepend
 
 QMAKE_CC		= $(OE_QMAKE_CC)
 QMAKE_LEX		= flex
diff --git a/recipes-qt/qmake/qmake-native_1.07a.bb b/recipes-qt/qmake/qmake-native_1.07a.bb
index 00faa9b..43d3a4d 100644
--- a/recipes-qt/qmake/qmake-native_1.07a.bb
+++ b/recipes-qt/qmake/qmake-native_1.07a.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "TrollTech Makefile Generator"
 HOMEPAGE = "http://www.trolltech.com"
 SECTION = "devel"
 LICENSE = "GPL QPL"
-PR = "r6"
+PR = "r7"
 
 QTEVER = "qt-embedded-free-3.3.5"
 
-- 
1.7.2.5



