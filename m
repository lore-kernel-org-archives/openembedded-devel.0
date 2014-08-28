Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa12-08.prod.phx3.secureserver.net
	(p3plsmtpa12-08.prod.phx3.secureserver.net [68.178.252.237])
	by mail.openembedded.org (Postfix) with ESMTP id 9636E71081
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 12:13:42 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa12-08.prod.phx3.secureserver.net with 
	id kC6Q1o0081mTNtu01C6UDk; Thu, 28 Aug 2014 05:06:28 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Aug 2014 07:06:17 -0500
Message-Id: <1409227581-20888-2-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1409227581-20888-1-git-send-email-pab@pabigot.com>
References: <1409227581-20888-1-git-send-email-pab@pabigot.com>
Subject: [meta-oe][PATCH 1/5] ntp: re-enable server debugging and control by PACKAGECONFIG
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
X-List-Received-Date: Thu, 28 Aug 2014 12:13:44 -0000

The description in a previous patch to disable debugging is incorrect.
Although the option is default-enabled in configure.ac, configure does
respect the option that disables it.

In ntp 4.2.7 the option code is refactored to ntp_debug.m4 and has an
effect in sntp as well.  Adding --disable-debugging to the top-level
configure options overrides the default for both 4.2.6 and 4.2.7 without
patching the distribution.

Make the selection explicit and configurable, but restore the historical
default.  Absence of debugging capability in the server makes it
difficult to validate complex configurations.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 .../ntp/files/ntp-disable-debugging.patch          | 23 ----------------------
 meta-networking/recipes-support/ntp/ntp.inc        |  5 +++--
 2 files changed, 3 insertions(+), 25 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ntp/files/ntp-disable-debugging.patch

diff --git a/meta-networking/recipes-support/ntp/files/ntp-disable-debugging.patch b/meta-networking/recipes-support/ntp/files/ntp-disable-debugging.patch
deleted file mode 100644
index 242276e..0000000
--- a/meta-networking/recipes-support/ntp/files/ntp-disable-debugging.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-set ntp_ok to no if ntp debugging is not enabled.
-
-Upstream-status: Pending
-
-There is a problem in configure.ac file that whether or not
-'--enable-debugging' is specified in configure cmdline, debugging
-is always enabled.
-We should disable ntp debugging by default.
-
-Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
-
----
---- a/configure.ac
-+++ b/configure.ac
-@@ -2458,7 +2458,7 @@
-         [+ include ntpd debugging code]
-     )],
-     [ntp_ok=$enableval],
--    [ntp_ok=yes]
-+    [ntp_ok=no]
- )
- case "$ntp_ok" in
-  yes)
diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index b63f202..55926e0 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -23,7 +23,6 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://sntp.service \
            file://sntp \
            file://ntpd.list \
-           file://ntp-disable-debugging.patch \
            file://CVE-2013-5211.patch \
 "
 
@@ -38,7 +37,8 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --home-dir /var/lib/ntp \
                        --shell /bin/false --user-group ntp"
 
-PACKAGECONFIG ??= "cap"
+# NB: debug is default-enabled by NTP; keep it default-enabled here.
+PACKAGECONFIG ??= "cap debug"
 PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
                           --with-openssl-incdir=${STAGING_INCDIR} \
                           --with-crypto, \
@@ -46,6 +46,7 @@ PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
                           openssl"
 PACKAGECONFIG[cap] = "--enable-linuxcaps,--disable-linuxcaps,libcap"
 PACKAGECONFIG[readline] = "--with-lineeditlibs,--without-lineeditlibs,readline"
+PACKAGECONFIG[debug] = "--enable-debugging,--disable-debugging"
 
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d
-- 
1.8.5.5


