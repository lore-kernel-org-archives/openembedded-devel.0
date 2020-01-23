Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 50F977FE21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 02:28:13 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id c16so1439973ioh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 18:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EZbEhLFGydzNGMqMIvgUKH6aREp2A9EQRMfSeUm7SLw=;
	b=GIXQt7gZqGlUvnRGJbG4J6T8d644WUJ2qvDhkpNrgFDRc0jKKTKICrT1yKMTi5PAiB
	LCd1S+ApM/wH0jpzWR7CFv+JGqN39zU8A1914AALX08DkxgepvRWqNtZx+VRbePVHeTh
	m234R/gWFBXoa6N/duHH7akoLbszNjKoYyjADzX5F48BQbmNg2UBU6SXs6fOnMpcRqtK
	X7RSqnsQL/LLlWLLf1CcjXrVB8M63UikE6NarQN16y1Ko7KkFOSFmUQERDfNWrsC6/V0
	L6X6hvVYh8brwXCNy8ZcUpGjQnr3/Xuhm1lsNHLoZUbdriFaTwVJaUm3Ovc1YsF34vwj
	l7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EZbEhLFGydzNGMqMIvgUKH6aREp2A9EQRMfSeUm7SLw=;
	b=NJ4iGKes0yllCluwuwNXC2j//cfnVBGw3tJPANicaFuYA5jGLmJKS38IPoNut04jvi
	ldoiramCKqkP9Nfv01H/oYrfxsx+bRmO8LZC6noTz8fCEBKDTuR/fuA59vrhIdTJB4/c
	tyI2Zw1Uh49fqJXXZxZalfjUiJz8tJyJQXnrLh7StN3KwQwJ6l7Cql7BtwDKPF+w9EhM
	cOMeTMkQ5Ejc4R7V93wRTYQxPiL7MxLhmxN1hjXo5Go26gVHUcrht4ZKhoQ2yO3FQwlW
	Bl4gb3ju5cmPdt6ec0knS6d5QXqG6kFPXzG586hPHoVfZlcYEkwSIuAZlEzC8/SUvmHZ
	J21g==
X-Gm-Message-State: APjAAAXXBSSeYaAf6PXu5rg/m1uMW1AXannvLHnpd6iyzbUXNtpoAkJh
	5fMEBIrYnvDC3aPJ5ksVdSm3NvmI56EjyJ53Ejc=
X-Google-Smtp-Source: APXvYqyf0scglN5w40rF6qMhfjULvfIvBZcIPsEET3vxogd0pg4V0d0kbc6ZEr4s9U9rnecW0Cy1hfJHa4L9msjTiZU=
X-Received: by 2002:a5e:dd08:: with SMTP id t8mr9352732iop.151.1579746494908; 
	Wed, 22 Jan 2020 18:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20200117065558.19959-1-zangrc.fnst@cn.fujitsu.com>
	<CAMKF1spN_VGujcWwN25za7f+M9Chjgsvrr5cWN=w3voA-_NK+A@mail.gmail.com>
In-Reply-To: <CAMKF1spN_VGujcWwN25za7f+M9Chjgsvrr5cWN=w3voA-_NK+A@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 22 Jan 2020 18:28:03 -0800
Message-ID: <CANx9H-COXyvdkxV7xrQB3vK8-J5GGqVuTuQP_seV+c5uZMOsPQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] [PATCH] python-yappi: upgrade 1.0 -> 1.2.3
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
X-List-Received-Date: Thu, 23 Jan 2020 02:28:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 22, 2020 at 12:54 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Jan 16, 2020 at 10:54 PM Zang Ruochen
> <zangrc.fnst@cn.fujitsu.com> wrote:
> >
> > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > ---
> >  meta-python/recipes-devtools/python/python-yappi.inc        | 6 +++---
> >  .../python/{python-yappi_1.0.bb => python-yappi_1.2.3.bb}   | 0
> >  .../python/{python3-yappi_1.0.bb => python3-yappi_1.2.3.bb} | 0
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python-yappi_1.0.bb =>
> python-yappi_1.2.3.bb} (100%)
> >  rename meta-python/recipes-devtools/python/{python3-yappi_1.0.bb =>
> python3-yappi_1.2.3.bb} (100%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-yappi.inc
> b/meta-python/recipes-devtools/python/python-yappi.inc
> > index 54d408742..e84774f9d 100644
> > --- a/meta-python/recipes-devtools/python/python-yappi.inc
> > +++ b/meta-python/recipes-devtools/python/python-yappi.inc
> > @@ -2,10 +2,10 @@ SUMMARY  = "Yet Another Python Profiler"
> >  HOMEPAGE = "http://yappi.googlecode.com/"
> >
> >  LICENSE = "MIT"
> > -LIC_FILES_CHKSUM =
> "file://PKG-INFO;md5=9a193c13f346884e597acdcac7fe9ac8"
> > +LIC_FILES_CHKSUM =
> "file://PKG-INFO;md5=91efaebbca5a9e4db0870636d36e7b98"
> >
>
> what changed here? Please mention that in commit msg and also rebase
> it on the latest master
>
> > -SRC_URI[md5sum] = "a545101aa8a435b0780f06f4723f58c8"
> > -SRC_URI[sha256sum] =
> "7f814131515d51db62b1a3468bcb84de30499124752806a5a6e11caf0b4344bf"
> > +SRC_URI[md5sum] = "36474a3e47ad9a2e4605b8e7e30a08fc"
> > +SRC_URI[sha256sum] =
> "b8db9bc607610d6da4e27e87ec828ebddec4bdaac89ca07ebfe9a153b0641580"
> >
> >  inherit pypi setuptools
> >
> > diff --git a/meta-python/recipes-devtools/python/python-yappi_1.0.bb
> b/meta-python/recipes-devtools/python/python-yappi_1.2.3.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python-yappi_1.0.bb
> > rename to meta-python/recipes-devtools/python/python-yappi_1.2.3.bb


The py2 recipe can be patched on meta-python2 if you so desire.
We are dropping py2 recipes from meta-python.

>
> > diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.0.bb
> b/meta-python/recipes-devtools/python/python3-yappi_1.2.3.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python3-yappi_1.0.bb
> > rename to meta-python/recipes-devtools/python/python3-yappi_1.2.3.bb
> > --
> > 2.20.1
> >
> >
> >
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

