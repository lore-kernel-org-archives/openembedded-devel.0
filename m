Return-Path: <yann.peron@optimatic.fr>
Received: from mo2.mail-out.ovh.net (mo2.mail-out.ovh.net [178.32.228.2])
	by mail.openembedded.org (Postfix) with ESMTP id C67C8608B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Mar 2017 11:38:11 +0000 (UTC)
Received: from player157.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 3FA855E460
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Mar 2017 12:38:12 +0100 (CET)
Received: from localhost.localdomain (arl95-2-82-239-171-38.fbx.proxad.net
	[82.239.171.38]) (Authenticated sender: yann.peron@optimatic.fr)
	by player157.ha.ovh.net (Postfix) with ESMTPSA id 0975E500083;
	Mon,  6 Mar 2017 12:38:10 +0100 (CET)
From: Yann PERON <yann.peron@optimatic.fr>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 12:36:42 +0100
Message-Id: <1488800202-32655-1-git-send-email-yann.peron@optimatic.fr>
X-Mailer: git-send-email 2.1.4
X-Ovh-Tracer-Id: 5342395058892150856
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrgedtgdeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecu
Subject: [meta-qt5][PATCH v2] Add QtSerialBus to meta-toolchain-qt5.
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
X-List-Received-Date: Mon, 06 Mar 2017 11:38:12 -0000

Dynamic library Qt5SerialBus.so was not created in toolchain file system when I built bitbake meta-toolchain-qt5

Signed-off-by: Yann PERON <yann.peron@optimatic.fr>
---
 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 1521dbf..2735135 100755
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -83,6 +83,8 @@ RDEPENDS_${PN} += " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtsensors-qmlplugins', '', d)} \
     qtserialport-dev \
     qtserialport-mkspecs \
+    qtserialbus-dev \
+    qtserialbus-mkspecs \
     qtsvg-dev \
     qtsvg-mkspecs \
     qtsvg-plugins \
-- 
2.1.4


