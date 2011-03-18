Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0aHU-0005Tz-W3
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 15:03:57 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so3155541bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 07:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=RdFdwQ7mivi/jOsLaMNRcE00FvmCJU+XnnUy3XVBrNA=;
	b=JDWte22KxHJle7DBB2jeRCsFxP6F9UvI10//i6i/YvFMRQ7pwsy2ISXv/ehrA+Afn8
	VE9sTD+vblBy0i24NusCCV99UjN6z4D4nta8nIyI5bELCY0k3I89+Pm9jeA9efG2+yXO
	SmGH6LM1uwoLy15S24CyUHtr+z/3N12J/iKFo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=sAICZDW+PULzayylFUh+HXNJxx4U7xnUL9MaPOxz5tGcZFO24oWCCnYKrAJF4pQOBa
	FHgnEZakJCvzPo//ExTrD3pwZl4MZ/8cMfHDltlQHeiBQtN7/HyCPzVtBwErnkU3/z0L
	wFOR4P9tUsWSzC4N+f6A2WiopsuNqBW1iqGpM=
Received: by 10.204.75.22 with SMTP id w22mr1022776bkj.65.1300456933661;
	Fri, 18 Mar 2011 07:02:13 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t1sm2168942bkx.7.2011.03.18.07.02.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2011 07:02:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2011 15:00:26 +0100
Message-Id: <1300456829-25755-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 09/12] iw: depend only on libnl(-2.0) not libnl2(-2.0)
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
X-List-Received-Date: Fri, 18 Mar 2011 14:03:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/iw/iw_0.9.20.bb |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/recipes/iw/iw_0.9.20.bb b/recipes/iw/iw_0.9.20.bb
index 0b6a768..7048091 100644
--- a/recipes/iw/iw_0.9.20.bb
+++ b/recipes/iw/iw_0.9.20.bb
@@ -3,18 +3,15 @@ HOMEPAGE = "http://linuxwireless.org/en/users/Documentation/iw"
 SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "BSD"
-PR = "r2"
+PR = "r3"
 
-DEPENDS = "libnl2 pkgconfig"
+DEPENDS = "libnl pkgconfig"
 
 SRC_URI = " \
 	http://wireless.kernel.org/download/iw/${P}.tar.bz2 \
 	file://kill-git-version-check.patch \
 	"
-# We stage libnl2 header files not directly as they clash with libnl files. Once
-# we only use libnl2 and stage the headers at the normal place we can remove
-# this.
-CFLAGS += "-I${STAGING_INCDIR}/libnl2/ -DCONFIG_LIBNL20"
+CFLAGS += "-DCONFIG_LIBNL20"
 
 do_compile() {
 	oe_runmake
-- 
1.7.4.1



