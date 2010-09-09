Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Otjgg-0002me-D1
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 18:09:25 +0200
Received: (qmail 31087 invoked by uid 503); 9 Sep 2010 16:20:08 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 9 Sep 2010 16:20:08 -0000
Received: (qmail 17016 invoked by uid 503); 9 Sep 2010 15:52:39 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 9 Sep 2010 15:52:39 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 9 Sep 2010 18:08:39 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 9 Sep 2010 18:08:38 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Sep 2010 18:07:13 +0200
Message-Id: <1284048433-20991-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1284048433-20991-2-git-send-email-eric@eukrea.com>
References: <AANLkTi=KDR=mtuVUiQE-5_-FL4oR+meQssfeUgz6bBLq@mail.gmail.com>
	<1284048433-20991-1-git-send-email-eric@eukrea.com>
	<1284048433-20991-2-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 470063211894123851
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] python_2.6.5: tune python-distutils
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
X-List-Received-Date: Thu, 09 Sep 2010 16:09:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

removing config/libpython2.6.a and distutils/command/win*
as suggested by cdricjulien.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/python/python_2.6.5.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/recipes/python/python_2.6.5.bb b/recipes/python/python_2.6.5.bb
index c144fee..ecd9f78 100644
--- a/recipes/python/python_2.6.5.bb
+++ b/recipes/python/python_2.6.5.bb
@@ -83,6 +83,12 @@ do_install() {
 	sed -i -e s,ccache,'$(CCACHE)', ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
 }
 
+do_install_append() {
+	# remove unecessary files from python-distutils' packages
+	rm ${D}/${libdir}/python${PYTHON_MAJMIN}/config/libpython2.6.a
+	rm ${D}/${libdir}/python${PYTHON_MAJMIN}/distutils/command/win*
+}
+
 require python-${PYTHON_MAJMIN}-manifest.inc
 
 # manual dependency additions
-- 
1.6.3.3



