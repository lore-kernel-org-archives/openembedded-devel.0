Return-Path: <eduardo@monkey.io>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id AEE8176486
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 17:01:30 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id g3so174075070ywa.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 10:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=monkey-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=Km2uvuyPBjsdcZFEUiQwWYHMdGqgnmyuomRZs6uDMYk=;
	b=K9lYv9rGt1lJB6rS5CObpTlLQchUUu9YpKmrwWwP1zXFBhvgLcjCnJ1PnbcS3InLHj
	vgIkQAlRgVxYGvVI8xVoa06o+XErtdDB+Yn9CQRexaOiyqUKoswTlSZhnMGwhK9Ce5Pp
	65GhwJdxV5XcSPwkGRz0d/MNI6dazXm/AASpOjD7PjYBOub/Qfrh9vSSpNL7AY5cZ+e3
	EwFKE4A0y2PE2cf0My67pTo29UXSQjOv4mRRMM3MWLkTggvGEZA9vJdrQA3GKKMnbHXf
	PZAq+8GPl6KQydUXJS1ZVQXEuMgfDaHVubRqgcFp8SoS54e57zxUZ0Oh1S8l0GrAJFA9
	nweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=Km2uvuyPBjsdcZFEUiQwWYHMdGqgnmyuomRZs6uDMYk=;
	b=iALWOVn1gZDC/kCzsQDBXrEcW0ctvUg6eILQ7G+dfQxxfraZC828wgpEfPUe7unxgo
	QhMGEIfu4xxAortCfEWb2RSHGRN25OFcCDlKuUZgEvLLw16Vmy4Uq12CQ9NjEdGt0rUO
	hw6OTmUJfePxNeXNbJPY3luhok4Vi1+cAGdmWKHL3NZiO3cg/xfYfUNWEb48Mc5jNLqj
	n2B1cHAJHWNijcf488DGGfhSf3YOepoQE6YiQx5Fjf20yu3nBjC1GzYYAU5ZUb2LqklD
	1aXJ0MYMOf4zW83L+17hJUjq39B0gAkOItuWjED17w0nFD+lOYCNGCK1Vw7S/kLYd0Hp
	RV7A==
X-Gm-Message-State: AD7BkJI+XZhnHJDeB3xQBYAt6WJnSqtU8JveFbnZJn8S9MSYpZyb5EbnIP0Ptzlzn/LWuJpzIGLPVJxF+GRT1g==
MIME-Version: 1.0
X-Received: by 10.129.75.15 with SMTP id y15mr3471209ywa.32.1459530090959;
	Fri, 01 Apr 2016 10:01:30 -0700 (PDT)
Received: by 10.13.203.1 with HTTP; Fri, 1 Apr 2016 10:01:30 -0700 (PDT)
In-Reply-To: <CA+chaQfbTZu=JZO2FaLLCSFZtzHpL3=x3qrA16EAWrB=Yx+Unw@mail.gmail.com>
References: <1459406572-8144-1-git-send-email-eduardo@monkey.io>
	<20160401133809.GF2567@jama>
	<CAEaCVQjmZGJOX332YqUH8eLOAGURiKXS4-f40P6KqNE7FgZ9qQ@mail.gmail.com>
	<CA+chaQfbTZu=JZO2FaLLCSFZtzHpL3=x3qrA16EAWrB=Yx+Unw@mail.gmail.com>
Date: Fri, 1 Apr 2016 11:01:30 -0600
Message-ID: <CAEaCVQjGbaWfr5ZT7-4S1jNStoWUQ3QJyNhZ+-nOYpe2EBvZgA@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] fluentbit: add new recipe
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
X-List-Received-Date: Fri, 01 Apr 2016 17:01:33 -0000
Content-Type: text/plain; charset=UTF-8

Oh, sorry I misunderstood. The program requires zlib to run, so it's a
build (headers) and runtime dependency.

On Fri, Apr 1, 2016 at 10:57 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Then it's probably build time dependency as the warning says, not runtime
> dependency like you did.
>
> Read what the component build does, if it checks for zlib in configure then
> you really need to add it to DEPENDS not RDEPENDS_${PN}.
>
> On Fri, Apr 1, 2016 at 6:53 PM, Eduardo Silva <eduardo@monkey.io> wrote:
>
> > > +LIC_FILES_CHKSUM =
> > "file://${S}/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
> >
> > >
> > > LIC_FILES_CHKSUM is relative to ${S}, so LIC_FILES_CHKSUM =
> > > "file://LICENSE.. should work fine
> > >
> > >
> > Thanks, I have updated my local copy
> >
> >
> > > > +
> > > > +RDEPENDS_${PN} = "zlib"
> > >
> > > If it does link with libz then the runtime dependency should be added
> > > automatically by shlibs code in package.bbclass if it's not the case
> > > can you add comment explaining why it needs to be added explicitly?
> > >
> > >
> > I added that because I got a QA warning message:
> >
> > WARNING: QA Issue: fluentbit-dev rdepends on zlib, but it isn't a build
> > dependency? [build-deps]
> > WARNING: QA Issue: fluentbit rdepends on zlib, but it isn't a build
> > dependency? [build-deps]
> >
> > what's your suggestion in this case ?
> >
> > best
> >
> >
> >
> > > > +
> > > > +inherit cmake
> > > > --
> > > > 2.5.0
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > >
> >
> >
> > --
> > Eduardo Silva
> > Monkey Software
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
Eduardo Silva
Monkey Software

