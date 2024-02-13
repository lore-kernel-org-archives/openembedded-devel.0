Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7D9C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 06:31:42 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.5908.1707805895795063879
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Feb 2024 22:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout02.t-online.de (Postfix) with SMTP id D7B165C4A;
	Tue, 13 Feb 2024 07:31:28 +0100 (CET)
Received: from [192.168.178.67] ([84.163.32.89]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rZmKG-0lrKl60; Tue, 13 Feb 2024 07:31:28 +0100
Date: Tue, 13 Feb 2024 07:31:42 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-oe][PATCH] libnfs: Add cmake checks for sys/uio.h
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <UG7S8S.3LEL3RUU0WPC@t-online.de>
In-Reply-To: <20240213033051.2910281-1-raj.khem@gmail.com>
References: <20240213033051.2910281-1-raj.khem@gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-uQIsiErSaPZ7cja8quER"
X-TOI-EXPURGATEID: 150726::1707805888-477FD979-58C878E3/0/0 CLEAN NORMAL
X-TOI-MSGID: 975674d5-ab75-45e3-b39e-a337ee62a00b
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Feb 2024 06:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108721

--=-uQIsiErSaPZ7cja8quER
Content-Type: text/plain; charset=us-ascii; format=flowed

Thanks for the fix!

On Mon, Feb 12 2024 at 07:30:51 PM -08:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Fixes build issues with latest compiler e.g. gcc-14
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> Cc: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> ---
>  .../0001-cmake-Test-for-sys-uio.h.patch       | 44 
> +++++++++++++++++++
>  .../libnfs/libnfs_5.0.3.bb                    |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 
> meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Test-for-sys-uio.h.patch
> 
> diff --git 
> a/meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Test-for-sys-uio.h.patch 
> b/meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Test-for-sys-uio.h.patch
> new file mode 100644
> index 0000000000..de3ab82292
> --- /dev/null
> +++ 
> b/meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Test-for-sys-uio.h.patch
> @@ -0,0 +1,44 @@
> +From d0fa719d49f38777911a8e99717f2d4b30811080 Mon Sep 17 00:00:00 
> 2001
> +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> +Date: Mon, 12 Feb 2024 19:24:54 -0800
> +Subject: [PATCH] cmake: Test for sys/uio.h
> +
> +writev() API is used in few places and it will need including 
> sys/uio.h
> +for getting the funciton signature
> +
> +Upstream-Status: Submitted 
> [<https://github.com/sahlberg/libnfs/pull/440>]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> +---
> + cmake/ConfigureChecks.cmake | 1 +
> + cmake/config.h.cmake        | 3 +++
> + 2 files changed, 4 insertions(+)
> +
> +diff --git a/cmake/ConfigureChecks.cmake 
> b/cmake/ConfigureChecks.cmake
> +index 0258fc8..c26a02d 100644
> +--- a/cmake/ConfigureChecks.cmake
> ++++ b/cmake/ConfigureChecks.cmake
> +@@ -22,6 +22,7 @@ check_include_file("sys/stat.h" HAVE_SYS_STAT_H)
> + check_include_file("sys/sysmacros.h" HAVE_SYS_SYSMACROS_H)
> + check_include_file("sys/time.h" HAVE_SYS_TIME_H)
> + check_include_file("sys/types.h" HAVE_SYS_TYPES_H)
> ++check_include_file("sys/uio.h" HAVE_SYS_UIO_H)
> + check_include_file("sys/vfs.h" HAVE_SYS_VFS_H)
> + check_include_file("unistd.h" HAVE_UNISTD_H)
> + check_include_file("utime.h" HAVE_UTIME_H)
> +diff --git a/cmake/config.h.cmake b/cmake/config.h.cmake
> +index 4016c6c..6263896 100644
> +--- a/cmake/config.h.cmake
> ++++ b/cmake/config.h.cmake
> +@@ -90,6 +90,9 @@
> + /* Define to 1 if you have the <sys/types.h> header file. */
> + #cmakedefine HAVE_SYS_TYPES_H
> +
> ++/* Define to 1 if you have the <sys/uio.h> header file. */
> ++#cmakedefine HAVE_SYS_UIO_H
> ++
> + /* Define to 1 if you have the <sys/vfs.h> header file. */
> + #cmakedefine HAVE_SYS_VFS_H
> +
> +--
> +2.43.1
> +
> diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb 
> b/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb
> index 068c827f70..8a470ee2fb 100644
> --- a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb
> +++ b/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=825301ba17efc9d188ee0abd4b924ada"
>  SRC_URI = " \
>  	git://github.com/sahlberg/libnfs.git;protocol=https;branch=master \
>  
> 	file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch 
> <file://0001-cmakelists.txt-respect-cmake_install_libdir-for-mult.patch/> 
> \
> +  file://0001-cmake-Test-for-sys-uio.h.patch 
> <file://0001-cmake-test-for-sys-uio.h.patch/> \
>  "
>  SRCREV = "4379837536d9eac537810dc7b13071136049b22a"
>  S = "${WORKDIR}/git"
> --
> 2.43.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108719): 
> <https://lists.openembedded.org/g/openembedded-devel/message/108719>
> Mute This Topic: <https://lists.openembedded.org/mt/104326527/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-uQIsiErSaPZ7cja8quER
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Thanks for the fix!</div></div><div id="geary-quote" dir="auto"><br>On Mon, Feb 12 2024 at 07:30:51 PM -08:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Fixes build issues with latest compiler e.g. gcc-14

Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
Cc: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../0001-cmake-Test-for-sys-uio.h.patch       | 44 +++++++++++++++++++
 .../libnfs/libnfs_5.0.3.bb                    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Test-for-sys-uio.h.patch

diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Test-for-sys-uio.h.patch b/meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Test-for-sys-uio.h.patch
new file mode 100644
index 0000000000..de3ab82292
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Test-for-sys-uio.h.patch
@@ -0,0 +1,44 @@
+From d0fa719d49f38777911a8e99717f2d4b30811080 Mon Sep 17 00:00:00 2001
+From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
+Date: Mon, 12 Feb 2024 19:24:54 -0800
+Subject: [PATCH] cmake: Test for sys/uio.h
+
+writev() API is used in few places and it will need including sys/uio.h
+for getting the funciton signature
+
+Upstream-Status: Submitted [<a href="https://github.com/sahlberg/libnfs/pull/440">https://github.com/sahlberg/libnfs/pull/440</a>]
+Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
+---
+ cmake/ConfigureChecks.cmake | 1 +
+ cmake/config.h.cmake        | 3 +++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/cmake/ConfigureChecks.cmake b/cmake/ConfigureChecks.cmake
+index 0258fc8..c26a02d 100644
+--- a/cmake/ConfigureChecks.cmake
++++ b/cmake/ConfigureChecks.cmake
+@@ -22,6 +22,7 @@ check_include_file("sys/stat.h" HAVE_SYS_STAT_H)
+ check_include_file("sys/sysmacros.h" HAVE_SYS_SYSMACROS_H)
+ check_include_file("sys/time.h" HAVE_SYS_TIME_H)
+ check_include_file("sys/types.h" HAVE_SYS_TYPES_H)
++check_include_file("sys/uio.h" HAVE_SYS_UIO_H)
+ check_include_file("sys/vfs.h" HAVE_SYS_VFS_H)
+ check_include_file("unistd.h" HAVE_UNISTD_H)
+ check_include_file("utime.h" HAVE_UTIME_H)
+diff --git a/cmake/config.h.cmake b/cmake/config.h.cmake
+index 4016c6c..6263896 100644
+--- a/cmake/config.h.cmake
++++ b/cmake/config.h.cmake
+@@ -90,6 +90,9 @@
+ /* Define to 1 if you have the &lt;sys/types.h&gt; header file. */
+ #cmakedefine HAVE_SYS_TYPES_H
+ 
++/* Define to 1 if you have the &lt;sys/uio.h&gt; header file. */
++#cmakedefine HAVE_SYS_UIO_H
++
+ /* Define to 1 if you have the &lt;sys/vfs.h&gt; header file. */
+ #cmakedefine HAVE_SYS_VFS_H
+ 
+-- 
+2.43.1
+
diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb b/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb
index 068c827f70..8a470ee2fb 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=825301ba17efc9d188ee0abd4b924ada"
 SRC_URI = " \
 	git://github.com/sahlberg/libnfs.git;protocol=https;branch=master \
 	<a href="file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch">file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch</a> \
+  <a href="file://0001-cmake-Test-for-sys-uio.h.patch">file://0001-cmake-Test-for-sys-uio.h.patch</a> \
 "
 SRCREV = "4379837536d9eac537810dc7b13071136049b22a"
 S = "${WORKDIR}/git"
<div>-- 
</div>2.43.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#108719): <a href="https://lists.openembedded.org/g/openembedded-devel/message/108719">https://lists.openembedded.org/g/openembedded-devel/message/108719</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/104326527/3618223">https://lists.openembedded.org/mt/104326527/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-uQIsiErSaPZ7cja8quER--


