Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2448D111BB
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 23:20:32 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7019.1764199229848770102
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 15:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d3SwCTtZ;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-63fc6115d65so275976d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 15:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764199229; x=1764804029; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XEBbOeHco6+HT5aKPbIKa7oRF4ZbsGhB5M2jQHuTU6Q=;
        b=d3SwCTtZjNTftTUGSHeOEcjha6UZTa36KMWUt2Sb2q9XL5puwx2dkK9Ang4VhSlUVo
         bmqVVzWT73ZjKwlW3R+RcKuCXE9LOamBA7QsNX5FMedKewXdaRHHng/tS5R7oJCNozog
         76FWd2n16wHrAv/+uI+PAGr1SlpJ8yLgjyLUjlo2XC8big+NRCpujoO0NKKQizvzQHrC
         hx6dDKt5I6VwjR1eTP/UM+SwlnY9Acb6HVvWkjtNBgQlryXNgZ8AWf8za6pdr4hzxyxQ
         dv0TNI8YIUdiuPfM4JwS1KLtMqfgmru0UcraofF0zayFF56+a4is/gzuGQDfV802nhCq
         cauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764199229; x=1764804029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEBbOeHco6+HT5aKPbIKa7oRF4ZbsGhB5M2jQHuTU6Q=;
        b=fmIPxxg3TtCXCjbLqdaThnDvLvc8AiJy1SQZ8l/w1bvmHq65piRqzJSH2nBR54enhC
         pUu2p03P5zWwhsTUgbZ91cvJKX3Hxk3uyXS3+ghg4hGIXHblvkPUgXdf8d6yNCSg/Q0q
         tHyOdQ4qS4GY6FZLRH1YzwrtMmMbB6KrTNfv1P2dXqagsuViGScpYQnDyUaGAsG4XMoq
         kXx1l8osDqlA5f1iOPpokRI7mJwEknZnSR5YrIIdEZZVZdDC+2n9lA+rBUw7PCbJdBU5
         VMwOjV7a12Kjpg6jnrBo3m3qIICRcU7hmM+ZPzZ8asAOzny9nqoZNFpMEGHIhVlaf8o5
         9HKQ==
X-Gm-Message-State: AOJu0YwrNkR6/ogRtrsMRrBBSZefqUIShqgDmav4cF0DVdUIvou3xd6d
	l1c5BfKpYbCvVMKDYJarcPtrWBUS+fASFtp+jniNVXrRMKQ5WR6Ay0Sr64vtRKdUhSrjjqoKZ40
	QwYT7W8QNo+1xFEiFAHUPyxG7+xPr8x0=
X-Gm-Gg: ASbGncu2PHfBYt2wr/Gfvha1s/mOhlMKO7/xxAlA58uv4Yp0sRHGY3ve1xkrfKb0moh
	FluE5lGM/Mr2csglSNiGCN++WJM7opNdTmqV+l+i2LMrCrmS2sljXMOR7GUrkqLP/exOiy3iAbp
	g2MgditfjTdu0VZNL9yl3Zd97JXJC+fin5yzgySBtYe1Zm6H8x8Tk8RK+1t658xJBfl00T/UIyJ
	0XTbYvK+gtyEWw8/La9HwKBKsycRMdoTjS+GZd7m5BsQKGOusI3/0C0qbOy5TJBaf+b8OHp57Us
	4YInutDsbgnEY8VzQloJK2Lszm/KVbmc28eJRh2nFWpKTMWnzNRgMgIvAA762nknopwe9bS0uAm
	G0r+CwI8QwxY344JTkos8tndC+i3QS8Cv1AGxyi8EOxW5xA==
X-Google-Smtp-Source: AGHT+IGsaL3E4xhDXnx1T5RuFkMNFP9jHUNgNhEzuDLDZXkd2L1EgrS+X6V++HkHmBs0VnkuKbu1cjCQnIl8MJcxzTA=
X-Received: by 2002:a53:c90c:0:b0:641:f5bc:6950 with SMTP id
 956f58d0204a3-64302af04e2mr11309859d50.84.1764199228736; Wed, 26 Nov 2025
 15:20:28 -0800 (PST)
MIME-Version: 1.0
References: <20251126032906.4282-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20251126032906.4282-1-liuyd.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Nov 2025 15:20:02 -0800
X-Gm-Features: AWmQ_bkuJEZe0Bd0SKOznu3DqsuDqXQ3hZ_8fKUioakD_BNQT8DVDLg4_XUkDqA
Message-ID: <CAMKF1sq+3rB-9EX++A27w5LHZGED66MD6uPJj19NW5mZt4QoEg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] wxwidgets: upgrade 3.2.8 -> 3.3.1
To: liuyd.fnst@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000578e36064487a491"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 23:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122098

--000000000000578e36064487a491
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

python3-wxgtk4 from meta-python depends upon this recipe and the version
which we carry in meta-python is 3.4.3 or proposed 3.4.4 which is
only built and tested with wxwidget 3.2.8.1, I will defer this until we
have a release of wxgtk4 python module that works with wxwidget 3.3.x

On Tue, Nov 25, 2025 at 7:29=E2=80=AFPM Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
wrote:

> 1.Changelog:
>  https://github.com/wxWidgets/wxWidgets/releases/tag/v3.3.1
>
> 2.Update following patches for 3.3.1
>  0002-fix-libdir-for-multilib.patch
>  0003-create-links-with-relative-path.patch
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  .../0002-fix-libdir-for-multilib.patch        | 25 +++++++++++--------
>  ...0003-create-links-with-relative-path.patch | 15 ++++++-----
>  ...{wxwidgets_3.2.8.bb =3D> wxwidgets_3.3.1.bb} |  6 ++---
>  3 files changed, 26 insertions(+), 20 deletions(-)
>  rename meta-oe/recipes-extended/wxwidgets/{wxwidgets_3.2.8.bb =3D>
> wxwidgets_3.3.1.bb} (96%)
>
> diff --git
> a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multil=
ib.patch
> b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multil=
ib.patch
> index cd0417612f..bc6c4e6f54 100644
> ---
> a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multil=
ib.patch
> +++
> b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multil=
ib.patch
> @@ -15,6 +15,9 @@ Rebase for wxWidgets 3.2.1. Replace wxPLATFORM_LIB_DIR
> with LIB_SUFFIX
>  in this patch that LIB_SUFFIX has been passed to cmake in cmake.bbclass.
>
>  Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +Update for 3.3.1
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
>  ---
>   CMakeLists.txt                         |  2 +-
>   build/cmake/config.cmake               |  2 +-
> @@ -23,7 +26,7 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
>   4 files changed, 9 insertions(+), 9 deletions(-)
>
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index d6a4b49..9e86b87 100644
> +index 6112fb7fac..42c0430598 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
>  @@ -43,7 +43,7 @@ include(build/cmake/policies.cmake NO_POLICY_SCOPE)
> @@ -36,7 +39,7 @@ index d6a4b49..9e86b87 100644
>   # parse the version number from wx/version.h and include in
> wxMAJOR_VERSION and wxMINOR_VERSION
>   file(READ "${wxSOURCE_DIR}/include/wx/version.h" WX_VERSION_H_CONTENTS)
>  diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake
> -index addd8d6..9ec6775 100644
> +index fe6c0f84c7..6845aacbe0 100644
>  --- a/build/cmake/config.cmake
>  +++ b/build/cmake/config.cmake
>  @@ -100,7 +100,7 @@ function(wx_write_config_inplace)
> @@ -49,10 +52,10 @@ index addd8d6..9ec6775 100644
>           )
>   endfunction()
>  diff --git a/build/cmake/install.cmake b/build/cmake/install.cmake
> -index 202d054..e255e0b 100644
> +index a373983043..225a112ca5 100644
>  --- a/build/cmake/install.cmake
>  +++ b/build/cmake/install.cmake
> -@@ -44,11 +44,11 @@ if(WIN32_MSVC_NAMING)
> +@@ -51,11 +51,11 @@ if(WIN32_MSVC_NAMING)
>   else()
>       install(
>           DIRECTORY "${wxSETUP_HEADER_PATH}"
> @@ -66,12 +69,12 @@ index 202d054..e255e0b 100644
>           PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
>                       GROUP_EXECUTE GROUP_READ
>                       WORLD_EXECUTE WORLD_READ
> -@@ -57,13 +57,13 @@ else()
> +@@ -64,13 +64,13 @@ else()
>       install(DIRECTORY DESTINATION "bin")
>       install(CODE "execute_process( \
>           COMMAND ${CMAKE_COMMAND} -E create_symlink \
> --        \"${CMAKE_INSTALL_PREFIX}/lib/wx/config/${wxBUILD_FILE_ID}\" \
> -+
> \"${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}/wx/config/${wxBUILD_FILE_ID}\"=
 \
> +-
> \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wx/config/${wxBUILD_FILE_ID}\=
" \
> ++
> \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}/wx/config/${wxBU=
ILD_FILE_ID}\"
> \
>           \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wx-config\" \
>           )"
>       )
> @@ -82,7 +85,7 @@ index 202d054..e255e0b 100644
>
>   # find_package config file
>   include(CMakePackageConfigHelpers)
> -@@ -86,11 +86,11 @@ write_basic_package_version_file(
> +@@ -93,11 +93,11 @@ write_basic_package_version_file(
>   configure_package_config_file(
>       "${wxSOURCE_DIR}/build/cmake/wxWidgetsConfig.cmake.in"
>       "${projectConfig}"
> @@ -97,10 +100,10 @@ index 202d054..e255e0b 100644
>
>   # uninstall target
>  diff --git a/build/cmake/lib/webview/CMakeLists.txt
> b/build/cmake/lib/webview/CMakeLists.txt
> -index 2cb35e7..7977a84 100644
> +index 84ba0351d7..e68ab16d1b 100644
>  --- a/build/cmake/lib/webview/CMakeLists.txt
>  +++ b/build/cmake/lib/webview/CMakeLists.txt
> -@@ -146,7 +146,7 @@ if(WXGTK AND wxUSE_WEBVIEW_WEBKIT2)
> +@@ -153,7 +153,7 @@ if(WXGTK AND wxUSE_WEBVIEW_WEBKIT2)
>           ${WEBKIT2_LIBRARIES}
>           )
>
> @@ -110,5 +113,5 @@ index 2cb35e7..7977a84 100644
>       wx_add_dependencies(wxwebview wxwebkit2_ext)
>   endif()
>  --
> -2.49.0
> +2.43.0
>
> diff --git
> a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-rel=
ative-path.patch
> b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-rel=
ative-path.patch
> index dbede0304f..f0d22ec56d 100644
> ---
> a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-rel=
ative-path.patch
> +++
> b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-rel=
ative-path.patch
> @@ -24,37 +24,40 @@ Create symlink with relative path to fix the issues.
>  Upstream-Status: Pending
>
>  Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +Update for 3.3.1.
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
>  ---
>   build/cmake/install.cmake        | 2 +-
>   build/cmake/utils/CMakeLists.txt | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/build/cmake/install.cmake b/build/cmake/install.cmake
> -index d3303faabb..c79e187f37 100644
> +index 5a54fcb895..1dcd1b2886 100644
>  --- a/build/cmake/install.cmake
>  +++ b/build/cmake/install.cmake
> -@@ -42,7 +42,7 @@ else()
> +@@ -64,7 +64,7 @@ else()
>       install(DIRECTORY DESTINATION "bin")
>       install(CODE "execute_process( \
>           COMMAND ${CMAKE_COMMAND} -E create_symlink \
> --
> \"${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}/wx/config/${wxBUILD_FILE_ID}\"=
 \
> +-
> \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}/wx/config/${wxBU=
ILD_FILE_ID}\"
> \
>  +        \"../lib${LIB_SUFFIX}/wx/config/${wxBUILD_FILE_ID}\" \
>           \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wx-config\" \
>           )"
>       )
>  diff --git a/build/cmake/utils/CMakeLists.txt
> b/build/cmake/utils/CMakeLists.txt
> -index dbed8cc9b3..1dbc3261d3 100644
> +index 15f4339ef9..1dbc3261d3 100644
>  --- a/build/cmake/utils/CMakeLists.txt
>  +++ b/build/cmake/utils/CMakeLists.txt
>  @@ -40,7 +40,7 @@ if(wxUSE_XRC)
>           # Don't use wx_install() here to preserve escaping.
>           install(CODE "execute_process( \
>               COMMAND ${CMAKE_COMMAND} -E create_symlink \
> --
> \"${CMAKE_INSTALL_PREFIX}/bin/${wxrc_output_name}${EXE_SUFFIX}\" \
> +-
> \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/${wxrc_output_name}${EXE_SUFF=
IX}\"
> \
>  +            \"./${wxrc_output_name}${EXE_SUFFIX}\" \
>
> \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wxrc${EXE_SUFFIX}\" \
>               )"
>           )
>  --
> -2.25.1
> +2.43.0
>
> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
> b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.3.1.bb
> similarity index 96%
> rename from meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
> rename to meta-oe/recipes-extended/wxwidgets/wxwidgets_3.3.1.bb
> index fcb30b41b0..8e5c3e60c6 100644
> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.3.1.bb
> @@ -18,7 +18,7 @@ DEPENDS +=3D " \
>      tiff \
>  "
>
> -SRC_URI =3D "gitsm://
> github.com/wxWidgets/wxWidgets.git;branch=3D3.2;protocol=3Dhttps;tag=3Dv$=
{PV}
> <http://github.com/wxWidgets/wxWidgets.git;branch=3D3.2;protocol=3Dhttps;=
tag=3Dv$%7BPV%7D>
> \
> +SRC_URI =3D "gitsm://
> github.com/wxWidgets/wxWidgets.git;branch=3Dmaster;protocol=3Dhttps;tag=
=3Dv${PV}
> <http://github.com/wxWidgets/wxWidgets.git;branch=3Dmaster;protocol=3Dhtt=
ps;tag=3Dv$%7BPV%7D>
> \
>
> file://0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch \
>             file://0002-fix-libdir-for-multilib.patch \
>             file://0003-create-links-with-relative-path.patch \
> @@ -27,7 +27,7 @@ SRC_URI =3D "gitsm://
> github.com/wxWidgets/wxWidgets.git;branch=3D3.2;protocol=3Dhttps;
>             file://0006-Fix-locale-on-musl.patch \
>             file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch =
\
>             "
> -SRCREV =3D "8aef5f40b93958719771331ca03866b7b6fff6bf"
> +SRCREV =3D "49c6810948f40c457e3d0848b9111627b5b61de5"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>
> @@ -110,7 +110,7 @@ do_install:append() {
>      # fix host contamination
>      sed -i -e "s#${STAGING_DIR_NATIVE}##g" \
>             -e "s#${STAGING_DIR_TARGET}##g" \
> -           ${D}${libdir}/wx/config/*-unicode-3.2 \
> +           ${D}${libdir}/wx/config/*-unicode-3.3 \
>             ${D}${libdir}/cmake/wxWidgets/wxWidgetsTargets.cmake
>  }
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122068):
> https://lists.openembedded.org/g/openembedded-devel/message/122068
> Mute This Topic: https://lists.openembedded.org/mt/116480543/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000578e36064487a491
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">python3-wxgtk4=C2=A0from=C2=A0meta-python depends upon thi=
s recipe and the version which we carry in meta-python is 3.4.3 or proposed=
 3.4.4 which is<div>only built and tested with wxwidget 3.2.8.1, I will def=
er this until we have a release of wxgtk4 python module that works with wxw=
idget 3.3.x</div></div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 25, 2025 at 7:29=E2=80=
=AFPM Yiding Liu (Fujitsu) via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;liuyd.fnst=3D<a href=3D"mailto:fujitsu.com@lis=
ts.openembedded.org">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">1.Changelog:<br>
=C2=A0<a href=3D"https://github.com/wxWidgets/wxWidgets/releases/tag/v3.3.1=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/wxWidgets/wxWidge=
ts/releases/tag/v3.3.1</a><br>
<br>
2.Update following patches for 3.3.1<br>
=C2=A00002-fix-libdir-for-multilib.patch<br>
=C2=A00003-create-links-with-relative-path.patch<br>
<br>
Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" tar=
get=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../0002-fix-libdir-for-multilib.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
5 +++++++++++--------<br>
=C2=A0...0003-create-links-with-relative-path.patch | 15 ++++++-----<br>
=C2=A0...{<a href=3D"http://wxwidgets_3.2.8.bb" rel=3D"noreferrer" target=
=3D"_blank">wxwidgets_3.2.8.bb</a> =3D&gt; <a href=3D"http://wxwidgets_3.3.=
1.bb" rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.3.1.bb</a>} |=C2=A0 =
6 ++---<br>
=C2=A03 files changed, 26 insertions(+), 20 deletions(-)<br>
=C2=A0rename meta-oe/recipes-extended/wxwidgets/{<a href=3D"http://wxwidget=
s_3.2.8.bb" rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.2.8.bb</a> =3D=
&gt; <a href=3D"http://wxwidgets_3.3.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">wxwidgets_3.3.1.bb</a>} (96%)<br>
<br>
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-f=
or-multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-l=
ibdir-for-multilib.patch<br>
index cd0417612f..bc6c4e6f54 100644<br>
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-mult=
ilib.patch<br>
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-mult=
ilib.patch<br>
@@ -15,6 +15,9 @@ Rebase for wxWidgets 3.2.1. Replace wxPLATFORM_LIB_DIR wi=
th LIB_SUFFIX<br>
=C2=A0in this patch that LIB_SUFFIX has been passed to cmake in cmake.bbcla=
ss.<br>
<br>
=C2=A0Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"=
 target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
+<br>
+Update for 3.3.1<br>
+Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" ta=
rget=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0 build/cmake/config.cmake=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
@@ -23,7 +26,7 @@ Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@wi=
ndriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
=C2=A0 4 files changed, 9 insertions(+), 9 deletions(-)<br>
<br>
=C2=A0diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
-index d6a4b49..9e86b87 100644<br>
+index 6112fb7fac..42c0430598 100644<br>
=C2=A0--- a/CMakeLists.txt<br>
=C2=A0+++ b/CMakeLists.txt<br>
=C2=A0@@ -43,7 +43,7 @@ include(build/cmake/policies.cmake NO_POLICY_SCOPE)=
<br>
@@ -36,7 +39,7 @@ index d6a4b49..9e86b87 100644<br>
=C2=A0 # parse the version number from wx/version.h and include in wxMAJOR_=
VERSION and wxMINOR_VERSION<br>
=C2=A0 file(READ &quot;${wxSOURCE_DIR}/include/wx/version.h&quot; WX_VERSIO=
N_H_CONTENTS)<br>
=C2=A0diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake<br>
-index addd8d6..9ec6775 100644<br>
+index fe6c0f84c7..6845aacbe0 100644<br>
=C2=A0--- a/build/cmake/config.cmake<br>
=C2=A0+++ b/build/cmake/config.cmake<br>
=C2=A0@@ -100,7 +100,7 @@ function(wx_write_config_inplace)<br>
@@ -49,10 +52,10 @@ index addd8d6..9ec6775 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
=C2=A0 endfunction()<br>
=C2=A0diff --git a/build/cmake/install.cmake b/build/cmake/install.cmake<br=
>
-index 202d054..e255e0b 100644<br>
+index a373983043..225a112ca5 100644<br>
=C2=A0--- a/build/cmake/install.cmake<br>
=C2=A0+++ b/build/cmake/install.cmake<br>
-@@ -44,11 +44,11 @@ if(WIN32_MSVC_NAMING)<br>
+@@ -51,11 +51,11 @@ if(WIN32_MSVC_NAMING)<br>
=C2=A0 else()<br>
=C2=A0 =C2=A0 =C2=A0 install(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DIRECTORY &quot;${wxSETUP_HEADER_PATH}&q=
uot;<br>
@@ -66,12 +69,12 @@ index 202d054..e255e0b 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PERMISSIONS OWNER_EXECUTE OWNER_WRITE OW=
NER_READ<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 GROUP_EXECUTE GROUP_READ<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 WORLD_EXECUTE WORLD_READ<br>
-@@ -57,13 +57,13 @@ else()<br>
+@@ -64,13 +64,13 @@ else()<br>
=C2=A0 =C2=A0 =C2=A0 install(DIRECTORY DESTINATION &quot;bin&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 install(CODE &quot;execute_process( \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 COMMAND ${CMAKE_COMMAND} -E create_symli=
nk \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;${CMAKE_INSTALL_PREFIX}/lib/wx/config/=
${wxBUILD_FILE_ID}\&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFI=
X}/wx/config/${wxBUILD_FILE_ID}\&quot; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/=
lib/wx/config/${wxBUILD_FILE_ID}\&quot; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/=
lib${LIB_SUFFIX}/wx/config/${wxBUILD_FILE_ID}\&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;\$ENV{DESTDIR}${CMAKE_INSTALL_PRE=
FIX}/bin/wx-config\&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )&quot;<br>
=C2=A0 =C2=A0 =C2=A0 )<br>
@@ -82,7 +85,7 @@ index 202d054..e255e0b 100644<br>
<br>
=C2=A0 # find_package config file<br>
=C2=A0 include(CMakePackageConfigHelpers)<br>
-@@ -86,11 +86,11 @@ write_basic_package_version_file(<br>
+@@ -93,11 +93,11 @@ write_basic_package_version_file(<br>
=C2=A0 configure_package_config_file(<br>
=C2=A0 =C2=A0 =C2=A0 &quot;${wxSOURCE_DIR}/build/cmake/<a href=3D"http://wx=
WidgetsConfig.cmake.in" rel=3D"noreferrer" target=3D"_blank">wxWidgetsConfi=
g.cmake.in</a>&quot;<br>
=C2=A0 =C2=A0 =C2=A0 &quot;${projectConfig}&quot;<br>
@@ -97,10 +100,10 @@ index 202d054..e255e0b 100644<br>
<br>
=C2=A0 # uninstall target<br>
=C2=A0diff --git a/build/cmake/lib/webview/CMakeLists.txt b/build/cmake/lib=
/webview/CMakeLists.txt<br>
-index 2cb35e7..7977a84 100644<br>
+index 84ba0351d7..e68ab16d1b 100644<br>
=C2=A0--- a/build/cmake/lib/webview/CMakeLists.txt<br>
=C2=A0+++ b/build/cmake/lib/webview/CMakeLists.txt<br>
-@@ -146,7 +146,7 @@ if(WXGTK AND wxUSE_WEBVIEW_WEBKIT2)<br>
+@@ -153,7 +153,7 @@ if(WXGTK AND wxUSE_WEBVIEW_WEBKIT2)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${WEBKIT2_LIBRARIES}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
<br>
@@ -110,5 +113,5 @@ index 2cb35e7..7977a84 100644<br>
=C2=A0 =C2=A0 =C2=A0 wx_add_dependencies(wxwebview wxwebkit2_ext)<br>
=C2=A0 endif()<br>
=C2=A0-- <br>
-2.49.0<br>
+2.43.0<br>
<br>
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links=
-with-relative-path.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/00=
03-create-links-with-relative-path.patch<br>
index dbede0304f..f0d22ec56d 100644<br>
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-r=
elative-path.patch<br>
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-r=
elative-path.patch<br>
@@ -24,37 +24,40 @@ Create symlink with relative path to fix the issues.<br=
>
=C2=A0Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"=
 target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
+<br>
+Update for 3.3.1.<br>
+Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" ta=
rget=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 build/cmake/install.cmake=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0 build/cmake/utils/CMakeLists.txt | 2 +-<br>
=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/build/cmake/install.cmake b/build/cmake/install.cmake<br=
>
-index d3303faabb..c79e187f37 100644<br>
+index 5a54fcb895..1dcd1b2886 100644<br>
=C2=A0--- a/build/cmake/install.cmake<br>
=C2=A0+++ b/build/cmake/install.cmake<br>
-@@ -42,7 +42,7 @@ else()<br>
+@@ -64,7 +64,7 @@ else()<br>
=C2=A0 =C2=A0 =C2=A0 install(DIRECTORY DESTINATION &quot;bin&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 install(CODE &quot;execute_process( \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 COMMAND ${CMAKE_COMMAND} -E create_symli=
nk \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFI=
X}/wx/config/${wxBUILD_FILE_ID}\&quot; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/=
lib${LIB_SUFFIX}/wx/config/${wxBUILD_FILE_ID}\&quot; \<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;../lib${LIB_SUFFIX}/wx/config/${w=
xBUILD_FILE_ID}\&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;\$ENV{DESTDIR}${CMAKE_INSTALL_PRE=
FIX}/bin/wx-config\&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )&quot;<br>
=C2=A0 =C2=A0 =C2=A0 )<br>
=C2=A0diff --git a/build/cmake/utils/CMakeLists.txt b/build/cmake/utils/CMa=
keLists.txt<br>
-index dbed8cc9b3..1dbc3261d3 100644<br>
+index 15f4339ef9..1dbc3261d3 100644<br>
=C2=A0--- a/build/cmake/utils/CMakeLists.txt<br>
=C2=A0+++ b/build/cmake/utils/CMakeLists.txt<br>
=C2=A0@@ -40,7 +40,7 @@ if(wxUSE_XRC)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Don&#39;t use wx_install() here to pre=
serve escaping.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install(CODE &quot;execute_process( \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 COMMAND ${CMAKE_COMMAND} -=
E create_symlink \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;${CMAKE_INSTALL_PREFIX}/=
bin/${wxrc_output_name}${EXE_SUFFIX}\&quot; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;\$ENV{DESTDIR}${CMAKE_IN=
STALL_PREFIX}/bin/${wxrc_output_name}${EXE_SUFFIX}\&quot; \<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;./${wxrc_output_nam=
e}${EXE_SUFFIX}\&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;\$ENV{DESTDIR}${CMA=
KE_INSTALL_PREFIX}/bin/wxrc${EXE_SUFFIX}\&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
=C2=A0-- <br>
-2.25.1<br>
+2.43.0<br>
<br>
diff --git a/meta-oe/recipes-extended/wxwidgets/<a href=3D"http://wxwidgets=
_3.2.8.bb" rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.2.8.bb</a> b/me=
ta-oe/recipes-extended/wxwidgets/<a href=3D"http://wxwidgets_3.3.1.bb" rel=
=3D"noreferrer" target=3D"_blank">wxwidgets_3.3.1.bb</a><br>
similarity index 96%<br>
rename from meta-oe/recipes-extended/wxwidgets/<a href=3D"http://wxwidgets_=
3.2.8.bb" rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.2.8.bb</a><br>
rename to meta-oe/recipes-extended/wxwidgets/<a href=3D"http://wxwidgets_3.=
3.1.bb" rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.3.1.bb</a><br>
index fcb30b41b0..8e5c3e60c6 100644<br>
--- a/meta-oe/recipes-extended/wxwidgets/<a href=3D"http://wxwidgets_3.2.8.=
bb" rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.2.8.bb</a><br>
+++ b/meta-oe/recipes-extended/wxwidgets/<a href=3D"http://wxwidgets_3.3.1.=
bb" rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.3.1.bb</a><br>
@@ -18,7 +18,7 @@ DEPENDS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0tiff \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/wxWidgets/wxWidgets=
.git;branch=3D3.2;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/wxWidgets/wxWidgets.git;branch=3D3.2;protocol=3Dh=
ttps;tag=3Dv${PV}</a> \<br>
+SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/wxWidgets/wxWidgets=
.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" =
target=3D"_blank">github.com/wxWidgets/wxWidgets.git;branch=3Dmaster;protoc=
ol=3Dhttps;tag=3Dv${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-wx-config.in-Disable-=
cross-magic-it-does-not-work-fo.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-fix-libdir-for-multil=
ib.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-create-links-with-rel=
ative-path.patch \<br>
@@ -27,7 +27,7 @@ SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/wx=
Widgets/wxWidgets.git;branch=3D3.2;protocol=3Dhttps" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/wxWidgets/wxWidgets.git;branch=3D3.2;protocol=3Dh=
ttps</a>;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0006-Fix-locale-on-musl.pa=
tch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0007-Set-HAVE_LARGEFILE_SU=
PPORT-to-1-explicitly.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRCREV =3D &quot;8aef5f40b93958719771331ca03866b7b6fff6bf&quot;<br>
+SRCREV =3D &quot;49c6810948f40c457e3d0848b9111627b5b61de5&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)&quo=
t;<br>
<br>
@@ -110,7 +110,7 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0# fix host contamination<br>
=C2=A0 =C2=A0 =C2=A0sed -i -e &quot;s#${STAGING_DIR_NATIVE}##g&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s#${STAGING_DIR_TARGET}#=
#g&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${libdir}/wx/config/*-unicode=
-3.2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${libdir}/wx/config/*-unicode=
-3.3 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${libdir}/cmake/wxWidgets/wxW=
idgetsTargets.cmake<br>
=C2=A0}<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122068): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122068" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122068</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116480543/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116480543/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000578e36064487a491--

