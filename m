Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PLJRm-0002er-Bt
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 18:48:00 +0100
Received: (qmail 20248 invoked by uid 503); 24 Nov 2010 17:51:09 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 24 Nov 2010 17:51:09 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 24 Nov 2010 19:46:45 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 24 Nov 2010 19:46:44 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Nov 2010 18:43:54 +0100
Message-Id: <1290620636-21238-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5729704627765685577
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] busybox 1.17.3: add latest fixes
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
X-List-Received-Date: Wed, 24 Nov 2010 17:48:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

from http://busybox.net/downloads/fixes-1.17.3/

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../busybox-1.17.3/busybox-1.17.3-iproute.patch    |   13 ++++++++
 .../busybox/busybox-1.17.3/busybox-1.17.3-ls.patch |   30 ++++++++++++++++++++
 recipes/busybox/busybox_1.17.3.bb                  |    4 ++-
 3 files changed, 46 insertions(+), 1 deletions(-)
 create mode 100644 recipes/busybox/busybox-1.17.3/busybox-1.17.3-iproute.patch
 create mode 100644 recipes/busybox/busybox-1.17.3/busybox-1.17.3-ls.patch

diff --git a/recipes/busybox/busybox-1.17.3/busybox-1.17.3-iproute.patch b/recipes/busybox/busybox-1.17.3/busybox-1.17.3-iproute.patch
new file mode 100644
index 0000000..03c749f
--- /dev/null
+++ b/recipes/busybox/busybox-1.17.3/busybox-1.17.3-iproute.patch
@@ -0,0 +1,13 @@
+diff -urpN busybox-1.17.3/networking/libiproute/iproute.c busybox-1.17.3-iproute/networking/libiproute/iproute.c
+--- busybox-1.17.3/networking/libiproute/iproute.c	2010-10-09 21:57:14.000000000 +0200
++++ busybox-1.17.3-iproute/networking/libiproute/iproute.c	2010-11-04 09:13:06.307919550 +0100
+@@ -791,8 +791,8 @@ static int iproute_get(char **argv)
+ 				}
+ 				req.r.rtm_dst_len = addr.bitlen;
+ 			}
+-			argv++;
+ 		}
++		argv++;
+ 	}
+ 
+ 	if (req.r.rtm_dst_len == 0) {
diff --git a/recipes/busybox/busybox-1.17.3/busybox-1.17.3-ls.patch b/recipes/busybox/busybox-1.17.3/busybox-1.17.3-ls.patch
new file mode 100644
index 0000000..1c4f895
--- /dev/null
+++ b/recipes/busybox/busybox-1.17.3/busybox-1.17.3-ls.patch
@@ -0,0 +1,30 @@
+diff -urpN busybox-1.17.3/coreutils/ls.c busybox-1.17.3-ls/coreutils/ls.c
+--- busybox-1.17.3/coreutils/ls.c	2010-10-09 21:57:13.000000000 +0200
++++ busybox-1.17.3-ls/coreutils/ls.c	2010-11-06 00:26:48.467049575 +0100
+@@ -184,7 +184,7 @@ static const unsigned opt_flags[] = {
+ 	LIST_INO,                   /* i */
+ 	LIST_LONG | STYLE_LONG,     /* l - remember LS_DISP_HR in mask! */
+ 	LIST_SHORT | STYLE_SINGLE,  /* 1 */
+-	0,                          /* g (don't show group) - handled via OPT_g */
++	0,                          /* g (don't show owner) - handled via OPT_g */
+ 	LIST_ID_NUMERIC,            /* n */
+ 	LIST_BLOCKS,                /* s */
+ 	DISP_ROWS,                  /* x */
+@@ -621,7 +621,7 @@ static NOINLINE unsigned list_single(con
+ 	if (all_fmt & LIST_ID_NAME) {
+ 		if (option_mask32 & OPT_g) {
+ 			column += printf("%-8.8s ",
+-				get_cached_username(dn->dstat.st_uid));
++				get_cached_groupname(dn->dstat.st_gid));
+ 		} else {
+ 			column += printf("%-8.8s %-8.8s ",
+ 				get_cached_username(dn->dstat.st_uid),
+@@ -631,7 +631,7 @@ static NOINLINE unsigned list_single(con
+ #endif
+ 	if (all_fmt & LIST_ID_NUMERIC) {
+ 		if (option_mask32 & OPT_g)
+-			column += printf("%-8u ", (int) dn->dstat.st_uid);
++			column += printf("%-8u ", (int) dn->dstat.st_gid);
+ 		else
+ 			column += printf("%-8u %-8u ",
+ 					(int) dn->dstat.st_uid,
diff --git a/recipes/busybox/busybox_1.17.3.bb b/recipes/busybox/busybox_1.17.3.bb
index 6956bde..f1a0b74 100644
--- a/recipes/busybox/busybox_1.17.3.bb
+++ b/recipes/busybox/busybox_1.17.3.bb
@@ -1,10 +1,12 @@
 require busybox_1.1x.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI += "\
   file://busybox-1.17.3-sort.patch  \
   file://busybox-1.17.3-dnsd.patch \
   file://busybox-1.17.3-unicode.patch \
+  file://busybox-1.17.3-iproute.patch \
+  file://busybox-1.17.3-ls.patch \
 "
 
 SRC_URI[md5sum] = "a2ce1a951571da8c6e0eaf75b1acef60"
-- 
1.6.3.3



