Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UV1p4-0007W6-KA
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Apr 2013 17:41:35 +0200
Received: by mail-ea0-f171.google.com with SMTP id b15so823420eae.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2013 08:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=+DVCJ2oKTgbQaDEeTXGwgjoDhAwU8Br2751asPlgwNg=;
	b=TWBv0Mp0AhggL0cP7L2L6R9Yyqui/KVbWQYjdiBH53LfGtKWrt+fFIjooqt/+YYLOC
	b5j5iR9QO9oaIvSJV1lqEHb/N2ZxTpJw3q0N649uQyWa2JlsqGBRelaLFY+eRinF1a54
	2+8U3CU0QNro27aGnokdTjvReBLc8KyEt6SK6Ypc2zH3ua9ofd8kGYWOddE9HSAbNR0/
	E0il/37K5FJVrxMsx/qOQ2ApMRXsmIwgl58NSPpg8oLhUY7bvi7+NavczHkU9dwwK2U5
	p4c0M92ku95KUSOEF0PRn/Ddg0FE00lUr1jq9bKhajUXgqRLfjaLfu8GS46ZPiX1DKNY
	yLoA==
X-Received: by 10.15.99.201 with SMTP id bl49mr63970622eeb.43.1366817025370;
	Wed, 24 Apr 2013 08:23:45 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id v48sm4895808eeg.7.2013.04.24.08.23.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 24 Apr 2013 08:23:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Apr 2013 17:21:24 +0200
Message-Id: <1366816884-32023-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] lxdm: fix postinst-code
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
X-List-Received-Date: Wed, 24 Apr 2013 15:41:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Exiting postinst code leaves systemd.bbclass offline postinst code unexecuted,
causes postinst not to finish at first boot (lxdm.service is not aliased to
display-manager.service -> started much too early) and is not neccesary:
language preparation can be done offline.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb |   21 +++++++++------------
 1 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index a24f75c..6675691 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -15,7 +15,7 @@ LXDM_PAM = "${@base_contains("DISTRO_TYPE", "debug", "lxdm-pam-debug", "lxdm-pam
 SRCREV = "65e7cc8fdc150c2b925eb348ce82de17dee5eb0b"
 PV = "0.4.2+git${SRCPV}"
 PE = "1"
-PR = "r6"
+PR = "r7"
 
 DEPENDS = "cairo consolekit dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango"
 
@@ -49,19 +49,16 @@ do_install_append() {
 
 # make installed languages choosable
 pkg_postinst_${PN} () {
-if [ "x$D" != "x" ]; then
-    exit 1
-fi
 langs=""
-for lang in `find ${libdir}/locale -maxdepth 1 | grep _ | sort`; do
-    lang=`basename $lang`
-    if [ "x$langs" = "x" ]; then
-        langs="$lang"
-    else
-        langs="$langs $lang"
-    fi
+for lang in `find $D${libdir}/locale -maxdepth 1 | grep _ | sort`; do
+lang=`basename $lang`
+if [ "x$langs" = "x" ]; then
+    langs="$lang"
+else
+   langs="$langs $lang"
+fi
 done
-sed -i "s:last_langs=.*$:last_langs=$langs:g" ${localstatedir}/lib/lxdm/lxdm.conf
+sed -i "s:last_langs=.*$:last_langs=$langs:g" $D${localstatedir}/lib/lxdm/lxdm.conf
 }
 
 RDEPENDS_${PN} = "pam-plugin-loginuid setxkbmap"
-- 
1.7.6.5



