Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id DFECF748F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 19:57:19 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id o73so3500406ybc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 11:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4hiS3OpHA00AgW9EBvk5n7yHaAXdstKvoWJzruq24YY=;
	b=iBdCkagFK4WJA318446u2JAwc5JkKIFhDful50aT9tb0jHJft6jQ+DR7CvpNDx6HeF
	iE9thX0qah8mpNZUOFO97xnlBxosPumfHMNS8/BlCXpSpuFw3BWOrcNVnsTaHZGPlCgF
	TSw+LRxc1EKCjr9UFmOJy4r4lfL9D1vPwW83SgeBaHLbnvZso6tOfNO249Kq/Ruu7QKN
	d9PpsvdTMdc2oRQiBKG9xYmk1tbEFIWustpl2DQfVcqJXffSicXRjVtquUKynxyUKchn
	CHha0gNnj/MV/9DvzwcyoaMUMbNcUqMVmzvgvi99os5X0rsUSl64PgTVTvAHw/bSWIyK
	dbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4hiS3OpHA00AgW9EBvk5n7yHaAXdstKvoWJzruq24YY=;
	b=qcpWbMmdxOVXTPua0mzp5ATXiTve3UKZsdYzkqJwhXuN5GxTsBfvgW0IxC26HA9ZkN
	DjqYi7UtVIG2r8l8a3uIvlxXE+O249ld5mNZpP+rVjyvhg3pvoqWK/XNbu2vTL09NiKa
	1qFssdlzp+ia9IT6gy7ORLwWq0lUQ4saj8v7/hR+L0/QZQZ/Dtj19pY3x24BPLUufO+v
	/VbjlRrMR76d3nTIeM/oAGCX6TBllA1kqaq4zOQh9hPv1/Xz4CttshZ0Swr/9ilpU+zk
	P9W0I/5lku72CpXNtYxicxF0eHWFwSzeO8Vu/JPUSQNGuZPq22vSrqrUjTHRb3ZM+Nyc
	JSaw==
X-Gm-Message-State: AJcUuke/miNMHV/i5BJp9mj2okVlYmA7jJ3J69spqijXOgNa/s2oLDTF
	myroO7kbUp1BQQKH732PwfoPdrt4ivH2FGnRrN3khqRM
X-Google-Smtp-Source: ALg8bN6o8m2Yw09SWhz8y/yBVXdU3ZIX8vzHdgEaVNCF6AnONlGUbIf788FtifrZ0Hn60zbc5WPhUMROCfEMBZfzdhE=
X-Received: by 2002:a25:ad87:: with SMTP id z7mr3453704ybi.106.1547755040782; 
	Thu, 17 Jan 2019 11:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20190117162629.47677-1-stefan@agner.ch>
	<20190117162629.47677-2-stefan@agner.ch>
	<CALbNGRTMjFogycr0vsaLDxLeQi-ZVvHb6bu2pm9QebwaWdH3bw@mail.gmail.com>
	<8079727a69d7f33cc1936930d52fb55d@agner.ch>
In-Reply-To: <8079727a69d7f33cc1936930d52fb55d@agner.ch>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 17 Jan 2019 20:57:08 +0100
Message-ID: <CALbNGRQ5D47zG-pFSPmD6obfmF_G8pdCdT8JT3dy6BA3ctWdsQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 17 Jan 2019 19:57:20 -0000
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
Am aware of what you want: Reduce image size.
Still don't like changing defaults because settings cannot be changed
by unprivileged users (and machines connected to network should not
run as root and this is what might be the consequence for lazy
people). And this would be another OE/Yocto default many other distros
don't have. BTW: The connection to systemd DISTRO_FEATURE was
introduced by me and there was a reason for it - but I don't remember
- it is long time ago and maybe it is not necessary any more.

How about inverting the logic: As long as no 'extra-setting' is done,
polkit is enabled by default (as suggested by the packets). Would a
DISTRO feature 'no-polkit' be something you could reach your target?

Andreas

