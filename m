Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id A23B160097
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Oct 2014 15:16:01 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id n3so4459290wiv.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Oct 2014 08:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oHQ8zRLKgeVShY59qoCMi1lSZ38fb5F9LK9tZw9Lt7U=;
	b=VP3ttYDXSokG2iQiYJiPixdcDJLP7vASAb+hopODhHlYMNjbe+N5Xb9FAij2jHFEcj
	BkiX5WhvBABK1RSUGrynoQ0CrIoh5i3njKXzyOk1JYYJI4fQ3eMT6jdjuFf81/lTOT4R
	IX3e8xU61CW1W1Qf0cmi246oV9iHLThJL2t8YEHNXc1TkQ2s1ge0zNOfITgB/PvU1ePt
	WCFF2hfLCHG1zJAG6KxgpVx71kEzJ4/v+vQfM2TAjkZ/lMmfQ6iokAoe0mHk5chuWYa9
	kEWafCuIkg3WcCDIX+yZluo8quXIyspcSbdae8Hmewa8wRW8zFr4JGUg8YFwaF/7Te/w
	gMMg==
X-Gm-Message-State: ALoCoQn0TJ390SgUXdJy/KjfaHNtJQfXb19EJQLjA9Cgrrl0Crl+15SEzhJtdZa/7Wi6ikG99iL7
X-Received: by 10.180.104.99 with SMTP id gd3mr15587367wib.10.1414336560857;
	Sun, 26 Oct 2014 08:16:00 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	da3sm12323048wjb.12.2014.10.26.08.15.59 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 26 Oct 2014 08:15:59 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Oct 2014 16:15:52 +0100
Message-Id: <1414336552-15191-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] ddrescue: update to 1.19
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
X-List-Received-Date: Sun, 26 Oct 2014 15:16:03 -0000

* License changed to GPLv2+
* Although 'configure is present, it isn't autotools.

Nota bene: this requires bitbake and oe-core support for tar.lz

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb | 18 ----------
 meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb | 42 ++++++++++++++++++++++
 2 files changed, 42 insertions(+), 18 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
 create mode 100644 meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb

diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb b/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
deleted file mode 100644
index a36c250..0000000
--- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Data recovery tool"
-DESCRIPTION = "GNU ddrescue is a data recovery tool. It copies data \
-    from one file or block device (hard disc, cdrom, etc) to another, \
-    trying hard to rescue data in case of read errors."
-HOMEPAGE = "http://www.gnu.org/software/ddrescue/ddrescue.html"
-SECTION = "console"
-LICENSE = "GPLv3+"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
-                    file://main_common.cc;beginline=5;endline=16;md5=b5a59150a33658cc1ffc31b1a4ffb9f2"
-
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
-SRC_URI[md5sum] = "57b67407e882c6418531d48a2f20d16b"
-SRC_URI[sha256sum] = "76b3f2e5fb0306d24f2632c3e168cccb73dc0a348e3a7089cd9230748ff23de6"
-
-inherit autotools
-
-EXTRA_OECONF = "'CXX=${CXX}' 'CPPFLAGS=${CPPFLAGS}' 'CXXFLAGS=${CXXFLAGS}' 'LDFLAGS=${LDFLAGS}'"
diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb b/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb
new file mode 100644
index 0000000..a605249
--- /dev/null
+++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb
@@ -0,0 +1,42 @@
+SUMMARY = "Data recovery tool"
+DESCRIPTION = "GNU ddrescue is a data recovery tool. It copies data \
+    from one file or block device (hard disc, cdrom, etc) to another, \
+    trying hard to rescue data in case of read errors."
+HOMEPAGE = "http://www.gnu.org/software/ddrescue/ddrescue.html"
+SECTION = "console"
+LICENSE = "GPLv2+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
+                    file://main_common.cc;beginline=5;endline=16;md5=3ec288b2676528cd2b069364e313016f"
+
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.lz"
+SRC_URI[md5sum] = "ed6b5b82d74cbd925db2b829350e74b1"
+SRC_URI[sha256sum] = "ed8d0c9d9aac80a9110e9cb0d0a91a7390d3bf9f816b67a62ca4eb140f4747b8"
+
+CONFIGUREOPTS = "\
+    '--srcdir=${S}' \
+    '--prefix=${prefix}' \
+    '--exec-prefix=${exec_prefix}' \
+    '--bindir=${bindir}' \
+    '--datadir=${datadir}' \
+    '--infodir=${infodir}' \
+    '--sysconfdir=${sysconfdir}' \
+    'CXX=${CXX}' \
+    'CPPFLAGS=${CPPFLAGS}' \
+    'CXXFLAGS=${CXXFLAGS}' \
+    'LDFLAGS=${LDFLAGS}' \
+"
+EXTRA_OEMAKE = ""
+
+do_configure () {
+    ${S}/configure ${CONFIGUREOPTS}
+}
+
+do_install () {
+    oe_runmake 'DESTDIR=${D}' install
+    # Info dir listing isn't interesting at this point so remove it if it exists.
+    if [ -e "${D}${infodir}/dir" ]; then
+        rm -f ${D}${infodir}/dir
+    fi
+}
+
-- 
1.9.0


