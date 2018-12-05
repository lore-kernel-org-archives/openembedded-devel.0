Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id A86DF6D1AC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 21:33:26 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id t13so24091509qtn.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2018 13:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YN7gQGXLC9qOYjxAfkRhkMa+9Sf7noY2ehL2JjYiAaU=;
	b=ewZuyih2aUNjc894ZuArynhMIcx2/rnaYrVjibU8s4uYrp40STl0dehSgpb4/8t8f6
	nK6ha2xo3Dx6hwNFW9eLeHTpx2JdqEyXqQTeYeE6Ghax9sLCgLNjqTJlfE6mqkzPlur/
	oLiYmuEbRDM7pZo37uNn7oSls+L9cHfiBKLdvLqJ/bW/5OXIe+UPTaxJTR3EWdQvGWNc
	SKSaSM43RfUyp5+TqXEfBq9FpZtcoeY975xjPkWUJQLDgN5Cku3pnw2nO7I27GwIs9tg
	IWaX0VnJPLEXYzc7qS3UxEhFOV7d3FU6NKBhrJvqxrrQ0nnsAtRvEfAQHVQi1M+6NpVr
	0iSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YN7gQGXLC9qOYjxAfkRhkMa+9Sf7noY2ehL2JjYiAaU=;
	b=XFm4kTo3ZTk6mETJoT1BFgTimbiyv086/oZE38P4hpwK8vk7MqJTVKX6fAgilTEDkf
	V4nYJ1OuJScdKRXmgcu6awBBQO09hz2kGHJd/5Aokelr6xWO/+Lb7l2fJ401aAt8BVLB
	9UkFzgb4Izny8Dov1Ej6+QqKCQQNsJ1OvQdh9UQGGImJfnv97aZAM9DCcSE3OR2QQFxW
	9n69gSL6iKQ9lbTKzbj5oK3VkJfeI6D49RayTpEXOM5f6DVtk/R0yfG470qwF9DGiBHW
	9LRuBj5YaNit/+Unnr9bsgLjTCVOoA9aybOaxd7xxkujgjhkipD0KjTYzGrmg7wKLszZ
	sdhA==
X-Gm-Message-State: AA+aEWa9CHLxV5mzkGAlRA70LqdsqAUQbHcdFL8UHqJYtFfdsuk7l49Y
	SbrMrAjHGXbifC5DDv27ca/mueXfzpAcPMg7JiA=
X-Google-Smtp-Source: AFSGD/UN48PSDsj71VCdrrunlYNf5T3DuVaDBI8xKlXMjyhdhdwEntxmHJnvZKJ8Lf9CvSP+glvgK246Y7o2Si4PjPo=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr24916371qtf.196.1544045607015;
	Wed, 05 Dec 2018 13:33:27 -0800 (PST)
MIME-Version: 1.0
References: <20181205121357.116604-1-uvv.mail@gmail.com>
	<20181205150052.27047-1-Martin.Jansa@gmail.com>
	<CA+chaQeK+jVNOcCnUQLjoNLeMpgHS-KHqgCf16rFfpZ=Jni7TQ@mail.gmail.com>
In-Reply-To: <CA+chaQeK+jVNOcCnUQLjoNLeMpgHS-KHqgCf16rFfpZ=Jni7TQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Dec 2018 13:33:00 -0800
Message-ID: <CAMKF1sorQ3k8Tm4dyo2P2Fw7LBi4P=9hMiWdw4XfM-w6AKB2Ag@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] glog: fix libunwind search in components which depend on glog
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2018 21:33:27 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Martin, I have picked https://patchwork.openembedded.org/patch/156922/
hopefully that is all we need
On Wed, Dec 5, 2018 at 8:58 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> This might be actually unnecessary with the:
>
> +list (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
>
> which sneaked in, in the "glog: fix installation path"
>
> On Wed, Dec 5, 2018 at 4:00 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> > * libunwind is not found when using find_package(glog) from some
> >   other recipe, without this change it fails with:
> >
> > CMake Error at
> > /OE/build/owpb/webos-ports/tmp-glibc/work/tissot-webos-linux/mtp-server/0.0.3+gitrAUTOINC+6159f1a143-r0/recipe-sysroot-native/usr/share/cmake-3.12/Modules/CMakeFindDependencyMacro.cmake:48
> > (find_package):
> >   By not providing "FindLibunwind.cmake" in CMAKE_MODULE_PATH this project
> >   has asked CMake to find a package configuration file provided by
> >   "Libunwind", but CMake did not find one.
> >
> >   Could not find a package configuration file provided by "Libunwind" with
> >   any of the following names:
> >
> >     LibunwindConfig.cmake
> >     libunwind-config.cmake
> >
> >   Add the installation prefix of "Libunwind" to CMAKE_PREFIX_PATH or set
> >   "Libunwind_DIR" to a directory containing one of the above files.  If
> >   "Libunwind" provides a separate development package or SDK, be sure it
> > has
> >   been installed.
> > Call Stack (most recent call first):
> >
> > /OE/build/owpb/webos-ports/tmp-glibc/work/tissot-webos-linux/mtp-server/0.0.3+gitrAUTOINC+6159f1a143-r0/recipe-sysroot/usr/lib/cmake/glog/glog-config.cmake:31
> > (find_dependency)
> >   CMakeLists.txt:17 (find_package)
> >
> > -- Configuring incomplete, errors occurred!
> >
> > * this might help others when upgrading to thud which has newer glog:
> >
> > mtp-server in meta-luneos layer is the only user of glog I could find
> > in public layers, it was failing to build with 0.3.5 version of glog
> > (and building fine with 0.3.4 glog which was built with autotools
> > instead of cmake and provided pkg-config instead of glog-config.cmake)
> >
> > First part is relatively simple, update CMakeLists.txt to use cmake
> > machinery instead of pkg-config:
> >
> > -pkg_check_modules(GLOG REQUIRED libglog)
> > +find_package(glog 0.3.5 REQUIRED)
> >
> > and update the use of GLOG_* variables, e.g.:
> > -  ${GLOG_LIBRARIES}
> > +  glog::glog
> >
> > interestingly glog::glog passes the glog library with whole path, in my
> > case:
> >   /OE/build/owpb/webos-ports/tmp-glibc/work/tissot-webos-linux/ \
> >   mtp-server/0.0.3+gitrAUTOINC+6159f1a143-r0/recipe-sysroot/usr/lib/ \
> >   libglog.so.0.3.5 -lunwind -lunwind-aarch64
> > instead of just -lglog -unwind -lunwind-aarch64 which would work as
> > well, because sysroot is configured correctly elsewhere.
> >
> > I'm not sure if this is really expected behavior of glog::glog or
> > another bug in glog-config.cmake.
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../0002-Find-Libunwind-during-configure.patch    | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git
> > a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
> > b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
> > index 15cf67fd2e..4d7642a907 100644
> > ---
> > a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
> > +++
> > b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
> > @@ -109,12 +109,21 @@ diff -uNr a/CMakeLists.txt b/CMakeLists.txt
> >
> >   install (EXPORT glog-targets NAMESPACE glog:: DESTINATION lib/cmake/glog)
> >  diff -uNr a/glog-config.cmake.in b/glog-config.cmake.in
> > ---- a/glog-config.cmake.in     2018-11-20 15:49:07.576278417 +0100
> > -+++ b/glog-config.cmake.in     2018-11-20 15:52:32.330418489 +0100
> > -@@ -4,4 +4,6 @@
> > +--- a/glog-config.cmake.in     2018-11-02 14:02:21.784835854 +0100
> > ++++ b/glog-config.cmake.in     2018-11-02 14:03:16.796935594 +0100
> > +@@ -4,4 +4,15 @@
> >
> >   @gflags_DEPENDENCY@
> >
> > ++# Record the state of the CMake module path when this script was
> > ++# called so that we can ensure that we leave it in the same state on
> > ++# exit as it was on entry, but modify it locally.
> > ++set(UNWIND_CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH})
> > ++
> > ++set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
> >  +find_dependency (Libunwind)
> > ++
> > ++# Restore original module path
> > ++set(CMAKE_MODULE_PATH "${UNWIND_CMAKE_MODULE_PATH}")
> >  +
> >   include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
> > --
> > 2.17.1
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

