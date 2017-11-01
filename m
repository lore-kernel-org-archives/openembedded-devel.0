Return-Path: <joe@deserted.net>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7D12B6FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 13:23:45 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id e89so5931778ioi.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Nov 2017 06:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=MzsQBZ1hxD6wEp8NqTnLjbBXG/3JtSMssc1HpLZSjX0=;
	b=U/9OtDx/6kC9F6LX+8a3fvJC/ROXD/WMZWv76JaYBmIiT6a9GfH9BLJzKDbSaSt61v
	H+Xsgz47GdOr6/8oIMzRYBOmz6z7yFfU57bHqxh5iVyzkga14DCHG65flqne3wWC28ax
	XIXmhV5xkxCdnKQSrqpHcTujtjy549cSRjInl2aBiO1Zhu7Wd11+gKxeLh7dH5gSlWic
	qx4T7cCorwqBNwYK8DpkHI80GEiyz7bkkvlTpHtS3DpdJngtLSYYeAmTO3yQj+dHMbne
	xNn0wUd7U+A9ALGScQjvd2nKUHZ8hq/o2OKq/LmJ5VXBZ7wn9SNbN7VrZ97YgP9G2XCu
	8HSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=MzsQBZ1hxD6wEp8NqTnLjbBXG/3JtSMssc1HpLZSjX0=;
	b=tr+Vp/K9j8ZFUZFWfteba4h1JwD/xxymv3uhy7jHBDccR0RHNgem/5uxAG71XvLZ7T
	vmgeaAfnM9yMpHCg/AsmsHVWg8m3O6gx6Zu2eG4TFHXNNa8rvYnhH6PN5o80TvHBcyTw
	nsv+A/ScvLFao/U9j4xf2dIj5xlZ9mjuOTsCnYaHTQ8DTJz5O96E9lLmL8X6kYj9ciTG
	73p2ehgZvwbpNQTSVGBFqIxlpJFjCKRX3KJLldspedt1eQqmyzMryuxAsq7tY5Ee49ik
	We5axOM0G9QImaIliv9+qYY4GGhxSjk9vdXrWtjVDHRqPvKoSE0CrjlyWpqo8kKyxwjO
	BrIA==
X-Gm-Message-State: AMCzsaWo6GIHEKrsn1zx36OF1iuFK0xhDdsriB/dMHVMxmZtNvmbY0sa
	FNrB7XegR0vFIbRkU5oniTurHe8/
X-Google-Smtp-Source: ABhQp+SwjShuzls0HUuJpiz4Aa1kUueW0iJDw3mcHi5Be83jll+hL4xGthGTgubsYNMpfXIGL9Bmcw==
X-Received: by 10.107.62.65 with SMTP id l62mr7354007ioa.153.1509542625640;
	Wed, 01 Nov 2017 06:23:45 -0700 (PDT)
Received: from mir.deserted.net (23-233-29-148.cpe.pppoe.ca. [23.233.29.148])
	by smtp.gmail.com with ESMTPSA id
	d129sm256232ioe.1.2017.11.01.06.23.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Nov 2017 06:23:45 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Nov 2017 09:23:37 -0400
Message-Id: <1509542622-20015-2-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509542622-20015-1-git-send-email-joe_macdonald@mentor.com>
References: <1509542622-20015-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH v2 1/6] ddclient: new package
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
X-List-Received-Date: Wed, 01 Nov 2017 13:23:45 -0000

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
 .../recipes-daemons/ddclient/ddclient_3.8.3.bb     | 45 ++++++++++++++++++++++
 .../recipes-daemons/ddclient/files/ip-up           |  4 ++
 .../recipes-daemons/ddclient/files/persistent      |  1 +
 3 files changed, 50 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
 create mode 100644 meta-networking/recipes-daemons/ddclient/files/ip-up
 create mode 100644 meta-networking/recipes-daemons/ddclient/files/persistent

diff --git a/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
new file mode 100644
index 0000000..f4ef536
--- /dev/null
+++ b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
@@ -0,0 +1,45 @@
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
+    install -d ${D}${sbindir} ${D}${sysconfdir}/ddclient ${D}${sysconfdir}/init.d ${D}${sysconfdir}/default/persistent
+    install -d ${D}${sysconfdir}/ppp/ip-up.d/ install -d ${D}${docdir}/ddclient
+    install -m 755 ${S}/ddclient ${D}${sbindir}
+    install ${S}/sample-etc_ddclient.conf ${D}${sysconfdir}/ddclient/ddclient.conf
+    install -m 755 ${WORKDIR}/ip-up ${D}${sysconfdir}/ppp/ip-up.d/ddclient
+    install -m 0644 ${WORKDIR}/persistent ${D}/${sysconfdir}/default/persistent/50_ddclient
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


