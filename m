Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QKGI2-0003e9-Ms
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 22:45:50 +0200
Received: (qmail 15225 invoked by uid 503); 11 May 2011 20:06:07 -0000
Received: from b6.ovh.net (HELO mail412.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 11 May 2011 20:06:06 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 11 May 2011 22:36:25 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 11 May 2011 22:36:23 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 May 2011 22:27:55 +0200
Message-Id: <1305145675-12434-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17529980076416609609
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] busybox_git: update to today's master
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
X-List-Received-Date: Wed, 11 May 2011 20:45:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

this patch also fix build failure because of missing group file.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/busybox_git.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes/busybox/busybox_git.bb b/recipes/busybox/busybox_git.bb
index 3a6477f..a12eef2 100644
--- a/recipes/busybox/busybox_git.bb
+++ b/recipes/busybox/busybox_git.bb
@@ -3,9 +3,9 @@ PR = "${INC_PR}.0"
 
 FILESPATHPKG =. "busybox-git:"
 
-SRCREV = "6596380f52cd48b8b44443bb5677ec8caf538761"
+SRCREV = "10c0131a8a1b3db7fd6b23b72ebd7b33afc7b018"
 
-PV = "1.18.2+gitr${SRCREV}"
+PV = "1.18.4+gitr${SRCREV}"
 
 S = "${WORKDIR}/git"
 
@@ -20,8 +20,11 @@ SRC_URI = "\
   file://busybox-httpd \
   file://busybox-udhcpd \
   file://default.script file://simple.script \
+  file://group \
   file://hwclock.sh \
   file://hwclock-default \
+  file://inetd \
+  file://inetd.conf \
   file://mount.busybox \
   file://mountall \
   file://passwd \
-- 
1.7.0.4



