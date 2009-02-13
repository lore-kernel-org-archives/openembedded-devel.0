Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LY2en-00075o-0d
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 19:20:57 +0100
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.hex)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LY2dM-0007ZT-9D
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 21:19:28 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2009 21:19:22 +0300
User-Agent: KMail/1.9.9
References: <200902131833.55265.khimov@altell.ru>
	<20090213155637.GV11815@smtp.west.cox.net>
In-Reply-To: <20090213155637.GV11815@smtp.west.cox.net>
Organization: Altell Ltd.
MIME-Version: 1.0
Message-Id: <200902132119.22895.khimov@altell.ru>
Subject: Re: [PATCH] New package: tnef
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
X-List-Received-Date: Fri, 13 Feb 2009 18:20:57 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Tom Rini:
> On Fri, Feb 13, 2009 at 06:33:54PM +0300, Roman I Khimov wrote:
> > --- a/conf/checksums.ini	2009-02-13 15:05:24.976017132 +0300
> > +++ b/conf/checksums.ini	2009-02-13 18:30:39.887017023 +0300
>
> Can you please run the sorter
> (contrib/source-checker/oe-checksums-sorter.py) when you add new
> entries?  Thanks.

Sure. Didn't know about that. So, updated one should be like this:

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
diff --git a/conf/checksums.ini b/conf/checksums.ini
index ca05e9f..9981bb2 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -20898,6 +20898,10 @@ sha256=794687ae1b34aba9a3cf6f9b118d0ba91b8f83858fe92a9ded0611225db3ca0e
 md5=2f9ef4509198e96bb184577fdddfce6d
 sha256=794687ae1b34aba9a3cf6f9b118d0ba91b8f83858fe92a9ded0611225db3ca0e
 
+[http://downloads.sourceforge.net/tnef/tnef-1.4.5.tar.gz]
+md5=ec46d47525c6afb928642e3edec21058
+sha256=42067fbc00d1ad4bcbb67440d61869aa43ed2d3d099fc691d3da8ad4296fa6b1
+
 [http://tofrodos.sourceforge.net/download/tofrodos-1.7.8.tar.gz]
 md5=aaa044f9817a048e126d9eb7a7535e96
 sha256=e1d78226c5b54c0ce8e1c7de8bdd025aec6bf684960d5cee28310cf8dce48bb9



