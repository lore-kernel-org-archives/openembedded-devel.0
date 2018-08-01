Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 26D8378DDA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 08:17:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w718HRca010926
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2018 01:17:27 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 01:17:26 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 1 Aug 2018 16:27:42 +0800
Message-ID: <58a1aae3aa6a92b607605922fbfb6a3e32867409.1533111522.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1533111522.git.hongxu.jia@windriver.com>
References: <cover.1533111522.git.hongxu.jia@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 02/16 V2] usermode: 1.111 -> 1.112
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
X-List-Received-Date: Wed, 01 Aug 2018 08:17:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

- Drop 0001-formatting-issues.patch which upstream fixed the issue

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...h => 0001-Missing-n-in-translated-string.patch} | 44 ++++++++++------------
 .../{usermode_1.111.bb => usermode_1.112.bb}       |  6 +--
 2 files changed, 22 insertions(+), 28 deletions(-)
 rename meta-gnome/recipes-support/usermode/usermode/{0001-formatting-issues.patch => 0001-Missing-n-in-translated-string.patch} (10%)
 rename meta-gnome/recipes-support/usermode/{usermode_1.111.bb => usermode_1.112.bb} (84%)

diff --git a/meta-gnome/recipes-support/usermode/usermode/0001-formatting-issues.patch b/meta-gnome/recipes-support/usermode/usermode/0001-Missing-n-in-translated-string.patch
similarity index 10%
rename from meta-gnome/recipes-support/usermode/usermode/0001-formatting-issues.patch
rename to meta-gnome/recipes-support/usermode/usermode/0001-Missing-n-in-translated-string.patch
index 9d512d4..9db700e 100644
--- a/meta-gnome/recipes-support/usermode/usermode/0001-formatting-issues.patch
+++ b/meta-gnome/recipes-support/usermode/usermode/0001-Missing-n-in-translated-string.patch
@@ -1,34 +1,28 @@
-From 7a316dad0697af2ef4e8079a5af51565a8195aa6 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 24 Jul 2017 01:42:30 -0400
-Subject: [PATCH] userhelper.c: fix formatting issues
+From 7cbc6441cd06e0c0bb51ac37c8f22b0fd51f12f2 Mon Sep 17 00:00:00 2001
+From: Jiri Kucera <jkucera@redhat.com>
+Date: Wed, 11 Apr 2018 17:13:44 +0200
+Subject: [PATCH] Missing \n in translated string
 
-Fixed when compile with "-Wformat -Wformat-security -Werror=format-security":
-|../usermode-1.111/userhelper.c:585:4: error: format not a string
-literal and no format arguments [-Werror=format-security]
-|    text = g_strdup_printf(dgettext(data->domain, data->banner));
-|    ^~~~
-
-Upstream-Status: Pending
+Upstream-Status: Backport
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- userhelper.c | 2 +-
+ po/tr.po | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/userhelper.c b/userhelper.c
-index 76ad492..ee0da49 100644
---- a/userhelper.c
-+++ b/userhelper.c
-@@ -582,7 +582,7 @@ converse_console(int num_msg, const struct pam_message **msg,
+diff --git a/po/tr.po b/po/tr.po
+index 84e5021..a28e947 100644
+--- a/po/tr.po
++++ b/po/tr.po
+@@ -408,7 +408,7 @@ msgstr "Grafik pencere açılamadı ve uçbirim denetimi bulunamadı.\n"
+ #: ../../po/../userpasswd.c:37
+ #, c-format
+ msgid "Unexpected command-line arguments\n"
+-msgstr "Beklenmeyen komut satırı argümanları"
++msgstr "Beklenmeyen komut satırı argümanları\n"
  
- 	if (banner == 0) {
- 		if ((data->banner != NULL) && (data->domain != NULL)) {
--			text = g_strdup_printf(dgettext(data->domain, data->banner));
-+			text = g_strdup_printf("%s", dgettext(data->domain, data->banner));
- 		} else {
- 			if ((service != NULL) && (strlen(service) > 0)) {
- 				if (data->fallback_allowed) {
+ #: ../../po/../userinfo.c:411
+ #, c-format
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta-gnome/recipes-support/usermode/usermode_1.111.bb b/meta-gnome/recipes-support/usermode/usermode_1.112.bb
similarity index 84%
rename from meta-gnome/recipes-support/usermode/usermode_1.111.bb
rename to meta-gnome/recipes-support/usermode/usermode_1.112.bb
index 3aea2e6..51f81a1 100644
--- a/meta-gnome/recipes-support/usermode/usermode_1.111.bb
+++ b/meta-gnome/recipes-support/usermode/usermode_1.112.bb
@@ -14,12 +14,12 @@ DEPENDS = "libuser ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '',
 "
 
 SRC_URI = "https://releases.pagure.org/${BPN}/${BPN}-${PV}.tar.xz \
-           file://0001-formatting-issues.patch \
            file://0001-fix-compile-failure-against-musl-C-library.patch \
            file://0001-Makefile.am-Link-with-libm-for-powl-API.patch \
+           file://0001-Missing-n-in-translated-string.patch \
            "
-SRC_URI[md5sum] = "28ba510fbd8da9f4e86e57d6c31cff29"
-SRC_URI[sha256sum] = "3dd0b9639b5bd396b7ea5fada6aaa694dbfdaa3ad06eb95a6eabcdfd02f875c6"
+SRC_URI[md5sum] = "a766a9f7600f573fb6de4655d4162196"
+SRC_URI[sha256sum] = "37c4d667209da14082c08df6e48fe955d1532efebd5322f13f94683c6cc10370"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-- 
2.7.4


