Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 839B6607A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 20:52:44 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t7CKqivE003719 for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 15:52:44 -0500
Received: from delcastillo2.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015081215524480-1428871 ;
	Wed, 12 Aug 2015 15:52:44 -0500 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Aug 2015 15:52:42 -0500
Message-Id: <1439412762-20356-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/12/2015 03:52:44 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/12/2015 03:52:44 PM,
	Serialize complete at 08/12/2015 03:52:44 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-08-12_11:, , signatures=0
Subject: [meta-python][PATCH v2] python-pyinotify: add recipe
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
X-List-Received-Date: Wed, 12 Aug 2015 20:52:49 -0000

Python bindings for Linux inotify mechanism

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 .../recipes-devtools/python/python-pyinotify_0.9.6.bb   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb

diff --git a/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb b/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
new file mode 100644
index 0000000..42956ce
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Python pyinotify: Linux filesystem events monitoring"
+HOMEPAGE = "https://pypi.python.org/pypi/pyinotify"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ab173cade7965b411528464589a08382"
+
+RDEPENDS_${PN} += "python-threading python-io python-subprocess python-misc python-shell"
+
+SRCNAME = "pyinotify"
+SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "8e580fa1ff3971f94a6f81672b76c406"
+SRC_URI[sha256sum] = "9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
1.9.1


