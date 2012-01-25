Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1Rq0j1-0003tq-LE
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 12:09:13 +0100
Received: by bkaq10 with SMTP id q10so4063820bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 03:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=occknhABlxM0nKkkKMp09tON+KOIzlN1RYkf21mXhk4=;
	b=gsCyc4tR1Y86wpa6jl7j9FJ9yZMvbTUJBLG+jo7qprTT0QYp7+hOV04PtE3161Xk65
	F/HbSaVdm8nWUtQ0AVzHuVGYOyj8DwM2PJPl/iJGBgOkc9WnylDjQD4cuHF6euSYKym3
	OGQaRs+NF+badaeiWBmzYRW5pR6G69cZQVwG4=
Received: by 10.204.10.73 with SMTP id o9mr6598968bko.99.1327488883792;
	Wed, 25 Jan 2012 02:54:43 -0800 (PST)
Received: from localhost.localdomain (mx2.promwad.com. [195.222.87.218])
	by mx.google.com with ESMTPS id bw9sm62414bkb.8.2012.01.25.02.54.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 02:54:43 -0800 (PST)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.77)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1Rq0Uy-0007Ib-8k; Wed, 25 Jan 2012 13:54:40 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 13:54:27 +0300
Message-Id: <1327488867-28024-1-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.8.3
Cc: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
Subject: [PATCH 01/10] Add recipe for netcat_0.7.1
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
X-List-Received-Date: Wed, 25 Jan 2012 11:09:13 -0000

From: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>

Recipe for this package has been taken from Openembedded-classic project.

Signed-off-by: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
---
 meta/recipes-connectivity/netcat/netcat_0.7.1.bb |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-connectivity/netcat/netcat_0.7.1.bb

diff --git a/meta/recipes-connectivity/netcat/netcat_0.7.1.bb b/meta/recipes-connectivity/netcat/netcat_0.7.1.bb
new file mode 100644
index 0000000..d7c9719
--- /dev/null
+++ b/meta/recipes-connectivity/netcat/netcat_0.7.1.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "GNU Netcat"
+HOMEPAGE = "http://netcat.sourceforge.net"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2"
+
+inherit autotools update-alternatives gettext
+
+do_install_append() {
+	mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
+}
+
+ALTERNATIVE_NAME = "nc"
+ALTERNATIVE_LINK = "${bindir}/nc"
+ALTERNATIVE_PATH = "${bindir}/nc.${PN}"
+ALTERNATIVE_PRIORITY = "100"
+
+SRC_URI[md5sum] = "0a29eff1736ddb5effd0b1ec1f6fe0ef"
+SRC_URI[sha256sum] = "b55af0bbdf5acc02d1eb6ab18da2acd77a400bafd074489003f3df09676332bb"
-- 
1.7.6.4



