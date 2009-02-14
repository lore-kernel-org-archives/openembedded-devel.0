Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LYLKw-0004xL-U6
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Feb 2009 15:17:43 +0100
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.hex)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LYLJO-00070H-Fu
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Feb 2009 17:16:06 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Feb 2009 17:15:56 +0300
User-Agent: KMail/1.9.9
References: <200902140035.13820.khimov@altell.ru>
	<200902140730.32782.openembedded@haerwu.biz>
In-Reply-To: <200902140730.32782.openembedded@haerwu.biz>
Organization: Altell Ltd.
MIME-Version: 1.0
Message-Id: <200902141715.56797.khimov@altell.ru>
Subject: Re: [PATCH] New package: siproxd
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
X-List-Received-Date: Sat, 14 Feb 2009 14:17:43 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Marcin Juszkiewicz:
> On Friday 13 of February 2009 22:35:13 Roman I Khimov wrote:
> > diff --git a/packages/siproxd/siproxd.inc
> >
> > +RDEPENDS = "libosip2"
> >
> > diff --git a/packages/siproxd/siproxd_0.7.1.bb
> >
> > +PR = "r0"
>
> Drop those two lines. You should not add libs to RDEPENDS (OE takes care
> of it) and "r0" is default PR value.

OK.

diff --git a/conf/checksums.ini b/conf/checksums.ini
index ca05e9f..ebf53da 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -19686,6 +19686,10 @@ sha256=928fa03d1b8a2329f5e71dd9190080146b5275119e28c19c36fdd57e788d84ba
 md5=597d7ff7edb42a18421c806ffd18a136
 sha256=7faaccb6f17296399051bd076a7f41e0f6d95a28eda3e30468f1bd7cf45898e1
 
+[http://downloads.sourceforge.net/siproxd/siproxd-0.7.1.tar.gz]
+md5=45e5a44803181e2bf3361d562060c904
+sha256=9e702c1fe770815ed87cf2a2b1d1d1d87551573d
+
 [http://download.berlios.de/sipsak/sipsak-0.9.6-1.tar.gz]
 md5=c4eb8e282902e75f4f040f09ea9d99d5
 sha256=5064c56d482a080b6a4aea71821b78c21b59d44f6d1aa14c27429441917911a9
diff --git a/packages/siproxd/siproxd.inc b/packages/siproxd/siproxd.inc
new file mode 100644
index 0000000..333210f
--- /dev/null
+++ b/packages/siproxd/siproxd.inc
@@ -0,0 +1,8 @@
+DESCRIPTION = "SIP proxy/masquerading daemon"
+SECTION = "net"
+DEPENDS = "libosip2"
+LICENSE = "GPL"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/siproxd/siproxd-${PV}.tar.gz"
+
+inherit autotools
diff --git a/packages/siproxd/siproxd_0.7.1.bb b/packages/siproxd/siproxd_0.7.1.bb
new file mode 100644
index 0000000..760a8b6
--- /dev/null
+++ b/packages/siproxd/siproxd_0.7.1.bb
@@ -0,0 +1 @@
+require siproxd.inc


