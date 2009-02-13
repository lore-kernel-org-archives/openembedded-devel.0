Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LY04i-0007pH-Qg
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 16:35:32 +0100
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.116])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LY03J-000H9f-3H
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 18:34:05 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2009 18:33:54 +0300
User-Agent: KMail/1.9.9
Organization: Altell Ltd.
MIME-Version: 1.0
Message-Id: <200902131833.55265.khimov@altell.ru>
Subject: [PATCH] New package: tnef
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
X-List-Received-Date: Fri, 13 Feb 2009 15:35:33 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all.

diff --git a/packages/tnef/tnef.inc b/packages/tnef/tnef.inc
new file mode 100644
index 0000000..2da8960
--- /dev/null
+++ b/packages/tnef/tnef.inc
@@ -0,0 +1,7 @@
+DESCRIPTION = "TNEF is a program for unpacking ms-tnef type MIME attachments"
+SECTION = "net"
+LICENSE = "GPL"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/tnef/tnef-${PV}.tar.gz"
+
+inherit autotools
diff --git a/packages/tnef/tnef_1.4.5.bb b/packages/tnef/tnef_1.4.5.bb
new file mode 100644
index 0000000..cec39d8
--- /dev/null
+++ b/packages/tnef/tnef_1.4.5.bb
@@ -0,0 +1,3 @@
+require tnef.inc
+
+PR = "r0"
--- a/conf/checksums.ini	2009-02-13 15:05:24.976017132 +0300
+++ b/conf/checksums.ini	2009-02-13 18:30:39.887017023 +0300
@@ -25330,3 +25330,6 @@ sha256=f57c4e33eb2cdd87a6c2f01bfa4794340
 md5=5f7b88ebb2bcd7e8044328482d079661
 sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
 
+[http://downloads.sourceforge.net/tnef/tnef-1.4.5.tar.gz]
+md5=ec46d47525c6afb928642e3edec21058
+sha256=42067fbc00d1ad4bcbb67440d61869aa43ed2d3d099fc691d3da8ad4296fa6b1


