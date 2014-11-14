Return-Path: <derek@minotaurinc.com>
Received: from relay.mailchannels.net (tkt-001-i374.relay.mailchannels.net
	[174.136.5.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2868C6A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 16:05:13 +0000 (UTC)
X-Sender-Id: arvixe|x-authuser|derek@minotaurinc.com
Received: from octopus.arvixe.com (ip-10-237-13-110.us-west-2.compute.internal
	[10.237.13.110])
	by relay.mailchannels.net (Postfix) with ESMTPA id 0887C1014CD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 16:05:07 +0000 (UTC)
X-Sender-Id: arvixe|x-authuser|derek@minotaurinc.com
Received: from octopus.arvixe.com (octopus.arvixe.com [10.224.1.53])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA)
	by 0.0.0.0:2500 (trex/5.3.4); Fri, 14 Nov 2014 16:05:11 GMT
X-MC-Relay: Neutral
X-MailChannels-SenderId: arvixe|x-authuser|derek@minotaurinc.com
X-MailChannels-Auth-Id: arvixe
X-MC-Loop-Signature: 1415981110852:3149819639
X-MC-Ingress-Time: 1415981109600
Received: from c-69-143-221-149.hsd1.md.comcast.net ([69.143.221.149]:41330
	helo=lnx-dereks-home.vaddio.com)
	by octopus.arvixe.com with esmtpsa (UNKNOWN:DHE-RSA-AES256-SHA:256)
	(Exim 4.82) (envelope-from <derek@minotaurinc.com>)
	id 1XpJMw-0004iT-4U; Fri, 14 Nov 2014 08:05:06 -0800
From: Derek Straka <derek@minotaurinc.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Nov 2014 11:04:44 -0500
Message-Id: <1415981085-13253-2-git-send-email-derek@minotaurinc.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1415981085-13253-1-git-send-email-derek@minotaurinc.com>
References: <1415981085-13253-1-git-send-email-derek@minotaurinc.com>
X-AuthUser: derek@minotaurinc.com
Cc: Derek Straka <derek@minotaurinc.com>
Subject: [meta-python][PATCH 2/3] python-certifi: add recipe for 14.05.14
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
X-List-Received-Date: Fri, 14 Nov 2014 16:05:24 -0000

Signed-off-by: Derek Straka <derek@minotaurinc.com>
---
 .../python/python-certifi_14.05.14.bb              |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-certifi_14.05.14.bb

diff --git a/meta-python/recipes-devtools/python/python-certifi_14.05.14.bb b/meta-python/recipes-devtools/python/python-certifi_14.05.14.bb
new file mode 100644
index 0000000..5e0404e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-certifi_14.05.14.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Python package for providing Mozilla's CA Bundle."
+DESCRIPTION = "This installable Python package contains a CA Bundle that you can reference in your \
+Python code. This is useful for verifying HTTP requests, for example.  This is the same CA Bundle \
+which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
+HOMEPAGE = "https://pypi.python.org/pypi/certifi"
+SECTION = "devel/python"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
+
+SRCNAME = "certifi"
+
+SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "315ea4e50673a16ab047099f816fd32a"
+SRC_URI[sha256sum] = "1e1bcbacd6357c151ae37cf0290dcc809721d32ce21fd6b7339568f3ddef1b69"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
1.7.9.5


