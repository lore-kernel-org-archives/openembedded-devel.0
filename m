Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PbK9z-0006Yc-Hq
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 22:47:47 +0100
Received: (qmail 10245 invoked by uid 503); 7 Jan 2011 21:19:25 -0000
Received: from b9.ovh.net (HELO mail421.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 7 Jan 2011 21:19:25 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 7 Jan 2011 23:47:19 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 7 Jan 2011 23:47:17 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Jan 2011 22:47:14 +0100
Message-Id: <1294436836-28074-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9936348154581921097
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 1/3] e2fsprogs: update to latest 1.41.14
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
X-List-Received-Date: Fri, 07 Jan 2011 21:47:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

this new version brings many fixes and enhancements :
http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.41.14

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/e2fsprogs/e2fsprogs_1.41.12.bb |   12 ------------
 recipes/e2fsprogs/e2fsprogs_1.41.14.bb |   12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.12.bb
 create mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.14.bb

diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.12.bb b/recipes/e2fsprogs/e2fsprogs_1.41.12.bb
deleted file mode 100644
index 1667099..0000000
--- a/recipes/e2fsprogs/e2fsprogs_1.41.12.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require e2fsprogs.inc
-
-PR = "${INC_PR}"
-
-SRC_URI += "file://llseek-uclibc.patch"
-
-do_configure() {
-	oe_runconf
-}
-
-SRC_URI[md5sum] = "1b24a21fc0c2381ef420961cbfec733f"
-SRC_URI[sha256sum] = "9c26d0dc20bfdafd0f27f3564791d6121d1c1876549d4f2ff1e41955c9bb9f20"
diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.14.bb b/recipes/e2fsprogs/e2fsprogs_1.41.14.bb
new file mode 100644
index 0000000..db322d1
--- /dev/null
+++ b/recipes/e2fsprogs/e2fsprogs_1.41.14.bb
@@ -0,0 +1,12 @@
+require e2fsprogs.inc
+
+PR = "${INC_PR}"
+
+SRC_URI += "file://llseek-uclibc.patch"
+
+do_configure() {
+	oe_runconf
+}
+
+SRC_URI[md5sum] = "05f70470aea2ef7efbb0845b2b116720"
+SRC_URI[sha256sum] = "3f8ac1fedd7c4bec480afcbe4acabdd4ac59ec0446a0fd50c8975cd0aad7b176"
-- 
1.6.3.3



