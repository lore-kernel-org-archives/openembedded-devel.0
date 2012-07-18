Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srbr2-0001hO-Kk
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 23:32:20 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so4571978wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GFiBonyFad3ivT8xO/zj6KQ/e4j/cj4OoXdGctL3wxc=;
	b=nFfjCnQtGtn5MosbzfN5NM1onxa4RCJqMrzynIU/02QuvU5NxvBAlpTPk/Uhd2Wgy5
	UbT98l+kr1o2TUICW1RbM7yBRPhrxN24Tu+ufSc3LfD68fs0luJU0TdEVW0Ay/JM1RhZ
	dvHKZGf1rlNj8XPHyheqHkUs+8/WUtv2ov6gysNj4r6uX5V9U+rUuFCPw7LN238K9ums
	kHqEtOhcGs5zn51wBXhLNNXlxo1GtcGj5q83uEg2pHaAoEM4AHHab3kYNoTL9w97SREQ
	EQFPzEKDLU8hkXKkyUdpskHs/lWfjuUNESEoqoDUQfjxTfTVXFY0s+GGyx96s272PL3a
	1+Eg==
Received: by 10.216.132.18 with SMTP id n18mr1388210wei.194.1342646461890;
	Wed, 18 Jul 2012 14:21:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ef5sm383637wib.3.2012.07.18.14.21.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 14:21:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2012 23:19:24 +0200
Message-Id: <eebe946c8729888b9a4aa6115fec5bada2cf4e35.1342645937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][RFC 14/14] terminology: add terminology-themes to RDEPENDS
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
X-List-Received-Date: Wed, 18 Jul 2012 21:32:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/terminology_svn.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/terminology_svn.bb b/meta-efl/recipes-efl/e17/terminology_svn.bb
index 2bb4f7c..48d229b 100644
--- a/meta-efl/recipes-efl/e17/terminology_svn.bb
+++ b/meta-efl/recipes-efl/e17/terminology_svn.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=03f6c2cf2bef233fadf7d0769f5bfda7"
 DEPENDS = "evas ecore edje elementary eina eet emotion"
 
 PV = "0.1.0+svnr${SRCPV}"
+PR = "r1"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e gettext
@@ -17,3 +18,8 @@ EXTRA_OECONF = "\
 FILES_${PN} += "\
         ${datadir}/icons/terminology.png \
 "
+
+# doesn't start without own theme
+# ERR<770>:terminology utils.c:26 theme_apply() Could not load any theme for group=terminology/background: No Error
+# CRI<770>:terminology main.c:448 elm_main() Couldn't find terminology theme! Forgot 'make install'?
+RDEPENDS_${PN} += "${PN}-themes"
-- 
1.7.8.6



