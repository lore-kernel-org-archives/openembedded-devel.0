Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Ot7ty-0001v8-KW
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 01:48:35 +0200
Received: (qmail 4860 invoked by uid 503); 7 Sep 2010 23:59:08 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 7 Sep 2010 23:59:08 -0000
Received: (qmail 26419 invoked by uid 503); 7 Sep 2010 23:32:05 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 7 Sep 2010 23:32:04 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 8 Sep 2010 01:47:55 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 8 Sep 2010 01:47:53 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Sep 2010 01:46:38 +0200
Message-Id: <1283903199-24538-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 14927462441744379209
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
Subject: [PATCH 1/2] python-2.6: remove python-dev from python-modules
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
X-List-Received-Date: Tue, 07 Sep 2010 23:48:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

actually python-modules installs python-dev in the image which pulls several
dev packages leading to a >250MB image instead of a 60MB image with this
patch.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/python/python-2.6-manifest.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/python/python-2.6-manifest.inc b/recipes/python/python-2.6-manifest.inc
index 4ed05cb..eec9f22 100644
--- a/recipes/python/python-2.6-manifest.inc
+++ b/recipes/python/python-2.6-manifest.inc
@@ -266,7 +266,7 @@ RDEPENDS_python-audio="python-core"
 FILES_python-audio="${libdir}/python2.6/wave.* ${libdir}/python2.6/chunk.* ${libdir}/python2.6/sndhdr.* ${libdir}/python2.6/lib-dynload/ossaudiodev.so ${libdir}/python2.6/lib-dynload/audioop.so "
 
 DESCRIPTION_python-modules="All Python modules"
-RDEPENDS_python-modules="python-profile python-threading python-distutils python-doctest python-stringold python-codecs python-ctypes python-pickle python-datetime python-core python-io python-compiler python-compression python-re python-xmlrpc python-terminal python-email python-image python-tests python-resource python-json python-dev python-difflib python-math python-syslog python-hotshot python-unixadmin python-textutils python-tkinter python-gdbm python-elementtree python-fcntl python-netclient python-pprint python-netserver python-curses python-smtpd python-html python-readline python-subprocess python-pydoc python-logging python-mailbox python-xml python-mime python-sqlite3 python-sqlite3-tests python-unittest python-multiprocessing python-robotparser python-compile python-debugger python-pkgutil python-shell python-bsddb python-numbers python-mmap python-zlib python-db python-crypt python-idle python-lang python-audio  "
+RDEPENDS_python-modules="python-profile python-threading python-distutils python-doctest python-stringold python-codecs python-ctypes python-pickle python-datetime python-core python-io python-compiler python-compression python-re python-xmlrpc python-terminal python-email python-image python-tests python-resource python-json python-difflib python-math python-syslog python-hotshot python-unixadmin python-textutils python-tkinter python-gdbm python-elementtree python-fcntl python-netclient python-pprint python-netserver python-curses python-smtpd python-html python-readline python-subprocess python-pydoc python-logging python-mailbox python-xml python-mime python-sqlite3 python-sqlite3-tests python-unittest python-multiprocessing python-robotparser python-compile python-debugger python-pkgutil python-shell python-bsddb python-numbers python-mmap python-zlib python-db python-crypt python-idle python-lang python-audio  "
 ALLOW_EMPTY_python-modules = "1"
 
 
-- 
1.6.3.3



