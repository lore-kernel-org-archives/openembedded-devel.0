Return-Path: <sjl@vctlabs.com>
X-Greylist: delayed 404 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 Feb 2016 18:53:38 UTC
Received: from dent.vctlabs.com (dent.vctlabs.com [68.183.110.161])
	by mail.openembedded.org (Postfix) with ESMTP id D34427716F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 18:53:38 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id DC8E8280728; Mon, 22 Feb 2016 10:46:29 -0800 (PST)
Date: Mon, 22 Feb 2016 10:46:29 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160222184629.GM17667@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-python][PATCH] python-tornado-redis: add recipe
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
X-List-Received-Date: Mon, 22 Feb 2016 18:53:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Tornado-Redis is a Redis client for Tornado web server, intended for
asyncronous handling of Redis pub/sub and blocking list commands

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 .../python/python-tornado-redis_2.4.18.bb          | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-tornado-redis_2.4.18.bb

diff --git a/meta-python/recipes-devtools/python/python-tornado-redis_2.4.18.bb b/meta-python/recipes-devtools/python/python-tornado-redis_2.4.18.bb
new file mode 100644
index 0000000..daec25e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-tornado-redis_2.4.18.bb
@@ -0,0 +1,25 @@
+SUMMARY  = "Tornado-Redis is an asyncronous Redis client for the Tornado Web Server"
+DESCRIPTION = "Tornado-Redis is a Redis client that uses Tornado's native 'tornado-gen' interface. \
+It can be used alongside redis-py in Tornado applications: \
+tornado-redis to subscribe to Pub/Sub notifications and for blocking commands (such as BLPOP, BRPOP, BRPOPLPUSH); \
+redis-py for other commands."
+HOMEPAGE = "https://github.com/leporo/tornado-redis"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=ca307e8f37b5fa7f8dbbec033f7db7de"
+
+SRCNAME = "tornado-redis"
+
+SRC_URI = " \
+    https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+SRC_URI[md5sum] = "1c7ec0f645d15400871141c1149e6934"
+SRC_URI[sha256sum] = "8fd3b324158291ad5fb7f5f8dc2e8763b2895556bd2a44f2dd721b703c669046"
+
+inherit setuptools
+
+RDEPENDS_${PN} += "python-tornado"
+
+RDEPENDS_${PN}-test += "${PN} python-tornado"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
-- 
1.9.1


