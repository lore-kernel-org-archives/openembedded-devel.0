Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 67EE46D25E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2014 17:14:31 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id gq1so2006198obb.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jan 2014 09:14:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TsEuQ7GyojNkXZOWn+1T5DhPDqOQfrI1olSz+jxGR8w=;
	b=TWucEeFgTa/iV92v76Fbf5TK/fdYBvyaa7BIJ6KcfpxrX43cwJsvJqBj7l3bYPDnJY
	QV2+aZ9+9T73i8KLHAjrqhzL8zwHo2Yv9+CtDO3zpFi2Tzq7Gy0h+h22RsuHixYMwPgI
	OE2XauT1YNh9QRhnDmGc9ZDHH2WcaFZKdLpibUUbWwWvW6EY5CZ2y2fUTPUGVcN/tTJL
	1IxmTYRDk+cfzqrg/2JA2fIKzPitj2SjVG6LmoQ0EYnFA8GQUQKbfsyCbsL1aiFA1M/7
	8XQeM7wdZFzZJ91biDRHVjNf8FNvyIOeWo53/uBI8J2uCz+j61XAyNg/SJRXefOyfzUI
	OgAw==
X-Gm-Message-State: ALoCoQkhPK1jcUSDrQft26J97f9FQoZkU8c+/iX5NbQfV4v6b5eyP8vmNax3Jprkro2joeT6DZ1d
X-Received: by 10.60.178.139 with SMTP id cy11mr41867055oec.36.1389201272181; 
	Wed, 08 Jan 2014 09:14:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.89.143 with HTTP; Wed, 8 Jan 2014 09:14:12 -0800 (PST)
In-Reply-To: <1389200502.6899.112.camel@ted>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
	<52B8DECA.6060704@balister.org>
	<CAJTo0LaEgLWZHk34e-_-+z69Zw3J+S1zGFFJAONjfYBDQ1TehQ@mail.gmail.com>
	<1389200502.6899.112.camel@ted>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 8 Jan 2014 18:14:12 +0100
Message-ID: <CAP71Wjxsn4f4MU7K_vK+rcusdsip5tA4hX6HAivrNuR60_-WzA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Poky Project <poky@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] Piglit in Poky
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
X-List-Received-Date: Wed, 08 Jan 2014 17:14:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 8, 2014 at 6:01 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> >
> > On 24 December 2013 01:09, Philip Balister <philip@balister.org> wrote:
> > >> 1) Move piglit and deps to oe-core.  Piglit is for QA purposes only
> > >> and pushes the boundaries of "core platform".  In a sense this is a
> > >> repeat of the discussion we had with Midori...  does oe-core contain
> > >> everything needed to sufficiently exercise the core components it
> > >> ships or not?
> > >
> > > I expect Richard will push back on this, and I would support him here.
> >
> > Probably best to let Richard speak for himself here. :)
>
> :)
>
> I have to admit I'm leaning towards pulling in the 4 recipes we need
> since the win is we get to test the GL stacks.
>
> We do support graphics in the core, we also do particularly badly at
> testing it. That is something I think we need to change. piglit lets us
> do that and its not like it has a significant number of dependencies.
> Having a couple more python modules to test the python stack probably
> isn't a bad idea ether. We pruned quite a number of recipes out, this is
> a case where we can add a small number for a significant win.


I am in favor of that too. I would like to use piglit too to test GLES on
some of our ARM projects. I am not sure when we can get to do it, but i am
definitely interested into that, and it's been on a TODO list for some time
now.

