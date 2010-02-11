Received: from outbound.icp-qv1-irony-out5.iinet.net.au ([203.59.1.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gbj@theforce.com.au>) id 1NfYWh-0007zH-NP
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 13:52:15 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApEBAIyLc0t8lJcQ/2dsb2JhbAAH2QWEVgQ
X-IronPort-AV: E=Sophos;i="4.49,451,1262534400"; d="scan'208";a="100645705"
Received: from unknown (HELO [10.1.1.8]) ([124.148.151.16])
	by outbound.icp-qv1-irony-out5.iinet.net.au with ESMTP;
	11 Feb 2010 20:46:29 +0800
Message-ID: <4B73FC24.9060807@theforce.com.au>
Date: Thu, 11 Feb 2010 23:46:28 +1100
From: Grahame Jordan <gbj@theforce.com.au>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 203.59.1.105
X-SA-Exim-Mail-From: gbj@theforce.com.au
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: omap3-desktop-image fails baking 'news'
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
X-List-Received-Date: Thu, 11 Feb 2010 12:52:15 -0000
Content-Type: multipart/mixed; boundary="------------020707050408010007060405"

--------------020707050408010007060405
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

After git pull I could not build e17/news on Ubuntu 9.04
Found this on:
http://old.nabble.com/omap3-desktop-image-fails-baking-'news'-td27323561.html
applied changes and it now compiles OK.

Please review/apply attached patch

Thanks

Grahame Jordan


--------------020707050408010007060405
Content-Type: text/x-patch;
 name="AM_GNU_GETTEXT_po.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="AM_GNU_GETTEXT_po.patch"

diff --git a/recipes/e17/news_svn.bb b/recipes/e17/news_svn.bb
index c72fbb5..644d2e9 100644
--- a/recipes/e17/news_svn.bb
+++ b/recipes/e17/news_svn.bb
@@ -1,12 +1,13 @@
 LICENSE = "MIT"
 PV = "0.1.0+svnr${SRCPV}"
 
+PR = "r4"
+
 require e-module.inc
 
 do_configure_prepend() {
-	sed -i -e /po/d configure.ac 
+	sed -i -e /po/d -e /AM_GNU_GETTEXT/d configure.ac 
 	sed -i -e s:\ po::g Makefile.am
+	touch ${S}/config.rpath
 }
 
-
-


--------------020707050408010007060405--
