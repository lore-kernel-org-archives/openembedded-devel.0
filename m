Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1TupIz-0007ds-Bv
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 20:02:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0EIlPK9012805
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2013 10:47:25 -0800 (PST)
Received: from localhost.localdomain (128.224.171.81) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 14 Jan 2013 10:47:25 -0800
From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Jan 2013 20:47:02 +0200
Message-ID: <1358189222-16342-1-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.171.81]
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [meta-oe][meta-gnome][PATCH] obexd: Update to v0.48 and remove openobex dependency
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
X-List-Received-Date: Mon, 14 Jan 2013 19:02:50 -0000
Content-Type: text/plain

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 .../obex/{obexd_0.44.bb => obexd_0.48.bb}          |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-connectivity/obex/{obexd_0.44.bb => obexd_0.48.bb} (74%)

diff --git a/meta-gnome/recipes-connectivity/obex/obexd_0.44.bb b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
similarity index 74%
rename from meta-gnome/recipes-connectivity/obex/obexd_0.44.bb
rename to meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
index 384ce05..b97d236 100644
--- a/meta-gnome/recipes-connectivity/obex/obexd_0.44.bb
+++ b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
@@ -1,16 +1,16 @@
 DESCRIPTION = "OBEX Server and Client"
-DEPENDS = "openobex glib-2.0 dbus bluez4 libical"
+DEPENDS = "glib-2.0 dbus bluez4 libical"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "files://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz \
            file://ssize_t_definition.patch \
           "
-SRC_URI[md5sum] = "3fb9cb9d7ab119753253ff784235a364"
-SRC_URI[sha256sum] = "104fc50eb8bf41d690d31588c3a4829a75dc7738b1c76cf260171d8f525da758"
+SRC_URI[md5sum] = "d03cf9bad2983243837f4f6d76ef14a6"
+SRC_URI[sha256sum] = "eaa9d8d9542700e6750918d72a3ce00f8cf3a2771d3e2516efd1be5a05f78582"
 
 inherit autotools
 
-- 
1.7.5.4



