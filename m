Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2F47F2F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:17:29 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 377641038D4;
	Thu, 22 Aug 2019 17:17:30 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 19:17:21 +0200
Message-Id: <20190822171723.18657-16-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822171723.18657-1-tworaz@tworaz.net>
References: <20190822171723.18657-1-tworaz@tworaz.net>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 15/17] evolution-data-server: Use SRC_URI provided by gnomebase.
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
X-List-Received-Date: Thu, 22 Aug 2019 17:17:29 -0000
Content-Transfer-Encoding: 8bit

Its a GNOME pacakge and SRC_URI provided by gnomebase bbclass is good
enough. No need to duplicate it.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 .../eds/evolution-data-server_3.32.4.bb         | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
index 8d6c3aded..170a69838 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
@@ -16,15 +16,14 @@ DEPENDS = " \
 
 inherit gnomebase cmake gtk-doc gettext gobject-introspection perlnative pythonnative upstream-version-is-even vala
 
-SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
-           file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
-           file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
-           file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
-           file://0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch \
-           file://0005-Use-LC_MESSAGES-for-address-localization-when-LC_ADD.patch \
-           file://0006-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch \
-           file://0007-Modify-gobject-intrispection-support-to-work-with-OE.patch \
-           file://iconv-detect.h \
+SRC_URI += "file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
+            file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
+            file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
+            file://0004-Add-native-suffix-to-exacutables-produced-and-run-du.patch \
+            file://0005-Use-LC_MESSAGES-for-address-localization-when-LC_ADD.patch \
+            file://0006-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch \
+            file://0007-Modify-gobject-intrispection-support-to-work-with-OE.patch \
+            file://iconv-detect.h \
            "
 SRC_URI[archive.md5sum] = "57820f3f88fc554e1a58665a52e12c05"
 SRC_URI[archive.sha256sum] = "83f67cb4b680e892b22b51bcde64c788b7ac63e92a99de401fb347e3794f4c7f"
-- 
2.21.0


