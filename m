Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.8126.1618983440963161964
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 22:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VN+dI1n0;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d6so12195849qtx.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Apr 2021 22:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9WcIJqK5tW/VPxp8cFQuUyQGE2zUtcBeGLt5pHboTcU=;
        b=VN+dI1n049v2PcFh3ikHFgVJ5QGax7I+7ReHf60ZcSPjbvgGcUSzgUjoT0IqZZNPAS
         WkBj0xL2cnFJZJkyzsk9tDeFin9zUig1FzpHAwaQmXK7EI/R7Tn8oXvZgHSD2+1m5I3S
         RzUxOSwPwV5cv6b6rf/JtP+KbiucRMbyHwbnahRcYC6EABek+vC5WHD/mQvwfCx0/zEj
         7VmXOQg0reaD1NrR8SDiVEVuH0mouvbja0MoKCzRs3p1n4p194nCA6Xq3kkiJzT5Qfbp
         EU7CNO+kmz+CpQnWVrAg3/lYXi4CUctzrC3mJrRjXEtbNRjwdUKBASfiQohDHSu9AynY
         NRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9WcIJqK5tW/VPxp8cFQuUyQGE2zUtcBeGLt5pHboTcU=;
        b=RVMpo+2YdK1rLH8yEP5ehUbuvjBj/gFqWkIq3xOMrrSIjE59YeNdi9LNsLe8fxP7WH
         0KilclR5Ss89Vdd6gKYD33DU7LJEGcauGD/AUgZmLENbMwkMby/0fJupBOcpzmdRB+iV
         J9HScDUtWqOadxKTWr/0CRKaPePnwtdOGzZ4b3Jm9cR/kYVeuTYK05f6eQ0gKLT5NpEh
         vtuKB4UZ1Zlt2b7Wr41uQt89LrPTqu5rAy+DbT87xzQh/BveQ/7SMxA6jLkFYTa7w6+O
         EVBcjMUkSwdZYtDVDJ1dJrXz5bkJNTZtw8NlslR4ZEDFgiHUquuytfD0E3FcajtzZCIO
         d6vA==
X-Gm-Message-State: AOAM531awn7LBTAQB6XpNzm6g2RhtTFJ7u5xYkjCpfqYqifuyCtdB0JG
	o1yjTwU4DssegAetLLEPw2fLBR6u4dFYSffXFeo=
X-Google-Smtp-Source: ABdhPJwBcby6OLl+q0YlemgbtXAqJ4wBLfVzNmqawSeFuGctgOJh7dR3pRnv43tHCU12925C5tjdILPcJI3gRkLcL3M=
X-Received: by 2002:a05:622a:1445:: with SMTP id v5mr20102477qtx.82.1618983440065;
 Tue, 20 Apr 2021 22:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210420065508.16247-1-Qi.Chen@windriver.com> <fbdaa43b-b1e4-cffa-0a97-1da77679fc06@gmail.com>
 <d1ae4467-6051-28ee-1ae7-688a3db87092@windriver.com>
In-Reply-To: <d1ae4467-6051-28ee-1ae7-688a3db87092@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 20 Apr 2021 22:36:53 -0700
Message-ID: <CAMKF1sqdj0ppi5BzbN4vSWXKrsvUqOohH8viPyrUp+LPiqJSQA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] tigervnc: upgrade to 1.11.0
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

also check this

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1159

On Tue, Apr 20, 2021 at 8:26 PM ChenQi <Qi.Chen@windriver.com> wrote:
>
> On 04/20/2021 10:43 PM, Khem Raj wrote:
> >
> >
> > On 4/19/21 11:55 PM, Chen Qi wrote:
> >> Upgrade to latest stable version.
> >>
> >> The 1.10 branch is not maitained any more, it stops update in 2019.
> >> The 1.11 branch has fix for CVE-2020-26117, which is a high risk CVE.
> >> https://nvd.nist.gov/vuln/detail/CVE-2020-26117
> >>
> >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> ---
> >>   ...002-do-not-build-tests-sub-directory.patch | 21 +++++------
> >>   ...vnc-add-fPIC-option-to-COMPILE_FLAGS.patch | 36 +++++++------------
> >>   ...{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb} |  6 ++--
> >>   3 files changed, 28 insertions(+), 35 deletions(-)
> >>   rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.10.1.bb =>
> >> tigervnc_1.11.0.bb} (96%)
> >>
> >> diff --git
> >> a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
> >> b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
> >>
> >> index 4e875ba82..5a42e67d0 100644
> >> ---
> >> a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
> >> +++
> >> b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
> >> @@ -1,29 +1,30 @@
> >> -From c3460d63f0b6cd50b9a64265f420f0439e12a1d5 Mon Sep 17 00:00:00 2001
> >> -From: Hongxu Jia <hongxu.jia@windriver.com>
> >> -Date: Tue, 25 Apr 2017 01:36:44 -0400
> >> -Subject: [PATCH 2/4] do not build tests sub directory
> >> +From 076d0e12a7be6cd2108e4ca0dcde1cb658918fa5 Mon Sep 17 00:00:00 2001
> >> +From: Chen Qi <Qi.Chen@windriver.com>
> >> +Date: Mon, 19 Apr 2021 23:02:45 -0700
> >> +Subject: [PATCH] do not build tests sub directory
> >>   -Upstream-Status: Inappropriate [oe specific]
> >> +Upstream-Status: Inappropriate [OE Specific]
> >>   -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> +Signed-off-by: Hongxu Jia <Hongxu.Jia@windriver.com>
> >> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >>   ---
> >>    CMakeLists.txt | 3 ---
> >>    1 file changed, 3 deletions(-)
> >>     diff --git a/CMakeLists.txt b/CMakeLists.txt
> >> -index 94ec2ef..fb72a00 100644
> >> +index 7bf99441..bda80598 100644
> >>   --- a/CMakeLists.txt
> >>   +++ b/CMakeLists.txt
> >> -@@ -300,9 +300,6 @@ if(BUILD_VIEWER)
> >> +@@ -304,9 +304,6 @@ if(BUILD_VIEWER)
> >>      add_subdirectory(media)
> >>    endif()
> >>      -add_subdirectory(tests)
> >>   -
> >>   -
> >> - include(cmake/BuildPackages.cmake)
> >> + add_subdirectory(release)
> >>       # uninstall
> >>   --
> >> -2.7.4
> >> +2.30.2
> >>   diff --git
> >> a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
> >> b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
> >>
> >> index 97b0a388a..5f14665b8 100644
> >> ---
> >> a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
> >> +++
> >> b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
> >> @@ -1,44 +1,34 @@
> >> -From 9563b69640227da2220ee0c39077afb736cc96d1 Mon Sep 17 00:00:00 2001
> >> -From: Hongxu Jia <hongxu.jia@windriver.com>
> >> -Date: Thu, 20 Jul 2017 17:12:17 +0800
> >> -Subject: [PATCH 4/4] tigervnc: add fPIC option to COMPILE_FLAGS
> >> +From 7f8acd59bb2e54f9be25a98dd71534700a9e355a Mon Sep 17 00:00:00 2001
> >> +From: Chen Qi <Qi.Chen@windriver.com>
> >> +Date: Mon, 19 Apr 2021 23:14:28 -0700
> >> +Subject: [PATCH] tigervnc: add fPIC option to COMPILE_FLAGS
> >>   -The static libraries in Xregion/network/rdr/rfb were linked by shared
> >> +The static libraries in network/rdr/rfb were linked by shared
> >>   library libvnc.so, so we should add fPIC option to COMPILE_FLAGS to
> >> fix
> >>   relocation issue.
> >>     Upstream-Status: Pending
> >>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >>   ---
> >> - common/Xregion/CMakeLists.txt | 1 +
> >>    common/network/CMakeLists.txt | 1 +
> >>    common/rdr/CMakeLists.txt     | 1 +
> >>    common/rfb/CMakeLists.txt     | 1 +
> >> - 4 files changed, 4 insertions(+)
> >> + 3 files changed, 3 insertions(+)
> >>   -diff --git a/common/Xregion/CMakeLists.txt
> >> b/common/Xregion/CMakeLists.txt
> >> -index 40ca97e..9411328 100644
> >> ---- a/common/Xregion/CMakeLists.txt
> >> -+++ b/common/Xregion/CMakeLists.txt
> >> -@@ -3,4 +3,5 @@ add_library(Xregion STATIC
> >> -
> >> - if(UNIX)
> >> -   libtool_create_control_file(Xregion)
> >> -+  set_target_properties(Xregion PROPERTIES COMPILE_FLAGS -fPIC)
> >> - endif()
> >>   diff --git a/common/network/CMakeLists.txt
> >> b/common/network/CMakeLists.txt
> >> -index b624c8e..6c06ec9 100644
> >> +index d00ca452..e84e0290 100644
> >>   --- a/common/network/CMakeLists.txt
> >>   +++ b/common/network/CMakeLists.txt
> >> -@@ -9,4 +9,5 @@ endif()
> >> +@@ -16,4 +16,5 @@ endif()
> >>       if(UNIX)
> >>      libtool_create_control_file(network)
> >>   +  set_target_properties(network PROPERTIES COMPILE_FLAGS -fPIC)
> >>    endif()
> >>   diff --git a/common/rdr/CMakeLists.txt b/common/rdr/CMakeLists.txt
> >> -index 989ba2f..20f6489 100644
> >> +index 989ba2f4..20f6489d 100644
> >>   --- a/common/rdr/CMakeLists.txt
> >>   +++ b/common/rdr/CMakeLists.txt
> >>   @@ -27,4 +27,5 @@ target_link_libraries(rdr ${RDR_LIBRARIES})
> >> @@ -48,15 +38,15 @@ index 989ba2f..20f6489 100644
> >>   +  set_target_properties(rdr PROPERTIES COMPILE_FLAGS -fPIC)
> >>    endif()
> >>   diff --git a/common/rfb/CMakeLists.txt b/common/rfb/CMakeLists.txt
> >> -index 5047e5e..88838ab 100644
> >> +index fc5a37bf..7f5ce131 100644
> >>   --- a/common/rfb/CMakeLists.txt
> >>   +++ b/common/rfb/CMakeLists.txt
> >> -@@ -98,4 +98,5 @@ target_link_libraries(rfb ${RFB_LIBRARIES})
> >> +@@ -99,4 +99,5 @@ target_link_libraries(rfb ${RFB_LIBRARIES})
> >>       if(UNIX)
> >>      libtool_create_control_file(rfb)
> >>   +  set_target_properties(rfb PROPERTIES COMPILE_FLAGS -fPIC)
> >>    endif()
> >>   --
> >> -2.7.4
> >> +2.30.2
> >>   diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
> >> b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
> >> similarity index 96%
> >> rename from meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
> >> rename to meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
> >> index f97c2b2d6..1e7160aea 100644
> >> --- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
> >> +++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
> >> @@ -15,9 +15,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
> >>   inherit autotools cmake
> >>   B = "${S}"
> >>   -SRCREV = "4739493b635372bd40a34640a719f79fa90e4dba"
> >> +SRCREV = "540bfc3278e396321124d4b18a798ac2bc18b6ca"
> >>   -SRC_URI =
> >> "git://github.com/TigerVNC/tigervnc.git;branch=1.10-branch \
> >> +SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch \
> >>              file://0002-do-not-build-tests-sub-directory.patch \
> >> file://0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
> >> file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
> >> @@ -83,6 +83,8 @@ EXTRA_OECONF = "--disable-xorg --disable-xnest
> >> --disable-xvfb --disable-dmx \
> >>           --disable-xwayland \
> >>   "
> >>   +EXTRA_OECMAKE += "-DINSTALL_SYSTEMD_UNITS=OFF"
> >> +
> >
> > I wonder if this should be made conditional on systemd in
> > DISTRO_FEATURES ?
> >
> >
>
> Got it. I'll send out V2.
>
> Best Regards,
> Chen Qi
>
> >>   do_configure_append () {
> >>       olddir=`pwd`
> >>       cd ${XSERVER_SOURCE_DIR}
> >>
> >>
> >>
> >> 
> >>
> >
>
