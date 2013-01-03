Received: from mail-la0-f53.google.com ([209.85.215.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqqAR-0006We-CZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jan 2013 20:09:49 +0100
Received: by mail-la0-f53.google.com with SMTP id fn20so8300594lab.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 10:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=eJNSdRQvoYC14ldvgc47zJEK9lPwm04H+VcLu35UNEc=;
	b=yubDu4PXA6qZMbAa0Qf244dmr1WgnHGYE3YtN2ol+R1vD4PPm5ovawXiq5UmnqUyd4
	Hte5oqfeIPvvNyeivbwiCwyXYF+Tw44FcuI/emRqiND+k+GMkVRvGuzZgW5f5NE3RrZc
	gQhxj/f4rj6rSsvC5lurs/YLAVCgi9SeL2NuwfzFFA550k0kNu55fV8yxbXzO8NH7Rnn
	dmnJ37XfTIEOugyXUSNFC/M9AXIqT/w4qeJV806P1J1CD475HZJuiVOHuMcrypreZ7f+
	BsbstVRqv6AElkj2AFgZ+c5VZM1cVqSJnaypx11lMBpxoGSFIi224/J2PTrjU++HKqfI
	bpJQ==
X-Received: by 10.112.27.33 with SMTP id q1mr20805928lbg.78.1357239263405;
	Thu, 03 Jan 2013 10:54:23 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ns7sm17324400lab.5.2013.01.03.10.54.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 10:54:22 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Tqpvo-0005Z1-0H; Thu, 03 Jan 2013 20:54:20 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2013 20:54:15 +0200
Message-Id: <1357239255-20959-4-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357239255-20959-3-git-send-email-cazfi74@gmail.com>
References: <1357239255-20959-1-git-send-email-cazfi74@gmail.com>
	<1357239255-20959-2-git-send-email-cazfi74@gmail.com>
	<1357239255-20959-3-git-send-email-cazfi74@gmail.com>
Subject: [meta-oe][PATCH 3/3] libmad: replace obsolete automake macros with working ones
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
X-List-Received-Date: Thu, 03 Jan 2013 19:09:51 -0000

Add obsolete-automake-macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libmad/libmad-0.15.1b/obsolete_automake_macros.patch |   14 ++++++++++++++
 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb      |    6 +++++-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad-0.15.1b/obsolete_automake_macros.patch

diff --git a/meta-oe/recipes-multimedia/libmad/libmad-0.15.1b/obsolete_automake_macros.patch b/meta-oe/recipes-multimedia/libmad/libmad-0.15.1b/obsolete_automake_macros.patch
new file mode 100644
index 0000000..b0f5f77
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libmad/libmad-0.15.1b/obsolete_automake_macros.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Submitted (https://sourceforge.net/tracker/?group_id=12349&atid=112349)
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd libmad-0.15.1b/configure.ac libmad-0.15.1b/configure.ac
+--- libmad-0.15.1b/configure.ac	2004-01-23 11:41:32.000000000 +0200
++++ libmad-0.15.1b/configure.ac	2013-01-03 08:28:23.718693697 +0200
+@@ -28,7 +28,7 @@
+
+ AM_INIT_AUTOMAKE
+
+-AM_CONFIG_HEADER([config.h])
++AC_CONFIG_HEADERS([config.h])
+
+ dnl System type.
diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index e4a3df7..b5ff698 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -6,10 +6,14 @@ DEPENDS = "libid3tag"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
+PR = "r1"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libmad-${PV}.tar.gz \
            file://add-pkgconfig.patch \
            file://mad.diff \
-           file://mad-mips-h-constraint.patch"
+           file://mad-mips-h-constraint.patch \
+           file://obsolete_automake_macros.patch \
+"
 
 SRC_URI_append_avr32 = " file://libmad-0.15.1b-avr32-optimization.patch"
 
-- 
1.7.10.4



