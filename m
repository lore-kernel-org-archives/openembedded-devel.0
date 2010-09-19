Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OxOqX-0004Xh-P8
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Sep 2010 20:42:44 +0200
Received: by ewy7 with SMTP id 7so1494404ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Sep 2010 11:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=nwvm/L/gMGDYyqZPd2Xxc6WZMcLG0NscocAGpAjWj20=;
	b=BmkhGUhPgmZzIZHNcS8ZNekWSJv1GO/nqtMLnnjAsDPxNPXUeZzoRcKl9o4+IAWFs9
	0eEiH3reblRkLp4t8WHP6xQ24Va9qDxgDHTCHqUHKTtCfVLBlcHDhE+ritpRPdHtQg8D
	faoi49bcfzIqS5gP+PRzYD3ZQW74L0V0f88r8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=VTAOp6vppukuKovEmY4yIFXaqJ/QceBKkyfy3IFFCFgK0Kx3uD4kpIwMc2+OPCujhM
	Yw9v8uzqiWxGzBdyP6F1jdI1t53duqyYiyBEJla84jtjeH87cGb+xifthM8yEwmL6JVw
	oR507zryHQo5MGYcCxPP9lmKt/DP4aHYG7Y9w=
Received: by 10.213.4.73 with SMTP id 9mr6134655ebq.5.1284921708355;
	Sun, 19 Sep 2010 11:41:48 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id v8sm9623565eeh.14.2010.09.19.11.41.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 19 Sep 2010 11:41:47 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Sep 2010 20:41:42 +0200
Message-Id: <1284921702-22995-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] python: remove python-dev from python-modules
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
X-List-Received-Date: Sun, 19 Sep 2010 18:42:45 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

python-modules has python-dv in it sdependencies.
I'm not a python wiz, but I feel that is no good as it drags in a lot of dev
packages. Note too sure if thre should be a depends on python though.

Expert opinion appreciated

 recipes/python/python-2.6-manifest.inc |    2 +-
 recipes/python/python_2.6.5.bb         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
 
 
diff --git a/recipes/python/python_2.6.5.bb b/recipes/python/python_2.6.5.bb
index c144fee..6ce0983 100644
--- a/recipes/python/python_2.6.5.bb
+++ b/recipes/python/python_2.6.5.bb
@@ -3,7 +3,7 @@ DEPENDS = "python-native db gdbm openssl readline sqlite3 tcl zlib\
            ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
 # set to .0 on every increase of INC_PR
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI = "\
   http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
-- 
1.6.4.2



