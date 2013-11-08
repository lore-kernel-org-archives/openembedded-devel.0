Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 61A736D663;
	Fri,  8 Nov 2013 11:23:05 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hn9so2002080wib.11
	for <multiple recipients>; Fri, 08 Nov 2013 03:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xyEXTUdTyvDwF2+J7NYr0rnEFifyj9OBq8tBFMhVEVQ=;
	b=IpafHyDBgLtjCymAfsGZ2ETugeJaH8ODTpCqA4ElKDVGkrDDbh1hC3qfmyy0JZZ/46
	KJ34hoRb4XjXK6Z4VREUmt04CFg3efJoURKXcdd9ouLa8xY5O9jqVgy9ISAwPU1p4fdF
	TpzrRhxcJcm+23AErAqph1hoTjerwlJb0oiFLh8pa2XNy0r9ArR+Psa9HGlSIecuYL2/
	dCRRnPHexJGP3N7hpkgmZvqPbceGcXZTbLe/W3hQ3AocOthb/n91fZ76C33ablcZ3asr
	l8HDR5ht2UHty838zh51aUDV34kgFuBhMKkoZlmsGvsH3ieWVAZZksfeFgN937sPrXfr
	A+cQ==
MIME-Version: 1.0
X-Received: by 10.180.72.238 with SMTP id g14mr1921355wiv.17.1383909786616;
	Fri, 08 Nov 2013 03:23:06 -0800 (PST)
Received: by 10.194.179.198 with HTTP; Fri, 8 Nov 2013 03:23:06 -0800 (PST)
In-Reply-To: <1383904061.6271.297.camel@ted>
References: <1383866326.6271.286.camel@ted>
	<CAJTo0LYq5PmQtBdwghmDGLs2ccTO6BBwJNGw7s37Yt+zjkWU6Q@mail.gmail.com>
	<CAAQYJAuMoE6gOMmM2trSN1MY7weCF+07JAJuhQu1K=p5KxO=Yg@mail.gmail.com>
	<1383904061.6271.297.camel@ted>
Date: Fri, 8 Nov 2013 12:23:06 +0100
Message-ID: <CA+chaQfB37mDfsiFreA3_7NBbeEitnk-xO07i0FKc55hPSZocg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Default DISTRO to nodistro
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
X-List-Received-Date: Fri, 08 Nov 2013 11:23:08 -0000
Content-Type: text/plain; charset=UTF-8

I don't feel strongly about this, but I have heard people say "distroless"
and I'm using the same when refering to default oe-core setup.


On Fri, Nov 8, 2013 at 10:47 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2013-11-08 at 10:33 +0100, Andrea Adami wrote:
> > On Fri, Nov 8, 2013 at 10:25 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > > On 7 November 2013 23:18, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > >> +DISTRO ??= "nodistro"
> > >
> > > Wouldn't "oe-core" be a better name, considering that's what
> > > DISTROVERSION becomes if DISTRO is unset?
> > >
> > > Ross
> >
> >
> > Agreed, we already have DISTRO_VERSION = "oe-core.0"
> > This sounds also the right name for THE default distro.
>
> I disagree and I feel quite strongly about this. OE-Core is not a
> distro. The whole idea was that OE-Core should build with sane defaults
> without any distro set. This is a dummy placeholder value and it really
> does mean to say that no distro is set.
>
> We did put a value into the DISTRO_VERSION field so you could tell what
> was being used but again its a placeholder.
>
> So in my view "nodistro" is clearer about what is meant.
>
> Cheers,
>
> Richard
>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

