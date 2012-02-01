Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <redzhepoff@gmail.com>) id 1Rsa94-000363-Me
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 14:22:42 +0100
Received: by eaal10 with SMTP id l10so36082eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2012 05:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ZwbWcD+kCKAqyVIJWtEeCxMp0CkZV0ciaaPBJQrRo44=;
	b=kSnFJYPNSTDesXNyGj9K3sSG1t4Ri4BpB3zWzfvOUhIl2ixkr5QwH3eWrYUIjefAd5
	B4u6Wbrb0p6IJuJ2oU5gIHkWnMMGOfw68GBHXCR1D4epdOE1Kng1lL5fUMZJ2Dr18acx
	s2AoV9S6SK6F9f8/mCXGT08wWPxamkSQPzzpU=
Received: by 10.213.35.211 with SMTP id q19mr1127541ebd.10.1328102087884;
	Wed, 01 Feb 2012 05:14:47 -0800 (PST)
Received: from localhost.localdomain (host-82-135-33-74.customer.m-online.net.
	[82.135.33.74])
	by mx.google.com with ESMTPS id b49sm98915755eec.9.2012.02.01.05.14.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 05:14:47 -0800 (PST)
Sender: =?UTF-8?B?0JLQu9Cw0LTQuNC80LjRgCDQoNC10LTQttC10L/QvtCy?=
	<redzhepoff@gmail.com>
From: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Feb 2012 14:14:19 +0100
Message-Id: <1328102059-9805-2-git-send-email-vladimir.redzhepoff@promwad.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328102059-9805-1-git-send-email-vladimir.redzhepoff@promwad.com>
References: <1328102059-9805-1-git-send-email-vladimir.redzhepoff@promwad.com>
Cc: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
Subject: [PATCH] Add recipe for pptp-linux_1.7.2
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
X-List-Received-Date: Wed, 01 Feb 2012 13:22:42 -0000

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
index 0000000..e95ba9f
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
+LICENSE = "GPLv2+"
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



