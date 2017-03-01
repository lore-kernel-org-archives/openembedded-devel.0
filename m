Return-Path: <yann.peron@optimatic.fr>
X-Greylist: delayed 11559 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 01 Mar 2017 12:45:48 UTC
Received: from mo2.mail-out.ovh.net (mo2.mail-out.ovh.net [178.32.228.2])
	by mail.openembedded.org (Postfix) with ESMTP id 07C7C72F67
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 12:45:48 +0000 (UTC)
Received: from player157.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 59B5D5D8FA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 11:17:57 +0100 (CET)
Received: from localhost.localdomain (arl95-2-82-239-171-38.fbx.proxad.net
	[82.239.171.38]) (Authenticated sender: yann.peron@optimatic.fr)
	by player157.ha.ovh.net (Postfix) with ESMTPSA id 0EDBA50009D;
	Wed,  1 Mar 2017 11:17:56 +0100 (CET)
From: Yann PERON <yann.peron@optimatic.fr>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Mar 2017 11:17:05 +0100
Message-Id: <1488363425-824-1-git-send-email-yann.peron@optimatic.fr>
X-Mailer: git-send-email 2.1.4
X-Ovh-Tracer-Id: 11517111622338648136
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrfedtgddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecu
Subject: [meta-qt5][PATCH] Ajout de qtSerialBus dans la toolchain
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
X-List-Received-Date: Wed, 01 Mar 2017 12:45:49 -0000

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


