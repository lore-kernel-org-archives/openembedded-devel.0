Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7206E9A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Apr 2014 18:41:45 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id cc10so3132255wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Apr 2014 11:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=5xwdzfGNtBwtj94psQuobOckkTxwbRZxE0H9bmNGjXs=;
	b=tVpQN/M3Nimi7MGmAuaEWYe1FCJkYFKBoRjh0sx2V4+vheWa91zifOMivvgTXQGt0K
	+ZVc7CSBAi5vigyTbsSTqdF9rDyj1S8Zd+a48ShDvh5o1sVe5Fz3x1kHalpSwQ0NiqdR
	FH9F0PMjG7tbpjC1+h6BCGzoEWqca4wF2tczgrozLythq56veV+PiU1theTEZil6q3KF
	1TgEDgDw3tJuVZCYrfCkWVSlP99rDxvr22VPICN20hb3Z5to+l9JZIwi2yt4Sjn9Ywbw
	fjzJ1VBdF/QBC9miNDajWXPfFzymVQvMO/pJfGR/fRynnwZ3KfpGYUOoob2b7Mi4CFFM
	5c6A==
MIME-Version: 1.0
X-Received: by 10.180.81.228 with SMTP id d4mr40229025wiy.49.1396550505663;
	Thu, 03 Apr 2014 11:41:45 -0700 (PDT)
Received: by 10.194.135.76 with HTTP; Thu, 3 Apr 2014 11:41:45 -0700 (PDT)
In-Reply-To: <lhgt1t$sfb$1@ger.gmane.org>
References: <1396388953-25506-1-git-send-email-stephen.arnold42@gmail.com>
	<lhgt1t$sfb$1@ger.gmane.org>
Date: Thu, 3 Apr 2014 11:41:45 -0700
Message-ID: <CAOLEWZV1w4m3-vRgDKopGJrpx9AKpUrykyq3r1iwS8MRye-ojQ@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [oe-core][PATCH] added upstream license files for gd and gnuplot
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
X-List-Received-Date: Thu, 03 Apr 2014 18:41:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Yeah, that makes sense (although in this case the license file patch was
obsoleted by splitting it across the the recipe change patches).  But yeah,
in the original case the " Common-licenses:" prefix would be good...

Anyway, thanks for the feedback,

Steve



On Wed, Apr 2, 2014 at 4:41 AM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Stephen Arnold schreef op 01-04-14 23:49:
>
> > Subject: [PATCH] added upstream license files for gd and gnuplot
>
> The general rule is that the first line says what the patch does, not what
> you did, so:
>
> [PATCH] Add upstream license files for gd and gnuplot
>
> would be better, but another rule is to prefix the area of interest:
>
> [PATCH] Common-licenses: add upstream license files for gd and gnuplot
>
>
>
> > Fixes QA warnings about missing license files and supports gnuplot recipe
> >  change in license classification.
> >
> > Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
> >
> > --- meta/files/common-licenses/GD      | 53
> > ++++++++++++++++++++++++++++++++++++++ meta/files/common-licenses/gnuplot
> > | 29 +++++++++++++++++++++ 2 files changed, 82 insertions(+) create mode
> > 100644 meta/files/common-licenses/GD create mode 100644
> > meta/files/common-licenses/gnuplot
> >
> > diff --git a/meta/files/common-licenses/GD
> > b/meta/files/common-licenses/GD new file mode 100644 index
> > 0000000..5e17d03 --- /dev/null +++ b/meta/files/common-licenses/GD @@
> > -0,0 +1,53 @@ + +     Portions copyright 1994, 1995, 1996, 1997, 1998,
> > 1999, 2000, 2001, +     2002 by Cold Spring Harbor Laboratory. Funded
> > under Grant +     P41-RR02188 by the National Institutes of Health. + +
> > Portions copyright 1996, 1997, 1998, 1999, 2000, 2001, 2002 by +
> > Boutell.Com, Inc. + +     Portions relating to GD2 format copyright 1999,
> > 2000, 2001, 2002 +     Philip Warner. + +     Portions relating to PNG
> > copyright 1999, 2000, 2001, 2002 Greg +     Roelofs. + +     Portions
> > relating to gdttf.c copyright 1999, 2000, 2001, 2002 John +     Ellson
> > (ellson@lucent.com). + +     Portions relating to gdft.c copyright 2001,
> > 2002 John Ellson +     (ellson@lucent.com). + +     Portions copyright
> > 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007 +
> Pierre-Alain Joye
> > (pierre@libgd.org). + +     Portions relating to JPEG and to color
> > quantization copyright 2000, +     2001, 2002, Doug Becker and copyright
> > (C) 1994, 1995, 1996, 1997, +     1998, 1999, 2000, 2001, 2002, Thomas G.
> > Lane. This software is +     based in part on the work of the Independent
> > JPEG Group. See the +     file README-JPEG.TXT for more information. + +
> > Portions relating to WBMP copyright 2000, 2001, 2002 Maurice +
> > Szmurlo and Johan Van den Brande. + +     Permission has been granted to
> > copy, distribute and modify gd in +     any context without fee,
> > including a commercial application, +     provided that this notice is
> > present in user-accessible supporting +     documentation. + +     This
> > does not affect your ownership of the derived work itself, and +     the
> > intent is to assure proper credit for the authors of gd, not to +
> > interfere with your productive use of gd. If you have questions, +
> > ask. "Derived works" includes all programs that utilize the +
> > library. Credit must be given in user-accessible documentation. + +
> > This software is provided "AS IS." The copyright holders disclaim +
> > all warranties, either express or implied, including but not +
> > limited to implied warranties of merchantability and fitness for a +
> > particular purpose, with respect to this code and accompanying +
> > documentation. + +     Although their code does not appear in gd, the
> > authors wish to thank +     David Koblas, David Rowley, and Hutchison
> > Avenue Software Corporation +     for their prior contributions. + diff
> > --git a/meta/files/common-licenses/gnuplot
> > b/meta/files/common-licenses/gnuplot new file mode 100644 index
> > 0000000..ff6fe23 --- /dev/null +++ b/meta/files/common-licenses/gnuplot
> > @@ -0,0 +1,29 @@ +/*[ + * Copyright 1986 - 1993, 1998, 2004   Thomas
> > Williams, Colin Kelley + * + * Permission to use, copy, and distribute
> > this software and its + * documentation for any purpose with or without
> > fee is hereby granted, + * provided that the above copyright notice
> > appear in all copies and + * that both that copyright notice and this
> > permission notice appear + * in supporting documentation. + * + *
> > Permission to modify the software is granted, but not the right to + *
> > distribute the complete modified source code.  Modifications are to + *
> > be distributed as patches to the released version.  Permission to + *
> > distribute binaries produced by compiling modified sources is granted, +
> > * provided you + *   1. distribute the corresponding source modifications
> > from the + *    released version in the form of a patch file along with
> > the binaries, + *   2. add special version identification to distinguish
> > your version + *    in addition to the base release version number, + *
> > 3. provide your name and address as the primary contact for the + *
> > support of your modified version, and + *   4. retain our contact
> > information in regard to use of the base + *    software. + * Permission
> > to distribute the released version of the source code along + * with
> > corresponding source modifications in the form of a patch file is + *
> > granted with same provisions 2 through 4 for binary distributions. + * +
> > * This software is provided "as is" without express or implied warranty +
> > * to the extent permitted by applicable law. +]*/
> >
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFTO/d8MkyGM64RGpERAtZ9AJ4l4antJVdWXUhF7WmVRHcCdQcWLQCbBiOz
> HKOfboYT/6mclZX90mCIQ70=
> =iz3/
> -----END PGP SIGNATURE-----
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

