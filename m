Return-Path: <brgl@bgdev.pl>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3BCA26C5D7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 07:35:23 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id p197so531305itp.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2018 23:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rJ3Yv0QIbym5BUFNs2l4jUGeAZCiH6w1wuvaVFyJT6c=;
	b=pOU70HMahiK6SZgt2EN9Zgkp8CVh/p/mgEpAeDGGwR3YN8asBJuRtJwyq5C4K/vdhy
	gR29gsGoTVVZX7dggAEdZ2rYyfaim+jX8nChc3Jsa/vdMrMJzHdpoAUJwnfXmNdeDbSV
	CxIVTY9eYO3L/FjM2fMEXKM634bJu1MoymZoKKjCahUW1q+4wFPRMykLLN70s/yRpDUk
	+8kO7UPESMlFT0Ytg0JRYyT8wdNH56eqWhcjamXw/uY0zZDpSfCQWJ9RLFlNNWNz7d2M
	TkSZ7Qq1se20hZOiS4DZFbrpMdq1l4s9upwpzredFb771RxFkLo35R0rn+hFfmra3XZB
	4wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rJ3Yv0QIbym5BUFNs2l4jUGeAZCiH6w1wuvaVFyJT6c=;
	b=iUWO1Z+zTIkYFw9DCQpGfzEe74cxIucoK43rxLHEHUntLM56aABuySHowlrZmMRPrV
	rAABfyONumfSt+1vpLLc+xBcNFW+0/U/3WCPa3gObwfhMCgXBS9QoFX9bm6MaE8jaWcV
	hlkkkAYR26X40A9v8n+NLOfWR7oigGc10++oBFLcAPaN0RiHfu3G+wvZLOG0mWSXxHP8
	U/revSc4W8xoxPb5VBVey1Z7F+6trBVTkCs0rp0muYwShPceBTvvZWLQ4IjNIqThRXur
	qOa68Rt09mCMyYISTyQgAYxo8w9xXHeETtnY/+0lshSVzB/Jt86nwP7lRyKaDdJ3Dap5
	H9Yw==
X-Gm-Message-State: AA+aEWZAcLHNX0+uiZWjHqtoChUno9Sh1vAFdOzskCfmoaCiz2eajaWF
	T8CNVS2c0G61EKCaU+kbMZQyZGtYhyLbJN4gncx6Fw==
X-Google-Smtp-Source: AJdET5cldMB4zcrf/EvMerqAtNpy9pUSxdqhcmaUXqBvhDuOiGmhCy+Si88KMRYjcQDEXA2yjIfj1P7pRcM6dgIPvSs=
X-Received: by 2002:a24:f909:: with SMTP id l9mr21323791ith.74.1543217724902; 
	Sun, 25 Nov 2018 23:35:24 -0800 (PST)
MIME-Version: 1.0
References: <20181123153941.10186-1-brgl@bgdev.pl>
	<CA+aJhH0KL7nzmkGUgUyD-h-ghf6u65uqeGOVavjV=u1fW6QQvg@mail.gmail.com>
	<CAMRc=MebuMRhQgzrZKU_0Gu9pNOPgJYitVMLFSPGm0B9hHfC3w@mail.gmail.com>
	<CA+aJhH2_yYkLCdY6C0XSuj9vB_k+VLioKh8ArSUZqo7XYydsDg@mail.gmail.com>
In-Reply-To: <CA+aJhH2_yYkLCdY6C0XSuj9vB_k+VLioKh8ArSUZqo7XYydsDg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 26 Nov 2018 08:35:13 +0100
Message-ID: <CAMRc=MfyKbLZXAqjhnOL=p-jXaCYM=+Y89eBbNYYNBeDc_b=0Q@mail.gmail.com>
To: nathan@nathanrossi.com
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/6] sigrok: set of new packages
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
X-List-Received-Date: Mon, 26 Nov 2018 07:35:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

niedz., 25 lis 2018 o 16:40 Nathan Rossi <nathan@nathanrossi.com> napisa=C5=
=82(a):
>
> On Mon, 26 Nov 2018 at 01:12, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > niedz., 25 lis 2018 o 07:04 Nathan Rossi <nathan@nathanrossi.com> napis=
a=C5=82(a):
> > >
> > > On Sat, 24 Nov 2018 at 01:39, Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> > > >
> > > > This series adds recipes for libsigrok and accompanying libraries a=
nd
> > > > tools. The eventual goal is to add pulseview - the graphical interf=
ace
> > > > for sigrok - to meta-qt5-extra.
> > > >
> > > > First two patches add external packages used by libsigrok. The thir=
d
> > > > patch adds a recipe for native doxygen, which is needed to generate
> > > > libsigrok C++ bindings which will in turn be necessary to build
> > > > pulseview.
> > > >
> > > > Last three patches add recipes for the sigrok suite including the
> > > > command-line utility - sigrok-cli.
> > > >
> > > > Bartosz Golaszewski (6):
> > > >   libzip: new package
> > > >   libserialport: new package
> > > >   doxygen: new native package
> > > >   libsigrok: new package
> > > >   libsigrokdecode: new package
> > > >   sigrok-cli: new package
> > >
> > > Anything against marking all the recipes (excluding doxygen) with
> > > BBCLASSEXTEND =3D "native nativesdk"?
> > >
> >
> > What would be the reason for that? Also: you'd need to do that for ALL
> > non-direct sigrok dependencies and I think there are quite a few.
>
> It makes it really easy to ship with a nativesdk toolset or use on
> your build host. I have personally been using it this way and made
> some recipes for it a few months ago
> (https://github.com/nathanrossi/meta-random/tree/master/recipes-toolbox/s=
igrok).
>
> With the recipes in this series the only dependency that is not also
> enabled for native/nativesdk is glibmm. However that is not enabled by
> default (since its a dependency of 'cxx' config).
>

I guess it can always be added later on. I'll stick to target packages for =
now.

> >
> > > Also any plans to include recipes for any of the firmware data
> > > packages that sigrok provides? (e.g. sigrok-firmware-fx2lafw)
> > >
> >
> > I don't personally need it and it seems like it requires integrating
> > the sdcc compiler into yocto. Probably more work than I can spend on
> > that.
>
> I was only referring to the pre-built firmware binaries that are
> released by the sigrok project.
> https://sigrok.org/download/binary/sigrok-firmware-fx2lafw/.
>

Same as above, no problem adding it later.

Bart

