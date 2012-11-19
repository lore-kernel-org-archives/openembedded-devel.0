Received: from mail-ye0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TaQFT-0000BE-20
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 13:14:50 +0100
Received: by mail-ye0-f175.google.com with SMTP id q1so103384yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2012 04:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=W8Z35ayuTaiBWlDVQD1H8r5lLsZP0CGiyw7h2x2vtDk=;
	b=sXXpRx8CLV54Qkbff2OBAd7K4VPfLVvZwu9R/IiZio1hU7MjdmK34+EHUubyfcP7Wl
	Y4sB4OealzCxr3uc5Iwze73ea+8VwaAh6GJV63nO/JQOnKNvoKc2EwOB+1uhHKLmByXB
	8PvWjd3QQNOaDodS2ThKPI1zUNT8GZ7ieZEc7uqZ/SJedIUIihBCF9SqJBjdYOxEQHg0
	Sdm4Ss3cqpiz1l5Elze+ZVw7tTJo3J9A4KBWof59Y0l4HgHZSXVl5XvWQOazZG5fv3e8
	CkhqtJoLini3alASSGn593qJ97hjz+ND0nFIFwMMozY9p7dbdnFcdbSMvHrkd3hE8Ycj
	PfOg==
Received: by 10.101.133.15 with SMTP id k15mr3191316ann.64.1353326444553;
	Mon, 19 Nov 2012 04:00:44 -0800 (PST)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id g2sm9474570yhj.9.2012.11.19.04.00.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Nov 2012 04:00:44 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Nov 2012 10:00:29 -0200
Message-Id: <1353326429-14624-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH] orbit2: put .a files into ${PN}-staticdev package
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
X-List-Received-Date: Mon, 19 Nov 2012 12:14:51 -0000

Change-Id: I1b1d5452fd0252f489061a7c6035a97e837c1d45
Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
index 9fe531b..3b6342b 100644
--- a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
+++ b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
@@ -10,7 +10,7 @@ SRC_URI = "${GNOME_MIRROR}/${SRC_NAME}/${SHRT_VER}/${SRC_NAME}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "10bfb957fa4a8935a0b4afaee7d71df7"
 SRC_URI[sha256sum] = "62bfce3f678f9347a19c766944e8aef7b89bc32b25ac23eb3e4c25929ce8974c"
 
-PR = "r4"
+PR = "r5"
 BBCLASSEXTEND = "native"
 
 IDL_COMPILER_DEPENDS = "orbit2-native"
@@ -24,7 +24,8 @@ PARALLEL_MAKE = ""
 
 
 FILES_${PN} += "${libdir}/orbit-2.0/*.so"
-FILES_${PN}-dev += "${libdir}/orbit-2.0/*.a ${libdir}/orbit-2.0/*.la"
+FILES_${PN}-dev += "${libdir}/orbit-2.0/*.la"
+FILES_${PN}-staticdev += "${libdir}/orbit-2.0/*.a"
 FILES_${PN}-dbg += "${libdir}/orbit-2.0/.debug"
 
 S = "${WORKDIR}/${SRC_NAME}-${PV}"
-- 
1.7.2.5



