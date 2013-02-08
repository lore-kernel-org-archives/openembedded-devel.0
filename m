Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3qCf-0000ra-6U
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 16:49:30 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2013 07:33:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,630,1355126400"; d="scan'208";a="284541552"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2013 07:33:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2013 15:33:10 +0000
Message-Id: <1a3fbde04f652b3f1745c09b8f8c653bb03bad7e.1360337212.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360337212.git.paul.eggleton@linux.intel.com>
References: <cover.1360337212.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1360337212.git.paul.eggleton@linux.intel.com>
References: <cover.1360337212.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 3/6] python-gevent: add new recipe for version 0.13.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2013 15:49:30 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-devtools/python/python-gevent_0.13.8.bb |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-gevent_0.13.8.bb

diff --git a/meta-oe/recipes-devtools/python/python-gevent_0.13.8.bb b/meta-oe/recipes-devtools/python/python-gevent_0.13.8.bb
new file mode 100644
index 0000000..3fd3e7c
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-gevent_0.13.8.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A coroutine-based Python networking library"
+DESCRIPTION = "gevent is a coroutine-based Python networking library that uses greenlet to provide \
+a high-level synchronous API on top of the libevent event loop."
+HOMEPAGE = "http://www.gevent.org"
+SECTION = "devel/python"
+LICENSE = "MIT & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2dbb33d00e1fd31c7041460a81ac0bd2 \
+                    file://LICENSE.pyevent;md5=718070c63de243053e2c616268b00fdd"
+DEPENDS += "python-greenlet libevent"
+RDEPENDS_${PN} += "python-greenlet python-mime python-pprint python-re"
+
+SRC_URI = "http://pypi.python.org/packages/source/g/gevent/gevent-${PV}.tar.gz"
+SRC_URI[md5sum] = "ca9dcaa7880762d8ebbc266b11252960"
+SRC_URI[sha256sum] = "54b8d26300ce408c0916a3e63ef6cd3e6aca76230833558deb7de15196ed955e"
+
+S = "${WORKDIR}/gevent-${PV}"
+
+inherit setuptools
+
-- 
1.7.10.4



