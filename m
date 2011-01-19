Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PfaXB-0005ja-Hh
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 17:05:21 +0100
Received: (qmail 3188 invoked by uid 503); 19 Jan 2011 16:08:14 -0000
Received: from b9.ovh.net (HELO mail619.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 19 Jan 2011 16:08:13 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 19 Jan 2011 17:57:58 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 19 Jan 2011 17:57:57 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jan 2011 16:57:28 +0100
Message-Id: <1295452649-28081-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 721983316123037001
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 1/2] busybox: enable CONFIG_RUN_PARTS if default.script is to be installed
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
X-List-Received-Date: Wed, 19 Jan 2011 16:05:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/busybox_1.1x.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/busybox/busybox_1.1x.inc b/recipes/busybox/busybox_1.1x.inc
index 4dbc3d9..1078aac 100644
--- a/recipes/busybox/busybox_1.1x.inc
+++ b/recipes/busybox/busybox_1.1x.inc
@@ -34,6 +34,9 @@ do_configure_prepend () {
 	if [ "${TARGET_ARCH}" = "avr32" ] ; then
 		sed -i s:CONFIG_FEATURE_OSF_LABEL=y:CONFIG_FEATURE_OSF_LABEL=n: ${WORKDIR}/defconfig
 	fi
+        if [ -e ${WORKDIR}/default.script ]; then
+		echo "CONFIG_RUN_PARTS=y"                    >> ${WORKDIR}/defconfig
+        fi
 }
 
 do_install_append() {
-- 
1.6.3.3



