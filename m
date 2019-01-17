Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id C3BA07C1ED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 20:01:36 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id s17so3485676ybp.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 12:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4G5/+JkFeYEpCUVHJ2xa+asPwVZcFpjbHY9X8Uc+mAU=;
	b=cmQiTXGaAbCGZgtbIVtLKYAqCTmtOz5emEeVgfiZNmNlRFiDDizJj8n6sPYPeDXPOs
	A69ZCQ8Ca1cy+0kgvakH+VZ1w0NqoqfFGDqABMhTt+No7CQWGT2eVl/h2Ejo9wMhvYoE
	ULXMDEUVYItqCtv9nxUTcvgIbW7oQnpNy/1gq37MPxrDBLgbkt9OZsGIV8WUHO4CzzJb
	Ze8pgzOf6yd2zpZ9vTR/tvK0gwZ5wdGJbV/3830wTtjy8t+skPooozrx14oW9W3kynsa
	tRhEVlIMZMKyFp84SWQOlo1t0UmujXRzuGPRqr77BwPqdSNz7OsCrWE/7mtOe+Fij2Iq
	iGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4G5/+JkFeYEpCUVHJ2xa+asPwVZcFpjbHY9X8Uc+mAU=;
	b=DfwsUhbEea3MOTxqP/lvPrxrWzfRsxgT8isZz8TFT8dreVPY/d3g0YW94Gx3GjEX9S
	kADBneSIbuo2c5/8XwUzVIketMgTQs+pewUSfd740YW5NM00nLr3kSNEZ1L/hKo/tFYF
	U5gtRqAy0iwCG/HbGYwQZdxnBP8n8xCAVKZC6+P08J3E3SeFlHJ+qFCViSuOIZNoVC6S
	6b+x7fy9ww1x19/iEO3pOatk1q4ltlITV5KWgrhPZyuqiKLrHWa8O+X78lY0KHSyj4OK
	Vv8AzKzkUtGDHhA4TqQDFybS3PnF1yMs2JTXNVisTYgyLN8SFeMB978dHUptG7rcCCOI
	44Aw==
X-Gm-Message-State: AJcUukcPF4KUvn5Zpxdf0xiKIOcE/l5fCCinjFEO8BbkniV/Fz7fMUu4
	+yPV1jDltvlIy395IFThco+qv8GySiXE6P4pcHvajA==
X-Google-Smtp-Source: ALg8bN5aYEV4fwInfFvQkfc3MEfZgbPtsGMzYR2ixdBao6LShLZgJir+ZrXVdmpl5m9brTEdpQpWqCFmUFZngmRh1po=
X-Received: by 2002:a25:bb04:: with SMTP id z4mr3598790ybg.38.1547755297531;
	Thu, 17 Jan 2019 12:01:37 -0800 (PST)
MIME-Version: 1.0
References: <20190117162629.47677-1-stefan@agner.ch>
	<20190117162629.47677-2-stefan@agner.ch>
	<CALbNGRTMjFogycr0vsaLDxLeQi-ZVvHb6bu2pm9QebwaWdH3bw@mail.gmail.com>
	<8079727a69d7f33cc1936930d52fb55d@agner.ch>
In-Reply-To: <8079727a69d7f33cc1936930d52fb55d@agner.ch>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 17 Jan 2019 21:01:23 +0100
Message-ID: <CALbNGRQ=wGD6j3zH7y1P4JDFzQ9jOShsbBV2rpTaC_CNPA3Mig@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/5] networkmanager: introduce polkit package config
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
X-List-Received-Date: Thu, 17 Jan 2019 20:01:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2019 at 8:09 PM Stefan Agner <stefan@agner.ch> wrote:
>
> On 17.01.2019 18:50, Andreas M=C3=BCller wrote:
> > On Thu, Jan 17, 2019 at 5:27 PM Stefan Agner <stefan@agner.ch> wrote:
> > Hi Stefan,
> >
> > sorry but don't like this patch as is:
> >>
> >> From: Stefan Agner <stefan.agner@toradex.com>
> >>
> >> Currently polkit is enabled if systemd is in package config. Those
> >> two things are orthogonal: NetworkManager can be used with systemd
> >> and without polkit just fine.
> > Did you test this (=3Dchange networkmanager connections settings) as an
> > unpriviledged user?
>
> Works as expected: need to be root to change connection settings :-)
>
> We plan to use D-Bus and D-Bus policies (<policy> tags) to allow some
> settings to unpriviledged users/groups.
>
> >>
> >> Introduce a new polkit package config and enable it depending on
> >> whether polkit is in DISTRO_FEATURES.
> >
> > * it changes the current behaviour and the default suggested by
> > configure.ac: 'we usually compile with polkit support.' and
> > meson.build sets polkit by default.
>
> Yes, this changes default behavior. I did not do that lightly, but I
> think it is sensible to have a global policy on polkit, and also let
> NetworkManager follow it. I guess the change in default behavior needs
> to be pointed out in the documentation e.g. in the chapter "Moving to
> the Yocto Project 2.7 Release".
>
> Throughout OpenEmbedded we had vastly different behavior wrt polkit.
> ConnMan disables it by default without any option to enable it. Quite
> some packages make it dependent on systemd, some have just a local
> package config polkit etc...
>
> We have a WiFi capable headless device with restricted flash and would
> like to use NetworkManager. Using polkit pulls in mozjs, which is rather
> large. We do not need interactive authentication capabilities, since our
> device does not allow direct user interaction...
>
>
> > * as far as I know there is no polkit DISTRO_FEATURE in metaverse yet.
>
> Hm, yes, we definitely should add polkit. How can I do this?
>
> >
> > I suggest to add polkit PACKAGECONFIG if systemd is in DISTRO_FEATURES
> > - if you don't want polkit you can add a PACKAGECONFIG_remove =3D
> > "polkit" somewhere.
>
> Yes, I know that. We had this in place so far.
>
> However, rather than having a bunch of PACKAGECONFIG, I'd rather have a
> distro wide policy on polkit. I did send an email to oe-core with a
> cover letter, and since that patch got merged, I was assuming that
> polkit as a distro policy is the way to go.
> http://lists.openembedded.org/pipermail/openembedded-core/2019-January/27=
8021.html
>
Ahh - I see am too late in the game - decision was already made - go
on and forget my last email.

Andreas

