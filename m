Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id D858777167
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 19:07:53 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so30365655pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 12:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=/Ops3PB4i2xOc8v9HUNVpRqsifRP3Fsv6+RdCL85XE4=;
	b=Agfu7UECfxn6RC8sxAGzO+WxMe5PhEEYK/V+C/ABFglR5DUva4ux28sAcH9heIfbAf
	CDjiFZMLUk83WoT1TgD0byqJLL1avD4nFTQ0ENOrG12iBCGn8LlXNaObsXRIqG25ZLQ5
	Vzo+P7Ktvk2g3ynuy5ZGMXo6dYZu52af6UrDFa+VIgj8Ekz+SHL7smzJnxlwDcL6pomd
	YYbiYLojbrOEoFHdq/OQhncW4Nv58Ay/Pi1lAyg3qIs/Dw2hG5HipJGIYBullE5Ti1bu
	bIB7CYJLm0DA/fwSWpkaHBrh+WgO6glZiWMShU2fZlqKEj98AqLd+kJAaomU//jjMSi+
	jIsQ==
X-Received: by 10.67.4.9 with SMTP id ca9mr18149344pad.90.1445022474074;
	Fri, 16 Oct 2015 12:07:54 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:197c:ac43:581b:7cb1?
	([2601:202:4000:1239:197c:ac43:581b:7cb1])
	by smtp.googlemail.com with ESMTPSA id
	i9sm22568638pbq.84.2015.10.16.12.07.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Oct 2015 12:07:52 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1445003910-6444-1-git-send-email-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56214B05.1050002@gmail.com>
Date: Fri, 16 Oct 2015 12:07:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1445003910-6444-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH][meta-oe][dizzy 1/4] oscam: respect *flags set from OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Oct 2015 19:07:56 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

all 4 merged to staging

- armin

On 10/16/2015 06:58 AM, Martin Jansa wrote:
> * build with -mfloat-abi=hard are failing with:
>   sysroots/foo/usr/include/gnu/stubs.h:7:29: fatal error: gnu/stubs-soft.h: No such file or directory
>   because cmake wasn't respecting *flags set from OE
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../recipes-dvb/oscam/oscam/respect-cflags.patch   | 38 ++++++++++++++++++++++
>  meta-multimedia/recipes-dvb/oscam/oscam_svn.bb     |  4 ++-
>  2 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 meta-multimedia/recipes-dvb/oscam/oscam/respect-cflags.patch
> 
> diff --git a/meta-multimedia/recipes-dvb/oscam/oscam/respect-cflags.patch b/meta-multimedia/recipes-dvb/oscam/oscam/respect-cflags.patch
> new file mode 100644
> index 0000000..179d04a
> --- /dev/null
> +++ b/meta-multimedia/recipes-dvb/oscam/oscam/respect-cflags.patch
> @@ -0,0 +1,38 @@
> +Upstream-Status: Backport
> +http://www.streamboard.tv/oscam/changeset/10068
> +http://www.streamboard.tv/oscam/changeset/10070
> +
> +Index: /CMakeLists.txt
> +===================================================================
> +--- a/CMakeLists.txt	(revision 10067)
> ++++ b/CMakeLists.txt	(revision 10068)
> +@@ -625,8 +625,8 @@
> +     list(GET GCC_VERSION_COMPONENTS 0 GCC_MINOR)
> +     add_definitions ("-W -Wall ")
> +-    set (CMAKE_C_FLAGS "-Wall -O2")
> +-	set (CMAKE_CXX_FLAGS "-Wall -O2")
> +-    set (CMAKE_C_FLAGS_DEBUG "-O0 -ggdb")
> +-    set (CMAKE_CXX_FLAGS_DEBUG "-O0 -ggdb")
> ++    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -O2")
> ++	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -O2")
> ++    set (CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O0 -ggdb")
> ++    set (CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0 -ggdb")
> + endif (CMAKE_COMPILER_IS_GNUCC)
> + # some optimisations
> +Index: /csctapi/CMakeLists.txt
> +===================================================================
> +--- a/csctapi/CMakeLists.txt	(revision 10069)
> ++++ b/csctapi/CMakeLists.txt	(revision 10070)
> +@@ -6,8 +6,8 @@
> +     list(GET GCC_VERSION_COMPONENTS 0 GCC_MINOR)
> +     add_definitions ("-W -Wall ")
> +-    set (CMAKE_C_FLAGS "-Wall -O2")
> +-	set (CMAKE_CXX_FLAGS "-Wall -O2")
> +-    set (CMAKE_C_FLAGS_DEBUG "-O0 -ggdb")
> +-    set (CMAKE_CXX_FLAGS_DEBUG "-O0 -ggdb")
> ++    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -O2")
> ++	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -O2")
> ++    set (CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O0 -ggdb")
> ++    set (CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0 -ggdb")
> + endif (CMAKE_COMPILER_IS_GNUCC)
> + # Mac extra removes to avoid ranlib warnings in some situations
> diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
> index c4a4d99..cac517f 100644
> --- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
> +++ b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
> @@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  
>  DEPENDS = "libusb1 openssl pcsc-lite"
>  
> -SRC_URI = "svn://www.streamboard.tv/svn/oscam;module=trunk;protocol=http"
> +SRC_URI = "svn://www.streamboard.tv/svn/oscam;module=trunk;protocol=http \
> +    file://respect-cflags.patch \
> +"
>  SRCREV = "9164"
>  PV = "1.10+${SRCPV}"
>  
> 

