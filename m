Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PYnrv-0003Sx-46
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 23:54:43 +0100
Received: (qmail 4716 invoked by uid 503); 31 Dec 2010 22:36:50 -0000
Received: from b9.ovh.net (HELO mail27.ha.ovh.net) (213.186.33.59)
	by 64.mail-out.ovh.net with SMTP; 31 Dec 2010 22:36:50 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 1 Jan 2011 00:54:25 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 1 Jan 2011 00:54:24 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Dec 2010 23:49:02 +0100
Message-Id: <1293835744-10837-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6854478633399397705
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 1/3] busybox-1.18.1: add latest fix
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
X-List-Received-Date: Fri, 31 Dec 2010 22:54:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* patch comes from :
	http://busybox.net/downloads/fixes-1.18.1/
* original commit in bb's git :
	bzip2: plug memory leak on every processed file

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../busybox-1.18.1/busybox-1.18.1-bzip2.patch      |   40 ++++++++++++++++++++
 recipes/busybox/busybox_1.18.1.bb                  |    3 +-
 2 files changed, 42 insertions(+), 1 deletions(-)
 create mode 100644 recipes/busybox/busybox-1.18.1/busybox-1.18.1-bzip2.patch

diff --git a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-bzip2.patch b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-bzip2.patch
new file mode 100644
index 0000000..cffa194
--- /dev/null
+++ b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-bzip2.patch
@@ -0,0 +1,40 @@
+diff -urpN busybox-1.18.1/archival/bzip2.c busybox-1.18.1-bzip2/archival/bzip2.c
+--- busybox-1.18.1/archival/bzip2.c	2010-12-20 01:41:26.000000000 +0100
++++ busybox-1.18.1-bzip2/archival/bzip2.c	2010-12-30 04:43:11.000000000 +0100
+@@ -128,10 +128,12 @@ IF_DESKTOP(long long) int FAST_FUNC comp
+ 			break;
+ 	}
+ 
+-#if ENABLE_FEATURE_CLEAN_UP
++	/* Can't be conditional on ENABLE_FEATURE_CLEAN_UP -
++	 * we are called repeatedly
++	 */
+ 	BZ2_bzCompressEnd(strm);
+ 	free(iobuf);
+-#endif
++
+ 	return total;
+ }
+ 
+diff -urpN busybox-1.18.1/archival/libarchive/bz/bzlib.c busybox-1.18.1-bzip2/archival/libarchive/bz/bzlib.c
+--- busybox-1.18.1/archival/libarchive/bz/bzlib.c	2010-12-20 01:41:26.000000000 +0100
++++ busybox-1.18.1-bzip2/archival/libarchive/bz/bzlib.c	2010-12-30 04:43:11.000000000 +0100
+@@ -361,7 +361,6 @@ int BZ2_bzCompress(bz_stream *strm, int 
+ 
+ 
+ /*---------------------------------------------------*/
+-#if ENABLE_FEATURE_CLEAN_UP
+ static
+ void BZ2_bzCompressEnd(bz_stream *strm)
+ {
+@@ -372,9 +371,8 @@ void BZ2_bzCompressEnd(bz_stream *strm)
+ 	free(s->arr2);
+ 	free(s->ftab);
+ 	free(s->crc32table);
+-	free(strm->state);
++	free(s);
+ }
+-#endif
+ 
+ 
+ /*---------------------------------------------------*/
diff --git a/recipes/busybox/busybox_1.18.1.bb b/recipes/busybox/busybox_1.18.1.bb
index 8fe1210..e41f46d 100644
--- a/recipes/busybox/busybox_1.18.1.bb
+++ b/recipes/busybox/busybox_1.18.1.bb
@@ -1,11 +1,12 @@
 require busybox_1.1x.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI += " \
 	file://busybox-1.18.1-hush.patch \
 	file://busybox-1.18.1-cpio.patch \
+	file://busybox-1.18.1-bzip2.patch \
 	"
 
 SRC_URI[md5sum] = "f15fe752d8b7012aa5e59f83b88ccb1c"
-- 
1.6.3.3



