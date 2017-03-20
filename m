Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id DB3C4778A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 13:08:22 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t189so63929776wmt.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 06:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cUNx/LAapVhRpJ37oS2kDM+ncySXOMqKS0pMidhdDYI=;
	b=p+que9CxTQQsEFTM/v6yhOMzPyvucwO+pdkaU3M1S4gUdAVfC/R5/ZqHeP6bGOZB7l
	atrhGyOfzRZxPC74ln8eKtcWlecOi4eLandXKsBlCxHUa6udLu9vTQLtW43dAFyCv94y
	5523DRKSZOW/RHLxuE/FsMmsJFl4BhNjU2RiQk8Kzq0ZGnQRS0pP5aV+uIFPufVxHIRP
	gfClqbeT2jwYlBKs0m9M5Y57EYn/YQgHdCaK5KZAMv8AGrFOO/5ZKralixs2z992Db9+
	T1OERxnRBMUdgKR5YRrZyzHGA/Ro6eDfnsoTL66nG9/p8uiBy1SiROtcQNUNQZkkYYQL
	kYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cUNx/LAapVhRpJ37oS2kDM+ncySXOMqKS0pMidhdDYI=;
	b=oAsviqpIDj/iDMvxD1kZxx5jC/849hNOrww7yaYHxhVm7l9ZVSDWWLkqNzAW0Pg3El
	MJK5DYerFKk1+z92QMCiY712JWN9zFARSyJfSn/Pp510/VQFRcXwnHRInXw8psaf13q6
	5j/YtIMN45+Fe8PRxt1BN9YvFNuDVEJ8CVyFVG4Hy77ecXv4LIIisMqLbKaUJgcO67+Z
	SoorSSL3qE8LSGwHXvdeNlvZ6Xm6FyORHbsg6fBD5cDKEVnf98ZqJ6yuKf93HTJrGtvH
	8LPqW0OMOxcIp3up8W798/95PgaMpA+RDiLQZhpY9tE1rt+7asU5b/6kdxywzVjP/Zy2
	AmMw==
X-Gm-Message-State: AFeK/H0LxWLqBkK1z21sczsmDRc3jmFXEJ2Zm8H6KUmb/nQi6ZIxjvq4wuCbohSjqY8xj7U5e2Az0w2bflzNVQ==
X-Received: by 10.28.4.10 with SMTP id 10mr9743032wme.124.1490015303430; Mon,
	20 Mar 2017 06:08:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Mon, 20 Mar 2017 06:08:22 -0700 (PDT)
In-Reply-To: <CALbNGRSQiaNCD4gjkxAO0FXY5Y7ZZmo0aQ9u6TZQ4uFusR2ugQ@mail.gmail.com>
References: <alpine.LFD.2.20.1703200753460.9821@uk63952.mitel.com>
	<CALbNGRSQiaNCD4gjkxAO0FXY5Y7ZZmo0aQ9u6TZQ4uFusR2ugQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 20 Mar 2017 14:08:22 +0100
Message-ID: <CA+chaQeVXMSEXuCF7F2jRG4-TBzFWkGMWv=Gz=ksD6Z=tC4C1Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: blacklisted accel-ppp (under binutils-2.27) seems to compile under binutils-2.28
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
X-List-Received-Date: Mon, 20 Mar 2017 13:08:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Yes, sending a patch is OK, but you might want to test it with gold
enabled, most linking errors are usually reproducible only when gold is
enabled.

On Mon, Mar 20, 2017 at 2:04 PM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Mon, Mar 20, 2017 at 12:56 PM, Robert P. J. Day
> <rpjday@crashcourse.ca> wrote:
> >
> >   current meta-openembedded recipe for accel-ppp reads:
> >
> > PNBLACKLIST[accel-ppp] ?=3D "BROKEN: fails to build with new binutils-2=
.27"
> >
> > with error logged here:
> >
> > http://errors.yoctoproject.org/Errors/Details/81003/
> >
> >   just tried under latest poky pull containing binutils-2.28
> >
> > and it seems to compile just fine. should it be unblacklisted?
> >
> > rday
> >
> How about sending a patch and give Martin's world a try?
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

