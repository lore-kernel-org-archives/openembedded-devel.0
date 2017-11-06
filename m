Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7014660248
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Nov 2017 16:23:40 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id b189so14868854wmd.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Nov 2017 08:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HwYbkB1/0rjyqWEY3v6G4LcZbb9ujIrF6xDoDd4R4k0=;
	b=t1BDororCZD8LbgezYiiWMzgH0Ujd8lqSpC2ddRwH2U8YifXwL6nCah+w421u+kb9Y
	HC7HhzD9t7ASPaJgN43HvO9lxIn8qPm+LuXAwY5T+HG2VZEK6jgFd1Hj/KMJGElId/6n
	piwV95u24C9EOt+YRSxMNWKrPEuxh4slVeRxEq9uBMnlwlo6l40i6qwUMKzh0D73LIn4
	pILth2EoHruKrUrcke5Xhd2b5DARW5uiDn6paxwKm0vYTV6HsShoX9wRPyCI7lNW93B0
	1RNc1n5DTqvbRhBe12F7OPDsuMbnRkivYcJQDZ0PKjC1/M7bWvoBIEtTkXPo5e+sIMJm
	JB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HwYbkB1/0rjyqWEY3v6G4LcZbb9ujIrF6xDoDd4R4k0=;
	b=Gq0fevKsayj3vGkGEdKjX7eO3szpLAVePbJKvAEABTr7HdeXPf4P+IkI5p8CQ1YJGj
	86ThhvBj8SeDYuE9SaDWNuo7KL9dVB8NhFE+Mk4j+h7Fq4yYURlXHSpQ4LCMDA7FJA1R
	37mKxTd46Xti/CILSMYOlNjHnQmNxqxtndz92ts+43mdXOPlxdtmUJ/8+qwwUNVI0bln
	YCiDMoSX3Nzgyash4+Cb6mpTqxqcEF0Eynqb+jzUqGxcLP5FYzeeq7LavnuHOVif0tUY
	UpT+OMTxbL347p0CPr9WLQcfDhstGbQRhZeiKQvmfnOaSufej/UJzXmIpskaVk3lUM5i
	njHQ==
X-Gm-Message-State: AJaThX5rE24bYH2Tnd0T8g2Bpx0tInHIkVEZiDJLQMfbmqB9XTt9QB74
	UQyVzt2m3z/T6JsdtILDvZcSCsoxetXlXAaRAow=
X-Google-Smtp-Source: ABhQp+SNAtq87OGWnMOfsLpnZdIarU3hzuxegoVMSo2nMPV9RuwrnDqPBfXfK2gOYuioKEFpJrDuMKX8A/8h++ZnZxs=
X-Received: by 10.28.93.200 with SMTP id r191mr5346315wmb.141.1509985421980;
	Mon, 06 Nov 2017 08:23:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Mon, 6 Nov 2017 08:23:41 -0800 (PST)
In-Reply-To: <CALbNGRTFUBUKNtZueSi_cDWOMiqMPxf482NR3kjyvduTA33oMg@mail.gmail.com>
References: <20171102103129.3703-1-schnitzeltony@googlemail.com>
	<20171102103129.3703-2-schnitzeltony@googlemail.com>
	<CAMKF1spbF2bJDQK_htfwpEKRgh1MzZEpkxpyde1x1dfoaqNYhw@mail.gmail.com>
	<CALbNGRRrpSkAy8vkVQ33P-ONLdWqXnT_Oa1tViORfBx2R_Wjbw@mail.gmail.com>
	<CALbNGRSy0-Y=oLGbR+ON0jSitnEzkyMJevYtMhf--1+i-p7JhA@mail.gmail.com>
	<CALbNGRTFUBUKNtZueSi_cDWOMiqMPxf482NR3kjyvduTA33oMg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 6 Nov 2017 17:23:41 +0100
Message-ID: <CA+chaQeX1+VVVLmoqrwESKGZ8Go=d=sMDbDBy5CZoCU584dAHQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 01/10] tumbler: make thumbnails work again
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
X-List-Received-Date: Mon, 06 Nov 2017 16:23:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

I'm ignoring all of them now, Armin is now taking care of master branch as
well.

BTW: your e-mails often end in my gmail spam with:
*Why is this message in Spam?* It has a from address in googlemail.com but
has failed googlemail.com's required tests for authentication.

I don't know if there is practical difference between @gmail.com and @
googlemail.com for you, but google doesn't seem to like the later.

Regards,

On Mon, Nov 6, 2017 at 12:50 PM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Thu, Nov 2, 2017 at 6:07 PM, Andreas M=C3=BCller <
> schnitzeltony@googlemail.com
> > wrote:
>
> > >  PACKAGECONFIG[gstreamer-thumbnailer] =3D "--enable-gstreamer-thumbna=
ile
> > r,--disable-gstreamer-thumbnailer,gstreamer1.0
> gstreamer1.0-plugins-base"
> >
> >> >
> >>> > +do_install_appen() {
> >>>
> >>> typo
> >>>
> >>> Thanks and LOL: In this way this patch does simply nothing and I coul=
d
> >> swear having tested it. @Martin: Can you please ignore this one until =
I
> >> checked and come back with V2 (if really necessary).
> >>
> >> I checked: This patch (created on April 4th) was a leftover and does n=
ot
> > make sense: Link is created properly / thumbs work fine.
> >
> > Thanks Khem for eagle eye :)
> >
> > FWIW: I removed the patch from git repo mentioned in pull request.
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

