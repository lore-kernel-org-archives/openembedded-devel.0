Return-Path: <derek@minotaurinc.com>
X-Greylist: delayed 568 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Nov 2014 23:29:03 UTC
Received: from relay.mailchannels.net (tkt-001-i373.relay.mailchannels.net
	[174.136.5.175])
	by mail.openembedded.org (Postfix) with ESMTP id E6F2C65D3A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 23:29:02 +0000 (UTC)
X-Sender-Id: arvixe|x-authuser|derek@minotaurinc.com
Received: from octopus.arvixe.com (ip-10-33-12-218.us-west-2.compute.internal
	[10.33.12.218])
	by relay.mailchannels.net (Postfix) with ESMTPA id E599E60AF8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 23:19:33 +0000 (UTC)
X-Sender-Id: arvixe|x-authuser|derek@minotaurinc.com
Received: from octopus.arvixe.com (octopus.arvixe.com [10.245.44.250])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA)
	by 0.0.0.0:2500 (trex/5.3.3); Mon, 10 Nov 2014 23:19:34 GMT
X-MC-Relay: Neutral
X-MailChannels-SenderId: arvixe|x-authuser|derek@minotaurinc.com
X-MailChannels-Auth-Id: arvixe
X-MC-Loop-Signature: 1415661574178:2630051026
X-MC-Ingress-Time: 1415661574178
Received: from c-69-143-221-149.hsd1.md.comcast.net ([69.143.221.149]:54838
	helo=lnx-dereks-home.vaddio.com)
	by octopus.arvixe.com with esmtpsa (UNKNOWN:DHE-RSA-AES256-SHA:256)
	(Exim 4.82) (envelope-from <derek@minotaurinc.com>)
	id 1XnyFA-0004fb-Gd; Mon, 10 Nov 2014 15:19:32 -0800
From: Derek Straka <derek@minotaurinc.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Nov 2014 18:19:08 -0500
Message-Id: <1415661548-16364-1-git-send-email-derek@minotaurinc.com>
X-Mailer: git-send-email 1.7.9.5
X-AuthUser: derek@minotaurinc.com
Cc: Derek Straka <derek@minotaurinc.com>
Subject: [meta-python][PATCH] python-flufl-enum: add recipe for 4.0.1
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
X-List-Received-Date: Mon, 10 Nov 2014 23:29:05 -0000

Signed-off-by: Derek Straka <derek@minotaurinc.com>
---
 .../python/python-flufl-enum_4.0.1.bb              |   33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb b/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb
new file mode 100644
index 0000000..a7376db
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb
@@ -0,0 +1,33 @@
+SUMMARY  = "A Python enumeration package."
+DESCRIPTION = "The flufl.enum library is a Python enumeration package. Its goal is to provide simple, \
+specific, concise semantics in an easy to read and write syntax. flufl.enum has just enough of the \
+features needed to make enumerations useful, but without a lot of extra baggage to weigh them down. "
+HOMEPAGE = "https://pypi.python.org/pypi/flufl.enum"
+SECTION = "devel/python"
+
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1fa25baed15d3be23c902636379438e8"
+
+SRCNAME = "flufl.enum"
+
+SRC_URI = " \
+    http://pypi.python.org/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "b3ad23761a78232bc78499ced7cb85d9"
+SRC_URI[sha256sum] = "4af7e7cf2dcc7517251570c7ef9ad194e30ee4b6f860eba500c03954ae95f9d8"
+
+inherit setuptools
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+PACKAGES =+ "\  
+    ${PN}-test \
+"
+
+FILES_${PN}-doc += "\
+    ${libdir}/${PYTHON_DIR}/site-packages/flufl/enum/*.rst \
+    ${libdir}/${PYTHON_DIR}/site-packages/flufl/enum/docs \
+"
+
+FILES_${PN}-test += "${libdir}/${PYTHON_DIR}/site-packages/flufl/enum/tests"
-- 
1.7.9.5


