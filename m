Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 14FFF78745
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 13:55:26 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id f19so2483210lfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 05:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M/iPPxEuX/UZQMiRAhGZE8lvVo/kkYnSXcnNdgtaw8Q=;
	b=VQ6PuNB9VN1P3Xp6+oChUhRKnzDP7CG9feABY+e8wBPoW4Y4bhJ2pl063tJsebz+vJ
	5+yNkOWT9wKrOrxcsI6u3PktZHzHFz+BNJm7SJObbDJmi3AlqXLL9j59/FTtTXJq7MvS
	Wt4UvYBT+aed+dbPVF4gh1nz5BTccH53yB7M2sxZblyI/ELtpMR7tyQEFory2B8Pni42
	TAJ57dvlMGKEypCw+Sr66kj21rdkP6LfgNDV9yowFoFUdc3K7S+7lJkGulRlPD7mPQsx
	CTAtCze2glXuklx1oswqm9606u7KO/s4GPIgToYXrIkvvQWCcqGHB6BRn4ZcShjtQvq2
	dI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M/iPPxEuX/UZQMiRAhGZE8lvVo/kkYnSXcnNdgtaw8Q=;
	b=nhM+P3lcqEXxSaFCRTbTAhBIPeSitaPz1UUQXQ5wBQAi8/6Wj9HNF61pDYwnuvBl52
	iQV7COu9W9MUfhMtH3U3GN/2h7D8E3LpSrDK38bnVR7gyuhZmnldVLsy08Rh4g6EqQjd
	7teZJPcNi7s2jKamIrBNLq6OCs5PJCWbDpgk0fcexcAZOb5BbRBzu8/gCXUhANpkCjYi
	2ivneAwFO9xta/AFFOubBiRDDgWsjfzHfkthTmITX7prt/ny8s2hOBTiNzJ2JkDOIVu3
	95i4hbKRd9SfYsZ0e+u9Pxss5F8oP5qlWviwtmQ1A98JvNV1Za1VWQXriX61PdTajS82
	KF1A==
X-Gm-Message-State: APf1xPCQRFxfV//pJNDtGh3/Xszxq07yHLdMsoI9v4RwJt692VkG3LST
	C0cxWPEUBj3Yg2F9DAJTmDY3w2sYbGOLGizLK40=
X-Google-Smtp-Source: AH8x224pIIdzylyzuqEyBBliY8ISb09CeRXKLTMO9JY/0s89bVYm6E7X5HL6hYIiW/4JLwrEGIjt6QB7WNBJ3Ao4GW4=
X-Received: by 10.46.86.74 with SMTP id k71mr2398122ljb.28.1519221327423; Wed,
	21 Feb 2018 05:55:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Wed, 21 Feb 2018 05:55:26 -0800 (PST)
In-Reply-To: <20180221134509.wheeephzdzqytopy@mentor.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
	<8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
	<CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
	<CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
	<20180221134509.wheeephzdzqytopy@mentor.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 21 Feb 2018 08:55:26 -0500
Message-ID: <CADkTA4OUy=njCwt5OwsSvRrnDQbF+m2bY+iF=Oj8OEA156Fraw@mail.gmail.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
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
X-List-Received-Date: Wed, 21 Feb 2018 13:55:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 21, 2018 at 8:45 AM, Joe MacDonald <Joe_MacDonald@mentor.com> wrote:
> [Re: [oe] Splitting meta-oe?] On 18.02.21 (Wed 09:49) Martin Jansa wrote:
>
>> > I need an updated python-<foo> package for an unrelated package
>>
>> And how far will you go?
>>
>> If you want just newer python-<foo> and nothing else, will you take other
>> changes to other python-* recipes from meta-python layer? There is a lot of
>> recipes there, if you're so picky about updates, then you shouldn't update
>> whole oe-core as well.
>
> It seems like this part is already settled, but it would seem to me that
> this scenario, if I understand it correctly, is "I'm using oe-core and
> see up-stream meta-oe/meta-somethingorother has an updated or new recipe
> for something I want in my image but I don't want to do a pull on all of
> meta-oe and potentially cause a huge rebuild of stuff I don't really
> care about".
>
> That sounds like a problem better solved with 'git branch', 'git fetch'
> and 'git cherry-pick' on the developer's side than breaking up meta-oe
> across existing meta-boundaries.

Agreed. I was just probing to see if anyone had ideas on how that could
be managed by infrastructure, versus me mucking about.

Maybe RP's thoughts on layer tooling or setup possibilities would help,
but either way, I'll keep chugging along :D

Cheers,

Bruce

>
> -J.
>
>>
>> On Wed, Feb 21, 2018 at 1:51 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
>> wrote:
>>
>> > On Tue, Feb 20, 2018 at 1:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > > On 2/20/18 9:13 AM, Bruce Ashfield wrote:
>> > >> On Tue, Feb 20, 2018 at 11:50 AM, akuster808 <akuster808@gmail.com>
>> > wrote:
>> > >>>
>> > >>>
>> > >>> On 02/20/2018 02:45 AM, Burton, Ross wrote:
>> > >>>> Hi,
>> > >>>>
>> > >>>> Is now a good time to talk about splitting up meta-oe?  Some layers
>> > are
>> > >>>> actively developed and maintained (one example: meta-python), others
>> > are
>> > >>>> basically bitrotting and only get touched when something else causes
>> > them
>> > >>>> to break world builds (one example: meta-gnome).  I've long felt that
>> > >>>> meta-oe should be split up and the high quality layers managed in
>> > their own
>> > >>>> repositories so patches to them don't get held up by breakage in other
>> > >>>> sub-layers.
>> > >>> You make it sound like meta-oe is not a high quality layer.  I could
>> > >>> make the same claim about oe-core master.
>> > >>>
>> > >>> I don't see the connection in patches being held up due to breakage in
>> > >>> other sub layers. This only happens if the dependency fail to build.
>> > >>>
>> > >>> You lose control over the quality in current layers that reside in
>> > >>> meta-openbedded just like you have no control over all the other layers
>> > >>> residing in the community. It makes maintaining stable versions very
>> > >>> difficult. Well, unless The Yocto Project takes over them.. I guess
>> > that
>> > >>> would work then.
>> > >>>
>> > >>>>
>> > >>>> Another advantage of splitting out the high quality layers is that
>> > we'd
>> > >>>> like to look at running more community layers through the Yocto
>> > >>>> autobuilder, and granular layers make that easier to manage.
>> > >>>  I thought not including layers in bblayers.conf was easy enough.
>> > >>>>
>> > >>>> Comments?
>> > >>>
>> > >>> What problem do you thing you are trying to solve here?
>> > >>
>> > >> My unrelated issues are that I can't update one layer, without getting
>> > >> all of the updates.
>> > >> .. but that is both a good thing (i.e. they are all tested together,
>> > >> so you know that the
>> > >> single SRCREV update is good for all layers), and a bad thing (when
>> > >> you just want a
>> > >> new python recipe update from meta-python, but don't want other
>> > changes).
>> > >>
>> > >
>> > > if you dont include the layers in your BBLAYERS and they become
>> > > effectively non existent, unless you are on metered internet connection,
>> > > where downloading unused stuff would save you bandwidth, it should be
>> > > ok.  No ?
>> >
>> > Its not that.
>> >
>> > I *am* building the different layers, but say I have a stable set of
>> > packages
>> > and working images .. but for whatever reason, I need an updated
>> > python-<foo>
>> > package for an unrelated package, or some other layer that needs a newer
>> > version, etc.
>> >
>> > How do I get that, without taking updates to all the layers ? .. and
>> > layers that
>> > I really didn't want to update. I have to do some sort of combo-layer,
>> > carry
>> > my own copy of the recipe, etc.
>> >
>> > So there are definitely ways to do it, I'm just pointing out that I
>> > end up taking
>> > some build failures/issues from time to time on packages I didn't really
>> > need to update.
>> >
>> > The flip side of that argument is that all of the layers and sub layers
>> > have
>> > gone through some sort of global build, and hence I know that they all have
>> > worked together for someone. If I can update pieces individually, I break
>> > that .. and I own the broken bits after that .. which again, goes to
>> > my point that
>> > fixing one workflow/issue can break another :D
>> >
>> > Bruce
>> >
>> > >
>> > >> It is very likely that splitting the layer would help one issue, but
>> > >> make the other worse.
>> > >>
>> > >> So no solution from me, just an observation about potential issue.
>> > >>
>> > >> Cheers,
>> > >>
>> > >> Bruce
>> > >>
>> > >>>
>> > >>> - armin
>> > >>>>
>> > >>>> Ross
>> > >>>
>> > >>>
>> > >>> --
>> > >>> _______________________________________________
>> > >>> Openembedded-devel mailing list
>> > >>> Openembedded-devel@lists.openembedded.org
>> > >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> > >>
>> > >>
>> > >>
>> > >
>> >
>> >
>> >
>> > --
>> > "Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end"
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
> --
> -Joe MacDonald.
> :wq



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

