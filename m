Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id E95F160650
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 14:39:00 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id 10so1497566lbg.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=BwUX1N+JQnzmTdCMQ64v8yFmlXlg0BClYixgSouwbng=;
	b=t3GEveNZmAd7ycwt55u7Ja3lVTZ7EkQuFA6RC+3tSmHnY4a7ztyHlZT7orRHd9DFBn
	b9+6v24Gey+5PGu/bBa3lV12YlQyCLSweTV0eGWnxFnRc/4I7JcH8eNezm/k/Tt1ClPl
	xGUYTQNxGMZjenPvI19fV66+Nb9FXr6WF+DBy85yUq/LvYf8hoJuxXvLjgin6t0OESnI
	UddcI0Z4MHk8BPlHJ3Nk74MX1qMxJ/UhTFHJgvJ7Bk5w2i55RUlCu0JybiPMtEoYuT/t
	ixP8tx8VRMtj82iOZD/FYlhbBjZ9nm3J2Fxx78I8TczEwyYmc8MrnwzCRDU3MFy4ovnJ
	nvhQ==
X-Received: by 10.112.139.166 with SMTP id qz6mr40862016lbb.13.1399473540546; 
	Wed, 07 May 2014 07:39:00 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.148.170 with HTTP; Wed, 7 May 2014 07:38:40 -0700 (PDT)
In-Reply-To: <3120944.8W8OHk0NM6@peggleto-mobl5.ger.corp.intel.com>
References: <5364B398.5000802@embed.me.uk>
	<1950582.OeVgyhOmPz@peggleto-mobl5.ger.corp.intel.com>
	<5369A9ED.4060506@linaro.org>
	<3120944.8W8OHk0NM6@peggleto-mobl5.ger.corp.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 7 May 2014 07:38:40 -0700
X-Google-Sender-Auth: Fx4a06xuZuCVGSaM8v7EnlsHAh0
Message-ID: <CABcZANkn6rQQzaMEqSTB1q_PcB9fv29uj=rrGqFAnCmUSFF=Ow@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Website Text
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
X-List-Received-Date: Wed, 07 May 2014 14:39:01 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 7, 2014 at 1:49 AM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> On Tuesday 06 May 2014 23:35:09 Trevor Woerner wrote:
> > On 05/06/14 12:12, Paul Eggleton wrote:
> > > So I'd hope that the machine listing in the layer index could be made
> > > to help with that.
> >
> > Absolutely, for raw recipe information or information on which MACHINEs
> > are supported the layer index would be a good choice.
> >
> > But there's a fair amount of difference between "MACHINE, layer, and
> > recipe definitions" versus "here's the FSL community information, they
> > use repo, here's where they keep their manifests, here are the manifests
> > they have available, these are the boards they support, and here is how
> > you run their setup script".
>
> Excuse my ignorance, but what do you mean by "manifests"?


A repo manifest is rather like a .gitmodules file, but out of band, in its
own repository. The manifest controls what repositories of what
branches/revisions get pulled down. A git url to the manifest is passed to
'repo init' to initialize the setup.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

