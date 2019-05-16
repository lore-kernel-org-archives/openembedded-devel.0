Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 65E886B07E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 08:21:26 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id q21so1840277iog.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 01:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oB1xvhiN1ihrS04AjZVTHj+dZ7tBIuzHuG8fIJG2X/E=;
	b=dXTpixkZa2F1BRCrtwKBy+H808NSXINAEcm2k68bT/MJVsLTuHjjQDtnSPDYjaXVSb
	qY/TINeNFhmcLiSoix+1jNptuCGYVqhRo03qgzupGcKgYEefndRQtgVEPfVH9VUtxJxz
	QXUbt4O25oUK0SHx36fe/tpy+yrbdI9U9i3xvXDfTJKI7uIwQWFFOb62mOx5g0cBhsfJ
	76p2lqjKL816EWbKXftOQM5UpHWDsnY7JIhGcr28KIy+V+tvdQ8GZ6rmPgpnhIWYHPBV
	katY9L4hhCgZMb/gHZKeLFUUg3UqnfSzbyL4fwLqRE7d1VTAHgZvqOT3xsjtiwn8yHUN
	U4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oB1xvhiN1ihrS04AjZVTHj+dZ7tBIuzHuG8fIJG2X/E=;
	b=PmpYtOa8jfKnj4M7hOc+6Netv5oE5TgKFsZCjEGOPq5pdNw7aebdgIggrKu+VDPhdh
	Oix1knPWqI+EZac0u+N7GUMI92P3rQe+4lzesh4yOXKIXPnqGZhJb40XNNj3nOFTRYtE
	XiJEtDXrCAAWyCZzESds31QdXS8kRNUdEhU4mFdJPIZN2H3TbMcLa3XYlNWIJj/2kiYZ
	Gw/ABN7M+4zvA9e4k4w93mUoBgDHGEX+T+OjKCg9mjysmqSCzkIiab81HqUdCeTgqRst
	9M/BnfyNlThYb9/zV2aqx+4RPxct2Ok0OxeY7/lZT8Bk+WGh35Cja1fVTPCmAwGR4czy
	AVrg==
X-Gm-Message-State: APjAAAVKfnDqFSDlSzMDzoY3umR6DAcbGn/iln7+iAmklof428TW18KS
	eOnlb1T33aaXiGxi0O5nV2FXXPwLlxDshF+WZ84=
X-Google-Smtp-Source: APXvYqzLj/T2Sxq+KxsiXPIXfBHjTjggd0Rf4qh0nJIl07gfaQA4ytqd7JSt5r95J2nMfT6Y1+rMJNLJf8UytE7pGo0=
X-Received: by 2002:a5d:9a18:: with SMTP id s24mr14929641iol.284.1557994887397;
	Thu, 16 May 2019 01:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190516070624.27975-1-Martin.Jansa@gmail.com>
	<20190516072441.GA7938@localhost>
In-Reply-To: <20190516072441.GA7938@localhost>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 16 May 2019 10:21:14 +0200
Message-ID: <CALbNGRTv-YB-Gx4sLpF7+8g0B9U63qm=mpm4a43KZmnzsq+9wQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] gtkwave: add distro_features_check
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
X-List-Received-Date: Thu, 16 May 2019 08:21:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 16, 2019 at 9:25 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, May 16, 2019 at 07:06:22AM +0000, Martin Jansa wrote:
> > * fixes:
> > ERROR: Nothing PROVIDES 'gtk+' (but /OE/build/luneos-warrior/webos-ports/meta-openembedded/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb DEPENDS on or otherwise requires it)
> > gtk+ was skipped: one of 'x11 directfb' needs to be in DISTRO_FEATURES
> > ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> > Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gtkwave', 'gtk+']
> >
> > and
> >
> > ERROR: Nothing PROVIDES 'tk' (but /OE/build/luneos-warrior/webos-ports/meta-openembedded/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb DEPENDS on or otherwise requires it)
> > tk was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
> > ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> > Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gtkwave', 'tk']
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> > index 60df6f773b..b9aae0f6c8 100644
> > --- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> > +++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> > @@ -14,6 +14,10 @@ inherit pkgconfig autotools gettext texinfo
> >  DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0"
> >  RDEPENDS_${PN} = "tk-lib"
> >
> > +# depends on gtk+ which has this restriction
> > +inherit distro_features_check
> > +ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
> >...
>
> Shouldn't this be x11 (without the directfb alternative)
> due to tk?
>
It is slightly off-top and maybe I missed something but from my
opinion these type of patches are wrong - and we have many of them.
The origin of the issue is gtk+ not gtkwave.

Would it be a big issue if recipes inherit distro-feature-check
settings from the recipes they depend on?

I ask this because this is definitely a maintenance burden and such a
mechanism would make life much easier.

Cheers

Andreas

