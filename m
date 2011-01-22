Received: from blath.larsmichelsen.com ([78.46.117.178] helo=larsmichelsen.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lm@larsmichelsen.com>) id 1Pghnq-0000ur-Rf
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 19:03:10 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by larsmichelsen.com (Postfix) with ESMTP id C45139544016
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 19:02:27 +0100 (CET)
Received: from larsmichelsen.com ([127.0.0.1])
	by localhost (blath.larsmichelsen.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 855rwRYENcKE; Sat, 22 Jan 2011 19:02:26 +0100 (CET)
Received: from localhost.localdomain (g229015111.adsl.alicedsl.de
	[92.229.15.111])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: lm)
	by larsmichelsen.com (Postfix) with ESMTPSA id A364F9544005;
	Sat, 22 Jan 2011 19:02:26 +0100 (CET)
From: Lars Michelsen <lm@larsmichelsen.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jan 2011 19:02:26 +0100
Message-Id: <1295719347-18968-1-git-send-email-lm@larsmichelsen.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH v2 1/2] python-caldav: New recipe - CalDAV rfc4791 client
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
X-List-Received-Date: Sat, 22 Jan 2011 18:03:10 -0000

This patch adds a new recipe for the python caldav client library module.

Tested building on Ubuntu 10.10 x86_64 for beagleboard c4. Tested
functionality on beagleboard c4.

Signed-off-by: Lars Michelsen <lm@larsmichelsen.com>
---
 recipes/python/python-caldav_0.1.6.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes/python/python-caldav_0.1.6.bb

diff --git a/recipes/python/python-caldav_0.1.6.bb b/recipes/python/python-caldav_0.1.6.bb
new file mode 100644
index 0000000..ecf8e39
--- /dev/null
+++ b/recipes/python/python-caldav_0.1.6.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "This project is a CalDAV (RFC4791) client library for Python."
+SECTION = "devel/python"
+PRIORITY = "optional"
+LICENSE = "GPL"
+HOMEPAGE = "http://bitbucket.org/cyrilrbt/caldav"
+SRCNAME = "caldav"
+PR = "r0"
+DEPENDS = "python python-lxml python-vobject"
+
+SRC_URI  = "http://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+SRC_URI[md5sum] = "e5eace7a3b6b7f511a1929a539e6a15d"
+SRC_URI[sha256sum] = "4a3b1855000feb8023ab05f8c9e0cfa1648a9abab9ca65ad3e933c22bab61310"
-- 
1.7.1



