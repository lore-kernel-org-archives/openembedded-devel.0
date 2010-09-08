Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OtJMS-0003ge-0Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 14:04:35 +0200
Received: (qmail 2608 invoked by uid 503); 8 Sep 2010 12:13:20 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 8 Sep 2010 12:13:20 -0000
Received: (qmail 32767 invoked by uid 503); 8 Sep 2010 11:46:09 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 8 Sep 2010 11:46:09 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 8 Sep 2010 14:02:03 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 8 Sep 2010 14:02:01 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Sep 2010 14:00:42 +0200
Message-Id: <1283947243-26897-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <A88FB909-75F8-430A-B6E7-16C4A1C51A13@vanille-media.de>
References: <A88FB909-75F8-430A-B6E7-16C4A1C51A13@vanille-media.de>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8879128142317923657
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
Subject: [PATCH 1/2] generate-manifest-2.6.py: tune python-modules' RDEPENDS
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
X-List-Received-Date: Wed, 08 Sep 2010 12:05:22 -0000
X-List-Received-Date: Wed, 08 Sep 2010 12:05:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* python-dev: pulls several dev packages leading to a >256MB image instead
of a 60MB image without this packages

* python-distutils: seems only needed for development. No installing it with
python-modules saves 6MB on the image.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 contrib/python/generate-manifest-2.6.py |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/contrib/python/generate-manifest-2.6.py b/contrib/python/generate-manifest-2.6.py
index 1a0f1d3..136cb2e 100755
--- a/contrib/python/generate-manifest-2.6.py
+++ b/contrib/python/generate-manifest-2.6.py
@@ -12,7 +12,7 @@ import time
 VERSION = "2.6.4"
 
 __author__ = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
-__version__ = "20100711"
+__version__ = "20100908"
 
 class MakefileMaker:
 
@@ -123,7 +123,7 @@ class MakefileMaker:
         line = 'RDEPENDS_python-modules="'
 
         for name, data in self.packages.iteritems():
-            if name != 'python-core-dbg':
+            if name not in ['python-core-dbg', 'python-dev', 'python-distutils']:
                 line += "%s " % name
 
         self.out( "%s \"" % line )
@@ -164,7 +164,7 @@ if __name__ == "__main__":
     m.addPackage( "python-core-dbg", "Python core module debug information", "python-core",
     "config/.debug lib-dynload/.debug ${bindir}/.debug ${libdir}/.debug" )
 
-    m.addPackage( "python-devel", "Python Development Package", "python-core",
+    m.addPackage( "python-dev", "Python Development Package", "python-core",
     "${includedir} ${libdir}/libpython2.6.so config" ) # package
 
     m.addPackage( "python-idle", "Python Integrated Development Environment", "python-core python-tkinter",
-- 
1.6.3.3



