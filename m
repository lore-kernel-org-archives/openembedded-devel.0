Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7C56AC43
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:33:57 +0000 (UTC)
Received: by webcq43 with SMTP id cq43so26859357web.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=KTwjRw1hvJPBl9pyWvRV8CegV255H68GsrAg1JH7Qug=;
	b=ihPp6BsvHZdfYFIguq/1dIRdHHKCkyCxAaVuzF2ueYG7HDU5992qZM3EeH7ao1h7Ny
	W9+tum16lT01wMx3Ky5sLxsEsCiPFNe/EC9Ktjh+3PBKqcm2av33YZsnoVWTNXpnJuDV
	cgm5iWNMw8TB3xGRB5tYUHQNlMPKZKB/bbqdbz7agMFdrKF6FYC1b/Zbu1Is8wQDHA/6
	ivSI/E7hacsuHgDcJIUjb+yTIXGIXIz92Y6Vxc+ERXC/S3yXSp3vBDEGnEXsc5Fw51xy
	YwjAjv/0+Z1hMbaTpkerRnRr+jQvhtpmwDNIvv9fLCajS016yQiugXt4oHaDn47QDL3D
	WoAA==
X-Received: by 10.180.101.225 with SMTP id fj1mr116485954wib.56.1426462438824; 
	Sun, 15 Mar 2015 16:33:58 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.33.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:33:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:13 +0100
Message-Id: <1426462419-10173-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 04/30] xfconf: update to 4.12.0
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
X-List-Received-Date: Sun, 15 Mar 2015 23:33:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

removed patch applied long time ago

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfconf/files/0001-Simplify-checks.patch        | 112 ---------------------
 .../xfconf/{xfconf_4.10.0.bb => xfconf_4.12.0.bb}  |   5 +-
 2 files changed, 2 insertions(+), 115 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfconf/files/0001-Simplify-checks.patch
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.10.0.bb => xfconf_4.12.0.bb} (70%)

diff --git a/meta-xfce/recipes-xfce/xfconf/files/0001-Simplify-checks.patch b/meta-xfce/recipes-xfce/xfconf/files/0001-Simplify-checks.patch
deleted file mode 100644
index ef68f7a..0000000
--- a/meta-xfce/recipes-xfce/xfconf/files/0001-Simplify-checks.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 233f7d3a9b0f98b794548433cead77633aab5f7d Mon Sep 17 00:00:00 2001
-From: Nick Schermer <nick@xfce.org>
-Date: Sun, 6 Jan 2013 12:46:47 +0100
-Subject: [PATCH] Simplify checks.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: backport [1]
-
-[1] http://git.xfce.org/xfce/xfconf/commit/?id=233f7d3a9b0f98b794548433cead77633aab5f7d
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- tests/Makefile.am         |  1 -
- tests/Makefile.inc        |  9 +--------
- tests/test-template.sh.in | 49 -----------------------------------------------
- 3 files changed, 1 insertion(+), 58 deletions(-)
- delete mode 100644 tests/test-template.sh.in
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 57165d9..57ba7e8 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -13,5 +13,4 @@ clean-local:
- 
- EXTRA_DIST = \
- 	$(test_scripts) \
--	test-template.sh.in \
- 	tests-common.h
-diff --git a/tests/Makefile.inc b/tests/Makefile.inc
-index 2ed3431..7a5a715 100644
---- a/tests/Makefile.inc
-+++ b/tests/Makefile.inc
-@@ -13,9 +13,7 @@
- # along with this program; if not, write to the Free Software
- # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- 
--check_SCRIPTS = $(addsuffix .sh,$(check_PROGRAMS))
--
--TESTS = $(check_SCRIPTS)
-+TESTS = $(check_PROGRAMS)
- TESTS_ENVIRONMENT = XDG_CONFIG_HOME="$(top_builddir)/tests/test-xdg_config_home" XFCONFD="$(top_builddir)/xfconfd/xfconfd"
- 
- AM_CFLAGS = \
-@@ -27,8 +25,3 @@ AM_CFLAGS = \
- LIBS = \
- 	$(top_builddir)/xfconf/libxfconf-$(LIBXFCONF_VERSION_API).la
- 
--%.sh: $(top_srcdir)/tests/test-template.sh.in Makefile
--	sed -e 's/@TEST_NAME@/$@/; s/\.sh//;' <$(top_srcdir)/tests/test-template.sh.in >$@
--	chmod 755 $@
--
--CLEANFILES = $(check_SCRIPTS)
-diff --git a/tests/test-template.sh.in b/tests/test-template.sh.in
-deleted file mode 100644
-index 2e638a8..0000000
---- a/tests/test-template.sh.in
-+++ /dev/null
-@@ -1,49 +0,0 @@
--#!/bin/sh
--
--cleanup() {
--    if [ "$XFCONFD_PID" ]; then
--        kill -TERM $XFCONFD_PID 2>/dev/null
--        sleep 1
--        kill -KILL $XFCONFD_PID 2>/dev/null
--    fi
--
--    kill -TERM $DBUS_SESSION_BUS_PID 2>/dev/null
--    sleep 1
--    kill -KILL $DBUS_SESSION_BUS_PID 2>/dev/null
--}
--
--die() {
--    [ "$1" ] && echo "$1" >&2
--    cleanup
--    exit 1
--}
--
--# some buildbots have problems with the tests (dbus not
--# working properly without an X11 server).
--if [ -n "$XFCONF_SKIP_TESTS" ]; then
--  echo "Warning: Tests disabled, skipping @TEST_NAME@" >&2
--  exit 0
--fi
--
--unset DBUS_SESSION_BUS_ADDRESS
--unset DBUS_SESSION_BUS_PID
--unset XFCONFD_PID
--
--eval `dbus-launch --sh-syntax`
--export DBUS_SESSION_BUS_ADDRESS
--export DBUS_SESSION_BUS_PID
--
--[ "$DBUS_SESSION_BUS_PID" ] || die "DBus failed to start"
--
--trap "die Interrupted" INT
--
--eval `$XFCONFD --daemon 2>/dev/null` || die "Failed to start xfconfd"
--
--export XDG_CONFIG_HOME  # make sure it's exported from the makefile
--export XDG_CONFIG_DIRS=""
--
--./@TEST_NAME@ || die "Test Failed"
--
--cleanup
--
--exit 0
--- 
-1.8.3.1
-
diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.12.0.bb
similarity index 70%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.12.0.bb
index 30d0de3..ff1dfa4 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.12.0.bb
@@ -8,9 +8,8 @@ inherit xfce gtk-doc
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI += "file://0001-Simplify-checks.patch"
-SRC_URI[md5sum] = "4ed48150a03fb5f42b455494307b7f28"
-SRC_URI[sha256sum] = "175219a441cc7d0f210bbd1a3b0abba41598627cd9db27235811400c3e100576"
+SRC_URI[md5sum] = "8ebfac507b4d6ce3f4bac9d257c2853b"
+SRC_URI[sha256sum] = "9910eaea8405336415d4d7f3056403f8c67bc23ba0dce251eac35205c603b156"
 
 FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
-- 
1.9.3


