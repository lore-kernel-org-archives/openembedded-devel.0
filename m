Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PLeDg-0005dc-Sa
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 16:58:49 +0100
Received: (qmail 5240 invoked by uid 503); 25 Nov 2010 16:01:57 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 25 Nov 2010 16:01:57 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Nov 2010 17:57:34 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 25 Nov 2010 17:57:32 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Nov 2010 16:54:29 +0100
Message-Id: <1290700469-3396-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <AANLkTi=tM7VYvnfq7+1RHy0mMtvgvxE+Ksc37t4D5vuJ@mail.gmail.com>
References: <AANLkTi=tM7VYvnfq7+1RHy0mMtvgvxE+Ksc37t4D5vuJ@mail.gmail.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9758174492785356105
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
Subject: [PATCH] qt4x11: set QT_LIBINFIX and QT_DIR_NAME
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
X-List-Received-Date: Thu, 25 Nov 2010 15:58:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

this will fix the following issue with qwt 5.2.1 where obj dir is:
work/armv4t-oe-linux-gnueabi/qwt-5.2.1-r0/qwt-5.2.1/src/obj${QT_LIBINFIX}/
instead of :
work/armv4t-oe-linux-gnueabi/qwt-5.2.1-r0/qwt-5.2.1/src/obj/

From: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 classes/qt4x11.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/classes/qt4x11.bbclass b/classes/qt4x11.bbclass
index 2d56b7e..abb1d9d 100644
--- a/classes/qt4x11.bbclass
+++ b/classes/qt4x11.bbclass
@@ -2,5 +2,8 @@ DEPENDS_prepend = "${@["qt4-x11-free ", ""][(bb.data.getVar('PN', d, 1)[:12] ==
 
 inherit qmake2
 
+QT_DIR_NAME = "qt4"
+QT_LIBINFIX = ""
+
 # Qt4 uses atomic instructions not supported in thumb mode
 ARM_INSTRUCTION_SET = "arm"
-- 
1.6.3.3



