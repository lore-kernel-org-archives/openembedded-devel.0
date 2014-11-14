Return-Path: <derek@minotaurinc.com>
Received: from relay.mailchannels.net (tkt-001-i373.relay.mailchannels.net
	[174.136.5.175])
	by mail.openembedded.org (Postfix) with ESMTP id 66ECF65C91
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 16:28:19 +0000 (UTC)
X-Sender-Id: arvixe|x-authuser|derek@minotaurinc.com
Received: from octopus.arvixe.com (ip-10-237-13-110.us-west-2.compute.internal
	[10.237.13.110])
	by relay.mailchannels.net (Postfix) with ESMTPA id 003785393
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 16:21:23 +0000 (UTC)
X-Sender-Id: arvixe|x-authuser|derek@minotaurinc.com
Received: from octopus.arvixe.com (octopus.arvixe.com [10.245.44.250])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA)
	by 0.0.0.0:2500 (trex/5.3.4); Fri, 14 Nov 2014 16:21:24 GMT
X-MC-Relay: Neutral
X-MailChannels-SenderId: arvixe|x-authuser|derek@minotaurinc.com
X-MailChannels-Auth-Id: arvixe
X-MC-Loop-Signature: 1415982084210:503393702
X-MC-Ingress-Time: 1415982084210
Received: from c-69-143-221-149.hsd1.md.comcast.net ([69.143.221.149]:41429
	helo=lnx-dereks-home.vaddio.com)
	by octopus.arvixe.com with esmtpsa (UNKNOWN:DHE-RSA-AES256-SHA:256)
	(Exim 4.82) (envelope-from <derek@minotaurinc.com>)
	id 1XpJcg-0004Jn-4d; Fri, 14 Nov 2014 08:21:22 -0800
From: Derek Straka <derek@minotaurinc.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Nov 2014 11:21:16 -0500
Message-Id: <1415982076-15847-1-git-send-email-derek@minotaurinc.com>
X-Mailer: git-send-email 1.7.9.5
X-AuthUser: derek@minotaurinc.com
Cc: Derek Straka <derek@minotaurinc.com>
Subject: [meta-python][PATCH] python-ujson: add recipe for 1.33
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
X-List-Received-Date: Fri, 14 Nov 2014 16:28:26 -0000

Signed-off-by: Derek Straka <derek@minotaurinc.com>
---
 .../recipes-devtools/python/python-ujson_1.33.bb   |   21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-ujson_1.33.bb

diff --git a/meta-python/recipes-devtools/python/python-ujson_1.33.bb b/meta-python/recipes-devtools/python/python-ujson_1.33.bb
new file mode 100644
index 0000000..8fdd2b8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-ujson_1.33.bb
@@ -0,0 +1,21 @@
+SUMMARY  = "Ultra fast JSON encoder and decoder for Python"
+DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pure C with bindings for Python 2.5+ and 3."
+HOMEPAGE = "https://pypi.python.org/pypi/ujson"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5b206f6ba5e41c60df8cdcddf79a3d82"
+
+SRCNAME = "ujson"
+
+SRC_URI = " \
+    http://pypi.python.org/packages/source/u/ujson/${SRCNAME}-${PV}.zip \
+"
+
+SRC_URI[md5sum] = "8148a2493fff78940feab1e11dc0a893"
+SRC_URI[sha256sum] = "68cf825f227c82e1ac61e423cfcad923ff734c27b5bdd7174495d162c42c602b"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} += "python-numbers"
-- 
1.7.9.5


