Return-Path: <Lauren.Post@freescale.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe004.messaging.microsoft.com [213.199.154.207])
	by mail.openembedded.org (Postfix) with ESMTP id 36F206F63F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 21:37:58 +0000 (UTC)
Received: from mail89-am1-R.bigfish.com (10.3.201.237) by
	AM1EHSOBE002.bigfish.com (10.3.204.22) with Microsoft SMTP Server id
	14.1.225.22; Fri, 7 Mar 2014 21:37:59 +0000
Received: from mail89-am1 (localhost [127.0.0.1])	by mail89-am1-R.bigfish.com
	(Postfix) with ESMTP id 2F5D11206DD	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 21:37:59 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zze0eahc8kzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz8275ch1de098h17326ah8275bh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h1155h)
Received: from mail89-am1 (localhost.localdomain [127.0.0.1]) by mail89-am1
	(MessageSwitch) id 1394228277542624_14014;
	Fri,  7 Mar 2014 21:37:57 +0000 (UTC)
Received: from AM1EHSMHS017.bigfish.com (unknown [10.3.201.254])	by
	mail89-am1.bigfish.com (Postfix) with ESMTP id 76D744E0065;
	Fri,  7 Mar 2014 21:37:57 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS017.bigfish.com
	(10.3.207.155) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 7 Mar 2014 21:37:57 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 7 Mar 2014 21:37:54 +0000
Received: from neo.am.freescale.net (neo.am.freescale.net [10.81.16.89])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s27LbrwI002056;
	Fri, 7 Mar 2014 14:37:54 -0700
From: Lauren Post <lauren.post@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Mar 2014 15:26:13 -0600
Message-ID: <1394227575-27897-5-git-send-email-lauren.post@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1394227575-27897-1-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1394227575-27897-1-git-send-email-lauren.post@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH 5/7] gtkperf: Create 0.40 version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Mar 2014 21:37:59 -0000
Content-Type: text/plain

gtkperf is a GTK Performance tool

Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 meta-oe/recipes-graphics/gtkperf/gtkperf/Makevars |   25 ++++++++++++++++++++
 meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb  |   26 +++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gtkperf/gtkperf/Makevars
 create mode 100644 meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb

diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf/Makevars b/meta-oe/recipes-graphics/gtkperf/gtkperf/Makevars
new file mode 100644
index 0000000..8b09f53
--- /dev/null
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf/Makevars
@@ -0,0 +1,25 @@
+# Makefile variables for PO directory in any package using GNU gettext.
+
+# Usually the message domain is the same as the package name.
+DOMAIN = $(PACKAGE)
+
+# These two variables depend on the location of this directory.
+subdir = po
+top_builddir = ..
+
+# These options get passed to xgettext.
+XGETTEXT_OPTIONS = --keyword=_ --keyword=N_
+
+# This is the copyright holder that gets inserted into the header of the
+# $(DOMAIN).pot file.  Set this to the copyright holder of the surrounding
+# package.  (Note that the msgstr strings, extracted from the package's
+# sources, belong to the copyright holder of the package.)  Translators are
+# expected to transfer the copyright for their translations to this person
+# or entity, or to disclaim their copyright.  The empty string stands for
+# the public domain; in this case the translators are expected to disclaim
+# their copyright.
+COPYRIGHT_HOLDER = Free Software Foundation, Inc.
+
+# This is the list of locale categories, beyond LC_MESSAGES, for which the
+# message catalogs shall be used.  It is usually empty.
+EXTRA_LOCALE_CATEGORIES =
diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
new file mode 100644
index 0000000..7e97a11
--- /dev/null
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
@@ -0,0 +1,26 @@
+SUMMARY = "GTK Performance tool"
+DESCRIPTION = "GTK Performance tools"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "http://prdownloads.sourceforge.net/gtkperf/gtkperf_${PV}.tar.gz \
+           file://Makevars"
+
+SRC_URI[md5sum] = "4331dde4bb83865e15482885fcb0cc53"
+SRC_URI[sha256sum] = "9704344e732038eecbd007dd996a56293a6b027b5b76f3f036273a3fae1ab27b"
+
+S = "${WORKDIR}/gtkperf"
+
+inherit autotools binconfig pkgconfig gettext
+
+do_configure_prepend () {
+	rm -f ${S}/m4/init.m4
+	cp -f ${WORKDIR}/Makevars ${S}/po/
+}
+
+do_install_append () {
+     rm -rf ${WORKDIR}/image/usr/doc
+}
+
+FILES_${PN} += "${exec_prefix}/share/duck.png"
-- 
1.7.9.5



