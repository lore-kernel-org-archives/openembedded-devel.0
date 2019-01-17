Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id E46E86BC7A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 21:41:43 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id 2so3595210ybw.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 13:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MXrsfAY4PriffX3SMzDS2u5PO4XFbAMYm956d6mnIpY=;
	b=QjJ9h6OKjHe2zyh2dNKTacFQ7FEoQKok9QS1xqObYdLcAyxP+JPN0g/IBOQFHrvetr
	WFVfMEogTvfJQcbLRmKMJibZsCleaOBibaPAxdrHhWxQKXPlm/wzNd3Chu08XpxPI2Mm
	MprN1PRTpsyhDoF0B3CQeHG6DNuB1fsjbFXXLhddVwFFMfZWkdfn5QCQGVshUq4qinmS
	Oh2mTZOEkxk/Bu/6ZYueookyU8wHY6S6khteDdtQDBtuQId0icrov1L3FaBH4xixZ6n8
	Ur4pqTpRA4eR6/tXb2bfj5sH9gJLFtuofQ+eYGbrv4oEUIGwWl8mp9yf9k+vYsuzRuvc
	hwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MXrsfAY4PriffX3SMzDS2u5PO4XFbAMYm956d6mnIpY=;
	b=lesEWmHoJQuDp9uk7exHgLh90Xy62mi2rumVfEqcHJLWqFWJdjcg5uCp4Ja2RSCLMb
	oxYi/mNxBapGbaqWkWLqc6Wwzq6jOJrhzLLfjjEsc6bv2GI8k3nod566E+AIhB9lwBpl
	gQDFawghoASlpd9E0E/b3PzVCUJqOtICyMr0NX0FPPC1tSzlhtgYwXufVOTh5A/prSfO
	rm8xZuIAUzlY7HtylMgogPjP1euqe7Zj21+g94C5uqqJtsn5rWL2UHT7tASEnY609NQt
	QlTPGlVMqOZTcnPOWu3EEzjhaKSaV5VebVNH+RmXvV9v2PmsoskQkgp/uqevoOfYPSUk
	e7kQ==
X-Gm-Message-State: AJcUuke4gTfI2LZ9z7XoDDkDtbux5n8aAIOHMBSJgA1rjSVDul301V3n
	uQjYcNvwM2IY8c19sYjp7V+xj1n8SxuOPD7kThs=
X-Google-Smtp-Source: ALg8bN7A8UYOT9VbaBAoZswOGt9inXVC1W4pauKrwIj9B2SB/A01Lfsmhivu4iK+qIwFmE58pOU0dlSIQwbbiqHINZc=
X-Received: by 2002:a25:664f:: with SMTP id z15mr3757910ybm.116.1547761304627; 
	Thu, 17 Jan 2019 13:41:44 -0800 (PST)
MIME-Version: 1.0
References: <20190117162629.47677-1-stefan@agner.ch>
	<20190117162629.47677-2-stefan@agner.ch>
	<CALbNGRTMjFogycr0vsaLDxLeQi-ZVvHb6bu2pm9QebwaWdH3bw@mail.gmail.com>
	<8079727a69d7f33cc1936930d52fb55d@agner.ch>
	<CALbNGRQ=wGD6j3zH7y1P4JDFzQ9jOShsbBV2rpTaC_CNPA3Mig@mail.gmail.com>
	<a9f13d522deacb543eb9426f228e716f@agner.ch>
In-Reply-To: <a9f13d522deacb543eb9426f228e716f@agner.ch>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 17 Jan 2019 22:41:31 +0100
Message-ID: <CALbNGRQM_EOaC40jUXEhsHoFWYb363SGxTj2WoG8Hg8ChX+w5Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 17 Jan 2019 21:41:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2019 at 9:18 PM Stefan Agner <stefan@agner.ch> wrote:
>
> On 17.01.2019 21:01, Andreas M=C3=BCller wrote:
> > On Thu, Jan 17, 2019 at 8:09 PM Stefan Agner <stefan@agner.ch> wrote:
> >>
> >> On 17.01.2019 18:50, Andreas M=C3=BCller wrote:
> >> > On Thu, Jan 17, 2019 at 5:27 PM Stefan Agner <stefan@agner.ch> wrote=
:
> >> > Hi Stefan,
> >> >
> >> > sorry but don't like this patch as is:
> >> >>
> >> >> From: Stefan Agner <stefan.agner@toradex.com>
> >> >>
> >> >> Currently polkit is enabled if systemd is in package config. Those
> >> >> two things are orthogonal: NetworkManager can be used with systemd
> >> >> and without polkit just fine.
> >> > Did you test this (=3Dchange networkmanager connections settings) as=
 an
> >> > unpriviledged user?
> >>
> >> Works as expected: need to be root to change connection settings :-)
> >>
> >> We plan to use D-Bus and D-Bus policies (<policy> tags) to allow some
> >> settings to unpriviledged users/groups.
> >>
> >> >>
> >> >> Introduce a new polkit package config and enable it depending on
> >> >> whether polkit is in DISTRO_FEATURES.
> >> >
> >> > * it changes the current behaviour and the default suggested by
> >> > configure.ac: 'we usually compile with polkit support.' and
> >> > meson.build sets polkit by default.
> >>
> >> Yes, this changes default behavior. I did not do that lightly, but I
> >> think it is sensible to have a global policy on polkit, and also let
> >> NetworkManager follow it. I guess the change in default behavior needs
> >> to be pointed out in the documentation e.g. in the chapter "Moving to
> >> the Yocto Project 2.7 Release".
> >>
> >> Throughout OpenEmbedded we had vastly different behavior wrt polkit.
> >> ConnMan disables it by default without any option to enable it. Quite
> >> some packages make it dependent on systemd, some have just a local
> >> package config polkit etc...
> >>
> >> We have a WiFi capable headless device with restricted flash and would
> >> like to use NetworkManager. Using polkit pulls in mozjs, which is rath=
er
> >> large. We do not need interactive authentication capabilities, since o=
ur
> >> device does not allow direct user interaction...
> >>
> >>
> >> > * as far as I know there is no polkit DISTRO_FEATURE in metaverse ye=
t.
> >>
> >> Hm, yes, we definitely should add polkit. How can I do this?
> >>
> >> >
> >> > I suggest to add polkit PACKAGECONFIG if systemd is in DISTRO_FEATUR=
ES
> >> > - if you don't want polkit you can add a PACKAGECONFIG_remove =3D
> >> > "polkit" somewhere.
> >>
> >> Yes, I know that. We had this in place so far.
> >>
> >> However, rather than having a bunch of PACKAGECONFIG, I'd rather have =
a
> >> distro wide policy on polkit. I did send an email to oe-core with a
> >> cover letter, and since that patch got merged, I was assuming that
> >> polkit as a distro policy is the way to go.
> >> http://lists.openembedded.org/pipermail/openembedded-core/2019-January=
/278021.html
> >>
> > Ahh - I see am too late in the game - decision was already made - go
> > on and forget my last email.
>
> Probably should have sent out this patch set changing meta-oe stuff at
> the same time to get the broader overview, sorry about that.
>
> NetworkManager is really the most drastic change here, since this is a
> prominent package where the change changes the current default. So if
> you have any suggestion to ease the transition, I am happy to look into
> it.
>
TBH: I haven't the time to take care for a use case I never had until
now. I'll just add polkit to my DISTRO_FEATURES and hope to get same
as before.

Andreas

