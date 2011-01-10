Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PcPNi-0000xV-3v
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 22:34:26 +0100
Received: (qmail 10803 invoked by uid 503); 10 Jan 2011 22:12:04 -0000
Received: from b9.ovh.net (HELO mail179.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 10 Jan 2011 22:12:04 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 10 Jan 2011 23:33:57 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 10 Jan 2011 23:33:55 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jan 2011 22:33:45 +0100
Message-Id: <1294695225-16321-5-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1294695225-16321-4-git-send-email-eric@eukrea.com>
References: <1294695225-16321-1-git-send-email-eric@eukrea.com>
	<1294695225-16321-2-git-send-email-eric@eukrea.com>
	<1294695225-16321-3-git-send-email-eric@eukrea.com>
	<1294695225-16321-4-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8881942890265554253
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] bitbake.conf: export LC_ALL = "C"
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
X-List-Received-Date: Mon, 10 Jan 2011 21:34:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* thus the build system language won't create troubles during builds
(example : perl is hacking some generated files' content but only
supports english outputs).

* this problem is only met when using bitbake master

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 conf/bitbake.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 102aa66..ab60df0 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -526,6 +526,8 @@ export SDK_LDFLAGS = "-L${STAGING_DIR_SDK}${libdir} \
                          -Wl,-rpath-link,${STAGING_DIR_SDK}${libdir} \
                          -Wl,-O1"
 
+export LC_ALL = "C"
+
 # Which flags to leave by strip-flags() in bin/build/oebuild.sh ?
 ALLOWED_FLAGS = "-O -mcpu -march -pipe"
 
-- 
1.6.3.3



