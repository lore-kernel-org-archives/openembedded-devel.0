Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KkrpI-0003sn-5w
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Oct 2008 04:52:32 +0200
Received: from firewall.tw.openmoko.org ([124.219.5.210] helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KkrlK-0004LX-LM
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Oct 2008 04:48:27 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 1 Oct 2008 04:47:41 +0200
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200810010447.44667.zecke@selfish.org>
Subject: RFC: Making it mandantory to have a checksums.ini entry
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
X-List-Received-Date: Wed, 01 Oct 2008 02:52:32 -0000
X-Groupsio-MsgNum: 6012
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_QTu4I/679tzcJq9"

--Boundary-00=_QTu4I/679tzcJq9
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,

I constantly spend my day moving checksums from tmp/checksums.ini to the right 
place and I would like to make it mandatory to have a checksums.ini entry 
when adding new versions.

The spend time on copy and pasting a checksums.ini entry is really small and 
the value is very high. Stuff like macports is forcing one to have checksums 
as well.

The attached diff would force it.

comments appreciated
	z.

--Boundary-00=_QTu4I/679tzcJq9
Content-Type: text/x-diff;
  charset="us-ascii";
  name="make-it-mandantory.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="make-it-mandantory.diff"

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 2025483..a2a93c8 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -602,7 +602,10 @@ python base_do_fetch() {
 		try:
 			if type == "http" or type == "https" or type == "ftp" or type == "ftps":
 				if not base_chk_file(parser, pn, pv,uri, localpath, d):
-					bb.note("%s-%s: %s has no entry in conf/checksums.ini, not checking URI" % (pn,pv,uri))
+					if not bb.data.getVar("OE_ALLOW_INSECURE_DOWNLOADS",d, True):
+						bb.fatal("%s-%s: %s has no entry in conf/checksums.ini, not checking URI" % (pn,pv,uri))
+					else:
+						bb.note("%s-%s: %s has no entry in conf/checksums.ini, not checking URI" % (pn,pv,uri))
 		except Exception:
 			raise bb.build.FuncFailed("Checksum of '%s' failed" % uri)
 }

--Boundary-00=_QTu4I/679tzcJq9--
