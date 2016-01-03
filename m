Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 612B26FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Jan 2016 21:15:31 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id e32so152273742qgf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jan 2016 13:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id;
	bh=2Lxtum8sP5GlHFPq3/fU0y6AIQWOuX0X4e8vS6hazMc=;
	b=gFuEswIdlg76xeBM2s1uQU9kyLlJA/ivrcJ8N30YTroTgnBZdf9LtwsG8DDl1Mg7h8
	GppZM/XKphvlc5JhIZ5O8PhjIwcFRX4JJ26dxVyzwIdLv1fKr+aKu06BE/LVbKFA4Nyu
	KScm3SZeRMh/53HKri2qUqsAwrmwoArShZIoA5qck5NKPNxJcWsy4+E9Ncx3bNKkP8dw
	18VjuTi8fwiQh7cXc8rgFjyWrq0gNBOST2fpDi1OTMyxSr7/A7gFRrFzOmth55+AT96v
	VMTiA+KqR4g6dn/tAw9wT09AhVPM5tRTtLcz5VFOyA57xoRIDVqQiu3zDn2ma6743KDV
	2Gvw==
X-Received: by 10.140.142.207 with SMTP id 198mr108143403qho.77.1451855732439; 
	Sun, 03 Jan 2016 13:15:32 -0800 (PST)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	c128sm38547120qha.5.2016.01.03.13.15.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jan 2016 13:15:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jan 2016 16:15:21 -0500
Message-Id: <1451855721-13018-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] Add python-jsonpatch and python-jsonpointer recipes
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
X-List-Received-Date: Sun, 03 Jan 2016 21:15:32 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-jsonpatch_1.12.bb                 | 21 +++++++++++++++++++++
 .../python/python-jsonpointer_1.10.bb               | 19 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb
 create mode 100644 meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb

diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb b/meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb
new file mode 100644
index 0000000..4dc3bee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb
@@ -0,0 +1,21 @@
+SUMMARY  = "Appling JSON patches in Python 2.6+ and 3.x"
+HOMEPAGE = "https://github.com/stefankoegl/python-json-patch"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
+
+SRCNAME = "jsonpatch"
+
+SRC_URI = " \
+    https://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+inherit setuptools
+
+SRC_URI[md5sum] = "76ae3183db5f2a8f85dd7705e9b6f278"
+SRC_URI[sha256sum] = "2e1eb457f9c8dd5dae837ca93c0fe5bd2522c9d44b9b380fb1aab2ab4dec04b1"
+
+RDEPENDS_${PN} += "python-jsonpointer"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
diff --git a/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb b/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb
new file mode 100644
index 0000000..9c69688
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Resolve JSON Pointers in Python"
+HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
+
+SRCNAME = "jsonpointer"
+
+SRC_URI = " \
+    https://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+inherit setuptools
+
+SRC_URI[md5sum] = "d68c0c6ad6889e9c94ec0feba719e45e"
+SRC_URI[sha256sum] = "9fa5dcac35eefd53e25d6cd4c310d963c9f0b897641772cd6e5e7b89df7ee0b1"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
-- 
1.9.1


