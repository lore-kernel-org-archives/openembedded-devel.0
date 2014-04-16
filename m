Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 91F4965D3B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 12:37:50 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id lx4so10043284iec.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 05:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=fWFS2qVD6eQN32h3U9iseFi/5XwIpQMvdbzictH+v8I=;
	b=LsZS9+Tj6BCSLAOu7DpYXC4daKJ2aR9TKBfD7UwCaC0/ab9rnmPdYa51cfrOonLXE7
	vdLOHaDnjqsGKHm152tqtuqcoCytgE0KySVe5msQGsaoAPlM3NmAHlvE01T8wmqN+3eZ
	QcH6RHVoJ7DHYpIJsXOIy9kq/D2zClbSYWSfb0onCigmstKj50BxnWFMNlehKq0KBYrg
	OEJG+svz8woFz432So5VRdtPNY0s6wJkJe7XGEucCeITSMeUEfDKn6YLGR3L6WqoJh/A
	eMCSTpL0Pqoe9qVff4QkprReC3CaG+UxEV9v3ovNtuCrk7eCEfmUtPQY69iUl8Pk0CYE
	ooQg==
MIME-Version: 1.0
X-Received: by 10.42.136.130 with SMTP id u2mr1966347ict.51.1397651869576;
	Wed, 16 Apr 2014 05:37:49 -0700 (PDT)
Received: by 10.64.230.100 with HTTP; Wed, 16 Apr 2014 05:37:49 -0700 (PDT)
In-Reply-To: <534E7151.5030504@balister.org>
References: <CALYKT1hsAOf+qKTPO_fNpBf1u0CJoXm0L2Nz6VCafbqckYY2oA@mail.gmail.com>
	<534E7151.5030504@balister.org>
Date: Wed, 16 Apr 2014 21:37:49 +0900
Message-ID: <CALYKT1gmOJES7rY0OZjEcUNM6zr0E8YtgHRxDOmNF1u3WWYK7g@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: What is the relationship between Open Embedded for MSM and Yocto Project?
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
X-List-Received-Date: Wed, 16 Apr 2014 12:37:52 -0000
Content-Type: text/plain; charset=UTF-8

Hi, Samuel Stirtzel, Khem Raj and Philip Balister,

Thank you for the kind answers!!

I understood what are those.

> - What is the relationship between those two? Any differences? Commons?
OE for MSM is one instance of Yocto Project - OE-core. And It's like Poky -
An reference instance of Yocto Project.

> - Can I refer to the documents about poky for my openembedded-core?
I think I can refer to the poky's documentations but must make sure that
poky and OE for MSM are siblings from the same framework - Yocto Prooject -
OE-core

Thank you very much for the kindness!!

Sincerely
Journeyer

----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------


2014-04-16 21:02 GMT+09:00 Philip Balister <philip@balister.org>:

> On 04/16/2014 02:49 AM, Journeyer J. Joh wrote:
> > Hello,
> >
> > First of all I thank Nicolas Dechesne and Brian Hutchinson, for the
> > previous kind replies.
> >
> > While I was reading documents from Yocto Project, I found my source code
> in
> > use in my company is of Open Embedded for MSM.
> >
> > I found this from the git remote url of my surce code. It is
> >   git://codeaurora.org/quic/le/openembedded/openembedded-core
> >
> > And the one of Yocto project is
> >   git://git.yoctoproject.org/poky
> >
> >>From the git log prints poky is actively developped now but
> > openembedded-core is not.
> >
> > In a nutshell(I learned this expression today^^),
> > - What is the relationship between those two? Any differences? Commons?
> > - Can I refer to the documents about poky for my openembedded-core?
>
> OpenEmbedded is the build system and has been actively developed since
> 2004 or so (give or take a few years)
>
> Poky is the reference distribution from the Yocto Project.
>
> The Yocto Project is working to make embedded development easier.
>
> You should check the OpenEmbedded git server for activity;
>
> http://cgit.openembedded.org/openembedded-core/
>
> I'm guessing (without looking) the codeaurora git is based of a release
> bench.
>
> Philip
>
> >
> > Thank you very much in advance.
> >
> > Sincerely
> > Journeyer
> >
> > ----------------------------------------
> > Journeyer J. Joh
> > o o s a p r o g r a m m e r
> > a t
> > g m a i l  d o t  c o m
> > ----------------------------------------
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

