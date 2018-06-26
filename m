Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D917E746F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 05:58:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5Q5wCDk013528
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 22:58:27 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 22:58:01 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:00:46 +0800
Message-ID: <1529992863-24711-3-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 03/20] python-dbus: upgrade 1.2.6 -> 1.2.8
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
X-List-Received-Date: Tue, 26 Jun 2018 05:58:37 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

1. Remove obsolete PACKAGECONFIG.
2. Explicitly disable building documenation.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../python/{python-dbus_1.2.6.bb => python-dbus_1.2.8.bb}      | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dbus_1.2.6.bb => python-dbus_1.2.8.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python-dbus_1.2.6.bb b/meta-python/recipes-devtools/python/python-dbus_1.2.8.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python-dbus_1.2.6.bb
rename to meta-python/recipes-devtools/python/python-dbus_1.2.8.bb
index 0f18ccc88..b3f724054 100644
--- a/meta-python/recipes-devtools/python/python-dbus_1.2.6.bb
+++ b/meta-python/recipes-devtools/python/python-dbus_1.2.8.bb
@@ -9,15 +9,15 @@ DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "1ce1ddf2582060f8f971652ea54cc17e"
-SRC_URI[sha256sum] = "32f29c17172cdb9cb61c68b1f1a71dfe7351506fc830869029c47449bd04faeb"
+SRC_URI[md5sum] = "7379db774c10904f27e7e2743d90fb43"
+SRC_URI[sha256sum] = "abf12bbb765e300bf8e2a1b2f32f85949eab06998dbda127952c31cb63957b6f"
 S = "${WORKDIR}/dbus-python-${PV}"
 
 inherit distutils-base autotools pkgconfig
 
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[docs] = "--enable-html-docs,--disable-html-docs,python3-docutils-native"
-PACKAGECONFIG[api-docs] = "--enable-api-docs,--disable-api-docs,python3-docutils-native python3-epydoc-native"
+# documentation needs python-sphinx, which is not in oe-core or meta-python for now
+# change to use PACKAGECONFIG when python-sphinx is added to oe-core or meta-python
+EXTRA_OECONF += "--disable-documentation"
 
 export STAGING_LIBDIR
 export STAGING_INCDIR
-- 
2.11.0


