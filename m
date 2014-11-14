Return-Path: <derek@minotaurinc.com>
X-Greylist: delayed 599 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Nov 2014 16:23:44 UTC
Received: from relay.mailchannels.net (aso-006-i437.relay.mailchannels.net
	[23.91.64.118])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB16712A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 16:23:44 +0000 (UTC)
X-Sender-Id: arvixe|x-authuser|derek@minotaurinc.com
Received: from octopus.arvixe.com (ip-10-204-4-183.us-west-2.compute.internal
	[10.204.4.183])
	by relay.mailchannels.net (Postfix) with ESMTPA id BA91810174F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 16:05:06 +0000 (UTC)
X-Sender-Id: arvixe|x-authuser|derek@minotaurinc.com
Received: from octopus.arvixe.com (octopus.arvixe.com [10.245.44.250])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA)
	by 0.0.0.0:2500 (trex/5.3.4); Fri, 14 Nov 2014 16:05:11 GMT
X-MC-Relay: Neutral
X-MailChannels-SenderId: arvixe|x-authuser|derek@minotaurinc.com
X-MailChannels-Auth-Id: arvixe
X-MC-Loop-Signature: 1415981110339:2683101335
X-MC-Ingress-Time: 1415981109297
Received: from c-69-143-221-149.hsd1.md.comcast.net ([69.143.221.149]:41330
	helo=lnx-dereks-home.vaddio.com)
	by octopus.arvixe.com with esmtpsa (UNKNOWN:DHE-RSA-AES256-SHA:256)
	(Exim 4.82) (envelope-from <derek@minotaurinc.com>)
	id 1XpJMu-0004iT-48; Fri, 14 Nov 2014 08:05:04 -0800
From: Derek Straka <derek@minotaurinc.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Nov 2014 11:04:43 -0500
Message-Id: <1415981085-13253-1-git-send-email-derek@minotaurinc.com>
X-Mailer: git-send-email 1.7.9.5
X-AuthUser: derek@minotaurinc.com
Cc: Derek Straka <derek@minotaurinc.com>
Subject: [meta-python][PATCH 1/3] python-backports-ssl: add recipe for 3.4.0.2
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
X-List-Received-Date: Fri, 14 Nov 2014 16:23:47 -0000

Signed-off-by: Derek Straka <derek@minotaurinc.com>
---
 .../python/python-backports-ssl_3.4.0.2.bb         |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb b/meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb
new file mode 100644
index 0000000..9caae41
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb
@@ -0,0 +1,23 @@
+SUMMARY = "The ssl.match_hostname() function from Python 3.4"
+DESCRIPTION = "The Secure Sockets layer is only actually secure if you check the hostname in the \
+certificate returned by the server to which you are connecting, and verify that it matches to hostname \
+that you are trying to reach. But the matching logic, defined in RFC2818, can be a bit tricky to implement \
+on your own. So the ssl package in the Standard Library of Python 3.2 and greater now includes a \
+match_hostname() function for performing this check instead of requiring every application to \
+implement the check separately. This backport brings match_hostname() to users of earlier versions of Python"
+HOMEPAGE = "https://pypi.python.org/pypi/backports.ssl_match_hostname"
+SECTION = "devel/python"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=77b684960b86b7a4bb4a450ffde08605"
+
+SRCNAME = "backports.ssl_match_hostname"
+
+SRC_URI = "https://pypi.python.org/packages/source/b/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "788214f20214c64631f0859dc79f23c6"
+SRC_URI[sha256sum] = "07410e7fb09aab7bdaf5e618de66c3dac84e2e3d628352814dc4c37de321d6ae"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
1.7.9.5


