Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PYENd-0004K8-NB
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 10:01:05 +0100
Received: (qmail 25111 invoked by uid 503); 30 Dec 2010 09:37:18 -0000
Received: from b6.ovh.net (HELO mail606.ha.ovh.net) (213.186.33.56)
	by 63.mail-out.ovh.net with SMTP; 30 Dec 2010 09:37:18 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 30 Dec 2010 11:00:36 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 30 Dec 2010 11:00:35 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Dec 2010 09:55:34 +0100
Message-Id: <1293699334-4159-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5346335709683952969
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] gnome-power-manager: fix compilation
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
X-List-Received-Date: Thu, 30 Dec 2010 09:01:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* libtool is hardcoded in src/Makefile and leads to
libtool: Command not found

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/gnome/gnome-power-manager_2.30.0.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/gnome/gnome-power-manager_2.30.0.bb b/recipes/gnome/gnome-power-manager_2.30.0.bb
index a752852..0c7bcb5 100644
--- a/recipes/gnome/gnome-power-manager_2.30.0.bb
+++ b/recipes/gnome/gnome-power-manager_2.30.0.bb
@@ -27,6 +27,7 @@ do_configure_append() {
         for i in $(find ${S} -name "Makefile") ; do
             sed -i -e s:-Werror::g $i
         done
+		sed -e "s/libtool --/${TARGET_SYS}-libtool --/" -i ${S}/src/Makefile
 }
 
 PACKAGES =+ "${PN}-applets"
-- 
1.7.0.4



