Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MDiad-0001uH-LU
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 19:24:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 9C2834A961A;
	Mon,  8 Jun 2009 13:15:25 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27079-08; Mon,  8 Jun 2009 13:15:25 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 6C6FA4C805D; Mon,  8 Jun 2009 13:15:25 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id F35DB4A91A2;
	Mon,  8 Jun 2009 13:15:21 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id DF10341483; Mon,  8 Jun 2009 13:15:21 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jun 2009 13:15:19 -0400
Message-Id: <1244481319-8401-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] Add iptraf, a heavy-duty bandwidth monitor.
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
X-List-Received-Date: Mon, 08 Jun 2009 17:24:56 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---

git-am may complain about whitespace in this one -- it's just the space
for context lines at the start of the makefile patch.

 conf/checksums.ini                                 |    8 +++++
 recipes/iptraf/iptraf-3.0.0/support-makefile.patch |   18 ++++++++++
 recipes/iptraf/iptraf_3.0.0.bb                     |   34 ++++++++++++++++++++
 3 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100644 recipes/iptraf/iptraf-3.0.0/support-makefile.patch
 create mode 100644 recipes/iptraf/iptraf_3.0.0.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 62f5a77..457de29 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -11214,6 +11214,14 @@ sha256=84ac04a28ae41e17df0f181d8bc0049ae7a83baae07296e890ea5977a2952318
 md5=0a9209f928002e5eee9cdff8fef4d4b3
 sha256=c5c8a091ed9a1fa2dab86b4d87719064b50c202e8503046f50f299a361e6211c
 
+[ftp://ftp.debian.org/debian/pool/main/i/iptraf/iptraf_3.0.0-6.diff.gz]
+md5=fe0e2944addbd5803b42e91f7e4ec5d7
+sha256=5803c3f3653887896b75567daf617a8f200cecdd28beb870219b3954d9931efa
+
+[ftp://ftp.debian.org/debian/pool/main/i/iptraf/iptraf_3.0.0.orig.tar.gz]
+md5=377371c28ee3c21a76f7024920649ea8
+sha256=9ee433d95573d612539da4b452e6cdcbca6ab6674a88bfbf6eaf12d4902b5163
+
 [http://downloads.sourceforge.net/iptstate/iptstate-2.2.1.tar.bz2]
 md5=6b08f09b9917f644629efea1febec4b3
 sha256=004f8358f4f84d90a260a76ac46ce8512126ac490d73460fcee6c11effd34362
diff --git a/recipes/iptraf/iptraf-3.0.0/support-makefile.patch b/recipes/iptraf/iptraf-3.0.0/support-makefile.patch
new file mode 100644
index 0000000..59fe43b
--- /dev/null
+++ b/recipes/iptraf/iptraf-3.0.0/support-makefile.patch
@@ -0,0 +1,18 @@
+--- iptraf-3.0.0/support/Makefile.orig	2002-07-19 12:31:48.000000000 -0400
++++ iptraf-3.0.0/support/Makefile	2009-06-08 01:21:19.000000000 -0400
+@@ -7,12 +7,12 @@
+ 
+ libtextbox.a: $(OBJS)
+ 	rm -rf libtextbox.a
+-	ar cq libtextbox.a $(OBJS)
+-	ranlib libtextbox.a
++	$(AR) cq libtextbox.a $(OBJS)
++	$(RANLIB) libtextbox.a
+ #	gcc -shared -o libtextbox.so $(OBJS)
+ 
+ %.o: %.c *.h
+-	gcc -O2 -g -Wall -fPIC $(INCLUDEDIR) -c -o $*.o $<
++#	gcc -O2 -g -Wall -fPIC $(INCLUDEDIR) -c -o $*.o $<
+ 
+ clean:
+ 	rm -rf *.o *~ libtextbox.a libtextbox.so
diff --git a/recipes/iptraf/iptraf_3.0.0.bb b/recipes/iptraf/iptraf_3.0.0.bb
new file mode 100644
index 0000000..bbfad48
--- /dev/null
+++ b/recipes/iptraf/iptraf_3.0.0.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Heavyweight console network bandwidth monitor"
+LICENSE = "GPLv2"
+DEPENDS = "ncurses"
+PR = "r0"
+
+SRC_URI = " \
+    ${DEBIAN_MIRROR}/main/i/iptraf/iptraf_${PV}.orig.tar.gz \
+    ${DEBIAN_MIRROR}/main/i/iptraf/iptraf_3.0.0-6.diff.gz;patch=1 \
+    file://support-makefile.patch;patch=1 \
+"
+
+# iptraf will store user filters etc. in /var/run/iptraf, which is probably
+# volatile.
+EXTRA_OEMAKE_append = " \
+    TARGET=${bindir} WORKDIR=${localstatedir}/run/iptraf DESTDIR=${D} \
+    INCLUDEDIR=-I../support \
+"
+
+do_compile(){
+    oe_runmake -C ${S}/src
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/src/iptraf ${D}${bindir}
+    install -m 0755 ${S}/src/rvnamed ${D}${bindir}
+
+    install -d ${D}${mandir}/man8
+    install -m 0644 ${S}/Documentation/iptraf.8 ${D}${mandir}/man8
+}
+
+PACKAGES =+ "${PN}-dns"
+DESCRIPTION_${PN}-dns = "Asynchronous reverse DNS lookup daemon for iptraf"
+FILES_${PN}-dns = "${bindir}/rvnamed"
-- 
1.6.3



