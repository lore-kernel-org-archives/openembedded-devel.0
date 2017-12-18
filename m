Return-Path: <kergoth@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id C11B371BEE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 15:37:13 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id l36so10933929uae.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 07:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y8GDxnrl4GtITAxWHTyErXpWY4YzUuiVQi0+9XLgrxw=;
	b=hwaQkmix4W694FICp2hGiO3lkzbaWFXVrJFE72K/738NH5WfOGbHoi6ytge3i7ZZmx
	Sni3kAfR9x0bvxbQRc0fZGyV55qHeKpPgNtOKDvmCkDNewsLPix9TnG20SG/G2/KKh86
	QPti5/KLt8TusjUFoWUpQifujKAZPOCl1VpsRFTblcGZoIY1Rv9I1NO6sO/+N40UPyap
	DPQx31aHon5HLJc7PkQgak8ewD0bJFjj5Q8UTfbo+SGGFQJpSxtVWX+Fn1xoQgHzVMuP
	EDR7ktpE4gU/L3iVsk7MCRLirFs6T5nuAhkQgtXBN3ymiyM2QfS3DH0UzsSHfh64qyRq
	w1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y8GDxnrl4GtITAxWHTyErXpWY4YzUuiVQi0+9XLgrxw=;
	b=KY8NQi5y4tRH1ltQoicIDTy6JJEt7pA/EhTX4LxNRNHaTIhzqfiBeUsr4onsXG/RsK
	Uoe/0a1T0rYb+NQkXDkSmE8tZ1i8U8sTsJr07mizXYXKpm2oSVGEG4Wm8Rj40Em0/IG4
	0a62/R6q56jhND2cVUuCOntVzlV0HWElqMPWOugB5bWZFxnHy11C3iST8c9i/Zn+5UyP
	FNBqLfzpNKCY14nkx6ZGZ0t+Pu/4bI84kNBqwxqylsAQB3N17oUunFXXehbNIVt+obAB
	5gEJeEL6w6lAttGS4ERkOb1KP7vZPxHHYX6e5wsJ9QIz9tEYujhNakj022ZeIl99d28h
	DecA==
X-Gm-Message-State: AKGB3mJUP9uvXg6ncOtNamomCL/NHY9+tv9TKRQboe++Y/Uj2DJW7OI4
	qT1pP16zQkc9zefPii1VFlpqWjwAfUe6B7rzRlU=
X-Google-Smtp-Source: ACJfBouRQsZ6NP479go+Gb2eGU9F3/7YiWSf/K7/3pmoWOmYsi0R9Pr2bMyXHScaqmDWLqJpxQ2FpEaqyw5ODcdPTf0=
X-Received: by 10.159.46.12 with SMTP id t12mr125857uaj.125.1513611434548;
	Mon, 18 Dec 2017 07:37:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.72.130 with HTTP; Mon, 18 Dec 2017 07:36:53 -0800 (PST)
In-Reply-To: <CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
	<CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 18 Dec 2017 08:36:53 -0700
Message-ID: <CABcZANku-aE5a69GpJxXmd2F0+uYVhiRZB3Uut7F2RG1e3R9EA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-pyroute2: uprev to v0.4.21 (from 0.3.22)
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
X-List-Received-Date: Mon, 18 Dec 2017 15:37:14 -0000
Content-Type: text/plain; charset="UTF-8"

All our python recipes should be explicitly listing the python module
packages they require. No python module recipes should be depending on
python-modules or python3-modules, but explicitly what they require.

On Mon, Dec 18, 2017 at 8:33 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On Sat, Dec 16, 2017 at 4:58 PM, Derek Straka <derek@asterius.io> wrote:
> > On Mon, Dec 4, 2017 at 2:00 PM, Mark Asselstine <
> > mark.asselstine@windriver.com> wrote:
> >
> >> Drop the json<-->simplejson patch instead opting to depend on
> >> python-json (part of core python libs). Beyond this the uprev is
> >> straightforward.
> >>
> >> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> >> ---
> >>  .../recipes-devtools/python/python-pyroute2.inc    | 23
> >> +++++--------------
> >>  .../import-simplejson-as-json.patch                | 26
> >> ----------------------
> >>  ...yroute2_0.3.22.bb => python-pyroute2_0.4.21.bb} |  0
> >>  ...route2_0.3.22.bb => python3-pyroute2_0.4.21.bb} |  0
> >>  4 files changed, 6 insertions(+), 43 deletions(-)
> >>  delete mode 100644 meta-python/recipes-devtools/
> >> python/python-pyroute2/import-simplejson-as-json.patch
> >>  rename meta-python/recipes-devtools/python/{python-pyroute2_0.3.22.bb
> =>
> >> python-pyroute2_0.4.21.bb} (100%)
> >>  rename meta-python/recipes-devtools/python/{python3-pyroute2_0.3.22.bb
> >> => python3-pyroute2_0.4.21.bb} (100%)
> >>
> >> diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc
> >> b/meta-python/recipes-devtools/python/python-pyroute2.inc
> >> index da1d4cd..521162c 100644
> >> --- a/meta-python/recipes-devtools/python/python-pyroute2.inc
> >> +++ b/meta-python/recipes-devtools/python/python-pyroute2.inc
> >> @@ -1,26 +1,15 @@
> >>  SUMMARY = "A pure Python netlink and Linux network configuration
> library"
> >>  LICENSE = "GPLv2 & Apache-2.0"
> >>  LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=
> >> b234ee4d69f5fce4486a80fdaf4a4263 \
> >> -                    file://LICENSE.Apache.v2;md5=
> >> 3b83ef96387f14655fc854ddc3c6bd57"
> >> +                    file://LICENSE.Apache.v2;md5=
> >> 34281e312165f843a2b7d1f114fe65ce"
> >>
> >> -SRC_URI[md5sum] = "733adb362b6603c7269c0b3df3045a55"
> >> -SRC_URI[sha256sum] = "5cdf44656cf623369f0cbf183d9d14
> >> a1a50ebdffbd50d4e30ffda62c0a05d7b3"
> >> -
> >> -SRC_URI += "file://import-simplejson-as-json.patch"
> >> +SRC_URI[md5sum] = "9c251543c4282a2f8b1a8d6aa8afc688"
> >> +SRC_URI[sha256sum] = "7afad28ee0a0f3e7c34adaa9f953d0
> >> 0560ed9910203e93f107833b6e8d151171"
> >>
> >>
> > Can we remove the extra path prepend now?
> >
> >>  FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyroute2:"
>
> Sure. I will send a V2 once we get agreement on the RDEPENDS.
>
> >>
> >>  inherit pypi
> >>
> >> -RDEPENDS_${PN} += "\
> >> -  ${PYTHON_PN}-distutils \
>
> stdlib
>
> >> -  ${PYTHON_PN}-simplejson \
>
> per the commit log, use json instead to match upstream expectations.
>
> >> -  ${PYTHON_PN}-multiprocessing \
>
> stdlib
>
> >> -  ${PYTHON_PN}-io ${PYTHON_PN}-pprint \
>
> stdlib
>
> >> -  ${PYTHON_PN}-pickle \
>
> stdlib
>
> >> -  ${PYTHON_PN}-logging \
>
> stdlib
>
> >> -  ${PYTHON_PN}-threading \
>
> stdlib
>
> >> -  ${PYTHON_PN}-textutils \
>
> No reference in this version of pyroute2
>
> >> -  ${PYTHON_PN}-subprocess \
>
> stdlib
>
> >> -  ${PYTHON_PN}-netclient \
>
> No reference in this version of pyroute2
>
> >> -"
> >>
> > None of these other dependencies are needed for a minimal python install?
>
> Sorry, I should have covered this in my commit log. This was a mistake on
> my
> part but was intentional since these are all stdlib modules as I have show
> above and as is described in the the pyroute2 README:
> "Pyroute2 is a pure Python **netlink** library. It requires only Python
> stdlib"
>
> All stdlib modules are listed as RDEPENDS in python[3]-modules so we are
> only making work for ourselves breaking these out here. I will put them
> back
> but if we go this route, of listed stdlib RDEPENDS, then there is a lot of
> work
> to ensure this is consistent across all our python recipes.
>
>
> Mark
>
>
> >
> >> +RDEPENDS_${PN} += " \
> >> +    ${PYTHON_PN}-json \
> >> +    "
> >> diff --git a/meta-python/recipes-devtools/python/python-
> >> pyroute2/import-simplejson-as-json.patch b/meta-python/recipes-
> >> devtools/python/python-pyroute2/import-simplejson-as-json.patch
> >> deleted file mode 100644
> >> index d73da07..0000000
> >> --- a/meta-python/recipes-devtools/python/python-
> >> pyroute2/import-simplejson-as-json.patch
> >> +++ /dev/null
> >> @@ -1,26 +0,0 @@
> >> -Upstream-Status: Inappropriate [wrong dependency]
> >> -
> >> -Subject: [PATCH] import simplejson as json
> >> -
> >> -At runtime python-pyroute2 tries to import json, but the module is not
> >> -available, import simplejson as json solve the issue.
> >> -
> >> -Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> >> ----
> >> - pyroute2/netlink/rtnl/ifinfmsg.py | 2 +-
> >> - 1 file changed, 1 insertion(+), 1 deletion(-)
> >> -
> >> -diff --git a/pyroute2/netlink/rtnl/ifinfmsg.py
> b/pyroute2/netlink/rtnl/
> >> ifinfmsg.py
> >> -index 4f14f25..55643eb 100644
> >> ---- a/pyroute2/netlink/rtnl/ifinfmsg.py
> >> -+++ b/pyroute2/netlink/rtnl/ifinfmsg.py
> >> -@@ -1,5 +1,5 @@
> >> - import os
> >> --import json
> >> -+import simplejson as json
> >> - import errno
> >> - import select
> >> - import struct
> >> ---
> >> -2.1.4
> >> -
> >> diff --git a/meta-python/recipes-devtools/python/python-
> pyroute2_0.3.22.bb
> >> b/meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb
> >> similarity index 100%
> >> rename from meta-python/recipes-devtools/python/python-pyroute2_0.3.22.
> bb
> >> rename to meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb
> >> diff --git a/meta-python/recipes-devtools/python/python3-
> >> pyroute2_0.3.22.bb b/meta-python/recipes-devtools/python/python3-
> >> pyroute2_0.4.21.bb
> >> similarity index 100%
> >> rename from meta-python/recipes-devtools/python/python3-pyroute2_0.3.
> 22.bb
> >> rename to meta-python/recipes-devtools/python/python3-pyroute2_0.4.
> 21.bb
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

