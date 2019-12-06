Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id D77FC7FBEF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 09:08:11 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id x1so6608027iop.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Dec 2019 01:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hcp+TPvaEs7lN0mkwmLb1/IFlDDP0+PSzttaqLXUeKQ=;
	b=FG21auVIua8cdYrWxOnIITPvnmrax2r2pAlv1L3r4SWOp9VrV6HoTE+MF3Zk7xHhRN
	upckPGNuzp0HpprV1QQ8UU0h/qaOXZtjo71mJLqVa8+rd7vGk8wlDSaPc3JstTYmYFNc
	NgRy0SR9cYjS8Z1bEhR1OICpj8oovNoYUJSQTC1cV/axPHATUhO3xf70K/js3q/Lrd9u
	wd9F8imBBPdIKw29qX/Um20Qmvg+eMuvutyWwjhH22XYaqG7ugnGy3DBvP/FIRIVDWAU
	ELTo/q46v/myxf0G9J61xtKMab6bHZI0xDA369OCgxnub3Chhkr2OpWL3C0VPwAB3kVn
	AAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hcp+TPvaEs7lN0mkwmLb1/IFlDDP0+PSzttaqLXUeKQ=;
	b=RY2KMKtejV/kBTS0McHwJ0GgoPZCpQDKAsaT0qg2jBpoXn+FIyW1EA3cNG57lAT0LW
	3DC6yXIJnwRZaxNCOoeIlzGJk/y9apmnoZCzVXiIdEC/TEVyjROW1+4YyQVv7556ooz6
	d40njGXubeRBdFSY2KhZIUPSX/4AfZGJAuQFU3zogOKxL8t9FuY1+m8ct4cY8cnz3e/h
	hkM3uo41r2AqrBLhzBTXQWiwDqVSEiJ4UxLSSM+cd/yde1+NbMWmA40jVx/UPTSdg+WP
	E+R18xslBQfurTshsLLLXZiH7nXJ1UzwZzzcNI7TePoQvjHlSh+W61YqpklHyYWKZP6J
	iwuA==
X-Gm-Message-State: APjAAAVLgC39fam8kK5lEDmY7+P/4473ew/1RLXRpdevqhpBD/j5S/rA
	+SnDC4xy2uIbrcsXZPv4nRCGYzr4ogy+L0ZxrKQ=
X-Google-Smtp-Source: APXvYqxDVAsMBteF1wOHcoV0ZiFi8Fxa8G0mlCVKQPTGWK9+cr/SdRYlPWZ93rwT1QHwUN/TQj79ZDHn3aSd9YGvt58=
X-Received: by 2002:a6b:f60e:: with SMTP id n14mr9262800ioh.147.1575623292888; 
	Fri, 06 Dec 2019 01:08:12 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<CAMKF1sp1MgymCXa_3UXydMTL6Novf0PjnLYVn3+TyaAMe+=woQ@mail.gmail.com>
	<CAMKF1sqrhYHQAeFPmbh=smyU=uqJxGOhYeCup3Nteyqk6guwXg@mail.gmail.com>
	<CALbNGRQAEhJbUdVw3Z69rU7jTLoY-=W9yUdDuxDSRNdRQfNH0Q@mail.gmail.com>
In-Reply-To: <CALbNGRQAEhJbUdVw3Z69rU7jTLoY-=W9yUdDuxDSRNdRQfNH0Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 6 Dec 2019 10:08:01 +0100
Message-ID: <CALbNGRTHzHsA-u36MAcBtkhMjdF6TJBv+O7uMg1ASVO8K53gQA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/21] Gnome cleanups & desktop patches
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
X-List-Received-Date: Fri, 06 Dec 2019 09:08:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2019 at 10:05 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Fri, Dec 6, 2019 at 8:12 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Seeing below parsing errors
> >
> > 20:27:29 ERROR: Nothing PROVIDES 'gdm' (but
> > /mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta=
-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb
> > DEPENDS on or otherwise requires it)
> OOps - I have written much about gdm but the patch adding it her is
> missing. Will send soon
No gdm was part of the series - need to look into x11 (distro)features more

>
> Andreas

