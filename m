Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1S4f2u-0004I9-FE
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 22:02:16 +0100
Received: by eekc1 with SMTP id c1so1371982eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 12:53:41 -0800 (PST)
Received-SPF: pass (google.com: domain of tworaz666@gmail.com designates
	10.14.37.78 as permitted sender) client-ip=10.14.37.78; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of tworaz666@gmail.com
	designates 10.14.37.78 as permitted sender)
	smtp.mail=tworaz666@gmail.com;
	dkim=pass header.i=tworaz666@gmail.com
Received: from mr.google.com ([10.14.37.78])
	by 10.14.37.78 with SMTP id x54mr1572385eea.42.1330980821621 (num_hops
	= 1); Mon, 05 Mar 2012 12:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=O6lOKnUU//fu40A85dlrEtZ9kWoMXFmN3yAISyhRjYQ=;
	b=Ij7H8tdIRzuS4nkUR9VADWqZUKi+gdEqkQ7BFc2xkop0MYZEdmFPxOZi2LytxcXwMs
	uIKQIY1hEREtWD2MLDPEo8RX6wAzaIrIJdzV8Qz9PxTCxGBkuc7GDLC0exAdBFVh/cLZ
	bKjq1RGxGVR3ECnQANpRZOes7t6fMWumYGXkJ3qCycJu/gJAuDKzAKsIiPBeN8HRFBKP
	jG1785Hr0auGWNZ1gnzlcpa6aAmhyGE52J5+G3CAyWU62vd/Aq1ANrSXU8gZuTv9By8V
	rRxZIn53TCNtWcbpQxDdHvPDDJyAJcgODlYR1svkusp2IveeGCjmGPdm6oG9rw+3oaPE
	0Tdg==
Received: by 10.14.37.78 with SMTP id x54mr1194745eea.42.1330980821385;
	Mon, 05 Mar 2012 12:53:41 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id y11sm4390600eem.3.2012.03.05.12.53.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 12:53:40 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Mar 2012 21:53:21 +0100
Message-Id: <1330980801-19523-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe] zsh: Add initial recipe for version 4.3.17.
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
X-List-Received-Date: Mon, 05 Mar 2012 21:02:16 -0000

Run tested on netbook pro.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta-oe/recipes-extended/zsh/zsh_4.3.17.bb |   51 ++++++++++++++++++++++++++++
 1 files changed, 51 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/zsh/zsh_4.3.17.bb

diff --git a/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb b/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
new file mode 100644
index 0000000..9192f20
--- /dev/null
+++ b/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
@@ -0,0 +1,51 @@
+DESCRIPTION = "UNIX Shell similar to the Korn shell"
+HOMEPAGE="http://www.zsh.org"
+SECTION = "base/shell"
+
+LICENSE = "ZSH"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=ad234d4b46db63491c4a9789da4fb341"
+
+DEPENDS = "ncurses libcap libpcre gdbm groff-native"
+
+SRC_URI = "ftp://ftp.zsh.org/pub/${P}.tar.bz2"
+SRC_URI[md5sum] = "8258967060b2654f30001a011946ac6a"
+SRC_URI[sha256sum] = "054e0452afd9c742c9f1489465175e1d4d7db50d88b602d132551d850cf7a704"
+
+FILES_${PN}-dbg += "\
+    ${libdir}/${PN}/${PV}/${PN}/.debug/*.so \
+    ${libdir}/${PN}/${PV}/${PN}/db/.debug/*.so \
+    ${libdir}/${PN}/${PV}/${PN}/net/.debug/*.so \
+    "
+
+inherit autotools
+
+EXTRA_OECONF = " \
+    --bindir=${base_bindir} \
+    --enable-etcdir=${sysconfdir} \
+    --enable-fndir=${datadir}/${PN}/${PV}/functions \
+    --enable-site-fndir=${datadir}/${PN}/site-functions \
+    --enable-function-subdirs \
+    --with-term-lib='ncursesw ncurses' \
+    --with-tcsetpgrp \
+    --enable-pcre \
+    --enable-cap \
+    --enable-multibyte \
+    --enable-gdbm \
+    --enable-dynamic \
+    zsh_cv_shared_environ=yes \
+    "
+
+do_configure () {
+    oe_runconf
+}
+
+pkg_postinst_${PN} () {
+    touch $D${sysconfdir}/shells
+    grep -q "bin/zsh" $D${sysconfdir}/shells || echo "/bin/zsh" >> $D${sysconfdir}/shells
+}
+
+pkg_postrm_${PN} () {
+    if [ -e $D${sysconfdir}/shells ]; then
+        sed -i -e '/\/bin\/zsh/d' $D${sysconfdir}/shells
+    fi
+}
-- 
1.7.3.4



