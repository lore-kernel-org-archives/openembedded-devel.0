Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id B00066FA5C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Apr 2014 16:32:19 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id cc10so888068wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Apr 2014 09:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=s982SfzFJhJq+7p7YDaQYRLA5B7PucHcmk6eAc1Nat0=;
	b=wWkWRLqBUOPx+0IfBSQb5nIvvob2T6jAfUosut96OJ/dTY+CGC8BkOBPR5KCc1PuA0
	cII3xvf7YEl0wNFMA+PsYhf4+3z1iZ4kwu4ZQN/DLXusecq/yhCYRwi7opw3SfVexGVo
	npPlaGqaCtAwQu3mWFyGYyf8jcGU31QwO/jOnDdW7KXrqSZMRSD2fSEs4Vi3qrYctAZR
	+dJ99zj24WTt9Z+CFzlJuPLzUHBpmq8YxshL3P7+y5PG9U4KhNKHM+lpRylyZQDymNKC
	Zr8j5XhyppXFLDv27sJ9qzK1h3LNGHY2PdUBbAZsfqomZKJEHAignYVe3MA0l14/BcEI
	qBdg==
MIME-Version: 1.0
X-Received: by 10.180.189.43 with SMTP id gf11mr3524462wic.32.1396456338291;
	Wed, 02 Apr 2014 09:32:18 -0700 (PDT)
Received: by 10.216.117.6 with HTTP; Wed, 2 Apr 2014 09:32:18 -0700 (PDT)
In-Reply-To: <20140402125004.GB2132@jama>
References: <1396410465-13709-1-git-send-email-stephen.arnold42@gmail.com>
	<20140402125004.GB2132@jama>
Date: Wed, 2 Apr 2014 09:32:18 -0700
Message-ID: <CAOLEWZVCE19+jeLdPT8Cb2GKQPDV7q9BNniJck6B57+QJjqYDQ@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2 1/2] gd: added upstream license file and fixed configure warnings
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
X-List-Received-Date: Wed, 02 Apr 2014 16:32:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

Both license files are "as-is" from their respective source trees.  md5sums
match the LIC_FILES_CHKSUM in each of the recipes.

Steve


On Wed, Apr 2, 2014 at 5:50 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Apr 01, 2014 at 08:47:44PM -0700, Stephen Arnold wrote:
> > This fixes QA warnings about missing license file and stale configure
> options,
> > (includes updates for freetype libpath and disables hardcoded rpaths).
>
> It shows couple of trailing whitespaces in license text, but if they are
> also in the original source of it, then we should probably keep them.
>
> Please confirm.
>
> > Upstream-Status: Inappropriate (distribution/packaging fix)
> >
> > Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
> > ---
> >  meta-oe/licenses/GD                               | 53
> +++++++++++++++++++++++
> >  meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb |  4 +-
> >  2 files changed, 55 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-oe/licenses/GD
> >
> > diff --git a/meta-oe/licenses/GD b/meta-oe/licenses/GD
> > new file mode 100644
> > index 0000000..5e17d03
> > --- /dev/null
> > +++ b/meta-oe/licenses/GD
> > @@ -0,0 +1,53 @@
> > +
> > +     Portions copyright 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001,
> > +     2002 by Cold Spring Harbor Laboratory. Funded under Grant
> > +     P41-RR02188 by the National Institutes of Health.
> > +
> > +     Portions copyright 1996, 1997, 1998, 1999, 2000, 2001, 2002 by
> > +     Boutell.Com, Inc.
> > +
> > +     Portions relating to GD2 format copyright 1999, 2000, 2001, 2002
> > +     Philip Warner.
> > +
> > +     Portions relating to PNG copyright 1999, 2000, 2001, 2002 Greg
> > +     Roelofs.
> > +
> > +     Portions relating to gdttf.c copyright 1999, 2000, 2001, 2002 John
> > +     Ellson (ellson@lucent.com).
> > +
> > +     Portions relating to gdft.c copyright 2001, 2002 John Ellson
> > +     (ellson@lucent.com).
> > +
> > +     Portions copyright 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007
> > +              Pierre-Alain Joye (pierre@libgd.org).
> > +
> > +     Portions relating to JPEG and to color quantization copyright 2000,
> > +     2001, 2002, Doug Becker and copyright (C) 1994, 1995, 1996, 1997,
> > +     1998, 1999, 2000, 2001, 2002, Thomas G. Lane. This software is
> > +     based in part on the work of the Independent JPEG Group. See the
> > +     file README-JPEG.TXT for more information.
> > +
> > +     Portions relating to WBMP copyright 2000, 2001, 2002 Maurice
> > +     Szmurlo and Johan Van den Brande.
> > +
> > +     Permission has been granted to copy, distribute and modify gd in
> > +     any context without fee, including a commercial application,
> > +     provided that this notice is present in user-accessible supporting
> > +     documentation.
> > +
> > +     This does not affect your ownership of the derived work itself, and
> > +     the intent is to assure proper credit for the authors of gd, not to
> > +     interfere with your productive use of gd. If you have questions,
> > +     ask. "Derived works" includes all programs that utilize the
> > +     library. Credit must be given in user-accessible documentation.
> > +
> > +     This software is provided "AS IS." The copyright holders disclaim
> > +     all warranties, either express or implied, including but not
> > +     limited to implied warranties of merchantability and fitness for a
> > +     particular purpose, with respect to this code and accompanying
> > +     documentation.
> > +
> > +     Although their code does not appear in gd, the authors wish to
> thank
> > +     David Koblas, David Rowley, and Hutchison Avenue Software
> Corporation
> > +     for their prior contributions.
> > +
> > diff --git a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bbb/meta-oe/recipes-support/gd/gd_2.0.35+
> 2.0.36rc1.bb
> > index 957c4eb..5fb5857 100644
> > --- a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
> > +++ b/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
> > @@ -15,10 +15,10 @@ S = "${WORKDIR}/gd-2.0.36RC1"
> >
> >  inherit autotools binconfig gettext
> >
> > -EXTRA_OECONF += " --with-zlib=${STAGING_LIBDIR}/.. \
> > +EXTRA_OECONF += " --disable-rpath \
> >                    --with-png=${STAGING_LIBDIR}/.. \
> >                    --with-jpeg=${STAGING_LIBDIR}/.. \
> > -                  --with-freetype \
> > +                  --with-freetype=${STAGING_LIBDIR}/.. \
> >                    --without-fontconfig \
> >                    --without-xpm \
> >                    --without-x"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

