Received: from smarthost.techfak.uni-bielefeld.de ([129.70.137.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1UZKgE-0000Lm-2L
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 May 2013 14:38:10 +0200
Received: from localhost.localdomain (sarotti.TechFak.Uni-Bielefeld.DE
	[129.70.144.156])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: sherbrec)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id
	3827180010; Mon,  6 May 2013 14:20:10 +0200 (CEST)
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2013 14:20:01 +0200
Message-Id: <1367842801-347-1-git-send-email-stefan@herbrechtsmeier.net>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-oe][PATCH] media-ctl: Use linux-libc-headers instead of linux kernel sources
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
X-List-Received-Date: Mon, 06 May 2013 12:38:10 -0000

Use the headers from the linux-libc-headers instead of the headers
from the linux kernel sources because user space programs should
be built against the header files provided by the distribution.

In file included from .../usr/src/kernel/include/linux/media.h:27:0,
                 from conftest.c:56:
.../usr/src/kernel/include/linux/types.h:13:2: warning: #warning \
"Attempt to use kernel headers from user space, see http://kernelnewbies.org/KernelHeaders" [-Wcpp]

On some platforms (qemu) intern kernel header (linux/types.h) redefines
some types from the system header (sys/types.h, timer.h, stdint.h)
and thereby breaks the checking of the linux media header.

ERROR: Kernel header file not found or not usable!

In file included from .../usr/include/linux/media.h:27:0,
                 from conftest.c:56:
In file included from .../usr/src/kernel/include/linux/types.h:14:26: error: conflicting types for 'fd_set'
In file included from .../sys/select.h:75:5: note: previous declaration of 'fd_set' was here

Similar errors for dev_t, mode_t, timer_t, uintptr_t and blkcnt_t.

Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
---
 .../recipes-multimedia/v4l2apps/media-ctl_git.bb   |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
index d96c1f9..cb3072b 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
@@ -2,17 +2,18 @@ DESCRIPTION = "Media controller control application"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
 
+DEPENDS = "linux-libc-headers"
+
 SRC_URI = "git://git.ideasonboard.org/media-ctl.git;protocol=git"
 SRCREV = "a6ec4a37028952ffd6e62eb52648cf66248eb519"
 
 PV = "0.0.1"
-PR = "r3"
+PR = "r4"
 S = "${WORKDIR}/git"
 
 inherit autotools
 
-# It needs some kernel definitions only for v4l2, so it isn't machine specific
-EXTRA_OECONF = "--with-kernel-headers=${STAGING_KERNEL_DIR}"
+EXTRA_OECONF = "--with-kernel-headers=${STAGING_EXECPREFIXDIR}"
 
 PACKAGES =+ "libmediactl libv4l2subdev"
 FILES_libmediactl = "${libdir}/libmediactl${SOLIBS}"
-- 
1.7.0.4



