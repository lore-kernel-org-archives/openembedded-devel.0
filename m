Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1R1fyy-0001w4-FI
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 16:53:36 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1R1fu6-0000Ag-7y from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 07:48:34 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 8 Sep 2011 16:48:33 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Sep 2011 19:50:17 +0500
Message-Id: <5d767bf228398dc44e49a6c40dd0bdf434044e03.1315490338.git.noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1315490338.git.noor_ahsan@mentor.com>
References: <cover.1315490338.git.noor_ahsan@mentor.com>
In-Reply-To: <noor_ahsan@mentor.com>
References: <noor_ahsan@mentor.com>
X-OriginalArrivalTime: 08 Sep 2011 14:48:33.0575 (UTC)
	FILETIME=[61D83370:01CC6E36]
Subject: [PATCH 1/1] strongswan: Add version 4.5.1 (initial recipe)
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
X-List-Received-Date: Thu, 08 Sep 2011 14:53:36 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Imported from oe.dev commit id 52d750320e5ec2d6ff8cefbacc0f7d8d9a9f8728.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../strongswan/strongswan_4.5.1.bb                 |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/strongswan/strongswan_4.5.1.bb

diff --git a/meta-oe/recipes-connectivity/strongswan/strongswan_4.5.1.bb b/meta-oe/recipes-connectivity/strongswan/strongswan_4.5.1.bb
new file mode 100644
index 0000000..bbc7146
--- /dev/null
+++ b/meta-oe/recipes-connectivity/strongswan/strongswan_4.5.1.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "strongSwan is an OpenSource IPsec implementation for the \
+Linux operating system."
+HOMEPAGE = "http://www.strongswan.org"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+DEPENDS = "gmp openssl flex-native flex bison-native"
+RRECOMMENDS_${PN} = "kernel-module-ipsec"
+
+
+SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2"
+SRC_URI[md5sum] = "81a4a699c4a1a49b74061dfa47b5a033"
+SRC_URI[sha256sum] = "252d7369d94aa2d79e6fad078853b07ca897ea811ab1e1a2b008bcec0d1e758a"
+
+inherit autotools
+
+EXTRA_OECONF = "--disable-curl --disable-soup --disable-ldap \
+		--enable-gmp --disable-mysql --disable-sqlite \
+		--enable-openssl"
+
+FILES_${PN}-dbg += "${libexecdir}/ipsec/.debug ${libexecdir}/ipsec/plugins/.debug"
+
-- 
1.7.0.4



