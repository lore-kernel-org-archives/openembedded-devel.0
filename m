Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIht-0005n8-Tt
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:13:10 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1964783eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ubuukwGZkmAzvjVcxbZ4N1I9UDDTLUkqJI6mSz6XUZE=;
	b=SMxkzgRxzWj3DETeBlCFlerwPwSnUygsjgnQpegVzdV9TvdkVPt0vrc3oA9C7PkoA5
	b2LIvVcCfjwRYgtNYhPs1wicp9TusnQbY9taEAbwknxyh4qRfl3vcIzd3mDx9LvzKxYZ
	hF9/m1OSsQUN4X6p07oxPyoy96ksliyenIxtEtdAIXQ5in6E/sLn4ISubiRAtoHkuH2I
	NG1eB5k4UgYj9u3ysJ0NDJQfZiZ3Q3lbpH5LsmSghKNQFqNXUSfr8kl2RjuBZ8tVGp/f
	AkFLxDRK/yhdsfGDsxbT/9UMIVCi7q7LolVKMt1MUK9MJz1+h9czaCScTqcwEBFYiWwG
	VjCg==
Received: by 10.14.173.65 with SMTP id u41mr33814398eel.13.1355680698928;
	Sun, 16 Dec 2012 09:58:18 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 46sm23874582eeg.4.2012.12.16.09.58.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:57:49 +0100
Message-Id: <ed33ff73c33196900c8aa6f469c87948c038512e.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/26] florence: added gnome-doc-utils and libnotify to dependencies
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
X-List-Received-Date: Sun, 16 Dec 2012 18:13:11 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

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
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
1.8.0.2



