Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsK-0000aa-LP
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:46:47 +0100
Received: by ewy24 with SMTP id 24so4866281ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=lokDIQU0lvzwfz7YxhaegZUCUIwkNBURgvO6XHh7iw4=;
	b=j87RfHkFD9g9DYXJHSTSOohC1wVK2/1aydL447mHVML+PQkrxZYm7YXQHzJHgyPrUV
	F8D0AaPL9R5QXIFX0P06FN7ESJNv6al67FN79yrRffDx2hR5+GTYdae5rdI8MNpen7Yo
	0bBoZrx9FnLxCj+UN4AeRDIWP4W55URju80lw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=CfoPpUFJFo5vaZ+d+HbMeMK3Wv8YSUKP75Qbp1NNK3AjG173og5CfPNUl+H79EZwgt
	yjGU2jTSKRWHdstv0rJk5Jzz8ma6VIaDkovaurbmGKXneamUzICRPoYcMPUjOxe43Bar
	Urdw7rKiiCY0TIu9Pr0kjdPc5Hz6ReYwxQfjQ=
Received: by 10.213.21.10 with SMTP id h10mr6204453ebb.17.1260139505903;
	Sun, 06 Dec 2009 14:45:05 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:05 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:41 +0100
Message-Id: <1260139496-21442-6-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-5-git-send-email-leon@sidebranch.com>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] binutils{,-cross}_nios2-2.15.bb: binutils for nios2.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:46:48 -0000

This is from a non-upstream GIT'd fork of binutils, community
maintained, as nios2 was never brought upstream into binutils.

Tested-by: Walter Goossens <walter.goossens@axon.tv>
Tested-by: Leon Woestenberg <leon@sidebranch.com>
Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 recipes/binutils/binutils-cross_nios2-2.15.bb |    8 +++++++
 recipes/binutils/binutils_nios2-2.15.bb       |   26 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 recipes/binutils/binutils-cross_nios2-2.15.bb
 create mode 100644 recipes/binutils/binutils_nios2-2.15.bb

diff --git a/recipes/binutils/binutils-cross_nios2-2.15.bb b/recipes/binutils/binutils-cross_nios2-2.15.bb
new file mode 100644
index 0000000..047f16a
--- /dev/null
+++ b/recipes/binutils/binutils-cross_nios2-2.15.bb
@@ -0,0 +1,8 @@
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-${PV}"
+require binutils_${PV}.bb
+require binutils-cross.inc
+
+# nios2-linux-uclibc-ar suffers from errors against FORTIFY_SOURCE checks on
+# GCC 4.3+ with _FORTIFY_SOURCE enabled. Either fix the bugs, take an older
+# host toolchain, or disable the checks. We disable the checks:
+CFLAGS += "-U_FORTIFY_SOURCE"
diff --git a/recipes/binutils/binutils_nios2-2.15.bb b/recipes/binutils/binutils_nios2-2.15.bb
new file mode 100644
index 0000000..f6e1a85
--- /dev/null
+++ b/recipes/binutils/binutils_nios2-2.15.bb
@@ -0,0 +1,26 @@
+INC_PR = "r2"
+PR = "${INC_PR}.1"
+
+require binutils.inc
+LICENSE = "GPLv3"
+
+# prepend this path for files in SRC_URI
+FILESPATHPKG =. "binutils-2.15.94.0.1:"
+
+SRCREV = "49396897843c932623b775168c5e6e1f2a43c3c8"
+
+SRC_URI = "git://sopc.et.ntust.edu.tw/git/binutils.git;protocol=http"
+
+SRC_URI += "\
+     file://ld_makefile.patch;patch=1 \
+     file://better_file_error.patch;patch=1 \
+     file://signed_char_fix.patch;patch=1 \
+     file://objdump_fix.patch;patch=1 \
+     file://binutils-100_cflags_for_build.patch;patch=1 \
+     file://binutils-2.15-allow-gcc-4.0.patch;patch=1"
+
+#     file://binutils-2.15.91.0.1-uclibc-100-conf.patch;patch=1 \
+#     file://binutils-2.15.90.0.3-uclibc-200-build_modules.patch;patch=1 \
+
+S = "${WORKDIR}/git"
+
-- 
1.6.0.4



