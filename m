Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.1843.1615402457153034032
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 10:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mv0YcboF;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id w60so8960379qte.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Mar 2021 10:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y0aqS8SO4hdtNQEkD7vZ6s6eG/L2RGgDWMd4tXTIhdg=;
        b=mv0YcboFR6Mix61w6n7pa4bJPJZmcApLTDRYc6qY58fkveMJVb0oOGj3kYjNWMU7eR
         2JnqdaK/O6+5pZb5GgHE9Q7Hb43sLPYDf1Q9VJwqgOvUmJvjTGAbT/LZi4SOdUAQ4yl6
         I+KwC60X1IXTjWnr3pjHkYsF/E2pq/Z+zExJsW42GWWTYq0bUB13yzoaJsllk7N+oL7Z
         YSO7/uNtqWbX7FLeM3gEb9NuU08XbuHkJ2yf30C9YW+AOpB2YiZqAMP+k3VC063P+RW6
         p3FfJZk3vIB9ZF214Eu7krNGK2Fp011bP0rnIqP2SzRZ8iOLq15hDKjC+YZpYRXSG1+H
         hPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y0aqS8SO4hdtNQEkD7vZ6s6eG/L2RGgDWMd4tXTIhdg=;
        b=f1azQGDrQCFhIeeeVtEMaB46hzT/8r08qYJfwGRGvnL+YLkig098TgA+INyfhYBWnl
         7PMdrw6cmnMg4bb+EgP4uvydjQIVIuylcM1y4FuQ+exPW1EyfFmVHvYQTRzRzlJ0Hl9O
         iokxPCDS199+xp1BwE8QcPRCnDVulpavhAD09ZjW0gE5FOuYcsD3wPlDN8pLiTBRfxlV
         F4Xe/L7qEw1MTQfu4F6iUIuE6fyeafRL617j38Wf7tun/TTUU7+mVkaVauZerfQ/56dh
         EBMzlygNo/xGUpm04hNPN+bckFl6yl0Ot6YDJJR0cVyTbeJi67v0mXPQKcXiNYGCzXpW
         02pg==
X-Gm-Message-State: AOAM532pp0popaye1r6UZy+VZhb/ZckR1j9yOxSMOaLGZQBPujXHLGIo
	8iUduALHDUdwyCe/cd+TOqPk+BmeCYo/QS0+mLk=
X-Google-Smtp-Source: ABdhPJxgstj2j3vpm5E2eVPpopiXpI/QNWtPhHf1NIHnsmVVSl8SRrzD8/D8/Z8MUYDLYrvD0bgkptfbQhoIivZccVw=
X-Received: by 2002:ac8:a42:: with SMTP id f2mr4031139qti.214.1615402456116;
 Wed, 10 Mar 2021 10:54:16 -0800 (PST)
MIME-Version: 1.0
References: <20210310181748.1926205-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210310181748.1926205-1-Martin.Jansa@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 10 Mar 2021 10:53:49 -0800
Message-ID: <CAMKF1soQ=Mep32oYHWkUPke9ag+e4PUz4jJzyfRx=aDhh4i5ZA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] glog: fix searching for Libunwind
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

thanks for fixing it. it would be good if some such dep was in meta-oe

On Wed, Mar 10, 2021 at 10:17 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> * it used to be part of 0003-installation-path-fix.patch which was removed during
>   the upgrade to 0.4.0 and now some recipes (e.g. mtp-server from meta-luneos) are
>   failing like:
>   CMake Error at /OE/build/luneos-hardknott/webos-ports/tmp-glibc/work/tissot-webos-linux/mtp-server/0.0.3+gitAUTOINC+bb4a81e61b-r0/recipe-sysroot-native/usr/share/cmake-3.19/Modules/CMakeFindDependencyMacro.cmake:47 (find_package):
>     By not providing "FindLibunwind.cmake" in CMAKE_MODULE_PATH this project
>     has asked CMake to find a package configuration file provided by
>     "Libunwind", but CMake did not find one.
>
>     Could not find a package configuration file provided by "Libunwind" with
>     any of the following names:
>
>       LibunwindConfig.cmake
>       libunwind-config.cmake
>
>     Add the installation prefix of "Libunwind" to CMAKE_PREFIX_PATH or set
>     "Libunwind_DIR" to a directory containing one of the above files.  If
>     "Libunwind" provides a separate development package or SDK, be sure it has
>     been installed.
>   Call Stack (most recent call first):
>     /OE/build/luneos-hardknott/webos-ports/tmp-glibc/work/tissot-webos-linux/mtp-server/0.0.3+gitAUTOINC+bb4a81e61b-r0/recipe-sysroot/usr/lib/cmake/glog/glog-config.cmake:35 (find_dependency)
>     CMakeLists.txt:17 (find_package)
>
>   because LibunwindConfig.cmake is provided by glog as:
>   recipe-sysroot/usr/lib/cmake/glog/FindLibunwind.cmake
>   but this directory wasn't searched by CMake.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../glog/glog/0001-Find-Libunwind-during-configure.patch       | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/glog/glog/0001-Find-Libunwind-during-configure.patch b/meta-oe/recipes-support/glog/glog/0001-Find-Libunwind-during-configure.patch
> index 577007a62e..4c0861cca1 100644
> --- a/meta-oe/recipes-support/glog/glog/0001-Find-Libunwind-during-configure.patch
> +++ b/meta-oe/recipes-support/glog/glog/0001-Find-Libunwind-during-configure.patch
> @@ -109,10 +109,11 @@
>   install (EXPORT glog-targets NAMESPACE glog:: DESTINATION
>  --- a/glog-config.cmake.in
>  +++ b/glog-config.cmake.in
> -@@ -8,4 +8,6 @@ include (CMakeFindDependencyMacro)
> +@@ -8,4 +8,7 @@ include (CMakeFindDependencyMacro)
>
>   @gflags_DEPENDENCY@
>
> ++list (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
>  +find_dependency (Libunwind)
>  +
>   include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
> --
> 2.30.1
>
>
> 
>
