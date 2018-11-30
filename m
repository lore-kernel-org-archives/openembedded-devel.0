Return-Path: <uvv.mail@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id E12806D6A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2018 07:55:44 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id k12so4962846qtf.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 23:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vyakp2W7oQITLDWfWDdTbWvQNRYYg7lgS6RsqkPUvAY=;
	b=BiWtHVsFxTa2bRaC1W4y8jJB9Ig+p8WN3Mcsp1/D/UYHMM2bbfJ+PB1IdZgkr0EuA4
	Mpmq9ZFsBnsacEg7/7+e2rqltCw8LHvwEtHPapsPXvqcSwj92QeR0q6a7DEvspCzPxIX
	kGy8WMUDuXypKfEgm8clNfXsfeaEATcvnj9kBOYRSLywUlBRKnl9UjhYuJBvzGOMKpYn
	RideW5hDjvgBg68ozECINx9T0S85OyxlYv5grdL9+0vlD1dyIAuCd9jFxaf3wmnS/4Ky
	KRzUlsoRbAKhsr0x/RwxpdAwlEpgJX8y+ds4ijCZZZfYv4CMiMNqRFGcFeGT14UJz7ub
	76Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vyakp2W7oQITLDWfWDdTbWvQNRYYg7lgS6RsqkPUvAY=;
	b=WQCU9xXl3WEehKbQbzgfPZKSrjRxgs8dbR739WRW2E+c/RtfsWdwU6I90B5AapA1yI
	6NOTQP6ZK0O0PSyTVDecFqrkMDadbzdhD2Z/9tXaEuwodMWeE9D6B3BvaEOMZO/Fpe9t
	jwBh1nKVTgxiPTltOqukAOqERG+MvSBzkaW0GgcS0xXKCRqygtPCtwExT0+ubP/MNkCZ
	HpcwmQbKG1JlKJTCso76vAejdWOoK42fNZNXDzmaE4AZlWME8erG/rEbgaFP7rP6gdK7
	pizWqwqnYjyxU5O1p4hwoDO45rJzGatCToXdkj07fPz217GVfgSbTxlN2FKZFAw9YAzT
	Nw0A==
X-Gm-Message-State: AA+aEWbpKqi6WBi5Z+yMlKMJkhX1AbrAeKPHFi3WjaagBLlkJVJ5apAU
	Uib9fK1zB3dNvF3f//W6MaUHqhgHknKdUR0HD9U=
X-Google-Smtp-Source: AFSGD/XFygWkQj08Bd7bJ0cp1xJ/HAU8LsOLqPU8HXwUfepHg6z5cDMbsAy6d8l360+AnK0D3QO+TbfdXsHIWqngreA=
X-Received: by 2002:a0c:f143:: with SMTP id y3mr4660367qvl.21.1543564545761;
	Thu, 29 Nov 2018 23:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20181120145631.70102-1-uvv.mail@gmail.com>
	<CA+chaQd8u--V+6QcD1vnH8HdLuEKp75p7rQhXfNwLOu+HAQ0Hg@mail.gmail.com>
In-Reply-To: <CA+chaQd8u--V+6QcD1vnH8HdLuEKp75p7rQhXfNwLOu+HAQ0Hg@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Date: Fri, 30 Nov 2018 08:55:34 +0100
Message-ID: <CAKHfEagnSLdftrW0WOOX_HdOqC66ciDS01o+f9par-TJapJfNQ@mail.gmail.com>
To: martin.jansa@gmail.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Vyacheslav.Yurkov@bruker.com, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] glog: fixed the build for mips and other platforms
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
X-List-Received-Date: Fri, 30 Nov 2018 07:55:45 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Martin,
I guess this issue is supposed to be fixed in glog master already, because
it uses ${CMAKE_INSTALL_LIBDIR}, not hard-coded "lib". I will backport a
patch for that

Regards,
Vyacheslav

On Thu, Nov 29, 2018 at 4:51 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> Hi,
>
> there is one more issue when multilib is enabled.
>
> ERROR: QA Issue: glog: Files/directories were installed but not shipped in
> any package:
>   /usr/lib/libglog.so.0.3.5
>   /usr/lib/libglog.so.0
>   /usr/lib/libglog.so
>   /usr/lib/cmake
>   /usr/lib/cmake/glog
>   /usr/lib/cmake/glog/glog-config-version.cmake
>   /usr/lib/cmake/glog/FindLibunwind.cmake
>   /usr/lib/cmake/glog/glog-targets-noconfig.cmake
>   /usr/lib/cmake/glog/glog-config.cmake
>   /usr/lib/cmake/glog/glog-targets.cmake
> Please set FILES such that these items are packaged. Alternatively if they
> are unneeded, avoid installing them or delete them within do_install.
> glog: 10 installed and not shipped files. [installed-vs-shipped]
>
> It shouldn't hardcode "lib" directory and it should respect libdir from OE
> environment instead (in this case /usr/lib64).
>
> On Tue, Nov 20, 2018 at 3:57 PM Vyacheslav Yurkov <uvv.mail@gmail.com>
> wrote:
>
>> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>>
>> According to build log
>> http://errors.yoctoproject.org/Errors/Details/201286/
>> FindLibunwind wokred only for x86, arm, and x86_64. This patch extends the
>> cmake module to work with mips, ia64, ppc(64) and other architectures
>> supported
>> by libunwind
>>
>> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>> ---
>>  ...0002-Find-Libunwind-during-configure.patch | 53 +++++++++++--------
>>  1 file changed, 30 insertions(+), 23 deletions(-)
>>
>> diff --git
>> a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
>> b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
>> index 3a6f824ea..15cf67fd2 100644
>> ---
>> a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
>> +++
>> b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
>> @@ -1,11 +1,11 @@
>>  diff -uNr a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
>>  --- a/cmake/FindLibunwind.cmake        1970-01-01 01:00:00.000000000
>> +0100
>> -+++ b/cmake/FindLibunwind.cmake        2018-11-02 14:04:35.460437058
>> +0100
>> -@@ -0,0 +1,37 @@
>> ++++ b/cmake/FindLibunwind.cmake        2018-11-20 15:53:48.799078114
>> +0100
>> +@@ -0,0 +1,54 @@
>>  +# - Try to find libunwind
>>  +# Once done this will define
>>  +#
>> -+#  LIBUNWIND_FOUND - system has libunwind
>> ++#  Libunwind_FOUND - system has libunwind
>>  +#  unwind - cmake target for libunwind
>>  +
>>  +find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
>> @@ -15,11 +15,24 @@ diff -uNr a/cmake/FindLibunwind.cmake
>> b/cmake/FindLibunwind.cmake
>>  +
>>  +if (CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
>>  +    set(LIBUNWIND_ARCH "arm")
>> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^aarch64")
>> ++    set(LIBUNWIND_ARCH "aarch64")
>>  +elseif (CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64" OR
>> -+        CMAKE_SYSTEM_PROCESSOR STREQUAL "amd64")
>> ++        CMAKE_SYSTEM_PROCESSOR STREQUAL "amd64" OR
>> ++        CMAKE_SYSTEM_PROCESSOR STREQUAL "corei7-64")
>>  +    set(LIBUNWIND_ARCH "x86_64")
>>  +elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^i.86$")
>>  +    set(LIBUNWIND_ARCH "x86")
>> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc64")
>> ++    set(LIBUNWIND_ARCH "ppc64")
>> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc")
>> ++    set(LIBUNWIND_ARCH "ppc32")
>> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^mips")
>> ++    set(LIBUNWIND_ARCH "mips")
>> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^hppa")
>> ++    set(LIBUNWIND_ARCH "hppa")
>> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ia64")
>> ++    set(LIBUNWIND_ARCH "ia64")
>>  +endif()
>>  +
>>  +find_library (UNWIND_LIBRARY_PLATFORM NAMES "unwind-${LIBUNWIND_ARCH}"
>> DOC "unwind library platform")
>> @@ -35,13 +48,17 @@ diff -uNr a/cmake/FindLibunwind.cmake
>> b/cmake/FindLibunwind.cmake
>>  +
>>  +mark_as_advanced (UNWIND_LIBRARY UNWIND_LIBRARY_PLATFORM)
>>  +
>> -+add_library(unwind INTERFACE IMPORTED)
>> -+set_target_properties(unwind PROPERTIES
>> -+    INTERFACE_LINK_LIBRARIES
>> "${UNWIND_LIBRARY};${UNWIND_LIBRARY_PLATFORM}"
>> -+)
>> ++if (Libunwind_FOUND)
>> ++    add_library(unwind INTERFACE IMPORTED)
>> ++    set_target_properties(unwind PROPERTIES
>> ++        INTERFACE_LINK_LIBRARIES
>> "${UNWIND_LIBRARY};${UNWIND_LIBRARY_PLATFORM}"
>> ++    )
>> ++else()
>> ++    message("Can't find libunwind library")
>> ++endif()
>>  diff -uNr a/CMakeLists.txt b/CMakeLists.txt
>> ---- a/CMakeLists.txt   2018-11-02 14:02:21.784835854 +0100
>> -+++ b/CMakeLists.txt   2018-11-02 14:03:16.796935594 +0100
>> +--- a/CMakeLists.txt   2018-11-20 15:49:07.576278417 +0100
>> ++++ b/CMakeLists.txt   2018-11-20 15:49:32.106819928 +0100
>>  @@ -58,7 +58,6 @@
>>   check_include_file (execinfo.h HAVE_EXECINFO_H)
>>   check_include_file (glob.h HAVE_GLOB_H)
>> @@ -91,23 +108,13 @@ diff -uNr a/CMakeLists.txt b/CMakeLists.txt
>>     DESTINATION lib/cmake/glog)
>>
>>   install (EXPORT glog-targets NAMESPACE glog:: DESTINATION
>> lib/cmake/glog)
>> -Binary files a/.git/index and b/.git/index differ
>>  diff -uNr a/glog-config.cmake.in b/glog-config.cmake.in
>> ---- a/glog-config.cmake.in     2018-11-02 14:02:21.784835854 +0100
>> -+++ b/glog-config.cmake.in     2018-11-02 14:03:16.796935594 +0100
>> -@@ -4,4 +4,15 @@
>> +--- a/glog-config.cmake.in     2018-11-20 15:49:07.576278417 +0100
>> ++++ b/glog-config.cmake.in     2018-11-20 15:52:32.330418489 +0100
>> +@@ -4,4 +4,6 @@
>>
>>   @gflags_DEPENDENCY@
>>
>> -+# Record the state of the CMake module path when this script was
>> -+# called so that we can ensure that we leave it in the same state on
>> -+# exit as it was on entry, but modify it locally.
>> -+set(UNWIND_CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH})
>> -+
>> -+set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
>>  +find_dependency (Libunwind)
>> -+
>> -+# Restore original module path
>> -+set(CMAKE_MODULE_PATH "${UNWIND_CMAKE_MODULE_PATH}")
>>  +
>>   include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
>> --
>> 2.19.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

