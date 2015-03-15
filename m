Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0F215723C3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:33:55 +0000 (UTC)
Received: by wifj2 with SMTP id j2so29392287wif.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=jAryu7Rhba/u3CKGn+apU7pKYu01KdX1v3Z5C4vDlFU=;
	b=W8ezg0SDrDbWvoEgyXHotvD9fXXXp7GgkbFIOwYdZ78uotL7YBVmq4I7U7H4f4YeK0
	r2LhTCoj6w59ovI98nYtbrOOKVyt49dgpm+2eoiSqYwNYfUe6vlCD7GrQrOZhMhcsXva
	SnD58lJgMc9heg7pIWmiR1246e6W7TEqVur0pfRnd0pKSkOr5acDg2ioS4sGGmMXloxm
	/eguqt/vhKgv5AiPZchVzX6eOw4YCv1MvyWMOk9kndfeX71JpUWyXlG91AifbTRy/IBf
	fyZv9S9nzrT27A5ov2Qj7f07Va1kq1D8GPVD9uqonRpeQqNN/wFIckTxvS/EcvkoC2Q5
	LXew==
X-Received: by 10.194.172.9 with SMTP id ay9mr116026214wjc.2.1426462435972;
	Sun, 15 Mar 2015 16:33:55 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.33.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:33:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:11 +0100
Message-Id: <1426462419-10173-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 02/30] xfce4-dev-tools: update to 4.12.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Mar 2015 23:33:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

to be honest: have no idea what the patch was for. Tested complete xfce 4.12
without issues. So remove it.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-dev-tools-4.11.0/xdt-autogen_dependency.patch     | 13 -------------
 ...{xfce4-dev-tools_4.11.0.bb => xfce4-dev-tools_4.12.0.bb} |  9 +++------
 2 files changed, 3 insertions(+), 19 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools-4.11.0/xdt-autogen_dependency.patch
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.11.0.bb => xfce4-dev-tools_4.12.0.bb} (62%)

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools-4.11.0/xdt-autogen_dependency.patch b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools-4.11.0/xdt-autogen_dependency.patch
deleted file mode 100644
index 8e6bd35..0000000
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools-4.11.0/xdt-autogen_dependency.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git a/scripts/Makefile.am b/scripts/Makefile.am
-index f2f0600..8e677dc 100644
---- a/scripts/Makefile.am
-+++ b/scripts/Makefile.am
-@@ -10,7 +10,7 @@ bin_SCRIPTS =								\
-	xdt-autogen							\
-	xdt-commit
-
--xdt-autogen: Makefile $(srcdir)/xdt-autogen.in
-+xdt-autogen: Makefile xdt-autogen.in
-	rm -f xdt-autogen xdt-autogen.gen
-	sed -e 's,\@DATADIR\@,$(datadir),g' \
-		xdt-autogen.in \
diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.12.0.bb
similarity index 62%
rename from meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
rename to meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.12.0.bb
index 5884ef6..5557f6d 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.12.0.bb
@@ -9,12 +9,9 @@ inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native"
 
-SRC_URI = " \
-    http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2 \
-    file://xdt-autogen_dependency.patch \
-"
-SRC_URI[md5sum] = "36112d0256092c30bd1b47105c547edf"
-SRC_URI[sha256sum] = "2dccdd4935716a97db28464ba2403572ce03134fd7adf294e1a59eaf297e6555"
+SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "559202c4d9650e23696c44aa94cfc5a9"
+SRC_URI[sha256sum] = "e2e3a654fe9110df81f8c2483c9cbfa6d656fed15d5e5e717d6ef10bd0f5b5cb"
 
 do_install_append() {
     install -d ${D}${datadir}/aclocal
-- 
1.9.3


