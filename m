Return-Path: <joe@deserted.net>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC6571B87
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 18:11:16 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id 97so29229628iok.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=JYJ0EyymefR4Jcan2jlqzQH4J3P87QSjSOrjCp/eL2Y=;
	b=VjT9ldsqqlJEh/aX8et3j6igEqjqv1aBwGbBEdRmMxqpjOq0znt0ieoVJ0s2XSazty
	4LsPv1G/rtWC5ldCkeDFJYn6dtiZMSUByrm9tqzFyin719IzGmfh/7EqpWXrehjhBE/r
	EhOqAIBcYv2ZNip6LFRqph0JpnkhHXAVBEE/pORhvsx0QWb64NzGOklBO41cyV9m8iT5
	NetH6DQdYp0P9ioY3BUyW+LAuEC2iMxsNjHkrKEP/YFqLpw1oUuxuFOGtESKmqNVicj+
	OBorjpHXqVkwZhyejdYfDyVB1asV4iCNuOiAhVTThH3h+x5vREx+3TMapV8gH505HCDT
	UlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=JYJ0EyymefR4Jcan2jlqzQH4J3P87QSjSOrjCp/eL2Y=;
	b=UD1j0LZ8OZMRqQghW7fmkpblavtRrDWbMkmAtMz6UzMQN7ZZpew1ZkkVWHW+hHAj+0
	kBFIOw2lE7+GWyRZJ15dH+toIFxNfiahOtWYXMJkeUAZ0ZzIL87VLLB1H4RYUGHQbuAl
	hGUbK//MbOKPZn0lZ/8PbguEokEYS6zjQtjo9J9Du0ASAE8ofsQgO4KRAs2u4/wlAIVo
	/ei8t6FElSU/PwdYPwW9h6ShJLAWZEq3uehGn2NCV3A+CBsLyaKgroojty5tE66XjqXt
	87JKbvArmtC5PBp8mS654EWSVFlWvnZRNxR1jwW9p82MJi/pCM4MGp7bF7bzguzNk3pn
	Jtvg==
X-Gm-Message-State: AMCzsaXKES+Hy4GiHZPN4gbz0bjtpu6ewlXTvPM5pLZmhg2MoZgnVorU
	CYLMgyhYWLe7qhb091V5+w8D3MXz
X-Google-Smtp-Source: ABhQp+R9y5Gu6cBAAbYboJGqlTchFmG24d/g4BRaP6aKRDv2eT2ahLdnDFR7i22SewdU90H9Y+y17w==
X-Received: by 10.107.212.14 with SMTP id l14mr12278568iog.66.1509387077929;
	Mon, 30 Oct 2017 11:11:17 -0700 (PDT)
Received: from mir.deserted.net (23-233-29-148.cpe.pppoe.ca. [23.233.29.148])
	by smtp.gmail.com with ESMTPSA id
	81sm2182416itl.20.2017.10.30.11.11.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Oct 2017 11:11:16 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Oct 2017 14:11:08 -0400
Message-Id: <1509387073-21934-2-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
References: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 1/6] ddclient: new package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Oct 2017 18:11:17 -0000

From: "Kinsella, Ray" <ray.kinsella@intel.com>

Adding the package ddclient. DDClient updates Dynamic DNS servers with an IP address.
Recipe is based on the original OE recipe found here.

http://cgit.openembedded.org/openembedded/tree/recipes/ddclient/ddclient_3.6.3.bb

with modifications based on the recipe at:

https://github.com/cshoredaniel/meta-cshored/blob/master/recipes-connectivity/ddclient/ddclient_3.8.3.bb

DDClient version has been updated to 3.8.3.

Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../recipes-daemons/ddclient/ddclient_3.8.3.bb     | 44 ++++++++++++++++++++++
 .../recipes-daemons/ddclient/files/ip-up           |  4 ++
 .../recipes-daemons/ddclient/files/persistent      |  1 +
 3 files changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
 create mode 100644 meta-networking/recipes-daemons/ddclient/files/ip-up
 create mode 100644 meta-networking/recipes-daemons/ddclient/files/persistent

diff --git a/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
new file mode 100644
index 0000000..d83a4d4
--- /dev/null
+++ b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
@@ -0,0 +1,44 @@
+SECTION = "net/misc"
+DESCRIPTION = "Ddclient is a Perl client used to update dynamic DNS entries for accounts on Dynamic DNS Network Services"
+HOMEPAGE = "http://ddclient.sourceforge.net/"
+LICENSE = "GPLv2"
+
+SRC_URI = "\
+    ${SOURCEFORGE_MIRROR}/ddclient/ddclient-${PV}.tar.bz2 \
+    file://ip-up"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+RDEPENDS_${PN} = "\
+    perl-module-getopt-long \
+    perl-module-sys-hostname \
+    perl-module-io-socket \
+    perl-module-vars \
+    perl-module-overload \
+    perl-module-overloading \
+    perl-module-config \
+    perl-module-integer \
+    perl-module-exporter-heavy \
+    perl-module-symbol \
+    perl-module-selectsaver \
+    bash \
+    perl \
+    libio-socket-ssl-perl"
+
+do_install() {
+    install -d ${D}${sbindir} ${D}${sysconfdir}/ddclient ${D}${sysconfdir}/init.d
+    install -d ${D}${sysconfdir}/ppp/ip-up.d/ install -d ${D}${docdir}/ddclient
+    install -m 755 ${S}/ddclient ${D}${sbindir}
+    install ${S}/sample-etc_ddclient.conf ${D}${sysconfdir}/ddclient/ddclient.conf
+    install -m 755 ${WORKDIR}/ip-up ${D}${sysconfdir}/ppp/ip-up.d/ddclient
+    sed -e 's|/etc/ddclient.conf|/etc/ddclient/ddclient.conf|g' ${S}/sample-etc_rc.d_init.d_ddclient > ${S}/rc_init
+    install -m 755 ${S}/rc_init ${D}${sysconfdir}/init.d/ddclient
+    install ${S}/README* ${D}${docdir}/ddclient
+    install ${S}/COPY* ${D}${docdir}/ddclient
+    install ${S}/sample* ${D}${docdir}/ddclient
+}
+
+CONFFILES_${PN} = "${sysconfdir}/ddclient/ddclient.conf"
+
+SRC_URI[md5sum] = "3b426ae52d509e463b42eeb08fb89e0b"
+SRC_URI[sha256sum] = "d40e2f1fd3f4bff386d27bbdf4b8645199b1995d27605a886b8c71e44d819591"
diff --git a/meta-networking/recipes-daemons/ddclient/files/ip-up b/meta-networking/recipes-daemons/ddclient/files/ip-up
new file mode 100644
index 0000000..4411db9
--- /dev/null
+++ b/meta-networking/recipes-daemons/ddclient/files/ip-up
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+logger -t ddclient $PPP_IFACE $PPP_LOCAL
+ddclient -daemon=0 -syslog -use=if -if=$PPP_IFACE >/dev/null 2>&1
diff --git a/meta-networking/recipes-daemons/ddclient/files/persistent b/meta-networking/recipes-daemons/ddclient/files/persistent
new file mode 100644
index 0000000..b721272
--- /dev/null
+++ b/meta-networking/recipes-daemons/ddclient/files/persistent
@@ -0,0 +1 @@
+l root root 0644 /etc/ddclient.conf /var/persistent/etc/ddclient.conf
-- 
2.7.4


