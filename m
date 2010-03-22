Received: from exprod5og109.obsmtp.com ([64.18.0.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nte1u-0001t5-Rz
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 10:34:43 +0100
Received: from source ([4.78.218.129]) (using TLSv1) by
	exprod5ob109.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS6c49NTGhx1mcTWwue0sctKUVPaFCi82@postini.com;
	Mon, 22 Mar 2010 02:31:33 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Cinmlip07.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:31:31 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:31:31 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 09:34:46 +0000
Message-ID: <20100322093446.27540.67012.stgit@ES-J7S4D2J.amer.consind.ge.com>
In-Reply-To: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
References: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.188
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 02/12] commit fac64459a3623afe4590bf1de9de826a79e0a8fe
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
X-List-Received-Date: Mon, 22 Mar 2010 09:34:43 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add realpath

    Add realpath utility, this is needed when building without busybox.
---

 recipes/realpath/files/makefile.patch |   12 ++++++++++++
 recipes/realpath/realpath_1.10.bb     |   19 +++++++++++++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/recipes/realpath/files/makefile.patch b/recipes/realpath/files/makefile.patch
new file mode 100644
index 0000000..d97ba59
--- /dev/null
+++ b/recipes/realpath/files/makefile.patch
@@ -0,0 +1,12 @@
+diff -urN realpath-1.10.orig/Makefile realpath-1.10/Makefile
+--- realpath-1.10.orig/Makefile	2009-07-28 16:04:11.000000000 +0100
++++ realpath-1.10/Makefile	2009-07-28 16:08:44.000000000 +0100
+@@ -3,7 +3,7 @@
+ # "@(#)realpath:$Id: Makefile,v 1.30 2006-05-07 19:41:41 robert Exp $"
+ #
+ 
+-VERSION	= $(shell dpkg-parsechangelog | sed -ne 's/^Version: *//p')
++#VERSION	= $(shell dpkg-parsechangelog | sed -ne 's/^Version: *//p')
+ 
+ CC	= gcc
+ CFLAGS	= -Wall -Wstrict-prototypes -Wmissing-prototypes -DVERSION='"$(VERSION)"' 
diff --git a/recipes/realpath/realpath_1.10.bb b/recipes/realpath/realpath_1.10.bb
new file mode 100644
index 0000000..911f987
--- /dev/null
+++ b/recipes/realpath/realpath_1.10.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Debian's Realpath Utility"
+SECTION = "utility"
+PRIORITY = "optional"
+LICENSE = "GPL"
+#DEPENDS = "perl-native po4a-native"
+PR = "r0"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/r/realpath/realpath_${PV}.tar.gz;name=realpath \
+	file://makefile.patch;patch=1"
+
+SRC_URI[realpath.md5sum] = "1f2b2bceaacadf79162a9cbb5956c3b6"
+SRC_URI[realpath.sha256sum] = "72199f9c11d1f9a36b3b9693988b558a167def6b88fa146ea6a7f7223f96c535"
+
+CFLAGS += "-DVERSION=${PV}"
+
+do_install () {
+	install -d ${D}${bindir}
+	install -p -m 0755 ${S}/realpath ${D}${bindir}
+}


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


