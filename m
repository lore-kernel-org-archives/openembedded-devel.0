Return-Path: <derek@minotaurinc.com>
X-Greylist: delayed 520 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Nov 2014 16:14:10 UTC
Received: from relay.mailchannels.net (ar-005-i190.relay.mailchannels.net
	[162.253.144.72])
	by mail.openembedded.org (Postfix) with ESMTP id 7AEE965D4F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 16:14:10 +0000 (UTC)
X-Sender-Id: arvixe|x-authuser|derek@minotaurinc.com
Received: from octopus.arvixe.com (ip-10-204-4-183.us-west-2.compute.internal
	[10.204.4.183])
	by relay.mailchannels.net (Postfix) with ESMTPA id 4C9BE6004B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 16:05:08 +0000 (UTC)
X-Sender-Id: arvixe|x-authuser|derek@minotaurinc.com
Received: from octopus.arvixe.com (octopus.arvixe.com [10.245.44.250])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA)
	by 0.0.0.0:2500 (trex/5.3.4); Fri, 14 Nov 2014 16:05:13 GMT
X-MC-Relay: Neutral
X-MailChannels-SenderId: arvixe|x-authuser|derek@minotaurinc.com
X-MailChannels-Auth-Id: arvixe
X-MC-Loop-Signature: 1415981112342:3458901047
X-MC-Ingress-Time: 1415981110650
Received: from c-69-143-221-149.hsd1.md.comcast.net ([69.143.221.149]:41330
	helo=lnx-dereks-home.vaddio.com)
	by octopus.arvixe.com with esmtpsa (UNKNOWN:DHE-RSA-AES256-SHA:256)
	(Exim 4.82) (envelope-from <derek@minotaurinc.com>)
	id 1XpJMx-0004iT-7L; Fri, 14 Nov 2014 08:05:07 -0800
From: Derek Straka <derek@minotaurinc.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Nov 2014 11:04:45 -0500
Message-Id: <1415981085-13253-3-git-send-email-derek@minotaurinc.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1415981085-13253-1-git-send-email-derek@minotaurinc.com>
References: <1415981085-13253-1-git-send-email-derek@minotaurinc.com>
X-AuthUser: derek@minotaurinc.com
Cc: Derek Straka <derek@minotaurinc.com>
Subject: [meta-python][PATCH 3/3] python-tornado: add recipe for 4.0.2
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
X-List-Received-Date: Fri, 14 Nov 2014 16:14:15 -0000

Signed-off-by: Derek Straka <derek@minotaurinc.com>
---
 .../recipes-devtools/python/python-tornado.inc     |   31 ++++++++++++++++++++
 .../python/python-tornado_4.0.2.bb                 |    6 ++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-tornado.inc
 create mode 100644 meta-python/recipes-devtools/python/python-tornado_4.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
new file mode 100644
index 0000000..ee2b308
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-tornado.inc
@@ -0,0 +1,31 @@
+SUMMARY  = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
+DESCRIPTION = "Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed. \
+By using non-blocking network I/O, Tornado can scale to tens of thousands of open connections, making it ideal for long \
+polling, WebSockets, and other applications that require a long-lived connection to each user."
+HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
+
+LICENSE = "Apache-2.0"
+
+SRCNAME = "tornado"
+
+SRC_URI = " \
+    https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+inherit setuptools
+
+RDEPENDS_${PN} += "python-compression python-numbers python-email python-subprocess \
+                    python-pkgutil python-html python-json python-backports-ssl python-certifi"
+
+RDEPENDS_${PN}-test += "${PN} python-unittest"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+PACKAGES =+ "\
+    ${PN}-test \
+"
+
+FILES_${PN}-test = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/${SRCNAME}/test \
+    ${libdir}/${PYTHON_DIR}/site-packages/${SRCNAME}/testing.py* \
+"
diff --git a/meta-python/recipes-devtools/python/python-tornado_4.0.2.bb b/meta-python/recipes-devtools/python/python-tornado_4.0.2.bb
new file mode 100644
index 0000000..184fcd7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-tornado_4.0.2.bb
@@ -0,0 +1,6 @@
+require python-tornado.inc
+
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5208df23820f490f691712a654be256d"
+
+SRC_URI[md5sum] = "985c0e704b765c33a6193d49d1935588"
+SRC_URI[sha256sum] = "900c5124ebdb6598ca8e8a0c5888f41a5f14117952d5515258e3d20222b21bfa"
-- 
1.7.9.5


