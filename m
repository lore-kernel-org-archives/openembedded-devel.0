Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PcPNf-0000xC-WC
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 22:34:24 +0100
Received: (qmail 10715 invoked by uid 503); 10 Jan 2011 22:12:03 -0000
Received: from b9.ovh.net (HELO mail179.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 10 Jan 2011 22:12:03 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 10 Jan 2011 23:33:55 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 10 Jan 2011 23:33:54 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jan 2011 22:33:41 +0100
Message-Id: <1294695225-16321-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8881661415288843593
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] busybox-1.18.1: add latest fixes
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
X-List-Received-Date: Mon, 10 Jan 2011 21:34:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* tftp: fix bad interaction betweel poll() and alarm(). Closes bug 3061
This was breaking timeout handling.
http://git.busybox.net/busybox/commit/?id=84dba9c5bbd99cb80c0e201bbffa27a51766c63f

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../busybox-1.18.1/busybox-1.18.1-hush.patch       |    2 +-
 .../busybox-1.18.1/busybox-1.18.1-tftp.patch       |   72 ++++++++++++++++++++
 recipes/busybox/busybox_1.18.1.bb                  |    3 +-
 3 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 recipes/busybox/busybox-1.18.1/busybox-1.18.1-tftp.patch

diff --git a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
index 590ed88..5281a52 100644
--- a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
+++ b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
@@ -1,6 +1,6 @@
 diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1-hush/shell/hush.c
 --- busybox-1.18.1/shell/hush.c	2010-12-21 05:31:04.000000000 +0100
-+++ busybox-1.18.1-hush/shell/hush.c	2011-01-09 21:00:02.000000000 +0100
++++ busybox-1.18.1-hush/shell/hush.c	2011-01-07 14:59:19.649956156 +0100
 @@ -913,7 +913,7 @@ static const struct built_in_command blt
   */
  #if HUSH_DEBUG
diff --git a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-tftp.patch b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-tftp.patch
new file mode 100644
index 0000000..b038ea8
--- /dev/null
+++ b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-tftp.patch
@@ -0,0 +1,72 @@
+diff -urpN busybox-1.18.1/networking/tftp.c busybox-1.18.1-tftp/networking/tftp.c
+--- busybox-1.18.1/networking/tftp.c	2010-12-20 01:41:27.000000000 +0100
++++ busybox-1.18.1-tftp/networking/tftp.c	2011-01-10 12:50:02.687941194 +0100
+@@ -105,39 +105,22 @@ struct BUG_G_too_big {
+ #define error_pkt_str    (error_pkt + 4)
+ 
+ #if ENABLE_FEATURE_TFTP_PROGRESS_BAR
+-/* SIGALRM logic nicked from the wget applet */
+-static void progress_meter(int flag)
++static void tftp_progress_update(void)
+ {
+-	/* We can be called from signal handler */
+-	int save_errno = errno;
+-
+-	if (flag == -1) { /* first call to progress_meter */
+-		bb_progress_init(&G.pmt);
+-	}
+-
+ 	bb_progress_update(&G.pmt, G.file, 0, G.pos, G.size);
+-
+-	if (flag == 0) {
+-		/* last call to progress_meter */
+-		alarm(0);
+-		bb_putchar_stderr('\n');
+-	} else {
+-		if (flag == -1) { /* first call to progress_meter */
+-			signal_SA_RESTART_empty_mask(SIGALRM, progress_meter);
+-		}
+-		alarm(1);
+-	}
+-
+-	errno = save_errno;
+ }
+ static void tftp_progress_init(void)
+ {
+-	progress_meter(-1);
++	bb_progress_init(&G.pmt);
++	tftp_progress_update();
+ }
+ static void tftp_progress_done(void)
+ {
+-	if (G.pmt.inited)
+-		progress_meter(0);
++	if (G.pmt.inited) {
++		tftp_progress_update();
++		bb_putchar_stderr('\n');
++		G.pmt.inited = 0;
++	}
+ }
+ #else
+ # define tftp_progress_init() ((void)0)
+@@ -460,9 +443,10 @@ static int tftp_protocol(
+ 		xsendto(socket_fd, xbuf, send_len, &peer_lsa->u.sa, peer_lsa->len);
+ 
+ #if ENABLE_FEATURE_TFTP_PROGRESS_BAR
+-		if (ENABLE_TFTP && remote_file) { /* tftp */
++		if (ENABLE_TFTP && remote_file) /* tftp */
+ 			G.pos = (block_nr - 1) * (uoff_t)blksize;
+-		}
++		if (G.pmt.inited)
++			tftp_progress_update();
+ #endif
+ 		/* Was it final ACK? then exit */
+ 		if (finished && (opcode == TFTP_ACK))
+@@ -479,6 +463,7 @@ static int tftp_protocol(
+ 		case 0:
+ 			retries--;
+ 			if (retries == 0) {
++				tftp_progress_done();
+ 				bb_error_msg("timeout");
+ 				goto ret; /* no err packet sent */
+ 			}
diff --git a/recipes/busybox/busybox_1.18.1.bb b/recipes/busybox/busybox_1.18.1.bb
index 7c7f21f..a2b4475 100644
--- a/recipes/busybox/busybox_1.18.1.bb
+++ b/recipes/busybox/busybox_1.18.1.bb
@@ -1,5 +1,5 @@
 require busybox_1.1x.inc
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 SRC_URI += " \
 	file://busybox-1.18.1-hush.patch \
@@ -8,6 +8,7 @@ SRC_URI += " \
 	file://busybox-1.18.1-mkswap.patch \
 	file://busybox-1.18.1-warning.patch \
 	file://busybox-1.18.1-modprobe-small.patch \
+	file://busybox-1.18.1-tftp.patch \
 	"
 
 SRC_URI[md5sum] = "f15fe752d8b7012aa5e59f83b88ccb1c"
-- 
1.6.3.3



