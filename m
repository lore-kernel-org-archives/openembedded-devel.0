Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 659AD605C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 10:46:05 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id g23so201269437wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 02:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=Q7ubou26TR3UFmEZ5YSNth1RRlwaifr/HbNCTu0jas8=;
	b=geTfolKDY/E4Q8LoN5uvSGAmHLd2jEbrI5BzDBSUddwqoYFaSs3vHgWrObvcKQqp1+
	qC0OL2t1QV9Mvm2AsZ9eISF/aZ6lOJfBQXp8LAP4UAEqt5pGDJV40OuZMGzBI3fIiJeQ
	hhPcSLLNad8PJyWwrVXYfeYmjyP3G0+5vCQ8IlDp/ISZlgvKXkJj/j0ogVd5hHBzlvfu
	En5lZ2SUz6zoXRhOCeqfop3eTSGDEZooP0BbKp8QzJAJXe7K8M3i30ev3NPJWOe3iWHy
	DUa9zEmPAv6yCWN4k82Xv0/x4eFRjrMrqmvUpATN+TXQAcHz+/nTIfSi9OsSo5OVHQo3
	F74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Q7ubou26TR3UFmEZ5YSNth1RRlwaifr/HbNCTu0jas8=;
	b=J+37mK6xoXUNF0iwPoaTrCM3vZ9XdLmGG45+WBSyz2scQsyPwjvV0htmRzYuiV1ltp
	eLG1kIx0k6N3Hkya6U8W46b+4cjo7rTVEgdtC/woizTqY/1Xt4TESsSKWbN4FQCbjodz
	TjINwinkXE93+L/wjMwMmxeZ+1RQd9L+mrV3Trzf+L1+VWmDyIj5/plyPTO570+zs2RD
	ZeeWgBLUw+WZ+HApiyAGYSFP89Eq+hrYJ226p5HzwEFxjGCIQVicJVYZgVu8mXOou1GC
	xNKClsgsJ0UEvlj0mSx4T4h1asJhXKIxFlFCoS7RrvaUfHxDB1UND9Zfy1XdLEZD7dMg
	IxBQ==
X-Gm-Message-State: AKaTC025SWA54UwQi2RJGr2XiICPic4dX5BmcVyWZr/mttp1L45LknshqZ4Qtbrji/4J3Q==
X-Received: by 10.28.234.85 with SMTP id i82mr17553663wmh.6.1480329966426;
	Mon, 28 Nov 2016 02:46:06 -0800 (PST)
Received: from [192.168.2.176] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	c187sm28153094wmd.13.2016.11.28.02.46.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 02:46:06 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-40-raj.khem@gmail.com>
From: Piotr Lewicki <piotr.lewicki@elfin.de>
Message-ID: <f70eb13c-7ee5-79af-9d28-85a2e63b0eda@elfin.de>
Date: Mon, 28 Nov 2016 11:46:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161123092209.23699-40-raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 28 Nov 2016 10:46:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Raj,

Did you forget to add the patch to the "SRC_URI"?


BR,

Piotr


On 23.11.2016 10:22, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../0001-jsoncpp-rename-features-header-file.patch | 152 +++++++++++++++++++++
>   meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb  |  21 +++
>   2 files changed, 173 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-jsoncpp-rename-features-header-file.patch
>   create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb
>
> diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-jsoncpp-rename-features-header-file.patch b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-jsoncpp-rename-features-header-file.patch
> new file mode 100644
> index 0000000..f1397ea
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-jsoncpp-rename-features-header-file.patch
> @@ -0,0 +1,152 @@
> +Issue: Build error in TDK DS_stub
> +
> +In file included from /home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/c++/i586-rdk-linux/bits/c++config.h:426:0,
> +                 from /home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/c++/string:38,
> +                 from /home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/json/value.h:12,
> +                 from /home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/json/json.h:10,
> +                 from ./include/DeviceSettingsAgent.h:15,
> +                 from src/DeviceSettingsAgent.cpp:13:
> +/home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/c++/i586-rdk-linux/bits/os_defines.h:44:19: error: missing binary operator before token "("
> + #if __GLIBC_PREREQ(2,15) && defined(_GNU_SOURCE)
> +
> +The issue was jsoncpp has features.h which was conflicting with the system
> +header file features.h.
> +
> +So renamed the header file  features.h in jsoncpp to json-features.h so
> +as to localize the effect of this change within jsoncpp.
> +
> + Signed-off-by: Ridish Aravindan <ridish.ra@lnttechservices.com>
> +
> +Index: jsoncpp-src-0.6.0-rc2/include/json/json-features.h
> +===================================================================
> +--- /dev/null	1970-01-01 00:00:00.000000000 +0000
> ++++ jsoncpp-src-0.6.0-rc2/include/json/json-features.h	2014-08-27 06:41:40.000000000 +0000
> +@@ -0,0 +1,49 @@
> ++// Copyright 2007-2010 Baptiste Lepilleur
> ++// Distributed under MIT license, or public domain if desired and
> ++// recognized in your jurisdiction.
> ++// See file LICENSE for detail or copy at http://jsoncpp.sourceforge.net/LICENSE
> ++
> ++#ifndef CPPTL_JSON_FEATURES_H_INCLUDED
> ++# define CPPTL_JSON_FEATURES_H_INCLUDED
> ++
> ++#if !defined(JSON_IS_AMALGAMATION)
> ++# include "forwards.h"
> ++#endif // if !defined(JSON_IS_AMALGAMATION)
> ++
> ++namespace Json {
> ++
> ++   /** \brief Configuration passed to reader and writer.
> ++    * This configuration object can be used to force the Reader or Writer
> ++    * to behave in a standard conforming way.
> ++    */
> ++   class JSON_API Features
> ++   {
> ++   public:
> ++      /** \brief A configuration that allows all features and assumes all strings are UTF-8.
> ++       * - C & C++ comments are allowed
> ++       * - Root object can be any JSON value
> ++       * - Assumes Value strings are encoded in UTF-8
> ++       */
> ++      static Features all();
> ++
> ++      /** \brief A configuration that is strictly compatible with the JSON specification.
> ++       * - Comments are forbidden.
> ++       * - Root object must be either an array or an object value.
> ++       * - Assumes Value strings are encoded in UTF-8
> ++       */
> ++      static Features strictMode();
> ++
> ++      /** \brief Initialize the configuration like JsonConfig::allFeatures;
> ++       */
> ++      Features();
> ++
> ++      /// \c true if comments are allowed. Default: \c true.
> ++      bool allowComments_;
> ++
> ++      /// \c true if root must be either an array or an object value. Default: \c false.
> ++      bool strictRoot_;
> ++   };
> ++
> ++} // namespace Json
> ++
> ++#endif // CPPTL_JSON_FEATURES_H_INCLUDED
> +Index: jsoncpp-src-0.6.0-rc2/include/json/json.h
> +===================================================================
> +--- jsoncpp-src-0.6.0-rc2.orig/include/json/json.h	2011-05-02 21:47:24.000000000 +0000
> ++++ jsoncpp-src-0.6.0-rc2/include/json/json.h	2014-08-27 06:39:13.000000000 +0000
> +@@ -10,6 +10,6 @@
> + # include "value.h"
> + # include "reader.h"
> + # include "writer.h"
> +-# include "features.h"
> ++# include "json-features.h"
> +
> + #endif // JSON_JSON_H_INCLUDED
> +Index: jsoncpp-src-0.6.0-rc2/include/json/reader.h
> +===================================================================
> +--- jsoncpp-src-0.6.0-rc2.orig/include/json/reader.h	2011-05-02 21:47:24.000000000 +0000
> ++++ jsoncpp-src-0.6.0-rc2/include/json/reader.h	2014-08-27 06:39:32.000000000 +0000
> +@@ -7,7 +7,7 @@
> + # define CPPTL_JSON_READER_H_INCLUDED
> +
> + #if !defined(JSON_IS_AMALGAMATION)
> +-# include "features.h"
> ++# include "json-features.h"
> + # include "value.h"
> + #endif // if !defined(JSON_IS_AMALGAMATION)
> + # include <deque>
> +Index: jsoncpp-src-0.6.0-rc2/include/json/features.h
> +===================================================================
> +--- jsoncpp-src-0.6.0-rc2.orig/include/json/features.h	2011-05-02 21:46:58.000000000 +0000
> ++++ /dev/null	1970-01-01 00:00:00.000000000 +0000
> +@@ -1,49 +0,0 @@
> +-// Copyright 2007-2010 Baptiste Lepilleur
> +-// Distributed under MIT license, or public domain if desired and
> +-// recognized in your jurisdiction.
> +-// See file LICENSE for detail or copy at http://jsoncpp.sourceforge.net/LICENSE
> +-
> +-#ifndef CPPTL_JSON_FEATURES_H_INCLUDED
> +-# define CPPTL_JSON_FEATURES_H_INCLUDED
> +-
> +-#if !defined(JSON_IS_AMALGAMATION)
> +-# include "forwards.h"
> +-#endif // if !defined(JSON_IS_AMALGAMATION)
> +-
> +-namespace Json {
> +-
> +-   /** \brief Configuration passed to reader and writer.
> +-    * This configuration object can be used to force the Reader or Writer
> +-    * to behave in a standard conforming way.
> +-    */
> +-   class JSON_API Features
> +-   {
> +-   public:
> +-      /** \brief A configuration that allows all features and assumes all strings are UTF-8.
> +-       * - C & C++ comments are allowed
> +-       * - Root object can be any JSON value
> +-       * - Assumes Value strings are encoded in UTF-8
> +-       */
> +-      static Features all();
> +-
> +-      /** \brief A configuration that is strictly compatible with the JSON specification.
> +-       * - Comments are forbidden.
> +-       * - Root object must be either an array or an object value.
> +-       * - Assumes Value strings are encoded in UTF-8
> +-       */
> +-      static Features strictMode();
> +-
> +-      /** \brief Initialize the configuration like JsonConfig::allFeatures;
> +-       */
> +-      Features();
> +-
> +-      /// \c true if comments are allowed. Default: \c true.
> +-      bool allowComments_;
> +-
> +-      /// \c true if root must be either an array or an object value. Default: \c false.
> +-      bool strictRoot_;
> +-   };
> +-
> +-} // namespace Json
> +-
> +-#endif // CPPTL_JSON_FEATURES_H_INCLUDED
> diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb
> new file mode 100644
> index 0000000..17947e3
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "JSON C++ lib used to read and write json file."
> +DESCRIPTION = "Jsoncpp is an implementation of a JSON (http://json.org) reader \
> +               and writer in C++. JSON (JavaScript Object Notation) is a \
> +               lightweight data-interchange format. It is easy for humans to \
> +               read and write. It is easy for machines to parse and generate."
> +
> +HOMEPAGE = "http://sourceforge.net/projects/jsoncpp/"
> +
> +SECTION = "libs"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c56ee55c03a55f8105b969d8270632ce"
> +
> +SRCREV = "d8cd848ede1071a25846cd90b4fddf269d868ff1"
> +SRC_URI = "git://github.com/open-source-parsers/jsoncpp \
> +"
> +
> +S = "${WORKDIR}/git"
> +inherit cmake
> +
> +EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DJSONCPP_WITH_TESTS=OFF"


