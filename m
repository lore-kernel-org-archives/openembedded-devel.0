Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id 21B8874619
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 14:43:48 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id a14-v6so6102094otf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 07:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N+GdcGR+wHejQX73j/3cOisgCEaWZ1BMuL9r3pRcQ9I=;
	b=TZhDD9KjJ1MG6zTjej7bjMpbCGtIVjUboV99ctbrVr5aRgn4yHULXdLQYWqFR6KeFw
	k2Osu4Tw0x4VP6TxFfKkhGnTm/hw4cNw9RI527ac76htoP5yF+uA898jbMVutUmg+1VQ
	dZdORBGPabJKhAzxu0zULWAzRWPqByUJGxsWbiKVvkmhODXdZluetBD5q83aBvrXE7O8
	LHDiWGEOUBNs2DYmh4cu1UbMKb0LYTAQbmXH16npo0RaNS0eQhP0B7EmFAKjOjybUB3t
	BpugFfBIPllrKkfdi9Bb8kVSAGQLNFganw76fhzwzMbHNJXpK+DCXPWMHQXwr5iMEm92
	WF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N+GdcGR+wHejQX73j/3cOisgCEaWZ1BMuL9r3pRcQ9I=;
	b=SfD6sm879pgdALRLHyKSSxtjpHeBzohwsvOSjeIP/wJnUTeT7NfeNgW8Hw4xFQlQZO
	iGgoPuFyQhI9FNueqBuXvbo6J0zB5sWp0e9afHBx3/hs4EVCk3/dXvD+YsQxh2ClWjJu
	WguXVY870uAABLZLvJMW35qBW7wSsjHyAJ//u6sRA08pi2oNyuv6ZSqZ0SW/P+AFgjfH
	AMuwtlmyu7u4Z2D90GBHcvRrKTVcPJExFWUYg+cRALaQk9xW42oJ0VSPwJbgO0NJPuiO
	O50q0ENIxWtCBMAeTfn/cHpc6VXd0jY4Lxtsw2xcfVp7k7L4c//G61+s0pEuqYTfie06
	Ca6w==
X-Gm-Message-State: ALQs6tBHTef+eVWew1vnZaJ2H34omDVBXW1o54252TB1s6KhgL017WYX
	7fbUu15ffg22fznHfyFq2BgMI5xF5+O2FgRVGzc=
X-Google-Smtp-Source: AIpwx4+iBqXrrBnB/QFo1ZIiOSCqFqdFNamQx3Fk0tTMcR8qtOG8FnAG9ij0wGbikG9DwNxkBZrU24d9HavQVVYFue8=
X-Received: by 2002:a9d:7346:: with SMTP id
	l6-v6mr4336222otk.227.1524149029776; 
	Thu, 19 Apr 2018 07:43:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Thu, 19 Apr 2018 07:43:49 -0700 (PDT)
In-Reply-To: <20180419141737.21053-2-costamagnagianfranco@yahoo.it>
References: <20180419141737.21053-1-costamagnagianfranco@yahoo.it>
	<20180419141737.21053-2-costamagnagianfranco@yahoo.it>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 19 Apr 2018 16:43:49 +0200
Message-ID: <CALbNGRT17R_aw7NGTGo7_n6dY5ULsppkoE=OKfTJxC+vDESweg@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] cpprest: add new recipe based on Debian packaging
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
X-List-Received-Date: Thu, 19 Apr 2018 14:43:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 19, 2018 at 4:17 PM, Gianfranco Costamagna
<costamagna.gianfranco@gmail.com> wrote:
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
> Co-developed-by: Cristiano Prato <cristiano.prato@cnhind.com>
> ---
>  .../cpprest/cpprest-2.10.2/fix-cmake-install.patch    | 15 +++++++++++++++
>  meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb     | 19 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
>  create mode 100644 meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
>
> diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
> new file mode 100644
> index 000000000..aeb8da052
> --- /dev/null
> +++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
> @@ -0,0 +1,15 @@
> +Description: install cmake files into /usr/lib/cmake/cpprestsdk
> +Author: Gianfranco Costamagna <locutusofborg@debian.org>
> +Last-Update: 2018-04-19
> +
> +--- cpprest-2.10.2.orig/CMakeLists.txt
> ++++ cpprest-2.10.2/CMakeLists.txt
> +@@ -18,7 +18,7 @@ enable_testing()
> + set(WERROR ON CACHE BOOL "Treat Warnings as Errors.")
> + set(CPPREST_EXCLUDE_WEBSOCKETS OFF CACHE BOOL "Exclude websockets functionality.")
> + set(CPPREST_EXCLUDE_COMPRESSION OFF CACHE BOOL "Exclude compression functionality.")
> +-set(CPPREST_EXPORT_DIR lib/cpprestsdk CACHE STRING "Directory to install CMake config files.")
> ++set(CPPREST_EXPORT_DIR lib/cmake/cpprestsdk CACHE STRING "Directory to install CMake config files.")
^ Instead of patching (for mulitlib?): Why not use this option? Something like

EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=${baselib}/cpprestsdk"

> + set(CPPREST_INSTALL_HEADERS ON CACHE BOOL "Install header files.")
> + set(CPPREST_INSTALL ON CACHE BOOL "Add install commands.")
> +
> diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
> new file mode 100644
> index 000000000..5f19d14ae
> --- /dev/null
> +++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design."
> +SECTION = "libs/network"
> +HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${S}/../license.txt;md5=a2e15b954769218ff912468eecd6a02f"
> +DEPENDS = "openssl websocketpp zlib boost"
> +
> +SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master"
> +
> +SRC_URI += "file://fix-cmake-install.patch"
> +
> +# tag 2.10.2
> +SRCREV= "fea848e2a77563cf2a6f28f8eab396fd6e787fbf"
> +
> +S = "${WORKDIR}/git/Release"
> +
> +inherit cmake
> +
> +FILES_${PN}-dev += "${libdir}/cmake"
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

