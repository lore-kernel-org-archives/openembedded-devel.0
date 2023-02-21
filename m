Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593DBC636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 20:08:09 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.52738.1677010081000813382
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Feb 2023 12:08:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout09.t-online.de (Postfix) with SMTP id 8B948115C8
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 21:07:58 +0100 (CET)
Received: from [192.168.178.83] ([84.154.165.85]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pUYvd-3fy5q40; Tue, 21 Feb 2023 21:07:58 +0100
Date: Tue, 21 Feb 2023 21:07:52 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-gnome][PATCH] gparted: update 1.4.0 -> 1.5.0
To: openembedded-devel@lists.openembedded.org
Message-Id: <495GQR.QDJEIFZLC9252@t-online.de>
In-Reply-To: <20230221200625.494020-1-f_l_k@t-online.de>
References: <20230221200625.494020-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-m3XESdz4RUhYqHa//Lxk"
X-TOI-EXPURGATEID: 150726::1677010078-D53B29DF-4B5996E1/0/0 CLEAN NORMAL
X-TOI-MSGID: 1262c367-a02d-4e18-abe2-2a9370bff15c
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 20:08:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101197

--=-m3XESdz4RUhYqHa//Lxk
Content-Type: text/plain; charset=us-ascii; format=flowed

sent again because of an error message during mail delivery

Am Di, 21. Feb 2023 um 21:06:25 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> - Remove unneeded patches
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...t-use-NULL-where-boolean-is-expected.patch | 33 
> -------------------
>  .../files/0001-use-posix-basename.patch       | 30 -----------------
>  .../{gparted_1.4.0.bb => gparted_1.5.0.bb}    |  6 ++--
>  3 files changed, 2 insertions(+), 67 deletions(-)
>  delete mode 100644 
> meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch
>  delete mode 100644 
> meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.patch
>  rename meta-gnome/recipes-extended/gparted/{gparted_1.4.0.bb => 
> gparted_1.5.0.bb} (78%)
> 
> diff --git 
> a/meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch 
> b/meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch
> deleted file mode 100644
> index 1b0d24024..000000000
> --- 
> a/meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 9af84e1c08a2159c10baf13244e2c8a7d7e837e9 Mon Sep 17 00:00:00 
> 2001
> -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> -Date: Thu, 27 Jan 2022 23:02:20 -0800
> -Subject: [PATCH] Do not use NULL where boolean is expected
> -
> -Fixes
> -src/GParted_Core.cc:73:57: error: static_cast from 'nullptr_t' to 
> 'PedPartitionFlag' (aka '_PedPartitionFlag') is not allowed
> -|         for ( PedPartitionFlag flag = ped_partition_flag_next( 
> static_cast<PedPartitionFlag>( NULL ) ) ;
> -|                                                                
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -| 1 error generated.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> ----
> - src/GParted_Core.cc | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/GParted_Core.cc b/src/GParted_Core.cc
> -index f7ac970..3290c66 100644
> ---- a/src/GParted_Core.cc
> -+++ b/src/GParted_Core.cc
> -@@ -70,7 +70,7 @@ GParted_Core::GParted_Core()
> - 	ped_exception_set_handler( ped_exception_handler ) ;
> -
> - 	//get valid flags ...
> --	for ( PedPartitionFlag flag = ped_partition_flag_next( 
> static_cast<PedPartitionFlag>( NULL ) ) ;
> -+	for ( PedPartitionFlag flag = ped_partition_flag_next( 
> static_cast<PedPartitionFlag>( false ) ) ;
> - 	      flag ;
> - 	      flag = ped_partition_flag_next( flag ) )
> - 		flags .push_back( flag ) ;
> ---
> -2.35.0
> -
> diff --git 
> a/meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.patch 
> b/meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.patch
> deleted file mode 100644
> index aae200e27..000000000
> --- 
> a/meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Subject: [PATCH] BCache_Info.cc: use posix basename
> -
> -gnu 'basename' is undeclared for cplusplus if using musl. Use posix 
> basename instead.
> -
> -fdebug-prefix-map=TOPDIR/build/tmp/work/cortexa57-yoe-linux-musl/gparted/1.4.0-r0/
> -recipe-sysroot-native=-fvisibility-inlines-hidden  -c -o 
> Dialog_Disklabel.o ../../
> -gparted-1.4.0/src/Dialog_Disklabel.cc 
> ../../gparted-1.4.0/src/BCache_Info.cc:52:33:
> -
> -error: use of undeclared identifier 'basename'; did you mean 
> 'g_basename'?
> -        return "/dev/" + Glib::ustring(basename(buf));
> -                                       ^~~~~~~~
> -                                       g_basename
> -
> -Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> -
> -Upstream-Status: Submitted
> -
> -<https://gitlab.gnome.org/GNOME/gparted/-/merge_requests/99>
> -
> ---- a/src/BCache_Info.cc	2022-03-02 22:04:17.000000000 +0100
> -+++ b/src/BCache_Info.cc	2022-04-09 15:02:56.932218665 +0200
> -@@ -17,7 +17,7 @@
> -
> - #include "BCache_Info.h"
> -
> --#include <string.h>  // GNU version of basename()
> -+#include <libgen.h>  // POSIX version of basename()
> - #include <unistd.h>
> - #include <glibmm/ustring.h>
> - #include <glibmm/fileutils.h>
> diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb 
> b/meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb
> similarity index 78%
> rename from meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
> rename to meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb
> index dde5a02ab..be7a96ea8 100644
> --- a/meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
> +++ b/meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb
> @@ -3,17 +3,15 @@ HOMEPAGE = "http://gparted.org/index.php"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f" 
> <file://copying;md5=94d55d512a9ba36caa9b7df079bae19f/>
> 
> -inherit autotools pkgconfig python3native gnome-help gtk-icon-cache 
> features_check
> +inherit autotools pkgconfig python3native gettext gnome-help 
> gtk-icon-cache features_check
> 
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> 
>  SRC_URI = " \
>      
> ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.gz 
> \
>      
> file://0001-Install-polkit-action-unconditionally-executable-pke.patch 
> <file://0001-install-polkit-action-unconditionally-executable-pke.patch/> 
> \
> -    file://0001-Do-not-use-NULL-where-boolean-is-expected.patch 
> <file://0001-do-not-use-null-where-boolean-is-expected.patch/> \
> -    file://0001-use-posix-basename.patch 
> <file://0001-use-posix-basename.patch/> \
>  "
> -SRC_URI[sha256sum] = 
> "e5293a792e53fdbeba29c4a834113cd9603d0d639330da931a468bf3687887be"
> +SRC_URI[sha256sum] = 
> "3c95ea26a944083ff1d9b17639b1e2ad9758df225dc751ff407b2a6aa092a8de"
> 
>  UPSTREAM_CHECK_URI = 
> "<https://sourceforge.net/projects/gparted/files/gparted/>"
>  UPSTREAM_CHECK_REGEX = "gparted-(?P<pver>\d+\.(\d+)+(\.\d+)+)"
> --
> 2.34.1
> 


--=-m3XESdz4RUhYqHa//Lxk
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>sent again because of an error message during mail delivery</div></div><div id="geary-quote" dir="auto"><br>Am Di, 21. Feb 2023 um 21:06:25 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- Remove unneeded patches

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...t-use-NULL-where-boolean-is-expected.patch | 33 -------------------
 .../files/0001-use-posix-basename.patch       | 30 -----------------
 .../{gparted_1.4.0.bb =&gt; gparted_1.5.0.bb}    |  6 ++--
 3 files changed, 2 insertions(+), 67 deletions(-)
 delete mode 100644 meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch
 delete mode 100644 meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.patch
 rename meta-gnome/recipes-extended/gparted/{gparted_1.4.0.bb =&gt; gparted_1.5.0.bb} (78%)

diff --git a/meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch b/meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch
deleted file mode 100644
index 1b0d24024..000000000
--- a/meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 9af84e1c08a2159c10baf13244e2c8a7d7e837e9 Mon Sep 17 00:00:00 2001
-From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
-Date: Thu, 27 Jan 2022 23:02:20 -0800
-Subject: [PATCH] Do not use NULL where boolean is expected
-
-Fixes
-src/GParted_Core.cc:73:57: error: static_cast from 'nullptr_t' to 'PedPartitionFlag' (aka '_PedPartitionFlag') is not allowed
-|         for ( PedPartitionFlag flag = ped_partition_flag_next( static_cast&lt;PedPartitionFlag&gt;( NULL ) ) ;
-|                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-| 1 error generated.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
----
- src/GParted_Core.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/GParted_Core.cc b/src/GParted_Core.cc
-index f7ac970..3290c66 100644
---- a/src/GParted_Core.cc
-+++ b/src/GParted_Core.cc
-@@ -70,7 +70,7 @@ GParted_Core::GParted_Core()
- 	ped_exception_set_handler( ped_exception_handler ) ; 
- 
- 	//get valid flags ...
--	for ( PedPartitionFlag flag = ped_partition_flag_next( static_cast&lt;PedPartitionFlag&gt;( NULL ) ) ;
-+	for ( PedPartitionFlag flag = ped_partition_flag_next( static_cast&lt;PedPartitionFlag&gt;( false ) ) ;
- 	      flag ;
- 	      flag = ped_partition_flag_next( flag ) )
- 		flags .push_back( flag ) ;
--- 
-2.35.0
-
diff --git a/meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.patch b/meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.patch
deleted file mode 100644
index aae200e27..000000000
--- a/meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Subject: [PATCH] BCache_Info.cc: use posix basename
-
-gnu 'basename' is undeclared for cplusplus if using musl. Use posix basename instead.
-
-fdebug-prefix-map=TOPDIR/build/tmp/work/cortexa57-yoe-linux-musl/gparted/1.4.0-r0/
-recipe-sysroot-native=-fvisibility-inlines-hidden  -c -o Dialog_Disklabel.o ../../
-gparted-1.4.0/src/Dialog_Disklabel.cc ../../gparted-1.4.0/src/BCache_Info.cc:52:33:
-
-error: use of undeclared identifier 'basename'; did you mean 'g_basename'?
-        return "/dev/" + Glib::ustring(basename(buf));
-                                       ^~~~~~~~
-                                       g_basename
-
-Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
-
-Upstream-Status: Submitted
-
-<a href="https://gitlab.gnome.org/GNOME/gparted/-/merge_requests/99">https://gitlab.gnome.org/GNOME/gparted/-/merge_requests/99</a>
-
---- a/src/BCache_Info.cc	2022-03-02 22:04:17.000000000 +0100
-+++ b/src/BCache_Info.cc	2022-04-09 15:02:56.932218665 +0200
-@@ -17,7 +17,7 @@
- 
- #include "BCache_Info.h"
- 
--#include &lt;string.h&gt;  // GNU version of basename()
-+#include &lt;libgen.h&gt;  // POSIX version of basename()
- #include &lt;unistd.h&gt;
- #include &lt;glibmm/ustring.h&gt;
- #include &lt;glibmm/fileutils.h&gt;
diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb b/meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb
similarity index 78%
rename from meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
rename to meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb
index dde5a02ab..be7a96ea8 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb
@@ -3,17 +3,15 @@ HOMEPAGE = "http://gparted.org/index.php"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f" "="">file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"</a>
 
-inherit autotools pkgconfig python3native gnome-help gtk-icon-cache features_check
+inherit autotools pkgconfig python3native gettext gnome-help gtk-icon-cache features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI = " \
     ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     <a href="file://0001-Install-polkit-action-unconditionally-executable-pke.patch">file://0001-Install-polkit-action-unconditionally-executable-pke.patch</a> \
-    <a href="file://0001-Do-not-use-NULL-where-boolean-is-expected.patch">file://0001-Do-not-use-NULL-where-boolean-is-expected.patch</a> \
-    <a href="file://0001-use-posix-basename.patch">file://0001-use-posix-basename.patch</a> \
 "
-SRC_URI[sha256sum] = "e5293a792e53fdbeba29c4a834113cd9603d0d639330da931a468bf3687887be"
+SRC_URI[sha256sum] = "3c95ea26a944083ff1d9b17639b1e2ad9758df225dc751ff407b2a6aa092a8de"
 
 UPSTREAM_CHECK_URI = "<a href="https://sourceforge.net/projects/gparted/files/gparted/">https://sourceforge.net/projects/gparted/files/gparted/</a>"
 UPSTREAM_CHECK_REGEX = "gparted-(?P&lt;pver&gt;\d+\.(\d+)+(\.\d+)+)"
<div>-- 
</div>2.34.1

</div></blockquote></div>
--=-m3XESdz4RUhYqHa//Lxk--


