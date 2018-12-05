Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4D6BC6C118
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 16:58:22 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id j2so20467272wrw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2018 08:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=DbbCh4RqdywDwXsofNLutou+m0EFhEphxmq6VMr9ciE=;
	b=Su2Y9iH/qY+ONfZzGc5V4ks9xzj7eF1OxTKnVqvAYgRb4i1WDhMaqUCBCb/DY2XwTk
	XQMF9qohA/2sdcKoqhqZpbQjpa41tZx0CvYdZIL74XgVTzh0PttshCu/BD8TdOwSTYhw
	LRQp7gAMyu3Ox53aVyJQKexcnyu+j+fPYgA2FwnTLZDP7cD8GZmJWIhpNoIw3d3wiGJl
	y9c8OD/qPitAQ3NNOcdk5v2kQfCIyH0/ucicEka07u7Gel4SHNj+DslV2nmhswrMjDKq
	OefKipIzvHke036Rp/Dja4/s3eaMC9T7+KVle1Ni+mFc0YDv2cyYUyPNHzhatl9SS835
	GdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=DbbCh4RqdywDwXsofNLutou+m0EFhEphxmq6VMr9ciE=;
	b=ugPDiYCT5OaP727PjTz/cRBke75sYsvu1byk+RtsG2QzeIIoo3Q+PV3WNa7BXeUVsW
	RoRwa2W6fblpDCEniVh/xY93N+NjUty0/oiu5T+5TE2QlT4yI8gGnD63J/QAHYx2YD2w
	tgLL0FLXwpohUUGPx+DEm1M2GULXaU18H/jkM0H9vkB5723Mt7FuYfl+m9kVCA0SEGRt
	oV7KRYoN+OVy/SKn05EP6P94Ax0ZTPmkjrZYikLgOqVSRBFBYLi7CsPgDaonjDOtB2EQ
	eVrzWpsuSqX2lP6yktFTKMuCaQjd4dh6NLoVS3po7ynXc3ROCL1MEMfBKgFdJaTgYX9r
	uHWQ==
X-Gm-Message-State: AA+aEWaedyUTUPTo7CCAkZRRQ6zpkDugiU3fgIeRVj5dZL6qOjbnyizX
	2rlyap0I8D4qAmQmySf9J2wX259oAYP9xyfK9ZXgrkAR
X-Google-Smtp-Source: AFSGD/WG8pgB5KMT2DW9NVDPwqBKTkj5C3uontnHVidxkbVJ85C3ZoKN6TySxlxbnyDqbWvVHuJEvNGSXAAM7inXdog=
X-Received: by 2002:a05:6000:110f:: with SMTP id
	z15mr21449931wrw.136.1544029102043; 
	Wed, 05 Dec 2018 08:58:22 -0800 (PST)
MIME-Version: 1.0
References: <20181205121357.116604-1-uvv.mail@gmail.com>
	<20181205150052.27047-1-Martin.Jansa@gmail.com>
In-Reply-To: <20181205150052.27047-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 5 Dec 2018 17:58:10 +0100
Message-ID: <CA+chaQeK+jVNOcCnUQLjoNLeMpgHS-KHqgCf16rFfpZ=Jni7TQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Wed, 05 Dec 2018 16:58:22 -0000
Content-Type: text/plain; charset="UTF-8"

This might be actually unnecessary with the:

+list (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")

which sneaked in, in the "glog: fix installation path"

On Wed, Dec 5, 2018 at 4:00 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> * libunwind is not found when using find_package(glog) from some
>   other recipe, without this change it fails with:
>
> CMake Error at
> /OE/build/owpb/webos-ports/tmp-glibc/work/tissot-webos-linux/mtp-server/0.0.3+gitrAUTOINC+6159f1a143-r0/recipe-sysroot-native/usr/share/cmake-3.12/Modules/CMakeFindDependencyMacro.cmake:48
> (find_package):
>   By not providing "FindLibunwind.cmake" in CMAKE_MODULE_PATH this project
>   has asked CMake to find a package configuration file provided by
>   "Libunwind", but CMake did not find one.
>
>   Could not find a package configuration file provided by "Libunwind" with
>   any of the following names:
>
>     LibunwindConfig.cmake
>     libunwind-config.cmake
>
>   Add the installation prefix of "Libunwind" to CMAKE_PREFIX_PATH or set
>   "Libunwind_DIR" to a directory containing one of the above files.  If
>   "Libunwind" provides a separate development package or SDK, be sure it
> has
>   been installed.
> Call Stack (most recent call first):
>
> /OE/build/owpb/webos-ports/tmp-glibc/work/tissot-webos-linux/mtp-server/0.0.3+gitrAUTOINC+6159f1a143-r0/recipe-sysroot/usr/lib/cmake/glog/glog-config.cmake:31
> (find_dependency)
>   CMakeLists.txt:17 (find_package)
>
> -- Configuring incomplete, errors occurred!
>
> * this might help others when upgrading to thud which has newer glog:
>
> mtp-server in meta-luneos layer is the only user of glog I could find
> in public layers, it was failing to build with 0.3.5 version of glog
> (and building fine with 0.3.4 glog which was built with autotools
> instead of cmake and provided pkg-config instead of glog-config.cmake)
>
> First part is relatively simple, update CMakeLists.txt to use cmake
> machinery instead of pkg-config:
>
> -pkg_check_modules(GLOG REQUIRED libglog)
> +find_package(glog 0.3.5 REQUIRED)
>
> and update the use of GLOG_* variables, e.g.:
> -  ${GLOG_LIBRARIES}
> +  glog::glog
>
> interestingly glog::glog passes the glog library with whole path, in my
> case:
>   /OE/build/owpb/webos-ports/tmp-glibc/work/tissot-webos-linux/ \
>   mtp-server/0.0.3+gitrAUTOINC+6159f1a143-r0/recipe-sysroot/usr/lib/ \
>   libglog.so.0.3.5 -lunwind -lunwind-aarch64
> instead of just -lglog -unwind -lunwind-aarch64 which would work as
> well, because sysroot is configured correctly elsewhere.
>
> I'm not sure if this is really expected behavior of glog::glog or
> another bug in glog-config.cmake.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../0002-Find-Libunwind-during-configure.patch    | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git
> a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
> b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
> index 15cf67fd2e..4d7642a907 100644
> ---
> a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
> +++
> b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
> @@ -109,12 +109,21 @@ diff -uNr a/CMakeLists.txt b/CMakeLists.txt
>
>   install (EXPORT glog-targets NAMESPACE glog:: DESTINATION lib/cmake/glog)
>  diff -uNr a/glog-config.cmake.in b/glog-config.cmake.in
> ---- a/glog-config.cmake.in     2018-11-20 15:49:07.576278417 +0100
> -+++ b/glog-config.cmake.in     2018-11-20 15:52:32.330418489 +0100
> -@@ -4,4 +4,6 @@
> +--- a/glog-config.cmake.in     2018-11-02 14:02:21.784835854 +0100
> ++++ b/glog-config.cmake.in     2018-11-02 14:03:16.796935594 +0100
> +@@ -4,4 +4,15 @@
>
>   @gflags_DEPENDENCY@
>
> ++# Record the state of the CMake module path when this script was
> ++# called so that we can ensure that we leave it in the same state on
> ++# exit as it was on entry, but modify it locally.
> ++set(UNWIND_CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH})
> ++
> ++set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
>  +find_dependency (Libunwind)
> ++
> ++# Restore original module path
> ++set(CMAKE_MODULE_PATH "${UNWIND_CMAKE_MODULE_PATH}")
>  +
>   include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
> --
> 2.17.1
>
>

