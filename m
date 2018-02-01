Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id EBBCF6093D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 19:40:38 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id x4-v6so1544880wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Feb 2018 11:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yoN3tl9vMvVZE34SrwVUrCc+LyBdnT3JaV40BeU8ARk=;
	b=HEjdJ+xFT+qgdpmDy3vSHshUM7YL1irzj7m7WRueHeICN+Fj1BJ+8LizQms1n4xS/0
	Ri7jI6RZZwHhFkvT4NS8TrWQGVfurDUsI3dqT89Tw/UV5TthfY+o9qtr0uHC0LSCWseY
	O5tRonB7UQmaNwld5rU52ommmUuU3OpGEl2gXIaZ/cGFzbRJNMc6BE/l5uavtxv5yoYM
	zAVtpFfkMA2XCqTLmJEjysqJKx0xh8m1RW7ia1vfRPB6kjdrLVzjottMc1krPNWqjydu
	HIlwoZxZ0ChQSrsYAY3aMI2zossTNCXbn7BRxK/pmlh6CMVBidORYxQWsiWVKpHOjoA6
	pGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yoN3tl9vMvVZE34SrwVUrCc+LyBdnT3JaV40BeU8ARk=;
	b=kuk/aeH824+Yyafm5k2fkuZRyY0DFAs+N9FDVTmLttM+QANlgWSjY/6WLxCRLzNG+g
	Pbhj31qV4yxz4xtSxbBNYX4oqYml8Rpt8VChYzsPz7UgjdttVrr470RIijSQ5gPLNW+w
	6khmA0yb9x1P6YyPVG8q9URokrOkZu5kjnufc9OC7Tnmaxhlf18RgpOgX8w//Jyly6GF
	RQzMzRwmMigmDDP64EP9IId5EK9WSpbYFFY4Um0vWxVg+vasQ7+UI4KYn/Gy8gFyYYL8
	/oANy0BSsk901Mtq1o12ovdAvm3OV9ogMN/71KCN9d4FisAnco01//C7PiZHYcmAHhVw
	vZ2A==
X-Gm-Message-State: AKwxytfmtAkjXnRg0VUb690EXVPenQbbs1LrbWmbIkxVSRA4z0gqLUEn
	I27j0n4da3Ajw6DXges9Sob7J3k2AHYCUgidoB4=
X-Google-Smtp-Source: AH8x224RWOZxTE30SmfEOC+Pk77JdxPg8v1w9ovUMGXemcOUgS8CB/1+/a4AGEhXG9SVpimsQNay8EGWuNLHGCGyqk4=
X-Received: by 10.28.191.19 with SMTP id p19mr26057800wmf.142.1517514039746;
	Thu, 01 Feb 2018 11:40:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Thu, 1 Feb 2018 11:40:39 -0800 (PST)
In-Reply-To: <CAPuovEJfXdpKs2XFp6Y6hmh5Mg8u=3Vo_dL98GSGbAp2DVwbww@mail.gmail.com>
References: <20180130121432.508-1-Martin.Jansa@gmail.com>
	<ec48cca7-f05b-826c-e3a5-a23ccdc9d7dd@gmail.com>
	<CA+chaQcCkNLS49AeBALYKyiW+_Q_kAgtjqfKE+Orz-mWGMyE+w@mail.gmail.com>
	<CAHUNapSQJoSJbexQd6_NWU=YO4ekubf5fwNeBdtrGxP_okkByQ@mail.gmail.com>
	<CAK18fxFuSkpsd4hb-9hvDSYTZGisJ73otqpxk-xW0ZYoGkU+-A@mail.gmail.com>
	<CAPuovEJfXdpKs2XFp6Y6hmh5Mg8u=3Vo_dL98GSGbAp2DVwbww@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 1 Feb 2018 20:40:39 +0100
Message-ID: <CA+chaQdTTxfeeZogrfYYi_VMYTwbAUHjpbAArWTa=MdbrxxyRg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] recipes: use oe.utils.conditional instead of deprecated base_conditional
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
X-List-Received-Date: Thu, 01 Feb 2018 19:40:39 -0000
Content-Type: text/plain; charset="UTF-8"

I didn't want to disrupt Armin's work flow more than I already did, but
I've rebased and pushed updated master-next now.

On Thu, Feb 1, 2018 at 8:36 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On Thu, Feb 1, 2018 at 1:47 PM, Andrei Gherzan <andrei@gherzan.com> wrote:
> > On Thu, Feb 1, 2018 at 2:22 PM, Trevor Woerner <twoerner@gmail.com>
> wrote:
> >
> >> On Thu, Feb 1, 2018 at 8:51 AM, Martin Jansa <martin.jansa@gmail.com>
> >> wrote:
> >>
> >> > I've merged it now to unblock people doing the builds as discussed on
> >> > meta-oe github and also meta-raspberrypi github.
> >> >
> >>
> >> Thank you, it'll be nice to have a working master again
> >>
> >>
> > Should be fixed now.
> >
>
> Martin,
>
> Any chance you can merge this to master-next? No reason to leave that
> branch busted.
>
> Thanks,
> Mark
>
> > --
> > Andrei Gherzan
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

