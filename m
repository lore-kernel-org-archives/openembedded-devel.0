Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PozVQ-0008VT-C9
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 15:34:24 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so5249326bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 06:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ZMyCEj6byJoq8OAGLcvCraAwhmul6HKH7AcccgIIG6E=;
	b=iBM2B7vviDFDDrZKTRRBGEsZujbJjwgtwyeQzIg8wgtVz0l8ULhJvbf9ZQtQdSsDTB
	M/VMtGZyPxtmED+zgahwN1K8EWr8JtNCOBS9m4dW/BObbjveBjkevFY26Oetkn1LNAoz
	+a1Nl9fxRGDw4zGFqtzWwOwLR5VqAHnGBSUAY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=E/Svl08aOeM/QBs0wduDDctjpg8HXGBxXRdQ7Ot+nBJlS2RwXFKrAxugTBfIOIF8kn
	gYApHu8xljBtjIPyQOwLGC2uN59UrXp8+fCzk4nQ6KBEZAkn2sAvIMHL2B0xzK+NNEyN
	oggKcG65TRAFcbftXo+vJqqwaMXP/x/uZpGJ4=
Received: by 10.204.73.78 with SMTP id p14mr3462171bkj.47.1297693997495;
	Mon, 14 Feb 2011 06:33:17 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id rc9sm1820702bkb.2.2011.02.14.06.33.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Feb 2011 06:33:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Feb 2011 15:32:38 +0100
Message-Id: <1297693958-25388-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1297693958-25388-1-git-send-email-Martin.Jansa@gmail.com>
References: <1297693958-25388-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 5/5] python: generate-manifest-2.6.py, update few entries
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
X-List-Received-Date: Mon, 14 Feb 2011 14:34:24 -0000

* config was in python-dev as well as python-distutils, keep in
  distutils
* linecache.* was in python-core as well as python-lang, keep in core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 contrib/python/generate-manifest-2.6.py |    4 ++--
 recipes/python/python-2.6-manifest.inc  |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/contrib/python/generate-manifest-2.6.py b/contrib/python/generate-manifest-2.6.py
index 6d7bee9..28a7226 100755
--- a/contrib/python/generate-manifest-2.6.py
+++ b/contrib/python/generate-manifest-2.6.py
@@ -165,7 +165,7 @@ if __name__ == "__main__":
     "config/.debug lib-dynload/.debug ${bindir}/.debug ${libdir}/.debug" )
 
     m.addPackage( "${PN}-dev", "Python Development Package", "${PN}-core",
-    "${includedir} ${libdir}/libpython2.6.so config" ) # package
+    "${includedir} ${libdir}/libpython2.6.so" ) # package
 
     m.addPackage( "${PN}-idle", "Python Integrated Development Environment", "${PN}-core ${PN}-tkinter",
     "${bindir}/idle idlelib" ) # package
@@ -257,7 +257,7 @@ if __name__ == "__main__":
     "lib-dynload/_bisect.so lib-dynload/_collections.so lib-dynload/_heapq.so lib-dynload/_weakref.so lib-dynload/_functools.so " +
     "lib-dynload/array.so lib-dynload/itertools.so lib-dynload/operator.so lib-dynload/parser.so " +
     "atexit.* bisect.* code.* codeop.* collections.* dis.* functools.* heapq.* inspect.* keyword.* opcode.* symbol.* repr.* token.* " +
-    "tokenize.* traceback.* linecache.* weakref.*" )
+    "tokenize.* traceback.* weakref.*" )
 
     m.addPackage( "${PN}-logging", "Python Logging Support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
     "logging" ) # package
diff --git a/recipes/python/python-2.6-manifest.inc b/recipes/python/python-2.6-manifest.inc
index 65ba9b8..89c9be4 100644
--- a/recipes/python/python-2.6-manifest.inc
+++ b/recipes/python/python-2.6-manifest.inc
@@ -67,7 +67,7 @@ FILES_${PN}-debugger="${libdir}/python2.6/bdb.* ${libdir}/python2.6/pdb.* "
 
 DESCRIPTION_${PN}-dev="Python Development Package"
 RDEPENDS_${PN}-dev="${PN}-core"
-FILES_${PN}-dev="${includedir} ${libdir}/libpython2.6.so ${libdir}/python2.6/config "
+FILES_${PN}-dev="${includedir} ${libdir}/libpython2.6.so "
 
 DESCRIPTION_${PN}-difflib="Python helpers for computing deltas between objects."
 RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
@@ -123,7 +123,7 @@ FILES_${PN}-json="${libdir}/python2.6/json "
 
 DESCRIPTION_${PN}-lang="Python Low-Level Language Support"
 RDEPENDS_${PN}-lang="${PN}-core"
-FILES_${PN}-lang="${libdir}/python2.6/lib-dynload/_bisect.so ${libdir}/python2.6/lib-dynload/_collections.so ${libdir}/python2.6/lib-dynload/_heapq.so ${libdir}/python2.6/lib-dynload/_weakref.so ${libdir}/python2.6/lib-dynload/_functools.so ${libdir}/python2.6/lib-dynload/array.so ${libdir}/python2.6/lib-dynload/itertools.so ${libdir}/python2.6/lib-dynload/operator.so ${libdir}/python2.6/lib-dynload/parser.so ${libdir}/python2.6/atexit.* ${libdir}/python2.6/bisect.* ${libdir}/python2.6/code.* ${libdir}/python2.6/codeop.* ${libdir}/python2.6/collections.* ${libdir}/python2.6/dis.* ${libdir}/python2.6/functools.* ${libdir}/python2.6/heapq.* ${libdir}/python2.6/inspect.* ${libdir}/python2.6/keyword.* ${libdir}/python2.6/opcode.* ${libdir}/python2.6/symbol.* ${libdir}/python2.6/repr.* ${libdir}/python2.6/token.* ${libdir}/python2.6/tokenize.* ${libdir}/python2.6/traceback.* ${libdir}/python2.6/linecache.* ${libdir}/python2.6/weakref.* "
+FILES_${PN}-lang="${libdir}/python2.6/lib-dynload/_bisect.so ${libdir}/python2.6/lib-dynload/_collections.so ${libdir}/python2.6/lib-dynload/_heapq.so ${libdir}/python2.6/lib-dynload/_weakref.so ${libdir}/python2.6/lib-dynload/_functools.so ${libdir}/python2.6/lib-dynload/array.so ${libdir}/python2.6/lib-dynload/itertools.so ${libdir}/python2.6/lib-dynload/operator.so ${libdir}/python2.6/lib-dynload/parser.so ${libdir}/python2.6/atexit.* ${libdir}/python2.6/bisect.* ${libdir}/python2.6/code.* ${libdir}/python2.6/codeop.* ${libdir}/python2.6/collections.* ${libdir}/python2.6/dis.* ${libdir}/python2.6/functools.* ${libdir}/python2.6/heapq.* ${libdir}/python2.6/inspect.* ${libdir}/python2.6/keyword.* ${libdir}/python2.6/opcode.* ${libdir}/python2.6/symbol.* ${libdir}/python2.6/repr.* ${libdir}/python2.6/token.* ${libdir}/python2.6/tokenize.* ${libdir}/python2.6/traceback.* ${libdir}/python2.6/weakref.* "
 
 DESCRIPTION_${PN}-logging="Python Logging Support"
 RDEPENDS_${PN}-logging="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold"
-- 
1.7.4.1



