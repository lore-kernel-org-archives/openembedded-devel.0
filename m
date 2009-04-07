Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vhdirk@gmail.com>) id 1LrBhb-0001kJ-Ov
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 15:51:01 +0200
Received: by ewy20 with SMTP id 20so2384723ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2009 06:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=tPJO2KliW75ORFuIVRYWpBkVzayYnfxndZ0Ry1VEEKo=;
	b=A7NuCh3vmQVB41p1GIJGJ2f3M63C//2lbGFp7Ijy+3dJw2xFsZcl0kohm2DKTf+Cn/
	gspcsKY5h+tsIOvygBahKcPyjl5v23p485oevU4VWpVewGznlW7Lcudo2e8HC4Dkbbo5
	sXXkYG0FVK/bVhYmZ1xRVLLB+q02Rn/L20rUE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=nRWEbn/RXyfQC8pB+V7nOg/4gIDdIeBrE566XMIBPXTTz7RmT8LgD36SB1H3R4V6YE
	dII0rRtWCSSdTlL82xU4HD+YKu254j+mhT2RcFVNeZRLcXlL/ykVyUpXUDS2drmIAfcq
	+8pffyy9FVFHGVq6Tsdkpr2v/FfkcjnKhW9wk=
Received: by 10.210.53.1 with SMTP id b1mr2394393eba.94.1239112080873;
	Tue, 07 Apr 2009 06:48:00 -0700 (PDT)
Received: from localhost.localdomain (213.219.146.119.adsl.dyn.edpnet.net
	[213.219.146.119])
	by mx.google.com with ESMTPS id 10sm4232138eyd.3.2009.04.07.06.47.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Apr 2009 06:48:00 -0700 (PDT)
From: Dirk 'Virk' Van Haerenborgh <vhdirk@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Apr 2009 15:47:58 +0200
Message-Id: <1239112078-29808-1-git-send-email-vhdirk@gmail.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: vhdirk@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Added gsoap version 2.7.13
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
X-List-Received-Date: Tue, 07 Apr 2009 13:51:01 -0000

The patch is to make sure the just build binary soapcpp2 is used instead of looking for it in /usr/bin in the staging dir, just the same as
v2.7.7 of gsoap.
---
 .../use-just-built-binary-2.7.13.patch             |   12 +++++++
 recipes/gsoap/gsoap-native_2.7.13.bb               |   16 ++++++++++
 recipes/gsoap/gsoap_2.7.13.bb                      |   31 ++++++++++++++++++++
 3 files changed, 59 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch
 create mode 100644 recipes/gsoap/gsoap-native_2.7.13.bb
 create mode 100644 recipes/gsoap/gsoap_2.7.13.bb

diff --git a/recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch b/recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch
new file mode 100644
index 0000000..25a8ef0
--- /dev/null
+++ b/recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch
@@ -0,0 +1,12 @@
+diff -urN gsoap-2.7.orig/gsoap/wsdl/Makefile.am gsoap-2.7.orig/gsoap/wsdl/Makefile.am
+--- gsoap-2.7.orig/gsoap/wsdl/Makefile.am	2009-03-21 22:24:42.000000000 +0100
++++ gsoap-2.7.orig/gsoap/wsdl/Makefile.am	2009-04-07 11:30:50.000000000 +0200
+@@ -17,7 +17,7 @@ BUILT_SOURCES=$(SOAP_CPP_SRC)
+ # WSDL2H_EXTRA_LIBS=-lssl -lcrypto -lz # defined in configure.in
+ 
+ $(SOAP_CPP_SRC) : $(SOAPHEADER)
+-	$(SOAP) $(SOAP_FLAGS) $(SOAPHEADER)
++	../src/soapcpp2 $(SOAP_FLAGS) $(SOAPHEADER)
+ 
+ #LIBS=
+ 
diff --git a/recipes/gsoap/gsoap-native_2.7.13.bb b/recipes/gsoap/gsoap-native_2.7.13.bb
new file mode 100644
index 0000000..e046ff6
--- /dev/null
+++ b/recipes/gsoap/gsoap-native_2.7.13.bb
@@ -0,0 +1,16 @@
+require gsoap_${PV}.bb
+
+DEPENDS = ""
+PR = "r1"
+
+SRC_URI += "file://use-just-built-binary-2.7.13.patch;patch=1"
+
+inherit native
+
+do_stage() {
+	autotools_stage_all
+}
+
+do_install() {
+	:
+}
diff --git a/recipes/gsoap/gsoap_2.7.13.bb b/recipes/gsoap/gsoap_2.7.13.bb
new file mode 100644
index 0000000..53d02d2
--- /dev/null
+++ b/recipes/gsoap/gsoap_2.7.13.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "The gSOAP toolkit provides a unique SOAP-to-C/C++ language binding \
+for the development of SOAP Web Services and clients."
+SECTION = "devel"
+LICENSE = "GPL"
+DEPENDS = "gsoap-native"
+PR = "r1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz"
+
+S = "${WORKDIR}/gsoap-2.7"
+
+inherit autotools
+
+PARALLEL_MAKE = ""
+
+EXTRA_OEMAKE = "SOAP=${STAGING_BINDIR_NATIVE}/soapcpp2"
+
+do_install_append() {
+	install -d ${D}${libdir}
+	for lib in libgsoapssl libgsoapssl++ libgsoap libgsoapck++ libgsoap++ libgsoapck
+	do
+		oe_libinstall -C gsoap $lib ${D}${libdir}
+	done
+}
+
+do_stage() {
+	autotools_stage_all
+}
+
+PACKAGES = "${PN}-dbg ${PN}-dev ${PN} ${PN}-doc ${PN}-locale"
+FILES_gsoap-dev = "${bindir}/wsdl2h ${bindir}/src ${libdir}"
-- 
1.6.0.4



