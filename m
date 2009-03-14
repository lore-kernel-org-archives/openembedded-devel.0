Received: from [12.173.51.131] (helo=mail.hcrest.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Phil.Black@hillcrestlabs.com>) id 1LiIKT-00015L-JJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Mar 2009 02:06:21 +0100
Received: from 68.33.21.8 ([68.33.21.8]) by MAILSERV.hcrest.com ([10.1.2.6])
	with Microsoft Exchange Server HTTP-DAV ; 
	Sat, 14 Mar 2009 01:05:57 +0000
Received: from pblack-linux by mail.hcrest.com; 13 Mar 2009 21:05:57 -0400
From: Philip Black <phil.black@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Mar 2009 21:05:57 -0400
Message-Id: <1236992757.7047.2.camel@pblack-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: patch for ipkg-utils
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
X-List-Received-Date: Sat, 14 Mar 2009 01:06:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I found a bug with how the arfile.py works when parsing ar files.
Basically, the code assumed whitespace delimited when it should have
been fixed sized fields.



diff -wubr ipkg-utils.old/arfile.py ipkg-utils/arfile.py
--- ipkg-utils.old/arfile.py	2009-03-13 12:45:25.937148714 -0400
+++ ipkg-utils/arfile.py	2009-03-13 12:44:59.680250619 -0400
@@ -74,7 +74,14 @@
             if l == "\n":
                 l = self.f.readline()
                 if not l: break
-            descriptor = l.split()
+            descriptor = [ l[0:15].strip() # filename 
+                                , l[16:27].strip() # timestamp
+                                , l[28:33].strip() # owner ID
+                                , l[34:39].strip() # gid
+                                , l[40:47].strip() # mode
+                                , l[48:57].strip() # size in bytes
+                                , l[58:59].strip() # file magic
+            ]
 #            print descriptor
             size = int(descriptor[5])
             memberName = descriptor[0][:-1]




