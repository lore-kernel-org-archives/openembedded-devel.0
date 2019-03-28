Return-Path: <wak@google.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 38B067D0F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 09:04:43 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id a28so638392lfo.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 02:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wEvYsgcMQwS+oRxohSYOp0GXwYYPUoCXtmRVARDtVxw=;
	b=IcfyB5VQhiX2cwm8rUaf79b1YLOoaSKnlnR8NYOtdpyKPYIu6a5oL3gLPIgVqWbm6e
	qNw8Gx7Z7lLbWZAxUDmoAykf0xy5yZU3nzQdmus/62EFRG9z43XYF0pAunRyVjwIW+XM
	g7S0ItIGaD2v2v2naM4agiIqNQwsSsUj5HLmrTd5pBxr5PMvMQBs7S9uvkBOhRMCOGfW
	3BgUOt8v5XnIDc7k+DidEd/P1GhahwSI3S8TduZyZX+XBDSJAw5lCkVVBlUZrXoMODLk
	KasPoV6Ad2LQe0xQOVr+1WL93ZTO+sxsiAq28T8vcdtWpohHt4fvx6yQ5PQW/PGQ+XTX
	4OTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wEvYsgcMQwS+oRxohSYOp0GXwYYPUoCXtmRVARDtVxw=;
	b=Y5zehAtdkUGRAwzlVmR8zNxwcf5W0W3JI8NXGF/TIHzngu4BRlMZ0WnPPkvk+vunS+
	F+vP/FOYhBvi5t2peM86AWZ8y1TcNxyoLWJTghnH9BVYbSslXI9Z2FkvQNmhTjvBkd8T
	v3R9JvnBj5ahs4HkaGrgV1RHWtuloI379cLAJspaeY/BvAQ/7TMzJPVktGLwLk5b34qm
	vlTCl4YFPWWi5HcKoQ3om+kLZhjfYLqI83ksra6SxFEfsysml2+ci6zUMy4PA7FcPP4o
	fbu765YyW68dYsEJcExakboti86DZLYH1nTdXuUjc2VAU8aHxhhWAOX7FCw39edMrrG0
	xWTA==
X-Gm-Message-State: APjAAAUO50/Gl2yPmOWymmffK0DloWVMBkVED/pQApbUbDco479IVwU/
	3ILfzjlD+y3fMifR6syXM97LlpUKhVBypoNs8xfKBQ==
X-Google-Smtp-Source: APXvYqwhlw2JBVOb8V626g2KUo3ap9GtB+lqhHT5fk5BkgaAtjiHzjdVLbO9WE8SDICmKZJMz8r2yOGJkN4Z1jaFhto=
X-Received: by 2002:ac2:44a2:: with SMTP id c2mr20913658lfm.155.1553763883527; 
	Thu, 28 Mar 2019 02:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190327032430.59511-1-wak@google.com>
	<CAMKF1srK4zKuwA0zzo6zNpASu_yYp1W8txE+gzgBiP6vzWuzAA@mail.gmail.com>
In-Reply-To: <CAMKF1srK4zKuwA0zzo6zNpASu_yYp1W8txE+gzgBiP6vzWuzAA@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Thu, 28 Mar 2019 02:04:32 -0700
Message-ID: <CAPnigKmZvszOumY-EEbvTGcR2+-8EP3woGEbMyNrts2=s0N8kA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cli11: 1.6.2 -> 1.7.1
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
X-List-Received-Date: Thu, 28 Mar 2019 09:04:43 -0000
Content-Type: text/plain; charset="UTF-8"

Yeah, sorry about that. This is a known issue with the gitsm and I
sent out a patch yesterday
https://patchwork.openembedded.org/series/16685/#
this was followed up by a maintainer patch to implement similar update checking
https://patchwork.openembedded.org/series/16702/#

I don't think we have consensus yet on a proper fix but hopefully we
get something soon. This is breaking us in openbmc.

On Wed, Mar 27, 2019 at 9:30 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Mar 26, 2019 at 8:24 PM William A. Kennington III via
> Openembedded-devel <openembedded-devel@lists.openembedded.org> wrote:
> >
> > LICENSE checksum updated to reflect a new copyright date being updated
> > there.
> >
> fails to unpack
>
> https://errors.yoctoproject.org/Errors/Details/234626/
>
> > Signed-off-by: William A. Kennington III <wak@google.com>
> > ---
> >  .../recipes-support/cli11/{cli11_1.6.2.bb => cli11_1.7.1.bb}  | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-oe/recipes-support/cli11/{cli11_1.6.2.bb => cli11_1.7.1.bb} (79%)
> >
> > diff --git a/meta-oe/recipes-support/cli11/cli11_1.6.2.bb b/meta-oe/recipes-support/cli11/cli11_1.7.1.bb
> > similarity index 79%
> > rename from meta-oe/recipes-support/cli11/cli11_1.6.2.bb
> > rename to meta-oe/recipes-support/cli11/cli11_1.7.1.bb
> > index e62c1d3d1..1ed97a27e 100644
> > --- a/meta-oe/recipes-support/cli11/cli11_1.6.2.bb
> > +++ b/meta-oe/recipes-support/cli11/cli11_1.7.1.bb
> > @@ -2,8 +2,8 @@ SUMMARY = "C++11 command line parser"
> >  DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
> >  HOMEPAGE = "https://github.com/CLIUtils/CLI11"
> >  LICENSE = "BSD-3-Clause"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=c271fee3ae28e11b24b97284d9f82887"
> > -SRCREV = "bd4dc911847d0cde7a6b41dfa626a85aab213baf"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=8489f3831fc7b75264c1d5e346251a74"
> > +SRCREV = "49ac989a9527ee9bb496de9ded7b4872c2e0e5ca"
> >  PV .= "+git${SRCPV}"
> >
> >  SRC_URI += "gitsm://github.com/CLIUtils/CLI11 \
> > --
> > 2.21.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

