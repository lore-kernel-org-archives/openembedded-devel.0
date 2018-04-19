Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id D433F71AC1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 15:45:05 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id d26-v6so7132973ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IfABgyCPupWiPVcl9YqeIDy1NoAAh3sLbLxVFJ4X6Xk=;
	b=rcS4lbN/dm0HgBE2ibKV1q9vrRx/xnCqEgbd8doDcsGHubfdn4G/dFb4kUy2Ic9c0Y
	WRp8K5dZj6ry9ZLc8E7dc1QiqkEUUXs4Uv+fps4GUMWl/zdvSuh8MBREu3w8D6g4b6oV
	s+I4VRgvxasT3aAhiJt8NA5I8n1/0WO5PkFrfJaJ/02B2TrAnP7mWcMaDlLPsijKLWzu
	oPmfd6UrgsPdU9/tb4pqb0EeE2NHINJuZeWDpZC+LJyZwc+VKlEIkDZcv+UOks4idCkH
	1lg3QYKGUbB6QZpmNMtr5rYTh13nisGJSJxB374mOHqMh9sJtYmHr9YOZV4XQwVgctGU
	YcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IfABgyCPupWiPVcl9YqeIDy1NoAAh3sLbLxVFJ4X6Xk=;
	b=cxuTeluec95Q71UTjHhuIagIYELAJHEBuePeSpscLgVjPBKf63/HvJwCjPx+IjlFFs
	UTScU/TEGHH8FLvfRu8hmaJ5oE4WrECI67MdWO8W6HWjZAvLobvRTugQm7oSx16MjSTg
	GImWCxweA0iQB+F0ABdw1sVejU7/Fx2B6S7BwDJn9d+LFH24V96guZu5WriLW4r/Vs98
	D1GJb081vNecuINGMTFTUw+Z53EmmWDFgaLesgiQAyWk98emFov+Zdhx1iXCaPUwxjWc
	VqpWbSi/AdUY80xvzY3Rzr3ME6ZLs1eRKic0XJfi8THO8vxkjfopnSwaxWkrahCLYYQa
	oUgg==
X-Gm-Message-State: ALQs6tDDNgND5MX03rMzgFauTtyxeF95Tx1aSPkxPqsNysfjolj0i/L5
	pgKjfy7YyNfZeWNySgTDq11n3U+uRTKB41C8s8E=
X-Google-Smtp-Source: AIpwx4/c+XR3tUiKQCbx5yH974MC8T1+MAdgpY+CGPESfxKJpdx3lyFUpa5lE1JDejYk6JxH6Xfs3u6CLFex/eX8pss=
X-Received: by 2002:a6b:8dc3:: with SMTP id
	p186-v6mr6725110iod.70.1524152706515; 
	Thu, 19 Apr 2018 08:45:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:894:0:0:0:0:0 with HTTP;
	Thu, 19 Apr 2018 08:44:46 -0700 (PDT)
In-Reply-To: <CALbNGRT17R_aw7NGTGo7_n6dY5ULsppkoE=OKfTJxC+vDESweg@mail.gmail.com>
References: <20180419141737.21053-1-costamagnagianfranco@yahoo.it>
	<20180419141737.21053-2-costamagnagianfranco@yahoo.it>
	<CALbNGRT17R_aw7NGTGo7_n6dY5ULsppkoE=OKfTJxC+vDESweg@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Thu, 19 Apr 2018 17:44:46 +0200
Message-ID: <CAATN8PXQ5ftKQCF8ZmWxdb92sst0AAZ3QMK7HMS4WRtqP9gv8w@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 19 Apr 2018 15:45:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I prefer whenever possible to fix upstream defaults instead of downstream
patching.
My goal is to drop this patch on next upstream release, rather than
hardcoding a path in the bb file.

https://github.com/Microsoft/cpprestsdk/pull/737

I already opened an upstream pull request.

G.

2018-04-19 16:43 GMT+02:00 Andreas M=C3=BCller <schnitzeltony@gmail.com>:

> On Thu, Apr 19, 2018 at 4:17 PM, Gianfranco Costamagna
> <costamagna.gianfranco@gmail.com> wrote:
> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.co=
m
> >
> > Co-developed-by: Cristiano Prato <cristiano.prato@cnhind.com>
> > ---
> >  .../cpprest/cpprest-2.10.2/fix-cmake-install.patch    | 15
> +++++++++++++++
> >  meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb     | 19
> +++++++++++++++++++
> >  2 files changed, 34 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-
> cmake-install.patch
> >  create mode 100644 meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
> >
> > diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-i=
nstall.patch
> b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
> > new file mode 100644
> > index 000000000..aeb8da052
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-
> cmake-install.patch
> > @@ -0,0 +1,15 @@
> > +Description: install cmake files into /usr/lib/cmake/cpprestsdk
> > +Author: Gianfranco Costamagna <locutusofborg@debian.org>
> > +Last-Update: 2018-04-19
> > +
> > +--- cpprest-2.10.2.orig/CMakeLists.txt
> > ++++ cpprest-2.10.2/CMakeLists.txt
> > +@@ -18,7 +18,7 @@ enable_testing()
> > + set(WERROR ON CACHE BOOL "Treat Warnings as Errors.")
> > + set(CPPREST_EXCLUDE_WEBSOCKETS OFF CACHE BOOL "Exclude websockets
> functionality.")
> > + set(CPPREST_EXCLUDE_COMPRESSION OFF CACHE BOOL "Exclude compression
> functionality.")
> > +-set(CPPREST_EXPORT_DIR lib/cpprestsdk CACHE STRING "Directory to
> install CMake config files.")
> > ++set(CPPREST_EXPORT_DIR lib/cmake/cpprestsdk CACHE STRING "Directory t=
o
> install CMake config files.")
> ^ Instead of patching (for mulitlib?): Why not use this option? Something
> like
>
> EXTRA_OECMAKE =3D "-DCPPREST_EXPORT_DIR=3D${baselib}/cpprestsdk"
>
> > + set(CPPREST_INSTALL_HEADERS ON CACHE BOOL "Install header files.")
> > + set(CPPREST_INSTALL ON CACHE BOOL "Add install commands.")
> > +
> > diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
> b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
> > new file mode 100644
> > index 000000000..5f19d14ae
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY =3D "Microsoft project for cloud-based client-server
> communication in native code using a modern asynchronous C++ API design."
> > +SECTION =3D "libs/network"
> > +HOMEPAGE =3D "https://github.com/Microsoft/cpprestsdk/"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://${S}/../license.txt;md5=3D
> a2e15b954769218ff912468eecd6a02f"
> > +DEPENDS =3D "openssl websocketpp zlib boost"
> > +
> > +SRC_URI =3D "git://github.com/Microsoft/cpprestsdk.git;protocol=3Dhttp=
s;
> branch=3Dmaster"
> > +
> > +SRC_URI +=3D "file://fix-cmake-install.patch"
> > +
> > +# tag 2.10.2
> > +SRCREV=3D "fea848e2a77563cf2a6f28f8eab396fd6e787fbf"
> > +
> > +S =3D "${WORKDIR}/git/Release"
> > +
> > +inherit cmake
> > +
> > +FILES_${PN}-dev +=3D "${libdir}/cmake"
> > --
> > 2.14.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

