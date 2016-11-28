Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4FDE1606A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 21:11:03 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 20so11737626uak.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=0QmimLD1RbKgUMke0WC21kyDHnbuajsW2IOSU7oMH0M=;
	b=vs1etgOwb0HecT/+v0hhqMmzYb4k9/syNhYCgqqK0OHekj0TIRnI8a3PzuP7nWFP+s
	hi0k9mA8BJVhc1zN2rqRvFSGY6P7egt4DJUItJZGUGg4L3HDdwKLVYVGmyBqavUG5t/D
	HMIwytDtcSAUUgKso2insJNfbAuFwEqHbr/6evgi99s3ofGo9JwSTu6sQf3Q5NXsTowh
	rr8UUdhgt4q4G7tjLGs9pzm0hoYmOHv7Kkuc491IV6nR3/X5obwCDFoW624ArtQ9g/08
	hmjEBhcgjr2bPU26JSpU091odWLgzm0+x29MkBuZWlJTvNRykF2tVka04Yryk6aRVVls
	jv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=0QmimLD1RbKgUMke0WC21kyDHnbuajsW2IOSU7oMH0M=;
	b=fIoDi70+QuW55i8151xuqhLKaV4zG5gfaGt/bG7ZQu245nwNDcmIfR7aewl4Y2G5aZ
	te91jF7f08d50YZX7x6ceA5qMv/h1h1cA2y7zvDf1W72qDQ9sLqiyBlQbb3Nl4XxiAKh
	k2goY//bi86WcQq0y04kq2i3tqoXgl6/27TftgBMrsBL3gz6sZOhnUMZr72xWPZsLpXX
	DzzfZxNLNDkf7SxrN7MWV+6kJ+Xl/VhRJVEs4A5I4Q1H5F5sKfHv7JSuei7F0PTo0KbU
	uJii0XJ+VkWCB/wQmCjcXKgh/K1HD5OQXxjobjpRoWMozjBJ0x7b46JsdPTi6sUtzdGr
	ugFQ==
X-Gm-Message-State: AKaTC0359HzuK9l09AP2WuKicsPLX1eLkA86jJxp1D/0UwJlkvVzpLjjdX8O0y1JFWdp7tP8E6XwZB9L5ohOoA==
X-Received: by 10.176.82.181 with SMTP id v50mr14910985uav.31.1480367464846;
	Mon, 28 Nov 2016 13:11:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Mon, 28 Nov 2016 13:10:34 -0800 (PST)
In-Reply-To: <f70eb13c-7ee5-79af-9d28-85a2e63b0eda@elfin.de>
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-40-raj.khem@gmail.com>
	<f70eb13c-7ee5-79af-9d28-85a2e63b0eda@elfin.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Nov 2016 13:10:34 -0800
Message-ID: <CAMKF1spVx1E8rocYN=tSwAXy4+9KxfGy-ThbQ224QttWcEa+vg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 40/49] jsoncpp: Add new recipe
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
X-List-Received-Date: Mon, 28 Nov 2016 21:11:05 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 28, 2016 at 2:46 AM, Piotr Lewicki <piotr.lewicki@elfin.de> wrote:
> Hi Raj,
>
> Did you forget to add the patch to the "SRC_URI"?
>

this patch is not required thus effectively deadcode I will send a v2.
Thanks for notifying.

>
> BR,
>
> Piotr
>
>
>
> On 23.11.2016 10:22, Khem Raj wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   .../0001-jsoncpp-rename-features-header-file.patch | 152
>> +++++++++++++++++++++
>>   meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb  |  21 +++
>>   2 files changed, 173 insertions(+)
>>   create mode 100644
>> meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-jsoncpp-rename-features-header-file.patch
>>   create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb
>>
>> diff --git
>> a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-jsoncpp-rename-features-header-file.patch
>> b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-jsoncpp-rename-features-header-file.patch
>> new file mode 100644
>> index 0000000..f1397ea
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-jsoncpp-rename-features-header-file.patch
>> @@ -0,0 +1,152 @@
>> +Issue: Build error in TDK DS_stub
>> +
>> +In file included from
>> /home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/c++/i586-rdk-linux/bits/c++config.h:426:0,
>> +                 from
>> /home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/c++/string:38,
>> +                 from
>> /home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/json/value.h:12,
>> +                 from
>> /home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/json/json.h:10,
>> +                 from ./include/DeviceSettingsAgent.h:15,
>> +                 from src/DeviceSettingsAgent.cpp:13:
>>
>> +/home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/c++/i586-rdk-linux/bits/os_defines.h:44:19:
>> error: missing binary operator before token "("
>> + #if __GLIBC_PREREQ(2,15) && defined(_GNU_SOURCE)
>> +
>> +The issue was jsoncpp has features.h which was conflicting with the
>> system
>> +header file features.h.
>> +
>> +So renamed the header file  features.h in jsoncpp to json-features.h so
>> +as to localize the effect of this change within jsoncpp.
>> +
>> + Signed-off-by: Ridish Aravindan <ridish.ra@lnttechservices.com>
>> +
>> +Index: jsoncpp-src-0.6.0-rc2/include/json/json-features.h
>> +===================================================================
>> +--- /dev/null  1970-01-01 00:00:00.000000000 +0000
>> ++++ jsoncpp-src-0.6.0-rc2/include/json/json-features.h 2014-08-27
>> 06:41:40.000000000 +0000
>> +@@ -0,0 +1,49 @@
>> ++// Copyright 2007-2010 Baptiste Lepilleur
>> ++// Distributed under MIT license, or public domain if desired and
>> ++// recognized in your jurisdiction.
>> ++// See file LICENSE for detail or copy at
>> http://jsoncpp.sourceforge.net/LICENSE
>> ++
>> ++#ifndef CPPTL_JSON_FEATURES_H_INCLUDED
>> ++# define CPPTL_JSON_FEATURES_H_INCLUDED
>> ++
>> ++#if !defined(JSON_IS_AMALGAMATION)
>> ++# include "forwards.h"
>> ++#endif // if !defined(JSON_IS_AMALGAMATION)
>> ++
>> ++namespace Json {
>> ++
>> ++   /** \brief Configuration passed to reader and writer.
>> ++    * This configuration object can be used to force the Reader or
>> Writer
>> ++    * to behave in a standard conforming way.
>> ++    */
>> ++   class JSON_API Features
>> ++   {
>> ++   public:
>> ++      /** \brief A configuration that allows all features and assumes
>> all strings are UTF-8.
>> ++       * - C & C++ comments are allowed
>> ++       * - Root object can be any JSON value
>> ++       * - Assumes Value strings are encoded in UTF-8
>> ++       */
>> ++      static Features all();
>> ++
>> ++      /** \brief A configuration that is strictly compatible with the
>> JSON specification.
>> ++       * - Comments are forbidden.
>> ++       * - Root object must be either an array or an object value.
>> ++       * - Assumes Value strings are encoded in UTF-8
>> ++       */
>> ++      static Features strictMode();
>> ++
>> ++      /** \brief Initialize the configuration like
>> JsonConfig::allFeatures;
>> ++       */
>> ++      Features();
>> ++
>> ++      /// \c true if comments are allowed. Default: \c true.
>> ++      bool allowComments_;
>> ++
>> ++      /// \c true if root must be either an array or an object value.
>> Default: \c false.
>> ++      bool strictRoot_;
>> ++   };
>> ++
>> ++} // namespace Json
>> ++
>> ++#endif // CPPTL_JSON_FEATURES_H_INCLUDED
>> +Index: jsoncpp-src-0.6.0-rc2/include/json/json.h
>> +===================================================================
>> +--- jsoncpp-src-0.6.0-rc2.orig/include/json/json.h     2011-05-02
>> 21:47:24.000000000 +0000
>> ++++ jsoncpp-src-0.6.0-rc2/include/json/json.h  2014-08-27
>> 06:39:13.000000000 +0000
>> +@@ -10,6 +10,6 @@
>> + # include "value.h"
>> + # include "reader.h"
>> + # include "writer.h"
>> +-# include "features.h"
>> ++# include "json-features.h"
>> +
>> + #endif // JSON_JSON_H_INCLUDED
>> +Index: jsoncpp-src-0.6.0-rc2/include/json/reader.h
>> +===================================================================
>> +--- jsoncpp-src-0.6.0-rc2.orig/include/json/reader.h   2011-05-02
>> 21:47:24.000000000 +0000
>> ++++ jsoncpp-src-0.6.0-rc2/include/json/reader.h        2014-08-27
>> 06:39:32.000000000 +0000
>> +@@ -7,7 +7,7 @@
>> + # define CPPTL_JSON_READER_H_INCLUDED
>> +
>> + #if !defined(JSON_IS_AMALGAMATION)
>> +-# include "features.h"
>> ++# include "json-features.h"
>> + # include "value.h"
>> + #endif // if !defined(JSON_IS_AMALGAMATION)
>> + # include <deque>
>> +Index: jsoncpp-src-0.6.0-rc2/include/json/features.h
>> +===================================================================
>> +--- jsoncpp-src-0.6.0-rc2.orig/include/json/features.h 2011-05-02
>> 21:46:58.000000000 +0000
>> ++++ /dev/null  1970-01-01 00:00:00.000000000 +0000
>> +@@ -1,49 +0,0 @@
>> +-// Copyright 2007-2010 Baptiste Lepilleur
>> +-// Distributed under MIT license, or public domain if desired and
>> +-// recognized in your jurisdiction.
>> +-// See file LICENSE for detail or copy at
>> http://jsoncpp.sourceforge.net/LICENSE
>> +-
>> +-#ifndef CPPTL_JSON_FEATURES_H_INCLUDED
>> +-# define CPPTL_JSON_FEATURES_H_INCLUDED
>> +-
>> +-#if !defined(JSON_IS_AMALGAMATION)
>> +-# include "forwards.h"
>> +-#endif // if !defined(JSON_IS_AMALGAMATION)
>> +-
>> +-namespace Json {
>> +-
>> +-   /** \brief Configuration passed to reader and writer.
>> +-    * This configuration object can be used to force the Reader or
>> Writer
>> +-    * to behave in a standard conforming way.
>> +-    */
>> +-   class JSON_API Features
>> +-   {
>> +-   public:
>> +-      /** \brief A configuration that allows all features and assumes
>> all strings are UTF-8.
>> +-       * - C & C++ comments are allowed
>> +-       * - Root object can be any JSON value
>> +-       * - Assumes Value strings are encoded in UTF-8
>> +-       */
>> +-      static Features all();
>> +-
>> +-      /** \brief A configuration that is strictly compatible with the
>> JSON specification.
>> +-       * - Comments are forbidden.
>> +-       * - Root object must be either an array or an object value.
>> +-       * - Assumes Value strings are encoded in UTF-8
>> +-       */
>> +-      static Features strictMode();
>> +-
>> +-      /** \brief Initialize the configuration like
>> JsonConfig::allFeatures;
>> +-       */
>> +-      Features();
>> +-
>> +-      /// \c true if comments are allowed. Default: \c true.
>> +-      bool allowComments_;
>> +-
>> +-      /// \c true if root must be either an array or an object value.
>> Default: \c false.
>> +-      bool strictRoot_;
>> +-   };
>> +-
>> +-} // namespace Json
>> +-
>> +-#endif // CPPTL_JSON_FEATURES_H_INCLUDED
>> diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb
>> b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb
>> new file mode 100644
>> index 0000000..17947e3
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb
>> @@ -0,0 +1,21 @@
>> +SUMMARY = "JSON C++ lib used to read and write json file."
>> +DESCRIPTION = "Jsoncpp is an implementation of a JSON (http://json.org)
>> reader \
>> +               and writer in C++. JSON (JavaScript Object Notation) is a
>> \
>> +               lightweight data-interchange format. It is easy for humans
>> to \
>> +               read and write. It is easy for machines to parse and
>> generate."
>> +
>> +HOMEPAGE = "http://sourceforge.net/projects/jsoncpp/"
>> +
>> +SECTION = "libs"
>> +
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c56ee55c03a55f8105b969d8270632ce"
>> +
>> +SRCREV = "d8cd848ede1071a25846cd90b4fddf269d868ff1"
>> +SRC_URI = "git://github.com/open-source-parsers/jsoncpp \
>> +"
>> +
>> +S = "${WORKDIR}/git"
>> +inherit cmake
>> +
>> +EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DJSONCPP_WITH_TESTS=OFF"
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

