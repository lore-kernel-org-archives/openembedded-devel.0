Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE72EE9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 16:20:12 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15750.1771431602785846498
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 08:20:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout03.t-online.de (Postfix) with SMTP id A1800E61D
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 17:20:00 +0100 (CET)
Received: from [192.168.178.36] ([84.163.40.86]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vskHQ-1yXDDE0; Wed, 18 Feb 2026 17:20:00 +0100
Date: Wed, 18 Feb 2026 17:19:54 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] snapper: update 0.12.2 -> 0.13.0
To: openembedded-devel@lists.openembedded.org
Message-Id: <6DXNAT.JI1LGUNWUPW61@t-online.de>
In-Reply-To: <1895638E389DBDB5.269009@lists.openembedded.org>
References: <1895638E389DBDB5.269009@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-oY94jJ3jIRNBzpoEJzSN"
X-TOI-EXPURGATEID: 150726::1771431600-DCFD20C6-4B0CCD47/0/0 CLEAN NORMAL
X-TOI-MSGID: 79d37209-ea93-487e-b94d-8357c0348f78
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 16:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124492

--=-oY94jJ3jIRNBzpoEJzSN
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: dont use VIRTUAL-RUNTIME_dbus in DEPENDS. Seems wrong to me

On Wed, Feb 18 2026 at 17:17:49 +01:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> - Remove 0001-Fix-build-with-boost-1.89.patch. Seems to be fixed
>   upstream
> - Use manpages class
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../0001-Fix-build-with-boost-1.89.patch      | 89 
> -------------------
>  .../{snapper_0.12.2.bb => snapper_0.13.0.bb}  | 12 ++-
>  2 files changed, 5 insertions(+), 96 deletions(-)
>  delete mode 100644 
> meta-oe/recipes-support/snapper/snapper/0001-Fix-build-with-boost-1.89.patch
>  rename meta-oe/recipes-support/snapper/{snapper_0.12.2.bb => 
> snapper_0.13.0.bb} (76%)
> 
> diff --git 
> a/meta-oe/recipes-support/snapper/snapper/0001-Fix-build-with-boost-1.89.patch 
> b/meta-oe/recipes-support/snapper/snapper/0001-Fix-build-with-boost-1.89.patch
> deleted file mode 100644
> index a6598b5635..0000000000
> --- 
> a/meta-oe/recipes-support/snapper/snapper/0001-Fix-build-with-boost-1.89.patch
> +++ /dev/null
> @@ -1,89 +0,0 @@
> -From c33e7707da86a23c4ad7e2451ddb04df419d6412 Mon Sep 17 00:00:00 
> 2001
> -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> -Date: Sun, 31 Aug 2025 00:13:07 -0700
> -Subject: [PATCH] Fix build with boost 1.89
> -
> -boost 1.89+ does not have boost system lib anymore all needed 
> functions
> -are now in header
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> ----
> - dbus/Makefile.am             | 2 +-
> - examples/c++-lib/Makefile.am | 1 -
> - server/Makefile.am           | 2 +-
> - snapper/Makefile.am          | 2 +-
> - testsuite-cmp/Makefile.am    | 1 -
> - zypp-plugin/Makefile.am      | 1 -
> - 6 files changed, 3 insertions(+), 6 deletions(-)
> -
> -diff --git a/dbus/Makefile.am b/dbus/Makefile.am
> -index 9c0456a..2078d7d 100644
> ---- a/dbus/Makefile.am
> -+++ b/dbus/Makefile.am
> -@@ -15,4 +15,4 @@ libdbus_la_SOURCES =					\
> - 	DBusMainLoop.cc		DBusMainLoop.h
> -
> - libdbus_la_LIBADD = $(DBUS_LIBS)
> --libdbus_la_LDFLAGS = -lboost_system -lboost_thread
> -+libdbus_la_LDFLAGS = -lboost_thread
> -diff --git a/examples/c++-lib/Makefile.am 
> b/examples/c++-lib/Makefile.am
> -index 52c81e5..f55da6f 100644
> ---- a/examples/c++-lib/Makefile.am
> -+++ b/examples/c++-lib/Makefile.am
> -@@ -5,7 +5,6 @@
> - AM_CPPFLAGS = -I$(top_srcdir)
> -
> - LDADD = ../../snapper/libsnapper.la
> --AM_LDFLAGS = -lboost_system
> -
> - noinst_PROGRAMS = List ListAll Create CmpDirs CreateNumber 
> CreateTimeline
> -
> -diff --git a/server/Makefile.am b/server/Makefile.am
> -index c03f373..1aef916 100644
> ---- a/server/Makefile.am
> -+++ b/server/Makefile.am
> -@@ -16,4 +16,4 @@ snapperd_SOURCES =					\
> - 	FilesTransferTask.cc	FilesTransferTask.h
> -
> - snapperd_LDADD = ../snapper/libsnapper.la ../dbus/libdbus.la -lrt
> --snapperd_LDFLAGS = -lboost_system -lboost_thread -lpthread
> -+snapperd_LDFLAGS = -lboost_thread -lpthread
> -diff --git a/snapper/Makefile.am b/snapper/Makefile.am
> -index b0fe55c..d75599f 100644
> ---- a/snapper/Makefile.am
> -+++ b/snapper/Makefile.am
> -@@ -71,7 +71,7 @@ endif
> -
> - libsnapper_la_CPPFLAGS = $(XML2_CFLAGS) $(ZLIB_CFLAGS)
> - libsnapper_la_LDFLAGS = -version-info @LIBVERSION_INFO@
> --libsnapper_la_LIBADD = -lboost_thread -lboost_system $(XML2_LIBS) 
> -lacl $(ZLIB_LIBS)
> -+libsnapper_la_LIBADD = -lboost_thread $(XML2_LIBS) -lacl 
> $(ZLIB_LIBS)
> - if ENABLE_ROLLBACK
> - libsnapper_la_LIBADD += -lmount
> - endif
> -diff --git a/testsuite-cmp/Makefile.am b/testsuite-cmp/Makefile.am
> -index 81104bf..555bc3b 100644
> ---- a/testsuite-cmp/Makefile.am
> -+++ b/testsuite-cmp/Makefile.am
> -@@ -3,7 +3,6 @@
> - #
> -
> - AM_CPPFLAGS = -I$(top_srcdir)
> --AM_LDFLAGS = -lboost_system
> -
> - LDADD = ../snapper/libsnapper.la
> -
> -diff --git a/zypp-plugin/Makefile.am b/zypp-plugin/Makefile.am
> -index 9d102e0..e395f59 100644
> ---- a/zypp-plugin/Makefile.am
> -+++ b/zypp-plugin/Makefile.am
> -@@ -33,7 +33,6 @@ forwarding_zypp_plugin_SOURCES = \
> - forwarding_zypp_plugin_LDADD = \
> - 	../snapper/libsnapper.la \
> - 	../stomp/libstomp.la \
> --	-lboost_system \
> - 	-lpthread
> -
> - TESTS = solvable-matcher.test
> diff --git a/meta-oe/recipes-support/snapper/snapper_0.12.2.bb 
> b/meta-oe/recipes-support/snapper/snapper_0.13.0.bb
> similarity index 76%
> rename from meta-oe/recipes-support/snapper/snapper_0.12.2.bb
> rename to meta-oe/recipes-support/snapper/snapper_0.13.0.bb
> index 981ca84c13..56d4c89d0f 100644
> --- a/meta-oe/recipes-support/snapper/snapper_0.12.2.bb
> +++ b/meta-oe/recipes-support/snapper/snapper_0.13.0.bb
> @@ -6,19 +6,17 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>  DEPENDS = "acl boost btrfs-tools dbus e2fsprogs json-c libxml2 lvm2 
> ncurses zlib"
> 
>  # Build separation is slightly broken
> -inherit autotools-brokensep pkgconfig gettext
> +inherit autotools-brokensep pkgconfig gettext manpages
> 
> -SRC_URI = 
> "git://github.com/openSUSE/snapper.git;protocol=https;branch=master \
> -           file://0001-Fix-build-with-boost-1.89.patch 
> <file://0001-fix-build-with-boost-1.89.patch/> \
> -          "
> -SRCREV = "4f3d2b2fc58aefa976668cd25b8eac02ba0f85e7"
> +SRC_URI = 
> "git://github.com/openSUSE/snapper.git;protocol=https;branch=master"
> +SRCREV = "3a3bd97083976d28538d402284ff947b4aab5b8f"
> 
>  EXTRA_OECONF += "--disable-zypp"
> 
> -PACKAGECONFIG ?= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'api-documentation 
> systemd pam', d)}"
> +PACKAGECONFIG ?= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'systemd pam', d)}"
>  PACKAGECONFIG[pam] = "--enable-pam 
> --with-pam-security=${base_libdir}/security, --disable-pam,libpam"
>  PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd"
> -PACKAGECONFIG[api-documentation] = 
> "--enable-doc,--disable-doc,libxslt-native 
> docbook-xsl-stylesheets-native"
> +PACKAGECONFIG[manpages] = "--enable-doc,--disable-doc,libxslt-native 
> docbook-xsl-stylesheets-native"
> 
>  # Avoid HOSTTOOLS path in binaries
>  export DIFF_BIN = "${bindir}/diff"
> --
> 2.52.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124491): 
> <https://lists.openembedded.org/g/openembedded-devel/message/124491>
> Mute This Topic: <https://lists.openembedded.org/mt/117877179/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-oY94jJ3jIRNBzpoEJzSN
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: dont use VIRTUAL-RUNTIME_dbus in DEPENDS. Seems wrong to me</div></div><div id="geary-quote" dir="auto"><br>On Wed, Feb 18 2026 at 17:17:49 +01:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- Remove 0001-Fix-build-with-boost-1.89.patch. Seems to be fixed
  upstream
- Use manpages class

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../0001-Fix-build-with-boost-1.89.patch      | 89 -------------------
 .../{snapper_0.12.2.bb =&gt; snapper_0.13.0.bb}  | 12 ++-
 2 files changed, 5 insertions(+), 96 deletions(-)
 delete mode 100644 meta-oe/recipes-support/snapper/snapper/0001-Fix-build-with-boost-1.89.patch
 rename meta-oe/recipes-support/snapper/{snapper_0.12.2.bb =&gt; snapper_0.13.0.bb} (76%)

diff --git a/meta-oe/recipes-support/snapper/snapper/0001-Fix-build-with-boost-1.89.patch b/meta-oe/recipes-support/snapper/snapper/0001-Fix-build-with-boost-1.89.patch
deleted file mode 100644
index a6598b5635..0000000000
--- a/meta-oe/recipes-support/snapper/snapper/0001-Fix-build-with-boost-1.89.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From c33e7707da86a23c4ad7e2451ddb04df419d6412 Mon Sep 17 00:00:00 2001
-From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
-Date: Sun, 31 Aug 2025 00:13:07 -0700
-Subject: [PATCH] Fix build with boost 1.89
-
-boost 1.89+ does not have boost system lib anymore all needed functions
-are now in header
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
----
- dbus/Makefile.am             | 2 +-
- examples/c++-lib/Makefile.am | 1 -
- server/Makefile.am           | 2 +-
- snapper/Makefile.am          | 2 +-
- testsuite-cmp/Makefile.am    | 1 -
- zypp-plugin/Makefile.am      | 1 -
- 6 files changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/dbus/Makefile.am b/dbus/Makefile.am
-index 9c0456a..2078d7d 100644
---- a/dbus/Makefile.am
-+++ b/dbus/Makefile.am
-@@ -15,4 +15,4 @@ libdbus_la_SOURCES =					\
- 	DBusMainLoop.cc		DBusMainLoop.h
- 
- libdbus_la_LIBADD = $(DBUS_LIBS)
--libdbus_la_LDFLAGS = -lboost_system -lboost_thread
-+libdbus_la_LDFLAGS = -lboost_thread
-diff --git a/examples/c++-lib/Makefile.am b/examples/c++-lib/Makefile.am
-index 52c81e5..f55da6f 100644
---- a/examples/c++-lib/Makefile.am
-+++ b/examples/c++-lib/Makefile.am
-@@ -5,7 +5,6 @@
- AM_CPPFLAGS = -I$(top_srcdir)
- 
- LDADD = ../../snapper/libsnapper.la
--AM_LDFLAGS = -lboost_system
- 
- noinst_PROGRAMS = List ListAll Create CmpDirs CreateNumber CreateTimeline
- 
-diff --git a/server/Makefile.am b/server/Makefile.am
-index c03f373..1aef916 100644
---- a/server/Makefile.am
-+++ b/server/Makefile.am
-@@ -16,4 +16,4 @@ snapperd_SOURCES =					\
- 	FilesTransferTask.cc	FilesTransferTask.h
- 
- snapperd_LDADD = ../snapper/libsnapper.la ../dbus/libdbus.la -lrt
--snapperd_LDFLAGS = -lboost_system -lboost_thread -lpthread
-+snapperd_LDFLAGS = -lboost_thread -lpthread
-diff --git a/snapper/Makefile.am b/snapper/Makefile.am
-index b0fe55c..d75599f 100644
---- a/snapper/Makefile.am
-+++ b/snapper/Makefile.am
-@@ -71,7 +71,7 @@ endif
- 
- libsnapper_la_CPPFLAGS = $(XML2_CFLAGS) $(ZLIB_CFLAGS)
- libsnapper_la_LDFLAGS = -version-info @LIBVERSION_INFO@
--libsnapper_la_LIBADD = -lboost_thread -lboost_system $(XML2_LIBS) -lacl $(ZLIB_LIBS)
-+libsnapper_la_LIBADD = -lboost_thread $(XML2_LIBS) -lacl $(ZLIB_LIBS)
- if ENABLE_ROLLBACK
- libsnapper_la_LIBADD += -lmount
- endif
-diff --git a/testsuite-cmp/Makefile.am b/testsuite-cmp/Makefile.am
-index 81104bf..555bc3b 100644
---- a/testsuite-cmp/Makefile.am
-+++ b/testsuite-cmp/Makefile.am
-@@ -3,7 +3,6 @@
- #
- 
- AM_CPPFLAGS = -I$(top_srcdir)
--AM_LDFLAGS = -lboost_system
- 
- LDADD = ../snapper/libsnapper.la
- 
-diff --git a/zypp-plugin/Makefile.am b/zypp-plugin/Makefile.am
-index 9d102e0..e395f59 100644
---- a/zypp-plugin/Makefile.am
-+++ b/zypp-plugin/Makefile.am
-@@ -33,7 +33,6 @@ forwarding_zypp_plugin_SOURCES = \
- forwarding_zypp_plugin_LDADD = \
- 	../snapper/libsnapper.la \
- 	../stomp/libstomp.la \
--	-lboost_system \
- 	-lpthread
- 
- TESTS = solvable-matcher.test
diff --git a/meta-oe/recipes-support/snapper/snapper_0.12.2.bb b/meta-oe/recipes-support/snapper/snapper_0.13.0.bb
similarity index 76%
rename from meta-oe/recipes-support/snapper/snapper_0.12.2.bb
rename to meta-oe/recipes-support/snapper/snapper_0.13.0.bb
index 981ca84c13..56d4c89d0f 100644
--- a/meta-oe/recipes-support/snapper/snapper_0.12.2.bb
+++ b/meta-oe/recipes-support/snapper/snapper_0.13.0.bb
@@ -6,19 +6,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "acl boost btrfs-tools dbus e2fsprogs json-c libxml2 lvm2 ncurses zlib"
 
 # Build separation is slightly broken
-inherit autotools-brokensep pkgconfig gettext
+inherit autotools-brokensep pkgconfig gettext manpages
 
-SRC_URI = "git://github.com/openSUSE/snapper.git;protocol=https;branch=master \
-           <a href="file://0001-Fix-build-with-boost-1.89.patch">file://0001-Fix-build-with-boost-1.89.patch</a> \
-          "
-SRCREV = "4f3d2b2fc58aefa976668cd25b8eac02ba0f85e7"
+SRC_URI = "git://github.com/openSUSE/snapper.git;protocol=https;branch=master"
+SRCREV = "3a3bd97083976d28538d402284ff947b4aab5b8f"
 
 EXTRA_OECONF += "--disable-zypp"
 
-PACKAGECONFIG ?= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'api-documentation systemd pam', d)}"
+PACKAGECONFIG ?= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'systemd pam', d)}"
 PACKAGECONFIG[pam] = "--enable-pam --with-pam-security=${base_libdir}/security, --disable-pam,libpam"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd"
-PACKAGECONFIG[api-documentation] = "--enable-doc,--disable-doc,libxslt-native docbook-xsl-stylesheets-native"
+PACKAGECONFIG[manpages] = "--enable-doc,--disable-doc,libxslt-native docbook-xsl-stylesheets-native"
 
 # Avoid HOSTTOOLS path in binaries
 export DIFF_BIN = "${bindir}/diff"
<div>-- 
</div>2.52.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#124491): <a href="https://lists.openembedded.org/g/openembedded-devel/message/124491">https://lists.openembedded.org/g/openembedded-devel/message/124491</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/117877179/3618223">https://lists.openembedded.org/mt/117877179/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-oY94jJ3jIRNBzpoEJzSN--


