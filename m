Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.com>) id 1JhKw6-00058r-Fj
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Apr 2008 10:36:43 +0200
Received: from [172.16.23.102] (helo=buddha.tw.openmoko.com)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <john_lee@openmoko.com>)
	id 1JhKvr-0007XX-3i for openembedded-devel@lists.openembedded.org;
	Thu, 03 Apr 2008 16:36:39 +0800
Received: from john by buddha.tw.openmoko.com with local (Exim 4.69)
	(envelope-from <john_lee@openmoko.com>) id 1JhKvV-0007gU-Mb
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Apr 2008 16:36:05 +0800
Date: Thu, 3 Apr 2008 16:36:05 +0800
From: John Lee <john_lee@openmoko.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20080403083605.GG28970@buddha.tw.openmoko.com>
Mail-Followup-To: openembedded-devel
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
X-SA-Exim-Connect-IP: 172.16.23.102
X-SA-Exim-Mail-From: john_lee@openmoko.com
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: cvs date & timezone problem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Apr 2008 08:36:43 -0000
X-Groupsio-MsgNum: 4907
Content-Type: multipart/mixed; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

we can specify mindate and maxdate to the patch of cvs source now, but
there's one problem: different timezone.

for example, cvs log enlightenment.pc.in 

RCS file: /var/cvs/e/e17/apps/e/enlightenment.pc.in,v
Working file: enlightenment.pc.in
head: 1.3
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 3;	selected revisions: 3
description:
----------------------------
revision 1.3
date: 2008-03-31 22:35:23 +0800;  author: raster;  state: Exp;  lines: +1 -1;


use @PACKAGE@
----------------------------
revision 1.2
date: 2008-03-29 05:33:51 +0800;  author: raster;  state: Exp;  lines: +1 -2;


set libs to be modules dir - we wont use it anyway.
----------------------------
revision 1.1
date: 2008-03-29 04:53:26 +0800;  author: raster;  state: Exp;


add pkgconfig supprot to e17 itself.
=============================================================================

you can see 2008-03-29 04:53:26 +0800 in Taiwan is actually 03-28 in
UTC.  so Holger kindly put

file://pkgconfig-fix.patch;patch=1;pnum=0;mindate=20080328

in e-wm_cvs.bb

However, if I build the e-wm in Taiwan, `enlightenment.pc.in' does not
exist yet on 20080328 Taiwan time.  The build will fail.

I would suggest set cvs fetch in bitbake to always use UTC+0 for this
matter and we set the min and max date according to UTC+0 instead of
our own timezone.  Enclosed please find the patch to the bitbake 1.8
branch.


Regards,
John

--rwEMma7ioTxnRzrJ
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="cvs-utc.patch"

Index: lib/bb/fetch/cvs.py
===================================================================
--- lib/bb/fetch/cvs.py	(revision 1044)
+++ lib/bb/fetch/cvs.py	(working copy)
@@ -111,7 +111,7 @@
         if 'norecurse' in ud.parm:
             options.append("-l")
         if ud.date:
-            options.append("-D %s" % ud.date)
+            options.append("-D \"%s UTC\"" % ud.date)
         if ud.tag:
             options.append("-r %s" % ud.tag)
 

--rwEMma7ioTxnRzrJ--
