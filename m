Received: from usps1.crhc.illinois.edu ([130.126.143.230]
	helo=usps.crhc.uiuc.edu) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johnso87@crhc.illinois.edu>) id 1PBwVE-0007sr-Jw
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 23:28:51 +0200
Received: from usps.crhc.uiuc.edu (localhost [127.0.0.1])
	by usps.crhc.uiuc.edu (Postfix) with ESMTP id EEBED340009B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 16:28:03 -0500 (CDT)
Received: from [128.252.3.32] (mjlap-128252003032.psychology.wustl.edu
	[128.252.3.32])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: johnso87)
	by usps.crhc.uiuc.edu (Postfix) with ESMTPSA id CD6D23400094
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 16:28:03 -0500 (CDT)
Message-ID: <4CCB3C63.4000503@crhc.illinois.edu>
Date: Fri, 29 Oct 2010 16:28:03 -0500
From: Matt Johnson <johnso87@crhc.illinois.edu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9pre) Gecko/20100217 Lightning/1.0b1 Shredder/3.0.3pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 130.126.143.230
X-SA-Exim-Mail-From: johnso87@crhc.illinois.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [PATCH]: Fix GraphViz .dot output for rdepends and rrecs (BitBake 1.10)
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
X-List-Received-Date: Fri, 29 Oct 2010 21:28:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The below patch fixes rdepends and rrecs GraphViz output.  These two are 
put into the rdepends data structure differently than the rest, and 
without this patch, each character gets its own vertex, which is wrong 
and creates massive .dot files.  The fix is similar to a previous one 
documented here: 
http://bugs.openembedded.org/attachment.cgi?id=13797&action=diff 
<http://bugs.openembedded.org/attachment.cgi?id=13797&action=diff> .  I 
have submitted the patch to the BitBake developer list too.

diff -uNr lib/bb/cooker.py.busted lib/bb/cooker.py
--- lib/bb/cooker.py.busted     2010-10-29 16:15:01.157515847 -0500
+++ lib/bb/cooker.py    2010-10-29 16:17:12.367546106 -0500
@@ -435,11 +435,11 @@
              for depend in depgraph["depends"][pn]:
                  print >> depends_file, '"%s" -> "%s"' % (package, depend)
          for package in depgraph["rdepends-pkg"]:
-            for rdepend in depgraph["rdepends-pkg"][package]:
-                print >> depends_file, '"%s" -> "%s" [style=dashed]' % 
(package, rdepend)
+            for rdepend in re.findall("([\w.-]+)(\ \(.+\))?", 
''.join(depgraph["rdepends-pkg"][package])):
+                print >> depends_file, '"%s" -> "%s%s" [style=dashed]' 
% (package, rdepend[0], rdepend[1])
          for package in depgraph["rrecs-pkg"]:
-            for rdepend in depgraph["rrecs-pkg"][package]:
-                print >> depends_file, '"%s" -> "%s" [style=dashed]' % 
(package, rdepend)
+            for rdepend in re.findall("([\w.-]+)(\ \(.+\))?", 
''.join(depgraph["rrecs-pkg"][package])):
+                print >> depends_file, '"%s" -> "%s%s" [style=dashed]' 
% (package, rdepend[0], rdepend[1])
          print >> depends_file,  "}"
          bb.msg.plain("Package dependencies saved to 
'package-depends.dot'")



