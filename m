Received: from [74.125.78.147] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1MiUIE-00080I-5o
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Sep 2009 16:25:06 +0200
Received: by ey-out-1920.google.com with SMTP id 5so26378eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2009 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=GZw+H1btrDJojR0CD2iKcMiY2uMA2gkNKbSXWAQ5GE8=;
	b=ZdymrksqZTJWSi/ad6KmW0T41WQ4mL/ndw+4XQhZiSBMbGKFk5c0NWBgyFUnVvV6Os
	7ftjA3r0rsPHgOv+sRonHQKPjSxs7c7tK2aftsLThYmTHG4WR3yOmRoUdK/IdSPTNnBg
	43xCE8oU9B10TYqdnBFthRF4Z76++39YvxVMo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=clgbNly20ZV7UBvDCcX47yUKMBKDf7fu4A3A3C2YzG6VJcGB3pBYp5SO6mmyJCxUM+
	KUsob4EM8j+3EsJqS/eqF9Hl/IpD53GwdqXzCeDGMczaY5nhtLALJMNEIh7FZ+w2Qqf4
	hQk+XR0ny5PvZuktRONRsI2lkpYK1qZR5DsTc=
Received: by 10.210.144.16 with SMTP id r16mr6271543ebd.22.1251813989134;
	Tue, 01 Sep 2009 07:06:29 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 23sm2182eya.6.2009.09.01.07.06.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 01 Sep 2009 07:06:10 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Sep 2009 16:06:07 +0200
Message-Id: <1251813967-16058-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] xscreensaver: fix packaging and QA
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
X-List-Received-Date: Tue, 01 Sep 2009 14:25:06 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/xscreensaver/xscreensaver.inc     |    3 ++-
 recipes/xscreensaver/xscreensaver_5.07.bb |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/xscreensaver/xscreensaver.inc b/recipes/xscreensaver/xscreensaver.inc
index a4925ac..5f8cdc0 100644
--- a/recipes/xscreensaver/xscreensaver.inc
+++ b/recipes/xscreensaver/xscreensaver.inc
@@ -10,6 +10,7 @@ DEPENDS = "intltool mesa freeglut virtual/libx11 gtk+ libxml2 libglade"
 
 # xscreensaver-demo is a glade app
 LDFLAGS_append = " -Wl,--export-dynamic"
+TARGET_CC_ARCH += "${LDFLAGS}"
 
 inherit autotools
 
@@ -30,7 +31,7 @@ EXTRA_OECONF=" --with-xml \
 
 PACKAGES =+  " xscreensaver-demo xscreensaver-extra"
 
-FILES_${PN}= "${bindir}/xscreensaver ${bindir}/xscreensaver-command ${datadir}/applications \
+FILES_${PN}= "${bindir}/xscreensaver ${bindir}/xscreensaver-text ${bindir}/xscreensaver-command ${datadir}/applications \
 	${libdir}/X11/"
 
 FILES_${PN}-dbg += "${libexecdir}/xscreensaver/.debug"
diff --git a/recipes/xscreensaver/xscreensaver_5.07.bb b/recipes/xscreensaver/xscreensaver_5.07.bb
index 8932b6f..cfe5ccc 100644
--- a/recipes/xscreensaver/xscreensaver_5.07.bb
+++ b/recipes/xscreensaver/xscreensaver_5.07.bb
@@ -1,5 +1,5 @@
 require xscreensaver.inc
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.jwz.org/xscreensaver/xscreensaver-${PV}.tar.gz \
            file://configure.in.patch;patch=1 \
-- 
1.6.1



