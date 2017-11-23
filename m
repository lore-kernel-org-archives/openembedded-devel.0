Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AECCD78840
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:09:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vANC9Z5v025866
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Nov 2017 04:09:35 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 04:09:34 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>, <raj.khem@gmail.com>
Date: Thu, 23 Nov 2017 07:09:08 -0500
Message-ID: <4ed94d8f888c8f4856c2592276832426826d57ef.1511437794.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1511437793.git.hongxu.jia@windriver.com>
References: <cover.1511437793.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/15] meta-installer: add xserver-xf86-config bbappend
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
X-List-Received-Date: Thu, 23 Nov 2017 12:09:34 -0000
Content-Type: text/plain

Tweak display rate from "640x480" to "1024x768". The xorg.conf
is already overridden by qemux86-64 in oe-core, so we have to
use sed to do the modification.

The bbappend works only if DISTRO = "anaconda".

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../xorg-xserver/xserver-xf86-config_0.1.bbappend            | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-installer/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend

diff --git a/meta-installer/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend b/meta-installer/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
new file mode 100644
index 0000000..5447273
--- /dev/null
+++ b/meta-installer/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
@@ -0,0 +1,12 @@
+do_install_prepend_qemux86-64_anaconda () {
+    if test -s ${WORKDIR}/xorg.conf; then
+        sed -i 's/Modes *"640x480"/Modes    "1024x768"/g' ${WORKDIR}/xorg.conf
+    fi
+}
+
+do_install_prepend_qemux86_anaconda () {
+    if test -s ${WORKDIR}/xorg.conf; then
+        sed -i 's/Modes *"640x480"/Modes    "1024x768"/g' ${WORKDIR}/xorg.conf
+    fi
+}
+
-- 
2.8.1


