Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id EB04973D90
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 16:11:29 +0000 (UTC)
Received: by wiun10 with SMTP id n10so28429105wiu.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2015 09:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=NKf0hroCf2Gwhs4rYGdtC0TXOS7Sp6L5hWtp3ASamPk=;
	b=eJPB39UQW0/To89Mlyn2HlTiGw1vSp6qgsbg4ukYSLjgc8MYYq0DM5QQQPL4CPOciD
	mewF3kLKLt/sUjCsubEYz1PiFoR+GPDEj5afsN6ZOt5ehTcQNJ6Q2b+VzVKG6uy0hffx
	DkLVsZ/Y3ekRIN38rjBeUDZ0wIz9KpeM3QOFhNGWTTWW+2H2UQ0Ey+zqHgZRE4GvaeAN
	C7UHo/0ukX6VI1PfIpq33Hrn5Oi2QIbBYh0ZSc4veLRtMoZ/n558DGb2La/Zdmzf6pKV
	mWN6tw7xFAHi4L3F7h8CvF/2miidxprRWh2j+jlxV2Ax/TZfB2X/X1YxpBb0HgZtz3KF
	EEbQ==
X-Received: by 10.194.185.8 with SMTP id ey8mr3735231wjc.118.1430928690676;
	Wed, 06 May 2015 09:11:30 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id k9sm2846567wia.6.2015.05.06.09.11.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 09:11:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 May 2015 18:10:46 +0200
Message-Id: <1430928646-2007-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
References: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] add udisks2 2.1.5
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
X-List-Received-Date: Wed, 06 May 2015 16:11:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

tests:

* Build & run along with udisks on xfce based image
* Tested automount on kde plasma desktop

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
new file mode 100644
index 0000000..2de2061
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
@@ -0,0 +1,31 @@
+SUMMARY = "udisks provides dbus interfaces for disks and storage devices"
+LICENSE = "GPLv2+ & LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43"
+
+DEPENDS = "libatasmart polkit udev dbus-glib glib-2.0 intltool-native gnome-common-native"
+
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
+SRC_URI = "http://udisks.freedesktop.org/releases/udisks-${PV}.tar.bz2"
+SRC_URI[md5sum] = "73632501002e6de8244f831e38b2b98e"
+SRC_URI[sha256sum] = "2cfcf560447ea44cba2a683342c7062aaaf35e4eb554bed64ac2dd55a70a5fb6"
+
+inherit autotools systemd gtk-doc
+
+S = "${WORKDIR}/udisks-${PV}"
+
+EXTRA_OECONF = "--disable-introspection"
+
+FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
+                ${datadir}/dbus-1/ \
+                ${datadir}/polkit-1 \
+                ${base_libdir}/udev/* \
+"
+
+PACKAGES =+ "${PN}-libs"
+
+FILES_${PN} += "${datadir}/bash-completion"
+FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
+
+SYSTEMD_SERVICE_${PN} = "${BPN}.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.9.3


