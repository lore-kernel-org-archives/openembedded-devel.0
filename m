Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2296D688
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2018 08:21:00 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id v13so4372476wrw.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2018 00:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Gq28ebDOu7T+y00gOwk+Uwgs6tuRazj4LRvXKyIDim0=;
	b=aYGfgFnXV9g3B3GYyCIHnWtw3X+DXDF1U3QV/ZnaqwTOiRX0Y5lHCzjXjrn8JNmdgN
	uRRiW8wWNMC2BJhfZqSC/+m2oGUodojgr/ol/QwldrgjYDbewZukVvgRzv41kjkwy6ta
	Jsv//7HnoW8glTxuwKukOkVKdbs5Z0BvINtesgmY54vCYLWPQK6m+3PM+0E5w09Pe44l
	cJA26hgj0H80sc37KiRqdabsfwJPfHBduKe1TdUPLhPuzWGtgxxRFcaRBVmApU1YmQ9e
	xFqyAPs40kpToEy1yCstHtn12ZDvhPt+bI/3SVpJQzNA8g4p9GlqQ4TZEcJinpJfxz0p
	rZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Gq28ebDOu7T+y00gOwk+Uwgs6tuRazj4LRvXKyIDim0=;
	b=XCeBEovG9DS6VeT8nY1KRQml2qeH62Y/IyBPRcUK+btPdJgUp3aQh68PtptsdfkPIH
	bUblCno+XRKFUxvV0QSAl0N08xZA8eKweP0Ads2cjIgSlgbVmNY7caIRZxlsdRTVlogi
	3E1yctajWiz2ybrusoYVyfqFQmO8YsOEOxXZ8JRenTcE4sHqTxXEJm0EoBZNxFxFRbS0
	usjFnt+QjbKhwpAykeqev3LDpKN8f5lXMd+zKkVrc1vTWOwZrSV/6oAWVpfK/9l+GuU9
	lWbps5vkSzCaz3lfeYqxa4JetuBa+LhV+HT40FHvHYJRCyXTShCMcp2cNiieEdJ3tLwM
	EG6g==
X-Gm-Message-State: AA+aEWbankPfg0Csihnz04PH20BF/YXm72soWlx3OFi7Q0WIhdHywpkF
	We4HSlqox8rwMCr25VUkWotvmOCa76sGs8+XZ24=
X-Google-Smtp-Source: AFSGD/VlK/YwwSsVa2mzoWqN7KaP7W777RDpRLBlsrqu7wxFl4dAwnfH4lMi71oZbvb5CPUCmt+pq1VRHw+tT25bghE=
X-Received: by 2002:a5d:5111:: with SMTP id s17mr3971903wrt.43.1543566060670; 
	Fri, 30 Nov 2018 00:21:00 -0800 (PST)
MIME-Version: 1.0
References: <20181120145631.70102-1-uvv.mail@gmail.com>
	<CA+chaQd8u--V+6QcD1vnH8HdLuEKp75p7rQhXfNwLOu+HAQ0Hg@mail.gmail.com>
	<CAKHfEagnSLdftrW0WOOX_HdOqC66ciDS01o+f9par-TJapJfNQ@mail.gmail.com>
In-Reply-To: <CAKHfEagnSLdftrW0WOOX_HdOqC66ciDS01o+f9par-TJapJfNQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 30 Nov 2018 09:20:51 +0100
Message-ID: <CA+chaQffmqUa0Ar6pr0g-kPGeRNrhVQ8TO39HUx8FXhmFqP5wQ@mail.gmail.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Vyacheslav.Yurkov@bruker.com,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 30 Nov 2018 08:21:00 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks, if you don't have mulitib build ready, I can test it as soon as you
send it to ML.

On Fri, Nov 30, 2018 at 8:55 AM Vyacheslav Yurkov <uvv.mail@gmail.com>
wrote:

> Hi Martin,
> I guess this issue is supposed to be fixed in glog master already, because
> it uses ${CMAKE_INSTALL_LIBDIR}, not hard-coded "lib". I will backport a
> patch for that
>
> Regards,
> Vyacheslav
>
> On Thu, Nov 29, 2018 at 4:51 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Hi,
>>
>> there is one more issue when multilib is enabled.
>>
>> ERROR: QA Issue: glog: Files/directories were installed but not shipped
>> in any package:
>>   /usr/lib/libglog.so.0.3.5
>>   /usr/lib/libglog.so.0
>>   /usr/lib/libglog.so
>>   /usr/lib/cmake
>>   /usr/lib/cmake/glog
>>   /usr/lib/cmake/glog/glog-config-version.cmake
>>   /usr/lib/cmake/glog/FindLibunwind.cmake
>>   /usr/lib/cmake/glog/glog-targets-noconfig.cmake
>>   /usr/lib/cmake/glog/glog-config.cmake
>>   /usr/lib/cmake/glog/glog-targets.cmake
>> Please set FILES such that these items are packaged. Alternatively if
>> they are unneeded, avoid installing them or delete them within do_install.
>> glog: 10 installed and not shipped files. [installed-vs-shipped]
>>
>> It shouldn't hardcode "lib" directory and it should respect libdir from
>> OE environment instead (in this case /usr/lib64).
>>
>> On Tue, Nov 20, 2018 at 3:57 PM Vyacheslav Yurkov <uvv.mail@gmail.com>
>> wrote:
>>
>>> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>>>
>>> According to build log
>>> http://errors.yoctoproject.org/Errors/Details/201286/
>>> FindLibunwind wokred only for x86, arm, and x86_64. This patch extends
>>> the
>>> cmake module to work with mips, ia64, ppc(64) and other architectures
>>> supported
>>> by libunwind
>>>
>>> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>>> ---
>>>  ...0002-Find-Libunwind-during-configure.patch | 53 +++++++++++--------
>>>  1 file changed, 30 insertions(+), 23 deletions(-)
>>>
>>> diff --git
>>> a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
>>> b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
>>> index 3a6f824ea..15cf67fd2 100644
>>> ---
>>> a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
>>> +++
>>> b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
>>> @@ -1,11 +1,11 @@
>>>  diff -uNr a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
>>>  --- a/cmake/FindLibunwind.cmake        1970-01-01 01:00:00.000000000
>>> +0100
>>> -+++ b/cmake/FindLibunwind.cmake        2018-11-02 14:04:35.460437058
>>> +0100
>>> -@@ -0,0 +1,37 @@
>>> ++++ b/cmake/FindLibunwind.cmake        2018-11-20 15:53:48.799078114
>>> +0100
>>> +@@ -0,0 +1,54 @@
>>>  +# - Try to find libunwind
>>>  +# Once done this will define
>>>  +#
>>> -+#  LIBUNWIND_FOUND - system has libunwind
>>> ++#  Libunwind_FOUND - system has libunwind
>>>  +#  unwind - cmake target for libunwind
>>>  +
>>>  +find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
>>> @@ -15,11 +15,24 @@ diff -uNr a/cmake/FindLibunwind.cmake
>>> b/cmake/FindLibunwind.cmake
>>>  +
>>>  +if (CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
>>>  +    set(LIBUNWIND_ARCH "arm")
>>> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^aarch64")
>>> ++    set(LIBUNWIND_ARCH "aarch64")
>>>  +elseif (CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64" OR
>>> -+        CMAKE_SYSTEM_PROCESSOR STREQUAL "amd64")
>>> ++        CMAKE_SYSTEM_PROCESSOR STREQUAL "amd64" OR
>>> ++        CMAKE_SYSTEM_PROCESSOR STREQUAL "corei7-64")
>>>  +    set(LIBUNWIND_ARCH "x86_64")
>>>  +elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^i.86$")
>>>  +    set(LIBUNWIND_ARCH "x86")
>>> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc64")
>>> ++    set(LIBUNWIND_ARCH "ppc64")
>>> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc")
>>> ++    set(LIBUNWIND_ARCH "ppc32")
>>> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^mips")
>>> ++    set(LIBUNWIND_ARCH "mips")
>>> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^hppa")
>>> ++    set(LIBUNWIND_ARCH "hppa")
>>> ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ia64")
>>> ++    set(LIBUNWIND_ARCH "ia64")
>>>  +endif()
>>>  +
>>>  +find_library (UNWIND_LIBRARY_PLATFORM NAMES "unwind-${LIBUNWIND_ARCH}"
>>> DOC "unwind library platform")
>>> @@ -35,13 +48,17 @@ diff -uNr a/cmake/FindLibunwind.cmake
>>> b/cmake/FindLibunwind.cmake
>>>  +
>>>  +mark_as_advanced (UNWIND_LIBRARY UNWIND_LIBRARY_PLATFORM)
>>>  +
>>> -+add_library(unwind INTERFACE IMPORTED)
>>> -+set_target_properties(unwind PROPERTIES
>>> -+    INTERFACE_LINK_LIBRARIES
>>> "${UNWIND_LIBRARY};${UNWIND_LIBRARY_PLATFORM}"
>>> -+)
>>> ++if (Libunwind_FOUND)
>>> ++    add_library(unwind INTERFACE IMPORTED)
>>> ++    set_target_properties(unwind PROPERTIES
>>> ++        INTERFACE_LINK_LIBRARIES
>>> "${UNWIND_LIBRARY};${UNWIND_LIBRARY_PLATFORM}"
>>> ++    )
>>> ++else()
>>> ++    message("Can't find libunwind library")
>>> ++endif()
>>>  diff -uNr a/CMakeLists.txt b/CMakeLists.txt
>>> ---- a/CMakeLists.txt   2018-11-02 14:02:21.784835854 +0100
>>> -+++ b/CMakeLists.txt   2018-11-02 14:03:16.796935594 +0100
>>> +--- a/CMakeLists.txt   2018-11-20 15:49:07.576278417 +0100
>>> ++++ b/CMakeLists.txt   2018-11-20 15:49:32.106819928 +0100
>>>  @@ -58,7 +58,6 @@
>>>   check_include_file (execinfo.h HAVE_EXECINFO_H)
>>>   check_include_file (glob.h HAVE_GLOB_H)
>>> @@ -91,23 +108,13 @@ diff -uNr a/CMakeLists.txt b/CMakeLists.txt
>>>     DESTINATION lib/cmake/glog)
>>>
>>>   install (EXPORT glog-targets NAMESPACE glog:: DESTINATION
>>> lib/cmake/glog)
>>> -Binary files a/.git/index and b/.git/index differ
>>>  diff -uNr a/glog-config.cmake.in b/glog-config.cmake.in
>>> ---- a/glog-config.cmake.in     2018-11-02 14:02:21.784835854 +0100
>>> -+++ b/glog-config.cmake.in     2018-11-02 14:03:16.796935594 +0100
>>> -@@ -4,4 +4,15 @@
>>> +--- a/glog-config.cmake.in     2018-11-20 15:49:07.576278417 +0100
>>> ++++ b/glog-config.cmake.in     2018-11-20 15:52:32.330418489 +0100
>>> +@@ -4,4 +4,6 @@
>>>
>>>   @gflags_DEPENDENCY@
>>>
>>> -+# Record the state of the CMake module path when this script was
>>> -+# called so that we can ensure that we leave it in the same state on
>>> -+# exit as it was on entry, but modify it locally.
>>> -+set(UNWIND_CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH})
>>> -+
>>> -+set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
>>>  +find_dependency (Libunwind)
>>> -+
>>> -+# Restore original module path
>>> -+set(CMAKE_MODULE_PATH "${UNWIND_CMAKE_MODULE_PATH}")
>>>  +
>>>   include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
>>> --
>>> 2.19.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
>

