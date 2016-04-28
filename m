Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id DF6E26FF9D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 13:16:53 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id bg3so38567979obb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 06:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=fNS2mahIMxbuxst91qdx1I0DCiQmUiANTo6QaqdpI8s=;
	b=0gZkIvGqBJTg+PysSsu0j3+4ihfPiKaHm49iETTpAVHkxLw3XlzF+xgC32gCcXFN8F
	FryhraKXFvrzVeWZYatvTBiWSs6mckGnKMrIvN0eBS0FMZ6c2JSG3tgMerXmIiK3CXu+
	wHDl6YZ60MLXAoC5hmhWa8EJ/OEEGJbXLa+PGfuLFRHx82FzRu0LwnNM4M/uYyjGKeE0
	FxKuGuM2GGzxhoBSBQ/BwIxZoiy/BqkrYiP2qshmNqXacHA47DgH2pFPyPuRFlRtksOz
	j+vI0aEE/OGonYnE26itsdV9ZAETMCk8PDr+4YRFbdZXRGwCiKJ6mu26VrEZzaKbWrx2
	E06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=fNS2mahIMxbuxst91qdx1I0DCiQmUiANTo6QaqdpI8s=;
	b=AcmEwYLsd9dLCnQC0FT4ppBbdaRKpGHbJYM9S4vg94AlaLH/nIBSEUuRHXqalr11Gd
	WgGKRyor4R9zarAAUAeoKXk6zUh62Yn00dQyCxfQSBa5jiRPzxddItl4xhnvyVk+8Hmb
	cWZvBhl3p77cB8h9oX26M6iSXz8KnzD0zwASXM1FMYpSM67YC/hkplV/EBrKxptrOReJ
	Py5/9JrCeQvD4OuGn9EACZz1wKFtoRY8etB9iRmVWdYyZ+xvm5HTRHYuFhIEm5iQMg95
	CE0+ssMswfHEXjwWbc5OzmZjjGRU7wc/vpEpXC+liNx+9z7jFBb3s1A2H9mFjC/BBerf
	hHCg==
X-Gm-Message-State: AOPr4FW1Trr1ZFK+BTID6fr5hQix0MRqFuld6RXxdm4Jp8rzVRG/ZLdALML87GIXSMNqUSTvOZGPR6rnYdwZCw==
MIME-Version: 1.0
X-Received: by 10.182.98.167 with SMTP id ej7mr6873669obb.46.1461849414010;
	Thu, 28 Apr 2016 06:16:54 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Thu, 28 Apr 2016 06:16:53 -0700 (PDT)
In-Reply-To: <8df29545-7040-9320-a7ae-dbacdac732ab@felipetonello.com>
References: <1461080418-9229-1-git-send-email-eu@felipetonello.com>
	<1461080418-9229-2-git-send-email-eu@felipetonello.com>
	<CADkTA4Pi3dG1G4DZ+rNEfwVnMJZxDNBfXtXv_fMKprkgBmRquQ@mail.gmail.com>
	<CADkTA4OyR2b_yCXFQ_NFzfEck_v3NvXGF4gUJLPGKcjvuHCFHA@mail.gmail.com>
	<57173E84.90703@felipetonello.com>
	<CADkTA4NT_bLfG6wUTFpxN+4veyL6iwdk8VZgRQu5AF_5QsKuHQ@mail.gmail.com>
	<8df29545-7040-9320-a7ae-dbacdac732ab@felipetonello.com>
Date: Thu, 28 Apr 2016 09:16:53 -0400
Message-ID: <CADkTA4Pj5_JmNdaciVk4rTe9P8RjWYBdZ8CEio_xMJwMwgtDFw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/2] protobuf: add protobuf-c recipe
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
X-List-Received-Date: Thu, 28 Apr 2016 13:16:54 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 28, 2016 at 4:02 AM, Felipe Ferreri Tonello <
eu@felipetonello.com> wrote:

> Hi Bruce,
>
> On 20/04/16 15:32, Bruce Ashfield wrote:
> > On Wed, Apr 20, 2016 at 4:32 AM, Felipe Ferreri Tonello <
> > eu@felipetonello.com> wrote:
> >
> >> Hi Bruce,
> >>
> >> On 19/04/16 20:55, Bruce Ashfield wrote:
> >>> On Tue, Apr 19, 2016 at 3:46 PM, Bruce Ashfield <
> >> bruce.ashfield@gmail.com>
> >>> wrote:
> >>>
> >>>>
> >>>>
> >>>> On Tue, Apr 19, 2016 at 11:40 AM, Felipe F. Tonello <
> >> eu@felipetonello.com>
> >>>> wrote:
> >>>>
> >>>>> Initial version of recipe. The main package could be split into two
> to
> >>>>> separate the compiler. This also applies to protobuf recipe.
> >>>>>
> >>>>>
> >>>> More precisely, this is the initial version outside of
> >> meta-virtualization
> >>>> which enea added
> >>>> in 2012 :) It was added as a dependency for criu (hence why it was put
> >> in
> >>>> meta-virt).
> >>>>
> >>>> If we move it to meta-oe, we at least owe that other implementation a
> >>>> reference in the commit.
> >>>>
> >>>>
> >>> s/if/when/.
> >>>
> >>> I'm happy to purge all the protobuf* recipes from meta-virt, since they
> >>> were only there as
> >>> support mechanisms (and I wasn't involved in their original merge).
> >>>
> >>> But if you can take a look at what's in the meta-virt recipe, I'll do
> >> some
> >>> runtime testing with your
> >>> variant here, and drop the meta-virt ones when I can confirm criu
> works.
> >>>
> >>
> >> Regular protobuf recipe is already part of meta-oe. That's why I added
> >> this one there too.
> >>
> >
> > Sure. That's obvious from the layer index, as is the existence of the one
> > in meta-virt.
>
> I didn 't take it from meta-virt. The original protobuf recipe is in
> meta-oe.
>

Yup, I wasn't implying that you did. Sorry if it came across that way, I
was just
pointing out the layer index, since it is a good place to check when
considering
a new recipe.

The ones in meta-virt need cleanup (and I'll drop them once this is in
meta-oe),
but that's something we could have tackled (literally) years ago if the
repetition
had been picked up.


>
> >
> > Credit, where credit is due. It's not my work, so I'm not asking for any
> > credit,
> > but simply duplicating something that already exists without a nod to the
> > older one
> > isn't ideal.
> >
> > All I was asking was that if you could a link to the meta-virt one in the
> > commit header
> > so that someone not familiar with the layer index can see the two options
> > .. and
> > at the same time I was wondering if you'd seen the meta-virt one and did
> > this one
> > differently for technical reasons. That makes it easier for me to drop
> > recipes as they
> > get cloned around to new (and better) locations.
>
> I am fine with that. Can you please provide the git hash so I can link it?
>
>
That's great, just a shout out something like:

----
replaces/obsoletes: commit 0d31f8448412 [Added protobuf-c criu dependency]
in meta-virtualization
----

Would be great, then we see the duplication, and why it was ever in
meta-virt in the first
place.

(the full commit log is below)


commit 0d31f844841249262fe142c4c03853dd1f647e2d

Author: David Nystr?m <david.nystrom@enea.com>

Date:   Thu Dec 6 10:54:55 2012 +0100


    Added protobuf-c criu dependency

    Signed-off-by: David Nystr?m <david.nystrom@enea.com>

Cheers,

Bruce


> Thanks in advance,
> Felipe
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

