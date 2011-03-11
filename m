Received: from edison.awellconnected.net ([83.167.180.132])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas@htc-linux.org>) id 1PxrBP-0005kr-Kx
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 02:30:23 +0100
Received: from ip-80-226-0-1.vodafone-net.de ([80.226.0.1]
	helo=[10.225.79.228])
	by edison.awellconnected.net with esmtp (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1Pxqbk-0004P9-3M
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 00:53:32 +0000
From: Lukas-David Gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Mar 2011 01:53:28 +0100
Message-ID: <1299804808.5437.22.camel@computer>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - edison.awellconnected.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - htc-linux.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH] libevent: recipe for 2.0.10-stable version
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
X-List-Received-Date: Fri, 11 Mar 2011 01:30:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From: Lukas-David Gorris <lukas.gorris@gmail.com>
Date: Fri, 11 Mar 2011 01:47:24 +0100
Subject: [PATCH 3/3] libevent: add recipe for 2.0.10-stable version

---
 recipes/libevent/libevent_2.0.10-stable.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libevent/libevent_2.0.10-stable.bb

diff --git a/recipes/libevent/libevent_2.0.10-stable.bb
b/recipes/libevent/libevent_2.0.10-stable.bb
new file mode 100644
index 0000000..fa656dc
--- /dev/null
+++ b/recipes/libevent/libevent_2.0.10-stable.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "The libevent API provides a mechanism to execute a
callback function \
+when a specific event occurs on a file descriptor or after a timeout
has been reached. \
+Furthermore, libevent also support callbacks due to signals or regular
timeouts."
+HOMEPAGE = "http://www.monkey.org/~provos/libevent/"
+SECTION = "libs"
+AUTHOR = "Niels Provos <provos@citi.umich.edu>"
+LICENSE = "BSD"
+PR = "r0"
+
+SRC_URI = "http://monkey.org/~provos/libevent-${PV}.tar.gz"
+
+inherit autotools
+
+SRC_URI[md5sum] = "a37401d26cbbf28185211d582741a3d4"
+SRC_URI[sha256sum] =
"a4b55810a9e21e9991b86ba5e82dbc9280598cc070544c4ecef4ab91b93dfc55"
+
-- 
1.7.1




