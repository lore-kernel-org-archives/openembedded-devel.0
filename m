Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NYGOX-0000FN-Ep
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 11:05:40 +0100
Received: by fxm4 with SMTP id 4so992173fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 02:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Ew+DDyHNyJeralp6sw2QJdbz+WgKE6iAE6WiwaearRQ=;
	b=ZlMuflvwM0y00nz9M7DGj8d8/DYFuybQRtD0kx2pKDyu2jfiSAaHUbYggY3Lzz7mvv
	nm3Ein2aHbzqWy2CfLbyFh34BSat9mLUNMUyfwecFMOGSU6fP97p2chawuasVkW4hsSA
	1//xHCvQC3/t4gKP1Tqwbkp6AGz1hHqtvfY2M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jnLT8UoUK2ocDScMdF6weqa33BKOIZX/xzPDaArk8rCChEXawBJ4BpGTlREz482B7x
	zu4pORz4OkGEZkQHocjFOMKKH4sxN04CneXzCGuykotMo9TtFoTA78VpZVzPnSzwhBqm
	4HD0b/yS0fvefASg/18iwtl/CwY80qpPBCEXQ=
Received: by 10.223.76.142 with SMTP id c14mr2699360fak.92.1264154599835;
	Fri, 22 Jan 2010 02:03:19 -0800 (PST)
Received: from localhost.localdomain (mk090152164068.a1.net [90.152.164.68])
	by mx.google.com with ESMTPS id 18sm2657854fks.4.2010.01.22.02.03.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Jan 2010 02:03:19 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jan 2010 11:03:33 +0100
Message-Id: <1264154613-29604-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <n>
References: <n>
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/2] libxml-libxml-perl: Adds perl module XML::LibXML
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
X-List-Received-Date: Fri, 22 Jan 2010 10:05:40 -0000

---
 .../libxml-libxml-perl-disable-libxml2-check.patch |   39 ++++++++++++++++++++
 recipes/perl/libxml-libxml-perl_1.70.bb            |   24 ++++++++++++
 2 files changed, 63 insertions(+), 0 deletions(-)
 create mode 100644 recipes/perl/files/libxml-libxml-perl-disable-libxml2-check.patch
 create mode 100644 recipes/perl/libxml-libxml-perl_1.70.bb

diff --git a/recipes/perl/files/libxml-libxml-perl-disable-libxml2-check.patch b/recipes/perl/files/libxml-libxml-perl-disable-libxml2-check.patch
new file mode 100644
index 0000000..c8e0218
--- /dev/null
+++ b/recipes/perl/files/libxml-libxml-perl-disable-libxml2-check.patch
@@ -0,0 +1,39 @@
+--- a/Makefile.PL	2010-01-21 15:31:53.000000000 +0100
++++ b/Makefile.PL	2010-01-21 15:32:51.000000000 +0100
+@@ -291,21 +291,21 @@
+ 
+ # -------------------------------------------------------------------------- #
+ # test if the libraries are really installed!
+-unless (have_library("xml2") or have_library("libxml2")) {
+-    print STDERR <<DEATH;
+-libxml2 not found
+-Try setting LIBS and INC values on the command line
+-Or get libxml2 from 
+-  http://xmlsoft.org/
+-If you install via RPMs, make sure you also install the -devel
+-RPMs, as this is where the headers (.h files) are.
+-
+-Also, you may try to run perl Makefile.PL with the DEBUG=1 parameter
+-to see the exact reason why the detection of libxml2 installation
+-failed or why Makefile.PL was not able to compile a test program.
+-DEATH
+-exit 0; # 0 recommended by http://cpantest.grango.org (Notes for CPAN Authors)
+-}
++#unless (have_library("xml2") or have_library("libxml2")) {
++#    print STDERR <<DEATH;
++#libxml2 not found
++#Try setting LIBS and INC values on the command line
++#Or get libxml2 from 
++#  http://xmlsoft.org/
++#If you install via RPMs, make sure you also install the -devel
++#RPMs, as this is where the headers (.h files) are.
++#
++#Also, you may try to run perl Makefile.PL with the DEBUG=1 parameter
++#to see the exact reason why the detection of libxml2 installation
++#failed or why Makefile.PL was not able to compile a test program.
++#DEATH
++#exit 0; # 0 recommended by http://cpantest.grango.org (Notes for CPAN Authors)
++#}
+ # -------------------------------------------------------------------------- #
+ 
+ # -------------------------------------------------------------------------- #
diff --git a/recipes/perl/libxml-libxml-perl_1.70.bb b/recipes/perl/libxml-libxml-perl_1.70.bb
new file mode 100644
index 0000000..ac56c9f
--- /dev/null
+++ b/recipes/perl/libxml-libxml-perl_1.70.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "XML-LibXML"
+SECTION = "libs"
+LICENSE = ""
+DEPENDS += "libxml2 \
+        libxml-sax-perl \
+        zlib \
+"
+PR = "r0"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PA/PAJAS/XML-LibXML-${PV}.tar.gz;name=libxml \
+        file://libxml-libxml-perl-disable-libxml2-check.patch;patch=1 \
+"
+SRC_URI[libxml.md5sum] = "33d4294f708e20c298cfe534d1166844"
+SRC_URI[libxml.sha256sum] = "53e6cf06772ba9d85055dc6e4488dbd876d2376e48ef3578fa73246ee98b3ba0"
+
+S = "${WORKDIR}/XML-LibXML-${PV}"
+
+inherit cpan
+
+EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR}/libxml2 LIBS=-L${STAGING_LIBDIR}"
+
+BBCLASSEXTEND = "native"
+
+CFLAGS += " -D_GNU_SOURCE "
-- 
1.6.4.4



