Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ga5VE-000529-DU
	for openembedded-devel@openembedded.org; Wed, 18 Oct 2006 09:06:12 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ga5OR-0004cg-BW
	for openembedded-devel@openembedded.org; Wed, 18 Oct 2006 08:59:11 +0200
Received: from cm30.sigma248.maxonline.com.sg ([218.212.248.30])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 18 Oct 2006 08:59:11 +0200
Received: from robk by cm30.sigma248.maxonline.com.sg with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 18 Oct 2006 08:59:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Date: Wed, 18 Oct 2006 15:02:04 +0800
Message-ID: <eh4jbk$29v$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: cm30.sigma248.maxonline.com.sg
User-Agent: KNode/0.10.2
Sender: news <news@sea.gmane.org>
Subject: Bitbake-1.6 crashes on 'which'.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2006 07:06:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit

Heya,

I had to patch 1.6 as below, copied from trunk/bitbake.

Cheers,

    Rob

Index: lib/bb/shell.py
===================================================================
--- lib/bb/shell.py     (revision 618)
+++ lib/bb/shell.py     (working copy)
@@ -57,7 +57,7 @@
 except NameError:
     from sets import Set as set
 import sys, os, readline, socket, httplib, urllib, commands, popen2, copy,
shlex, Queue, fnmatch
-from bb import data, parse, build, fatal
+from bb import data, parse, build, fatal, providers as Providers

 __version__ = "0.5.3.1"
 __credits__ = """BitBake Shell Version %s (C) 2005 Michael 'Mickey' Lauer
<mickey@Vanille.de>
@@ -107,7 +107,7 @@
         preferred = data.getVar( "PREFERRED_PROVIDER_%s" % item,
cooker.configuration.data, 1 )
         if not preferred: preferred = item
         try:
-            lv, lf, pv, pf = bb.providers.findBestProvider(preferred,
cooker.configuration.data, cooker.status, cooker.build_cache_fail)
+            lv, lf, pv, pf = Providers.findBestProvider(preferred,
cooker.configuration.data, cooker.status, cooker.build_cache_fail)
         except KeyError:
             if item in cooker.status.providers:
                 pf = cooker.status.providers[item][0]
@@ -529,7 +529,7 @@
         if not preferred: preferred = item

         try:
-            lv, lf, pv, pf = bb.providers.findBestProvider(preferred,
cooker.configuration.data, cooker.status, cooker.build_cache_fail)
+            lv, lf, pv, pf = Providers.findBestProvider(preferred,
cooker.configuration.data, cooker.status, cooker.build_cache_fail)
         except KeyError:
             lv, lf, pv, pf = (None,)*4





