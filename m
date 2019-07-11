Return-Path: <raj.khem@gmail.com>
Received: from mail-yw1-f41.google.com (mail-yw1-f41.google.com
	[209.85.161.41])
	by mail.openembedded.org (Postfix) with ESMTP id 326DD7EFE3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 14:58:34 +0000 (UTC)
Received: by mail-yw1-f41.google.com with SMTP id q128so3988659ywc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 07:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fntBKsdvKjgzaUJ5ns9AeXT+kZMUr6SNLaGBGYorJek=;
	b=imvBDg91QhLIpMMwyBs5W+HsBpvLVLvtUZimlcABO2Nop+/3zybvlLrHqOrvm26kUs
	qtCvWsx4F8eDsoP6h7HMcWk1zf+yNxT9VcrmLsoqFq5Q87/3rS2qN18FXcCngTcDRm7V
	38SGYGY4FMZhpr7WCmIjh851SZauJmZ9+D3V7PvEQhKx9ARm5E26GKoc00icyBYAeZP3
	pkM05sp6GaVt9xwz3nR8RRU8JXtkyDxxG+OHhECsAQpSanyJpjWM37i9JlnUDwSwgodt
	VMFkm6+2wZaNoyQIMMXjXdUP4xBJZwCZIfujjyRhZ+bcCeqjY+6UAyy8VAKx5xA3XslL
	fu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fntBKsdvKjgzaUJ5ns9AeXT+kZMUr6SNLaGBGYorJek=;
	b=HDQjhQ8LOXIrGyT5fBGGnbVs2xoQrWVuSEEIbEPBDBuaWEZ5AqLvl6ux6ffYsuPWX4
	z7bmL0j3ZyBTlY4+aOL4hhYSaJU2R5mjsZB7PG82H7QzHLhWwauw4PrTNA5OZYppLzd5
	s0TEAUWDRmq+INPcIw1kz1mlKUYLKMenN9O+GtUO8+EJvljShBDvwep8bpO29Uiph0mI
	7Ob/mo5PWG7V5/mCTqg+XWQ8TLnmeyv26JHNhxpJJTQMpMeaUJCNxp266GqsiC5u+bLG
	hj1zyRSrlNXxNIxKme1b9dGig5SDB0LXC9fNtGpCZd8j1585qgdQqSD0CS+CiglKs8gY
	hO1Q==
X-Gm-Message-State: APjAAAUyKmh+6L3pXDku0/5VcesgscQM2NrNLRrz7pFK8UljmAFFoxtL
	Geznj/I+//KLKXUXPxTZs49gS5yaSKSS7aIh0BU=
X-Google-Smtp-Source: APXvYqyEb4geOgCjLABgwT9WhqUUI7q+KAcJxRZE1oTaBcHu27FLHLLc2VUTMzWlg0HUryB+om2s/k1Uaw0wBIqXxm4=
X-Received: by 2002:ac8:764f:: with SMTP id i15mr2286097qtr.194.1562857114884; 
	Thu, 11 Jul 2019 07:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190702012913.7163-1-kai.kang@windriver.com>
	<CALbNGRRWQW24kwTwjoB=0w3MkAMa-GCKgpP5jUsYhnzsD4ajtA@mail.gmail.com>
	<2e8537cd-be5e-5e5a-31c6-490809fb00e2@windriver.com>
In-Reply-To: <2e8537cd-be5e-5e5a-31c6-490809fb00e2@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Jul 2019 07:58:24 -0700
Message-ID: <CAMKF1sqHPJ=LqAfqYdE8oeg-A=XBJ=2f3TOCPQfmHkHdsOAp_g@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][Patch 00/11] Upgrade to xfce 4.14 pre2
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
X-List-Received-Date: Thu, 11 Jul 2019 14:58:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

They should be in now

On Thu, Jul 11, 2019 at 12:51 AM Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2019/7/2 =E4=B8=8B=E5=8D=883:47, Andreas M=C3=BCller wrote:
> > On Tue, Jul 2, 2019 at 3:29 AM <kai.kang@windriver.com> wrote:
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> Upgrade core packages of xfce to 4.14pre2
> >>
> >> Kai Kang (11):
> >>    thunar: 1.8.6 -> 1.8.7
> >>    exo: 0.12.5 -> 0.12.6
> >>    garcon: 0.6.2 -> 0.6.3
> >>    thunar-volman: 0.9.2 -> 0.9.3
> >>    xfce4-dev-tools: 4.12.0 -> 4.13.0
> >>    xfce4-panel: 4.13.5 -> 4.13.6
> >>    xfce4-power-manager: 1.6.2 -> 1.6.3
> >>    xfce4-session: 4.13.2 -> 4.13.3
> >>    xfdesktop: 4.13.4 -> 4.13.5
> >>    xfwm4: 4.13.2 -> 4.13.3
> >>    xfconf: 4.13.7 -> 4.13.8
> > First of all thanks for taking care. One suggestion/wish: Could you
> > please update xfce4-settings to latest upstream and move away from my
> > fork?
> >
> > Background: The fork I created added two functionalities:
> > * Optionally hide mouse pointer for certain pointer devices. This
> > stopped working anyway (and was problematic for Qt application from
> > the beginning)
> > * Datetime-setter: I created a new project for that based on GTK3 [1].
> > It is not quite finished but I use it frequently and am happy to have
> > it (e.g on machines without RTC backup and missing network). So if
> > somebody wants this either it could be added later.
> >
> > Unfortunately I have no time to do this myself.
>
> Hi Khem,
>
> Upgrade xfce4-settings doesn't bock this series update. Would you like
> to merge them? Thanks.
>
>
> Kai
>
>
> >
> > Thanks
> >
> > Andreas
> >
>
> --
> Kai Kang
>
>

