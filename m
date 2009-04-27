Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LyUzF-00009Q-6G
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Apr 2009 19:51:25 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 3BED7189333; Mon, 27 Apr 2009 19:50:36 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2009 19:50:36 +0200
Message-Id: <1240854636-20070-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] cherokee: fix init script, daemonize is '-d', not '-b'
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
X-List-Received-Date: Mon, 27 Apr 2009 17:51:25 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/cherokee/cherokee_0.98.0.bb  |    2 ++
 recipes/cherokee/files/cherokee.init |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/cherokee/cherokee_0.98.0.bb b/recipes/cherokee/cherokee_0.98.0.bb
index 7a29694..a8ebaa8 100644
--- a/recipes/cherokee/cherokee_0.98.0.bb
+++ b/recipes/cherokee/cherokee_0.98.0.bb
@@ -1,5 +1,7 @@
 require cherokee.inc
 
+PR = "r1"
+
 SRC_URI = "http://www.cherokee-project.com/download/0.98/${PV}/cherokee-${PV}.tar.gz \
            file://cherokee.init "
 
diff --git a/recipes/cherokee/files/cherokee.init b/recipes/cherokee/files/cherokee.init
index ea1263a..93603b8 100644
--- a/recipes/cherokee/files/cherokee.init
+++ b/recipes/cherokee/files/cherokee.init
@@ -12,7 +12,7 @@ test ! -r "$CONFIG" && exit 0
 case "$1" in
   start)
     echo "Starting $DESC: "
-    start-stop-daemon --oknodo -S -x $DAEMON -- -b -C $CONFIG
+    start-stop-daemon --oknodo -S -x $DAEMON -- -d -C $CONFIG
     ;;
 
   stop)
-- 
1.5.6.5



