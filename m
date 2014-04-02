Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5E06FA7A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Apr 2014 03:48:55 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u56so7257732wes.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 20:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=gt3IqqC9wBd3ABAl+hBWoadejGAeEpzdnPXq1aJxb+M=;
	b=cnoF7+GJdhngDcV/74X3Smj2PJeZtkkkX9HBEr0b31Dn14S65SpEQ15RJCXinaOntm
	tY/qa836mIfzDlcnaHq4Fpr+U3hUzWvTNGZwxm02rDBN8IQCQIQ1knksubqg34qqSyuH
	TXBJZMwYrQY2DmDnmvv9Kb3oLCiWSubENMxgZaA7f4s8ABM+wnQyaAIuTiZ3Syu6m9f1
	ea0gl4uag9Kl4toZGUn75OYSydLfnvZGbT6fL9ee6botKNYdWwM5RA++ea0Qe6EbbVvm
	7VG6UXN6xTWFAMfKcKRP9B9sbFHsmONJcZBWi4Tjk35/fFoAPd1E60wIxx/Xr6acHTAC
	Q39Q==
MIME-Version: 1.0
X-Received: by 10.180.105.65 with SMTP id gk1mr25012015wib.12.1396410535318;
	Tue, 01 Apr 2014 20:48:55 -0700 (PDT)
Received: by 10.216.117.6 with HTTP; Tue, 1 Apr 2014 20:48:55 -0700 (PDT)
In-Reply-To: <20140402004143.GA2132@jama>
References: <CAOLEWZWxEZNDkg8v7oSoqjzA0mYXxW2pRMWqcraCLhYNRbA6nA@mail.gmail.com>
	<20140402004143.GA2132@jama>
Date: Tue, 1 Apr 2014 20:48:55 -0700
Message-ID: <CAOLEWZV156wEqqOMfNbphgB0_ykdiEzRuz7Osq70uLAf-B6DGg@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2] changed gnuplot recipe license to gnuplot
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
X-List-Received-Date: Wed, 02 Apr 2014 03:49:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Okay, restructured and resent as requested.

Steve


On Tue, Apr 1, 2014 at 5:41 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Apr 01, 2014 at 05:09:02PM -0700, Stephen Arnold wrote:
> > Was working with Martin on this one; the "original" patch referred to is
> > Tim's gnuplot upgrade patch.  The patch being superseded is my earlier
> > patch from today that included Tim's changes plus the license change.
> > *And* the license file patch was just resent as a patch to meta-oe, so
> > hopefully we're good on this one...
>
> The commit message should still be improved as Paul says, it also
> mentions oe-core patch which isn't true anymore.
>
> It would be even better if you add gnuplot license file in this commit
> and in the other one just add the license text for gd. That way we'll
> have related changes in the same commit.
>
> > On Tue, Apr 1, 2014 at 4:14 PM, Paul Barker <paul@paulbarker.me.uk>
> wrote:
> >
> > > On 1 April 2014 23:36, Stephen Arnold <stephen.arnold42@gmail.com>
> wrote:
> > > > Also sent license file patch for oe-core.  This supercedes previous
> > > gnuplot
> > > > patch that incorrectly included the original gnuplot patch changes as
> > > well.
> > >
> > > Just got a few bits of general advice on submitting patches to
> > > OpenEmbedded:
> > >
> > > Each patch subject should be of the form "thing: change", where thing
> > > is usually the recipe name. So this would be "gnuplot: Use gnuplot
> > > license" or something similar.
> > >
> > > The "[PATCH]" tag should be "[PATCH v2]" if you're superseding a
> > > previously sent but not yet merged patch. In this case, it's unclear
> > > which patch your mean. Please email in reply to the patch you want to
> > > cancel so that the maintainers know not to merge it.
> > >
> > > There's a lot of further detailed advice and guidelines at
> > > http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> > >
> > > Thanks,
> > >
> > > --
> > > Paul Barker
> > >
> > > Email: paul@paulbarker.me.uk
> > > http://www.paulbarker.me.uk
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
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

