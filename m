Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Tj6Mz-0003A6-Uf
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 11:50:25 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id E562DD22E8;
	Thu, 13 Dec 2012 11:36:06 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 11:35:28 +0100
Message-Id: <1355394929-25182-7-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1355394929-25182-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1355394929-25182-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 6/7] florence: added gnome-doc-utils and libnotify to dependencies
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
X-List-Received-Date: Thu, 13 Dec 2012 10:50:26 -0000

gnome-doc-utils due to this:

| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/hrw/HDD/devel/canonical/aarch64/CLEAN/build/tmp-eglibc/work/aarch64-oe-linux/florence/0.5.1-r1/florence-0.5.1/aclocal-copy/ --automake-acdir=/home/hrw/HDD/devel/canonical/aarch64/CLEAN/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.12 --force
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: not using Libtool
| autoreconf: running: /home/hrw/HDD/devel/canonical/aarch64/CLEAN/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/autoconf --force
| autoreconf: running: /home/hrw/HDD/devel/canonical/aarch64/CLEAN/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/autoheader --force
| autoreconf: running: automake --foreign --add-missing --copy --force-missing
| gnome-doc-utils.make:63: error: HAVE_GNOME_DOC_UTILS does not appear in AM_CONDITIONAL
| docs/Makefile.am:1:   'gnome-doc-utils.make' included from here
| gnome-doc-utils.make:143: error: ENABLE_SK does not appear in AM_CONDITIONAL
| docs/Makefile.am:1:   'gnome-doc-utils.make' included from here
| gnome-doc-utils.make:192: error: ENABLE_SK does not appear in AM_CONDITIONAL
| docs/Makefile.am:1:   'gnome-doc-utils.make' included from here
| src/Makefile.am:6: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
| autoreconf: automake failed with exit status: 1
| ERROR: autoreconf execution failed.

libnotify due to:

| configure:7503: checking for LIBNOTIFY
| configure:7510: $PKG_CONFIG --exists --print-errors "libnotify"
| Package libnotify was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libnotify.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libnotify' found

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-support/florence/florence_0.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/florence/florence_0.5.1.bb b/meta-oe/recipes-support/florence/florence_0.5.1.bb
index dcbcefa..56d8914 100644
--- a/meta-oe/recipes-support/florence/florence_0.5.1.bb
+++ b/meta-oe/recipes-support/florence/florence_0.5.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 PR = "r1"
 
-DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf cairo intltool-native"
+DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf cairo intltool-native gnome-doc-utils libnotify"
 
 SRC_URI = "http://switch.dl.sourceforge.net/project/florence/florence/0.5.1/florence-0.5.1.tar.bz2 \
            file://0001-Fix-glib-includes.patch"
-- 
1.8.0



