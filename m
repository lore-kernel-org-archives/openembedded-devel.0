Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4A12B6D090
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 22:42:33 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so682094eaj.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 15:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=BoH3HYKxd9mKHyWWd7yfAKgHzHEXXdjXoITQlcE+LNQ=;
	b=FNjFvBNKgOOydykv6zlHQhH8sZeEXZLbcPlF0yBfiUBigmfUZhxv47oQZyikwRBF9P
	dE3pcuW+9ItRa8MZdCGrPONPhAnupNLzXxzYCgydhjLX+OFM6Q0DoNzXJa4e/d6gZUj9
	l/iAFfYNROScODBv2Fkv3SCoxLMF8fRguDVwOSPYvUiOjhXLss6aXSx1Oa8dv4EpqlCy
	WS2eW1dCkaA/Pnx5Vgsf9yY9DrJZ+qClggTMOlvrWIsEvjNzJskmGlbr74kUNz6KVg2d
	kVG5h2SC1x/QQMo7s6AxtBit5bRHDdjLVz4oa9noFFzc4f6ji0hqnTZRuf1DwrQ1p8fB
	oAag==
X-Received: by 10.15.43.13 with SMTP id w13mr8132721eev.37.1381963354443;
	Wed, 16 Oct 2013 15:42:34 -0700 (PDT)
Received: from localhost.localdomain (p5B0A114C.dip0.t-ipconnect.de.
	[91.10.17.76])
	by mx.google.com with ESMTPSA id s3sm21561672eeo.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 16 Oct 2013 15:42:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2013 00:42:16 +0200
Message-Id: <1381963336-18888-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1381963336-18888-1-git-send-email-schnitzeltony@googlemail.com>
References: <1381963336-18888-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 2/2] xfconf: fix compile
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
X-List-Received-Date: Wed, 16 Oct 2013 22:42:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfconf/files/0001-Simplify-checks.patch        | 112 +++++++++++++++++++++
 meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb     |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/xfconf/files/0001-Simplify-checks.patch

diff --git a/meta-xfce/recipes-xfce/xfconf/files/0001-Simplify-checks.patch b/meta-xfce/recipes-xfce/xfconf/files/0001-Simplify-checks.patch
new file mode 100644
index 0000000..ef68f7a
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfconf/files/0001-Simplify-checks.patch
@@ -0,0 +1,112 @@
+From 233f7d3a9b0f98b794548433cead77633aab5f7d Mon Sep 17 00:00:00 2001
+From: Nick Schermer <nick@xfce.org>
+Date: Sun, 6 Jan 2013 12:46:47 +0100
+Subject: [PATCH] Simplify checks.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: backport [1]
+
+[1] http://git.xfce.org/xfce/xfconf/commit/?id=233f7d3a9b0f98b794548433cead77633aab5f7d
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ tests/Makefile.am         |  1 -
+ tests/Makefile.inc        |  9 +--------
+ tests/test-template.sh.in | 49 -----------------------------------------------
+ 3 files changed, 1 insertion(+), 58 deletions(-)
+ delete mode 100644 tests/test-template.sh.in
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 57165d9..57ba7e8 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -13,5 +13,4 @@ clean-local:
+ 
+ EXTRA_DIST = \
+ 	$(test_scripts) \
+-	test-template.sh.in \
+ 	tests-common.h
+diff --git a/tests/Makefile.inc b/tests/Makefile.inc
+index 2ed3431..7a5a715 100644
+--- a/tests/Makefile.inc
++++ b/tests/Makefile.inc
+@@ -13,9 +13,7 @@
+ # along with this program; if not, write to the Free Software
+ # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ 
+-check_SCRIPTS = $(addsuffix .sh,$(check_PROGRAMS))
+-
+-TESTS = $(check_SCRIPTS)
++TESTS = $(check_PROGRAMS)
+ TESTS_ENVIRONMENT = XDG_CONFIG_HOME="$(top_builddir)/tests/test-xdg_config_home" XFCONFD="$(top_builddir)/xfconfd/xfconfd"
+ 
+ AM_CFLAGS = \
+@@ -27,8 +25,3 @@ AM_CFLAGS = \
+ LIBS = \
+ 	$(top_builddir)/xfconf/libxfconf-$(LIBXFCONF_VERSION_API).la
+ 
+-%.sh: $(top_srcdir)/tests/test-template.sh.in Makefile
+-	sed -e 's/@TEST_NAME@/$@/; s/\.sh//;' <$(top_srcdir)/tests/test-template.sh.in >$@
+-	chmod 755 $@
+-
+-CLEANFILES = $(check_SCRIPTS)
+diff --git a/tests/test-template.sh.in b/tests/test-template.sh.in
+deleted file mode 100644
+index 2e638a8..0000000
+--- a/tests/test-template.sh.in
++++ /dev/null
+@@ -1,49 +0,0 @@
+-#!/bin/sh
+-
+-cleanup() {
+-    if [ "$XFCONFD_PID" ]; then
+-        kill -TERM $XFCONFD_PID 2>/dev/null
+-        sleep 1
+-        kill -KILL $XFCONFD_PID 2>/dev/null
+-    fi
+-
+-    kill -TERM $DBUS_SESSION_BUS_PID 2>/dev/null
+-    sleep 1
+-    kill -KILL $DBUS_SESSION_BUS_PID 2>/dev/null
+-}
+-
+-die() {
+-    [ "$1" ] && echo "$1" >&2
+-    cleanup
+-    exit 1
+-}
+-
+-# some buildbots have problems with the tests (dbus not
+-# working properly without an X11 server).
+-if [ -n "$XFCONF_SKIP_TESTS" ]; then
+-  echo "Warning: Tests disabled, skipping @TEST_NAME@" >&2
+-  exit 0
+-fi
+-
+-unset DBUS_SESSION_BUS_ADDRESS
+-unset DBUS_SESSION_BUS_PID
+-unset XFCONFD_PID
+-
+-eval `dbus-launch --sh-syntax`
+-export DBUS_SESSION_BUS_ADDRESS
+-export DBUS_SESSION_BUS_PID
+-
+-[ "$DBUS_SESSION_BUS_PID" ] || die "DBus failed to start"
+-
+-trap "die Interrupted" INT
+-
+-eval `$XFCONFD --daemon 2>/dev/null` || die "Failed to start xfconfd"
+-
+-export XDG_CONFIG_HOME  # make sure it's exported from the makefile
+-export XDG_CONFIG_DIRS=""
+-
+-./@TEST_NAME@ || die "Test Failed"
+-
+-cleanup
+-
+-exit 0
+-- 
+1.8.3.1
+
diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
index 5dceb09..4ea2b88 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
@@ -6,6 +6,7 @@ DEPENDS = "dbus-glib libxfce4util perl-native"
 
 inherit xfce
 
+SRC_URI += "file://0001-Simplify-checks.patch"
 SRC_URI[md5sum] = "4ed48150a03fb5f42b455494307b7f28"
 SRC_URI[sha256sum] = "175219a441cc7d0f210bbd1a3b0abba41598627cd9db27235811400c3e100576"
 
-- 
1.8.3.1


