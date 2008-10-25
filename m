Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Ktjpf-0004J5-Nx
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Oct 2008 16:09:35 +0200
Received: from [92.117.74.172] (helo=tamarin.localnet)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Ktjp0-0008CY-B6
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Oct 2008 16:08:56 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Oct 2008 16:09:16 +0200
User-Agent: KMail/1.10.1 (Linux/2.6.27-7-generic; KDE/4.1.2; i686; ; )
MIME-Version: 1.0
Message-Id: <200810251609.16654.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.117.74.172
Subject: Initial build broken?
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
X-List-Received-Date: Sat, 25 Oct 2008 14:09:36 -0000
X-Groupsio-MsgNum: 6382
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_MiyAJrGPgK8KXdB"

--Boundary-00=_MiyAJrGPgK8KXdB
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey guys,

I get a Bitbake exception when I don't have the TMPDIR created. Can anyone 
confirm this?

I have the following patches to help to see the problem and to cure it. 
Comments welcome.

I would be happy to apply them.


z.

 

--Boundary-00=_MiyAJrGPgK8KXdB
Content-Type: text/x-patch;
  charset="us-ascii";
  name="oe-work-on-initial-build.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="oe-work-on-initial-build.diff"

diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
index 7aabe04..b925d05 100644
--- a/classes/sanity.bbclass
+++ b/classes/sanity.bbclass
@@ -131,6 +131,8 @@ def check_sanity(e):
 		if (f.read().strip() != tmpdir):
 			messages = messages + "Error, TMPDIR has changed location. You need to either move it back to %s or rebuild\n" % tmpdir
 	else:
+		import bb
+		bb.mkdirhier(tmpdir)
 		f = file(checkfile, "w")
 		f.write(tmpdir)
 	f.close()

--Boundary-00=_MiyAJrGPgK8KXdB
Content-Type: text/x-patch;
  charset="us-ascii";
  name="0001--error-handling-Print-the-exception-if-config-parsi.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001--error-handling-Print-the-exception-if-config-parsi.patch"

From a36d39903ac0a4a33a46e2a82f389f1b5c2039f2 Mon Sep 17 00:00:00 2001
From: Holger Freyther <zecke@openmoko.org>
Date: Sat, 25 Oct 2008 16:00:58 +0200
Subject: [PATCH] [error handling] Print the exception if config parsing fai=
ls

  Print:
  Unable to open conf/bitbake.conf ([Errno 2] No such file or directory:
'/home/ich/build/om/neo1973/tmp/saved_tmpdir

  Instead of:
  Unable open conf/bitbake.conf
---
 lib/bb/cooker.py |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/bb/cooker.py b/lib/bb/cooker.py
index 1f9bb49..3a06d73 100644
--- a/lib/bb/cooker.py
+++ b/lib/bb/cooker.py
@@ -400,8 +400,8 @@ class BBCooker:
=20
             bb.event.fire(bb.event.ConfigParsed(self.configuration.data))
=20
-        except IOError:
-            bb.msg.fatal(bb.msg.domain.Parsing, "Unable to open %s" % afil=
e )
+        except IOError, e:
+            bb.msg.fatal(bb.msg.domain.Parsing, "Unable to open %s (%s)" %=
 (afile,e) )
         except bb.parse.ParseError, details:
             bb.msg.fatal(bb.msg.domain.Parsing, "Unable to parse %s (%s)" =
% (afile, details) )
=20
--=20
1.5.6.3


--Boundary-00=_MiyAJrGPgK8KXdB--
