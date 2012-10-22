Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TQJuS-0000H1-JC
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 17:27:20 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so994447eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 08:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=s/Mj/fLRtsHvp4wxlKUJJAtox3VFxZsNSiQh29t7KmU=;
	b=IdsW53wnnexkvwY9uyv/gTB7xTULIE1Coro4DYQ3UumvX6LPkEX9JoImh0bszGzDah
	njiFhCYTzujKijLz4ifYNVYpmhcwZUuubIUCBHOQYIzuFmo9kKQgkHp4/LonsG6lUOHN
	/Wu1ZDK1MlbTvF8F8vOuR/7t9ipg6JeMq8DZ+/ec7o1HyPVRLwhDZ58FuMDx6FYY2gY+
	RFgW4MuvF/JkO0eDeCNpVy6E3FktUSZqkywqmjtJL1WzDoga927O5l/wEMPGa4JehQjR
	kyBUL1Ki7SjmJLc3P7kqb5o+xHt5C0pMnUjngTC3sQ3dnQPlBKchSPTp83k8VJ909r8q
	lj0w==
Received: by 10.14.213.65 with SMTP id z41mr12455792eeo.29.1350918835793;
	Mon, 22 Oct 2012 08:13:55 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-109-91-251-94.unitymediagroup.de. [109.91.251.94])
	by mx.google.com with ESMTPS id d44sm16452113eeo.10.2012.10.22.08.13.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 08:13:54 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Oct 2012 17:13:28 +0200
Message-Id: <1350918808-23478-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH v3] libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg
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
X-List-Received-Date: Mon, 22 Oct 2012 15:27:20 -0000

This fixes "ERROR: Multiple .bb files are due to be built which each provide jpeg"

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
index 2aefe1f..d87743b 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe
                     file://djpeg.c;endline=13;md5=e85613b52f2906c5dfc0e21ec902cb33 \
 "
 PV = "8d+1.2.1"
-PR = "r1"
+PR = "r2"
 SRCREV = "837"
 SRC_URI = "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;protocol=https;module=trunk"
 
@@ -15,6 +15,9 @@ S = "${WORKDIR}/trunk"
 
 # Drop-in replacement for jpeg
 PROVIDES = "jpeg"
+RPROVIDES_${PN} += "jpeg"
+RREPLACES_${PN} += "jpeg"
+RCONFLICTS_${PN} += "jpeg"
 
 inherit autotools pkgconfig
 
-- 
1.7.9.5



