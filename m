Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UWBnM-0005cA-TO
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Apr 2013 22:32:38 +0200
Received: by mail-pb0-f54.google.com with SMTP id jt11so1499939pbb.27
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2013 13:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=NLoDf7hGMRwGLFlOqX/TdQdLK1AZb/e70bMSjeThRU4=;
	b=uCzozSZMF2UJw6pVRlmVf5jHw4WDsu548ItvdFF/DPV1tdp9ajOyaGsFEyQ8FISGgN
	QfRVcY6I5kS5qWlNkSU3LtI0EegKzS4jUjYP1H6/AU/qwJDAsR1lQaC5/RJbHzsQial6
	mzROUPDIJhSbdoACoXHvA4Uuoq1Xt+ju0B6HlaNUlEMOsahLNNWhD+X+Upc+fJzkRWQX
	7ely2+99ZLtGz2E0DM9E2BGOox5Oo/rhV1ySsyKHPIiCV7zKVRCawClOLkEOMhacOwPB
	w7kw6trZDIs6+kwLb6P48Ht03FtHVx4Dekp7Y4hwtwXyeNjXE9Ra2aq4ElGLIAVUNiH6
	CHnw==
X-Received: by 10.68.130.194 with SMTP id og2mr65524903pbb.101.1367093685576; 
	Sat, 27 Apr 2013 13:14:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	qb1sm17039694pbb.33.2013.04.27.13.14.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 13:14:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Apr 2013 22:14:33 +0200
Message-Id: <1367093674-13613-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1367093674-13613-1-git-send-email-Martin.Jansa@gmail.com>
References: <1367093674-13613-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] libnotify3, nautilus3: exclude from world
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
X-List-Received-Date: Sat, 27 Apr 2013 20:32:45 -0000

* libnotify3 conflicts with libnotify and breaks couple of gnome recipes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb | 3 +++
 meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb   | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb b/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
index 4c46ec4..fb9752f 100644
--- a/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
+++ b/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
@@ -5,6 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "dbus gtk+3"
 
+# conflicts with libnotify, mixing them in build breaks couple of packages
+EXCLUDE_FROM_WORLD = "1"
+
 BPN = "libnotify"
 
 inherit gnome lib_package
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
index a9dcaf4..1acf8d3 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
@@ -11,6 +11,9 @@ PR = "r4"
 DEPENDS = "libnotify3 gtk+3 libunique gvfs librsvg libexif gnome-desktop3"
 # optional: tracker
 
+# needs libnotify3 which conflicts with libnotify, mixing them in build breaks couple of packages
+EXCLUDE_FROM_WORLD = "1"
+
 # to include nautilus3/no-try-run-strftime.diff before the rest
 FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
 BPN = "nautilus"
-- 
1.8.2.1



