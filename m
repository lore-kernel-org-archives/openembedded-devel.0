Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UUZ6D-0004CY-F7
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Apr 2013 11:01:19 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 61F3DD20DD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2013 10:43:02 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Apr 2013 10:43:35 +0200
Message-Id: <1366706615-6980-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <20130218225241.GJ3300@jama>
References: <20130218225241.GJ3300@jama>
Subject: [meta-oe][PATCH v2] memcached: add 1.4.15
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
X-List-Received-Date: Tue, 23 Apr 2013 09:01:19 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../recipes-support/memcached/memcached_1.4.15.bb         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-networking/recipes-support/memcached/memcached_1.4.15.bb

diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.15.bb b/meta-networking/recipes-support/memcached/memcached_1.4.15.bb
new file mode 100644
index 0000000..016eaeb
--- /dev/null
+++ b/meta-networking/recipes-support/memcached/memcached_1.4.15.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Free & open source, high-performance, distributed memory object \
+caching system, generic in nature, but intended for use in speeding up dynamic \
+web applications by alleviating database load."
+HOMEPAGE = "http://memcached.org/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7e5ded7363d335e1bb18013ca08046ff"
+
+SRC_URI = "http://memcached.googlecode.com/files/memcached-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "36ea966f5a29655be1746bf4949f7f69"
+SRC_URI[sha256sum] = "169721ab7a7531add6ae9f6b14b6b5641725fe0b1f0bdf5c3a4327725901e2b4"
+
+DEPENDS = "libevent"
+
+inherit autotools
-- 
1.8.1.2



