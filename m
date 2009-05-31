Received: from [209.85.219.220] (helo=mail-ew0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1MAkae-0003YI-CA
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 14:56:40 +0200
Received: by ewy20 with SMTP id 20so7341062ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 May 2009 05:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=ZvgcjMA8UY6Sa2GsakMfGyNT0TlNjDeQQVq+vDD37dA=;
	b=A5XmoVrnrN2aZDMgCJXnaLJE/wQZaHqNkc6lRYGkfEnhuLbKvOynApejbJNkaBJ1/a
	7WAXeLDOEfKVY8NmU/YtT7t32UHyQjG24ocOYYyPlMvGgjSLFZqO1jF3h5bVzVj1Z/lo
	k0vDD2YZ64fuRMHNGBQlwjqzX2KTG8JiSJhLo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=sMSS2ptoz4bJt7H6X42wT3hrbTSMI8duav0ImpIMbk4ii+XsH572SRpAYl0pwV3Grg
	FdaNpFrOgxP80z4sAnd5ws0Q3bNT3irAQcyA/0IQmoZL9M7Kdwq86tMqUBojp5joKNRw
	TlA05zb/m5qi66b01RbWZszogZ+/SUxHUtdAw=
Received: by 10.210.61.8 with SMTP id j8mr5023762eba.22.1243774080602;
	Sun, 31 May 2009 05:48:00 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 7sm5788234eyb.5.2009.05.31.05.47.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 31 May 2009 05:47:59 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 May 2009 14:47:57 +0200
Message-Id: <1243774077-19022-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] xserver-common: add 1.24 from .dev
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
X-List-Received-Date: Sun, 31 May 2009 12:56:40 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/xserver-common/files/89xdgautostart.sh |    9 +++++++++
 recipes/xserver-common/xserver-common_1.24.bb  |   19 +++++++++++++++++++
 2 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xserver-common/files/89xdgautostart.sh
 create mode 100644 recipes/xserver-common/xserver-common_1.24.bb

diff --git a/recipes/xserver-common/files/89xdgautostart.sh b/recipes/xserver-common/files/89xdgautostart.sh
new file mode 100644
index 0000000..9886f9f
--- /dev/null
+++ b/recipes/xserver-common/files/89xdgautostart.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+XDGAUTOSTART=/etc/xdg/autostart
+if [ -d $XDGAUTOSTART ] ; then
+    for SCRIPT in $XDGAUTOSTART/*; do
+        CMD=`grep ^Exec= $SCRIPT | cut -d '=' -f 2`
+        $CMD &
+    done
+fi
diff --git a/recipes/xserver-common/xserver-common_1.24.bb b/recipes/xserver-common/xserver-common_1.24.bb
new file mode 100644
index 0000000..1059160
--- /dev/null
+++ b/recipes/xserver-common/xserver-common_1.24.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Common X11 scripts and support files"
+LICENSE = "GPL"
+SECTION = "x11"
+RDEPENDS_${PN} = "xmodmap xrandr xdpyinfo"
+PR = "r3"
+
+PACKAGE_ARCH = "all"
+
+# we are using a gpe-style Makefile
+inherit gpe
+
+SRC_URI_append = " file://setDPI.sh \
+                   file://89xdgautostart.sh \
+"
+
+do_install_append() {
+	install -m 0755 "${WORKDIR}/setDPI.sh" "${D}/etc/X11/Xinit.d/50setdpi"
+	install -m 0755 "${WORKDIR}/89xdgautostart.sh" "${D}/etc/X11/Xsession.d/89xdgautostart"
+}
-- 
1.6.1



