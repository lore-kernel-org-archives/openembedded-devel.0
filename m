Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id D75AB77027
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 07:44:44 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so16153675wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=JhPzUyN5lo3Q1auLSvDQyk/f8GBlPqkrMZb6/WQg2hc=;
	b=rhB6CTm6JhlJF9cmnOBT1MBlOIWnV+Yqu9VWV+d02ygPv8d+JCr7En6hUcLdVXPMRO
	qi8FWmSzNDi7CM0mwvTTP9JGdsP533dzMY5VVOqNFNr+EGfK3yTYyVLR56YylXE07lVB
	ynrcPfdKcqMRIi8ajQ5HwCr7VlVX5/FjL/fn0GrTsYMvZCEK1sk60P4lB1j1hmw24gvo
	KMNfFhZ/n4h56LllbyTBXoCFNZEQEOFg+ltz3mREAidcaCLGymIKnR9NsIdfjRvdPTVU
	SMMe6rtavgJuBoqZw/NfR4ptxDgi8w7umGbtg2nVO+6sl5LocMiFdh16q31cxkDHhJK0
	CX+g==
MIME-Version: 1.0
X-Received: by 10.180.19.41 with SMTP id b9mr1602682wie.71.1443685484061; Thu,
	01 Oct 2015 00:44:44 -0700 (PDT)
Received: by 10.194.159.102 with HTTP; Thu, 1 Oct 2015 00:44:43 -0700 (PDT)
In-Reply-To: <2092542.RsGTerxllR@peggleto-mobl.ger.corp.intel.com>
References: <1443601616-25650-1-git-send-email-ulf@emagii.com>
	<6121338.U6CHxlbeKO@peggleto-mobl.ger.corp.intel.com>
	<06BF52C6-946E-4474-B7CB-7EEA269202D5@emagii.com>
	<2092542.RsGTerxllR@peggleto-mobl.ger.corp.intel.com>
Date: Thu, 1 Oct 2015 09:44:43 +0200
Message-ID: <CA+chaQfgQU0MOLjQ3M+KmRtJyF+SWDhOtxP_tGnbMuRQ0f4XmA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: Re: [PATCH] Use GFDL-1.1 instead of GFDLv1.1
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
X-List-Received-Date: Thu, 01 Oct 2015 07:44:45 -0000
Content-Type: text/plain; charset=UTF-8

We only need better commit message which starts with "gnome-panel*:"

On Thu, Oct 1, 2015 at 8:54 AM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> Perhaps it wasn't clear, I was agreeing with you ;) I'm not even sure we
> need
> to add a mapping for this.
>
> Cheers,
> Paul
>
> On Thursday 01 October 2015 00:08:00 Ulf Samuelsson wrote:
> > Right now, it gives a warning during build.
> > Just because some think we should support both, it does not mean we have
> to
> > *use* both. Applying the patch should fix the warning message, which
> should
> > be priority one.
> >
> >
> > Best Regards
> > Ulf Samuelsson
> >
> > > 30 sep 2015 kl. 13:58 skrev Paul Eggleton <
> paul.eggleton@linux.intel.com>:
> > >
> > > Yes I'm aware of that. What I was pointing out is that usually we have
> an
> > > SPDXLICENSEMAP setting to map e.g. GPLv2 -> GPL-2.0; there is no such
> > > mapping for GFDL; I guess the assumption was that there was.
> > >
> > > Cheers,
> > > Paul
> > >
> > >> On Wednesday 30 September 2015 13:53:08 Ulf Samuelsson wrote:
> > >> There is no GFDLv1.1 file in the license directory
> > >>
> -------------------------------------------------------------------------
> > >> --- ------ openembedded-core/meta/files/common-licenses$ ls GFDL*
> > >>
> > >> GFDL-1.1  GFDL-1.2  GFDL-1.3
> > >>
> -------------------------------------------------------------------------
> > >> --- ------
> > >>
> > >> It does not make sense to have a duplicate file.
> > >>
> > >> Incidently, the GFDL-1.1 file contains the GFDL-1.2 license, not the
> 1.1
> > >> license.
> > >>
> > >> /Ulf
> > >>
> > >>> Den 2015-09-30 kl. 13:05, skrev Paul Eggleton:
> > >>>> On Wednesday 30 September 2015 03:10:56 Khem Raj wrote:
> > >>>>> On Wed, Sep 30, 2015 at 1:26 AM, Ulf Samuelsson <ulf@emagii.com>
> > >>>>> wrote:
> > >>>>> -LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
> > >>>>> +LICENSE = "GPLv2 & LGPLv2 & GFDL-1.1"
> > >>>>
> > >>>> IIRC both are correct
> > >>>
> > >>> I don't think we have an SPDXLICENSEMAP entry for this though, so it
> > >>> won't
> > >>> be being mapped (unlike GPLv2 -> GPL-2.0).
> > >>>
> > >>> Cheers,
> > >>> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

