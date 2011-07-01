Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QcglF-0000yd-Dv
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 18:40:09 +0200
Received: by iwn4 with SMTP id 4so3217547iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2011 09:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=E/FIFqGTlySjlKQKF4VJ+oJBxTOeZHJKOhBnVNQVQp8=;
	b=un225XZtnflyHn4MnUOVoHe+AV5OJMBj2H/06tc23R3aZvuGV/icZ8R0WfZ2k8DVQD
	E4C7UrvjIs+aY/iGLtGLklNIUTf4ivLSHB9q9tHDLChi9KKvSvIwMuhg9xytjKh4OtBG
	uT3mVdjVTwMnVbzx0ai2Rc2EaBVihWnn+yVDI=
Received: by 10.42.157.67 with SMTP id c3mr3078645icx.95.1309538183744;
	Fri, 01 Jul 2011 09:36:23 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id j1sm1949813ibg.38.2011.07.01.09.36.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 09:36:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jul 2011 09:36:10 -0700
Message-Id: <1309538171-28964-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 1/2] htop: Link with libubacktrace when compiling for uclibc
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
X-List-Received-Date: Fri, 01 Jul 2011 16:40:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/htop/htop_0.9.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-support/htop/htop_0.9.bb b/meta-oe/recipes-support/htop/htop_0.9.bb
index eb207aa..25dac4c 100644
--- a/meta-oe/recipes-support/htop/htop_0.9.bb
+++ b/meta-oe/recipes-support/htop/htop_0.9.bb
@@ -9,9 +9,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c312653532e8e669f30e5ec8bdc23be3"
 DEPENDS = "ncurses"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
+PR = "r1"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/htop/htop-${PV}.tar.gz \
            file://remove-proc-test.patch"
 
+LDFLAGS_append_libc-uclibc = " -lubacktrace"
+
 inherit autotools
 
 SRC_URI[md5sum] = "7c5507f35f363f3f40183a2ba3c561f8"
-- 
1.7.4.1



