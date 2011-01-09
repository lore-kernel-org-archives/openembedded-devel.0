Received: from 27.mail-out.ovh.net ([91.121.30.210])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Pc2gq-0007LJ-Rn
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 22:20:40 +0100
Received: (qmail 5074 invoked by uid 503); 9 Jan 2011 21:22:34 -0000
Received: from b6.ovh.net (HELO mail626.ha.ovh.net) (213.186.33.56)
	by 27.mail-out.ovh.net with SMTP; 9 Jan 2011 21:22:25 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 9 Jan 2011 23:21:45 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 9 Jan 2011 23:21:45 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Jan 2011 22:19:55 +0100
Message-Id: <1294607995-10242-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2803772243139145033
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] busybox-1.18.1: add latest fix
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
X-List-Received-Date: Sun, 09 Jan 2011 21:20:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

modprobe-small: support compressed modules in insmodmaster
http://git.busybox.net/busybox/commit/?id=e9d12b57bfb941e754d09a7d5f54c183ca7dbb25

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../busybox-1.18.1/busybox-1.18.1-hush.patch       |    2 +-
 .../busybox-1.18.1-modprobe-small.patch            |   21 ++++++++++++++++++++
 recipes/busybox/busybox_1.18.1.bb                  |    3 +-
 3 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 recipes/busybox/busybox-1.18.1/busybox-1.18.1-modprobe-small.patch

diff --git a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
index 5281a52..590ed88 100644
--- a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
+++ b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
@@ -1,6 +1,6 @@
 diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1-hush/shell/hush.c
 --- busybox-1.18.1/shell/hush.c	2010-12-21 05:31:04.000000000 +0100
-+++ busybox-1.18.1-hush/shell/hush.c	2011-01-07 14:59:19.649956156 +0100
++++ busybox-1.18.1-hush/shell/hush.c	2011-01-09 21:00:02.000000000 +0100
 @@ -913,7 +913,7 @@ static const struct built_in_command blt
   */
  #if HUSH_DEBUG
diff --git a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-modprobe-small.patch b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-modprobe-small.patch
new file mode 100644
index 0000000..c1d5615
--- /dev/null
+++ b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-modprobe-small.patch
@@ -0,0 +1,21 @@
+diff -urpN busybox-1.18.1/modutils/modprobe-small.c busybox-1.18.1-modprobe-small/modutils/modprobe-small.c
+--- busybox-1.18.1/modutils/modprobe-small.c	2010-12-20 01:41:27.000000000 +0100
++++ busybox-1.18.1-modprobe-small/modutils/modprobe-small.c	2011-01-09 21:00:26.000000000 +0100
+@@ -844,13 +844,15 @@ int modprobe_main(int argc UNUSED_PARAM,
+ 		void *map;
+ 
+ 		len = MAXINT(ssize_t);
+-		map = xmalloc_xopen_read_close(*argv, &len);
++		map = xmalloc_open_zipped_read_close(*argv, &len);
+ 		if (init_module(map, len,
+ 			IF_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE(options ? options : "")
+ 			IF_NOT_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE("")
+-				) != 0)
++			) != 0
++		) {
+ 			bb_error_msg_and_die("can't insert '%s': %s",
+ 					*argv, moderror(errno));
++		}
+ 		return 0;
+ 	}
+ 
diff --git a/recipes/busybox/busybox_1.18.1.bb b/recipes/busybox/busybox_1.18.1.bb
index 69daef5..7c7f21f 100644
--- a/recipes/busybox/busybox_1.18.1.bb
+++ b/recipes/busybox/busybox_1.18.1.bb
@@ -1,5 +1,5 @@
 require busybox_1.1x.inc
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI += " \
 	file://busybox-1.18.1-hush.patch \
@@ -7,6 +7,7 @@ SRC_URI += " \
 	file://busybox-1.18.1-bzip2.patch \
 	file://busybox-1.18.1-mkswap.patch \
 	file://busybox-1.18.1-warning.patch \
+	file://busybox-1.18.1-modprobe-small.patch \
 	"
 
 SRC_URI[md5sum] = "f15fe752d8b7012aa5e59f83b88ccb1c"
-- 
1.6.3.3



