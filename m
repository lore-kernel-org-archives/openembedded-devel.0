Return-Path: <Irfan_Sadiq@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A28FA77BC1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 14:53:44 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1e9uOn-0006BV-Qo from Irfan_Sadiq@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Nov 2017 07:53:45 -0700
Received: from svr-pkl-eng-02.pkl.mentorg.com (147.34.91.1) by
	SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Wed, 1 Nov 2017 14:53:40 +0000
From: H M Irfan Sadiq <irfan_sadiq@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 1 Nov 2017 19:52:52 +0500
Message-ID: <1509547972-13880-1-git-send-email-irfan_sadiq@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
	SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4)
Subject: [meta-oe][RFC][PATCH] scancode.bbclass: Adding a bbclass for scancode license scaning utility
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
X-List-Received-Date: Wed, 01 Nov 2017 14:53:44 -0000
Content-Type: text/plain

This is adding the functionality to run scancode utility on code.
You need to set the following variables to use it. You can override
 these from local.conf or auto.conf.
1) SCANCODE_GIT_LOCATION: Git Path for scancode-toolkit cloning, default is set.
2) SCANCODE_TAG: Select tag, if you want.
3) SCANCODE_FORMAT: Output file format json or html-app.
4) SCANCODE_SRC_LOCATION: Location to store scancode-toolkit.

This belongs to OI-2.

Signed-off-by: H M Irfan Sadiq <irfan_sadiq@mentor.com>
Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta-oe/classes/scancode.bbclass | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/classes/scancode.bbclass

diff --git a/meta-oe/classes/scancode.bbclass b/meta-oe/classes/scancode.bbclass
new file mode 100644
index 0000000..701660f
--- /dev/null
+++ b/meta-oe/classes/scancode.bbclass
@@ -0,0 +1,35 @@
+# We use scancode utlity for extacting licence information.
+# scancode itself is an OSS Utlitity.
+# For more informaiton https://github.com/nexB/scancode-toolkit
+
+SCANCODE_FORMAT ?= "html-app"
+EXT = "${@'html' if d.getVar('SCANCODE_FORMAT', True) == 'html-app' else 'json'}"
+SCANCODE_TOOLKIT = "${@get_scancode_toolkit(d)}"
+SCANCODE_TAG = "v2.2.1"
+SCANCODE_GIT_LOCATION ?= "https://github.com/nexB/scancode-toolkit.git"
+SCANCODE_SRC_LOCATION ?= "${DL_DIR}/scancode"
+
+def get_scancode_toolkit(d):
+    lf = bb.utils.lockfile(d.getVar('SCANCODE_SRC_LOCATION', True) + ".lock")
+    if (not os.path.exists(d.getVar('SCANCODE_SRC_LOCATION', True))):
+        os.system("git clone %s %s -b %s" % (d.getVar('SCANCODE_GIT_LOCATION', True), d.getVar('SCANCODE_SRC_LOCATION', True), d.getVar('SCANCODE_TAG', True)))
+    bb.utils.unlockfile(lf)
+    return (d.getVar('SCANCODE_SRC_LOCATION', True))
+
+do_scancode() {
+	mkdir -p ${DEPLOY_DIR_IMAGE}/scancode
+	cd ${SCANCODE_TOOLKIT}
+	if [ -d "${S}" ]; then
+		./scancode ${S} --format  ${SCANCODE_FORMAT} ${DEPLOY_DIR_IMAGE}/scancode/${PN}.${EXT}
+	fi
+}
+
+addtask scancode after do_patch
+
+do_scancode_oss() {
+    echo "We are done running scancode"
+}
+
+do_scancode_oss[recrdeptask] = "do_scancode_oss do_scancode"
+do_scancode_oss[nostamp] = "1"
+addtask do_scancode_oss after do_scancode
-- 
1.9.1


