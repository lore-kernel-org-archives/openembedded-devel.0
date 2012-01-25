Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1Rq0eB-0003G2-FY
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 12:04:11 +0100
Received: by bkaq10 with SMTP id q10so4060448bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 02:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=lfL+3GdnraUF/2SBudxzcX1h2qelzNGKz+BV94NhgeQ=;
	b=axnFR5UZqjjRxNNPf7mccHEUUJzLbcff98302+AWxZM+83R28yyBbirGN6bU8SO+4C
	qTURvHFP2Rflwft3gzVc70pYjAk6RZcbVTxuSBT5Mmhe/wG1M18DgOUQE27r4MxkrldS
	FtBnN8OtL/7isbv3mfSnu2D65N+KYB3tTwUuo=
Received: by 10.205.128.133 with SMTP id he5mr6633044bkc.17.1327488984129;
	Wed, 25 Jan 2012 02:56:24 -0800 (PST)
Received: from localhost.localdomain (mx2.promwad.com. [195.222.87.218])
	by mx.google.com with ESMTPS id a17sm81082bkz.7.2012.01.25.02.56.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 02:56:23 -0800 (PST)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.77)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1Rq0WZ-0007Lu-Un; Wed, 25 Jan 2012 13:56:19 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 13:56:19 +0300
Message-Id: <1327488979-28233-1-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.8.3
Cc: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
Subject: [PATCH 06/10] Add recipe for pptp-linux_1.7.2
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
X-List-Received-Date: Wed, 25 Jan 2012 11:04:11 -0000

From: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>

Recipe for this package has been taken from Openembedded-classic project.

Signed-off-by: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
---
 .../pptp-linux/pptp-linux-1.7.2/options.pptp       |   30 ++++++++++++++++++++
 .../pptp-linux/pptp-linux_1.7.2.bb                 |   29 +++++++++++++++++++
 2 files changed, 59 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-connectivity/pptp-linux/pptp-linux-1.7.2/options.pptp
 create mode 100644 meta/recipes-connectivity/pptp-linux/pptp-linux_1.7.2.bb

diff --git a/meta/recipes-connectivity/pptp-linux/pptp-linux-1.7.2/options.pptp b/meta/recipes-connectivity/pptp-linux/pptp-linux-1.7.2/options.pptp
new file mode 100644
index 0000000..f446e22
--- /dev/null
+++ b/meta/recipes-connectivity/pptp-linux/pptp-linux-1.7.2/options.pptp
@@ -0,0 +1,30 @@
+#
+# Lock the port
+#
+lock
+
+#
+# We don't need the tunnel server to authenticate itself
+#
+noauth
+
+#
+# Turn off transmission protocols we know won't be used
+#
+nobsdcomp
+nodeflate
+
+#
+# We want MPPE
+# (option naming specific to ppp 2.4.0 with unofficial patch)
+#
+#mppe-40
+mppe-128
+#mppe-stateless
+
+#
+# We want a sane mtu/mru 
+# (ppp 2.4.0 with unofficial patch)
+#
+#mtu 1000
+#mru 1000
diff --git a/meta/recipes-connectivity/pptp-linux/pptp-linux_1.7.2.bb b/meta/recipes-connectivity/pptp-linux/pptp-linux_1.7.2.bb
new file mode 100644
index 0000000..c04426a
--- /dev/null
+++ b/meta/recipes-connectivity/pptp-linux/pptp-linux_1.7.2.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "PPTP Client is a Linux, FreeBSD, NetBSD \
+and OpenBSD client for the proprietary Microsoft Point-to-Point \
+Tunneling Protocol, PPTP. Allows connection to a PPTP based \
+Virtual Private Network (VPN) as used by employers and some \
+cable and ADSL internet service providers."
+HOMEPAGE = "http://pptpclient.sourceforge.net"
+SECTION = "network"
+LICENSE = "GPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+RDEPENDS_${PN} = "ppp"
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/sourceforge/pptpclient/pptp-${PV}.tar.gz \
+           file://options.pptp"
+
+S = "${WORKDIR}/pptp-${PV}"
+
+do_compile() {
+        oe_runmake
+}
+do_install() {
+        install -d ${D}${sbindir} ${D}${sysconfdir}/ppp ${D}${mandir}/man8
+        install -m 555 pptp ${D}${sbindir}
+        install -m 644 pptp.8 ${D}${mandir}/man8
+        install -m 644 ${WORKDIR}/options.pptp ${D}${sysconfdir}/ppp
+}
+
+SRC_URI[md5sum] = "4c3d19286a37459a632c7128c92a9857"
+SRC_URI[sha256sum] = "e98ae0065d2a39fa3131654ff28cb7070e996f668ed6d0e7d9a445b8d37694bc"
-- 
1.7.6.4



