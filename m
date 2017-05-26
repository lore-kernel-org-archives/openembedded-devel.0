Return-Path: <gizero@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id F1ED878257
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 06:16:55 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id w10so1850289oif.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 23:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NY9LzM8JAxzmgvT3mKCIm1AVJG3aAoNOPBrXZVeQzWg=;
	b=rIZ50G7+MoDg2QTee1azcKzlR6ZypXrtlJQsU4XJ+VUSuW1z9skrvcxN/qERvh24bC
	TyDbKeVbLT2C2muz1YlZqXH/nVV/iaFR456twRdfTz6bIivIE9wLXjA4KFHwng8WB6Dq
	g1HAlG+vnguGnm0sg9jm/PpDju/thfkNmpUxoAFvamygaEktbvSevd8OKctl5UElGRFa
	2k5u+1y29cUqvOTCvdestHd18lzW5lu/rHyGm39sCJvd13RI9PfBluy6Rkvu3gr62P7/
	VTPVyBJNu0PVutwGyZAZX1hpXgoT6iyO4ZJ81Oy+zhVUPKIGj29WMAEvr4Q6glMytl2Z
	y6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NY9LzM8JAxzmgvT3mKCIm1AVJG3aAoNOPBrXZVeQzWg=;
	b=LtR07Ihd6O17Oi+KIMFPz3DupsEGfR4uK1bAZHYl4anjyG1o3J17iEmHwqOJRFMh2q
	qahFFr1H1bmcabGhdWYfrwzWyNY0rK2XCrUUGIRfEjkXSpt81ItUXaaqk76XRC9xt5o7
	98tN5B4qjOIxIG39Rj6HASk/mFDJ5pHwM0U6kVcAgfzB9phb6k0lDlC3iqq0YGGcHMLy
	GAXzub2KtEXW9dPWOe/Aai2rLKq3lrubxrdRcLHLqsfowkStV96cNgzY84m58jSGuoUi
	vLFnMzypLGmOuGz1/uFnPqIKcWZ01ecpTxAJ+IQ0Gaj699whDGPg6d3QE+YXHG8ckEn+
	+n8w==
X-Gm-Message-State: AODbwcCB3JjH99tgWHPVnR2mUTjR7QK7Hl7vRFRK+d5uYh7gS9oeI0NE
	Xv6wDurDzBbTkoSNPyfrcNCwuBFNNQ==
X-Received: by 10.202.218.135 with SMTP id r129mr146443oig.52.1495779416947;
	Thu, 25 May 2017 23:16:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.24.107 with HTTP; Thu, 25 May 2017 23:16:56 -0700 (PDT)
In-Reply-To: <CAAfyv34HE8niva2Z4NBiqa_XYncwx1P3=CtVn3+PGQd+e+KOQw@mail.gmail.com>
References: <alpine.LFD.2.20.1705250847490.19265@localhost.localdomain>
	<CAAfyv3517VgOHsPWRRHs2vdTr3hBt-dp+u=UGmwHZ+jdNh3sMw@mail.gmail.com>
	<alpine.LFD.2.20.1705251637150.5533@localhost.localdomain>
	<CAAfyv34V=J2dHaF35QUFASGP=-QWS8V8zj_Oe4cv7CKWpx6SZw@mail.gmail.com>
	<CAC+thW0NcmnQXvyfEYHxY=Ko2S69cUEnc2rQd2aDk0RnnMMdPw@mail.gmail.com>
	<CAAfyv34HE8niva2Z4NBiqa_XYncwx1P3=CtVn3+PGQd+e+KOQw@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Fri, 26 May 2017 08:16:56 +0200
Message-ID: <CAC+thW1A_UB+WbG-DVPUaMN5GR8zHPGZq=FGoYFvHA-Oo6N8DA@mail.gmail.com>
To: Belisko Marek <marek.belisko@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: is there a reason meta-openembedded/meta contains a lonely libgpiod.bb recipe?
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
X-List-Received-Date: Fri, 26 May 2017 06:16:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 26, 2017 at 8:07 AM, Belisko Marek <marek.belisko@gmail.com>
wrote:

> On Fri, May 26, 2017 at 8:04 AM, Andrea Galbusera <gizero@gmail.com>
> wrote:
> >
> >
> > On Thu, May 25, 2017 at 10:44 PM, Belisko Marek <marek.belisko@gmail.com
> >
> > wrote:
> >>
> >> Hi Robert,
> >>
> >> On Thu, May 25, 2017 at 10:38 PM, Robert P. J. Day
> >> <rpjday@crashcourse.ca> wrote:
> >> > On Thu, 25 May 2017, Belisko Marek wrote:
> >> >
> >> >> On Thu, May 25, 2017 at 9:10 PM, Robert P. J. Day
> >> >> <rpjday@crashcourse.ca> wrote:
> >> >> >
> >> >> >   is there some rationale for libgpiod.bb to be the lone recipe
> >> >> > under meta-openembedded/meta? would that recipe not fit into some
> >> >> > other layer?
> >> >
> >> >> I posted few days ago recipe for libgpiod. Please look at:
> >> >>
> >> >> http://lists.openembedded.org/pipermail/openembedded-devel/
> 2017-May/112810.html
> >> >
> >> >   but that doesn't really answer the question as to why that recipe
> >> > went into meta-openembedded/meta and not meta-openembedded/meta-oe.
> >> > even the subject refers to "meta-oe", so why was that recipe placed in
> >> > a directory named "meta"? was that perhaps a typo?
> >> Yes probably type. First version of patch was placed in meta-oe. My
> >> bad. I'll fix that but didn't get any feedback on patch yet. Thanks.
> >
> >
> > Your patch was already merged with the 'suspicious' path. I'd suggest
> > sending a new patch that moves it under meta-oe/.
> Hmm thanks. I wasn't  aware of that that it was already merged. Thanks
> I'll post updated version.
>

;-) Sometime happened to me also. The convention for meta-openembedded's is
not to ack on the list for each patch that get merged. Keep an eye on your
patchwork account or poll master-next and master branches to see where your
patches are in the pipeline: useful to detect when they accidentally get
stuck!

