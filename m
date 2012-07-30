Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Svrsd-0002tt-Bu
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 17:27:35 +0200
Received: by bkcik5 with SMTP id ik5so2201248bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 08:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=TcQXF00odtt2ZLrVTsZJNVtpyYcdPtpLIB/7khnbyOA=;
	b=vSaD39+65yGiOJjVSGCc8MHE735kViByb44U9SRMlAX76igcToaIaGMo/3JLtGnHsk
	OMvC3I3wIM8sj5MOzxsY0QoH8ZKbjp8qzzlexWgTnmb2URa2/3fVzdk43vlEWIzvDf8o
	eK0MQ+NhOtoYmscr0j4TEfIweGAPg+t42PqJAzTUrXhWbldW13fTErvkdPcScHvkENFr
	3NrhyuVExa25JZ1UrikAVKfvpMcfNGqqLozYPUT6bE1bD7ndrdHXgCjLfpn/GmbDGtt8
	qo+rXXw7PGddHswiWD0MSPAnb+fHCeREyGZPE+etJ+Inp6adSYzwWiZ7/J4dshOsTg+6
	L+pA==
Received: by 10.204.154.73 with SMTP id n9mr4021248bkw.113.1343661359575;
	Mon, 30 Jul 2012 08:15:59 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id t23sm4009138bks.4.2012.07.30.08.15.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 08:15:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jul 2012 17:15:27 +0200
Message-Id: <1343661328-26631-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe 1/2] exo: stop configure detecting host's python
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
X-List-Received-Date: Mon, 30 Jul 2012 15:27:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch does not cause python bindings builded properly (native headers included)

error message was:
ERROR: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
Rerun configure task after fixing this. The path was '/home/andreas/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/exo-0.6.2-r0/exo-0.6.2'
ERROR: Function failed: do_qa_configure
ERROR: Logfile of failure stored in: /home/andreas/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/exo-0.6.2-r0/temp/log.do_configure.13932
NOTE: package exo-0.6.2-r0: task do_configure: Failed

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/exo/exo_0.6.2.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.6.2.bb b/meta-xfce/recipes-xfce/exo/exo_0.6.2.bb
index b9fc687..ad8dc59 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.6.2.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.6.2.bb
@@ -4,9 +4,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "gtk+ libxfce4util virtual/libx11 perl-native cairo"
 
-PR = "r0"
+PR = "r1"
 
-inherit xfce
+inherit xfce pythonnative
 
 # SRC_URI must follow inherited one
 SRC_URI += " \
@@ -16,7 +16,6 @@ SRC_URI += " \
     file://fix-qa-desktop-type-error.patch \
 "
 
-
 # see http://wiki.xfce.org/gnomemount-replacement
 do_install_append () {
 	install -m 755 -d ${D}${bindir}/exo-mount-wrapper
-- 
1.7.6.5



