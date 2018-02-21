Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 83F3A71C14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 08:49:17 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id n7so2136881wrn.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 00:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tDddBi1ZZ526BbupbAqK4gQgzkc5CbaeEjLCj01Y5FE=;
	b=Glj/HQuIaawLMQJDJxy+rEm6DRbVzOEt7ACwH4EBdUGozDCTUFXFJbDp/nb6oa8Md6
	t6+keY/968gnXVEBvwFsS8TXQN+JhoUb3XjvVn5/X/WGHdp+RwM8DjMCKtogbWzLyVph
	7Y9GuNiguTHtdCODYYEuLkaQXLfLEg2V6aAUt0rws2xJJX/YB5kOi8OCESBVBtrB56QF
	GBPua7rXzyo2f8CivOcsycSktzXBR7ommwkLgm0MoWavyT41POUG9lwH0FhOIYnuVRyG
	i4tFYgRqetFWVjtGaS4ME1NyzJHyVoM3dzkBIuUb6uGxTtoLAKwXtdoBKYRNeR+Ht8Mk
	uVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tDddBi1ZZ526BbupbAqK4gQgzkc5CbaeEjLCj01Y5FE=;
	b=ciSvSBg0U0OpDTffRs3F8ij5HA9O8bwCH/pdaDA1yPjre98Bc9JZBOzUuhMqSTt2b4
	QkHiR5TN8F537nUXPE/72xvORDMAzUdRTHJDvIZLFzUdC2vyZcimAa+MfPVOpjYBWmO7
	gocAhGcraPIQVw3dcsCXVQqaCiBDzYl17grfuEwpXZPrcMiCEWPz+hcVteshXDvJstht
	b3HDR/mNGl1MitFOqAEg6E09MnOH+UzRqm6OI27upvXmQdyMQlZ5NfarWjedULPVTDD2
	Ygm0o3RshnvpWcEqsp7zNcAG05pxJyAardbohU4qEwpx0QVSJmqaMbezqNAfZPlvjfpw
	aMXw==
X-Gm-Message-State: APf1xPDxh1D+kwnS9o3DqShrQDE6puZYex9ETsYjQnx5sowN+HjhVl5B
	mUY15vWlsU8KBQy1hO1Vg6PUEgL2+e27MBs4/gs=
X-Google-Smtp-Source: AH8x227wE110crqa+0WVL66wICMaZ0wwjo/IAD7VDQpTko43kSw1pIJ2m3s7FF7p25C2OsJJiN8PcxbP+tEPul5Ub3M=
X-Received: by 10.28.212.141 with SMTP id l135mr1275403wmg.122.1519202958095; 
	Wed, 21 Feb 2018 00:49:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Wed, 21 Feb 2018 00:49:17 -0800 (PST)
In-Reply-To: <CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
	<8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
	<CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Feb 2018 09:49:17 +0100
Message-ID: <CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Wed, 21 Feb 2018 08:49:18 -0000
Content-Type: text/plain; charset="UTF-8"

> I need an updated python-<foo> package for an unrelated package

And how far will you go?

If you want just newer python-<foo> and nothing else, will you take other
changes to other python-* recipes from meta-python layer? There is a lot of
recipes there, if you're so picky about updates, then you shouldn't update
whole oe-core as well.

On Wed, Feb 21, 2018 at 1:51 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Tue, Feb 20, 2018 at 1:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On 2/20/18 9:13 AM, Bruce Ashfield wrote:
> >> On Tue, Feb 20, 2018 at 11:50 AM, akuster808 <akuster808@gmail.com>
> wrote:
> >>>
> >>>
> >>> On 02/20/2018 02:45 AM, Burton, Ross wrote:
> >>>> Hi,
> >>>>
> >>>> Is now a good time to talk about splitting up meta-oe?  Some layers
> are
> >>>> actively developed and maintained (one example: meta-python), others
> are
> >>>> basically bitrotting and only get touched when something else causes
> them
> >>>> to break world builds (one example: meta-gnome).  I've long felt that
> >>>> meta-oe should be split up and the high quality layers managed in
> their own
> >>>> repositories so patches to them don't get held up by breakage in other
> >>>> sub-layers.
> >>> You make it sound like meta-oe is not a high quality layer.  I could
> >>> make the same claim about oe-core master.
> >>>
> >>> I don't see the connection in patches being held up due to breakage in
> >>> other sub layers. This only happens if the dependency fail to build.
> >>>
> >>> You lose control over the quality in current layers that reside in
> >>> meta-openbedded just like you have no control over all the other layers
> >>> residing in the community. It makes maintaining stable versions very
> >>> difficult. Well, unless The Yocto Project takes over them.. I guess
> that
> >>> would work then.
> >>>
> >>>>
> >>>> Another advantage of splitting out the high quality layers is that
> we'd
> >>>> like to look at running more community layers through the Yocto
> >>>> autobuilder, and granular layers make that easier to manage.
> >>>  I thought not including layers in bblayers.conf was easy enough.
> >>>>
> >>>> Comments?
> >>>
> >>> What problem do you thing you are trying to solve here?
> >>
> >> My unrelated issues are that I can't update one layer, without getting
> >> all of the updates.
> >> .. but that is both a good thing (i.e. they are all tested together,
> >> so you know that the
> >> single SRCREV update is good for all layers), and a bad thing (when
> >> you just want a
> >> new python recipe update from meta-python, but don't want other
> changes).
> >>
> >
> > if you dont include the layers in your BBLAYERS and they become
> > effectively non existent, unless you are on metered internet connection,
> > where downloading unused stuff would save you bandwidth, it should be
> > ok.  No ?
>
> Its not that.
>
> I *am* building the different layers, but say I have a stable set of
> packages
> and working images .. but for whatever reason, I need an updated
> python-<foo>
> package for an unrelated package, or some other layer that needs a newer
> version, etc.
>
> How do I get that, without taking updates to all the layers ? .. and
> layers that
> I really didn't want to update. I have to do some sort of combo-layer,
> carry
> my own copy of the recipe, etc.
>
> So there are definitely ways to do it, I'm just pointing out that I
> end up taking
> some build failures/issues from time to time on packages I didn't really
> need to update.
>
> The flip side of that argument is that all of the layers and sub layers
> have
> gone through some sort of global build, and hence I know that they all have
> worked together for someone. If I can update pieces individually, I break
> that .. and I own the broken bits after that .. which again, goes to
> my point that
> fixing one workflow/issue can break another :D
>
> Bruce
>
> >
> >> It is very likely that splitting the layer would help one issue, but
> >> make the other worse.
> >>
> >> So no solution from me, just an observation about potential issue.
> >>
> >> Cheers,
> >>
> >> Bruce
> >>
> >>>
> >>> - armin
> >>>>
> >>>> Ross
> >>>
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>
> >>
> >
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

