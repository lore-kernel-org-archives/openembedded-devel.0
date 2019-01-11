Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id C63E87BE1A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 03:36:44 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id e5so16802972qtr.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 19:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JjxRtPsiSsv6Wi7tiDBgwf5i1pF6L5KMUSL90QUYdCM=;
	b=OMe1MWkd9H6addCnSY+8NEnaWPN6KuQH1dsh7wLVmzwhmrIUkE2HfG0nMfIgXrl5s1
	M7wEV6wH1sUPuaIPfveDblkbeaHnKbRuvmGR1QJ933Od1Dc80xOk3C+1bXCoZJwpIQM1
	/rWxOFiShJGG2Wx/hVd6jEmeqWT0P9nyq+ytCXhN6m9O+ryNxNe79nlG3rkGNTr03Dky
	h6x+PzzI9XFkgrInc135rwtcEZ2lyDDltbhqC0Ab+b3ao0DGHNhYqzvkHE0W6pYSvtpL
	7/4DbHe0loHscAN2ADO15Ak4AwAspmOFnCalbsv/VzUtldHM4WCyCsmYqnLtgmUZ6bZC
	pOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JjxRtPsiSsv6Wi7tiDBgwf5i1pF6L5KMUSL90QUYdCM=;
	b=jOBawnHdaSGwDvxubMtB/v/Jaa50gUQCtIIqxDQVQAnO5bE8gI+pfEiwgQvEuvBabd
	lGUGfB0DZZb5FWtnQcvRc/vkFQdXU17yEAop+EZXF3/LowgQb7YT3HpGnxPBX9VMFapL
	WyW0TkKKJ/bc8jl7cQbL7M0m/aHSlg2vk4tqiEfOpgv9XZOzPs0dPBh6m3/YYawnQA2q
	ifKLc8RvJzjACUC4vWdZku9G042QYLAHyo27t/Y1y7B0s9kG9+BJ1uwRDuV9n0RrEycp
	35/yFoOrQm7j/viCdSHiOkQay2WgYF9kfZaKgxhYyC0AyR4mYC6lJ+p66/Rl1Qiw0J5L
	N8+g==
X-Gm-Message-State: AJcUukdqZ28pTZKp3jB3pZBiQN4CUcrOR4o4b4rH95pGQb3fukd+4EG/
	qUlxze/vlwfBmvs2tqOTRLirNQDSOI2HJzbArMs=
X-Google-Smtp-Source: ALg8bN4ksi2uhgIooFrn6JPdyOZY38KFm+1HniZuND5m4/lt1E0z16A0EuNV55Frp3FwUfJlBY90ruvu0wa1+1AvK9M=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr12137549qtf.196.1547177805587;
	Thu, 10 Jan 2019 19:36:45 -0800 (PST)
MIME-Version: 1.0
References: <20190110094212.16763-1-richard@nod.at>
	<20190110094212.16763-2-richard@nod.at>
	<CALbNGRSKj12yY5NMN+msKbuKQTRcCOd3V5q196orVCTh8Mg6xg@mail.gmail.com>
In-Reply-To: <CALbNGRSKj12yY5NMN+msKbuKQTRcCOd3V5q196orVCTh8Mg6xg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Jan 2019 19:36:27 -0800
Message-ID: <CAMKF1sqH35n7CKa5PuTHCn8BFZTYfBA8TGUGKz1NJn5nKRPRdA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/6] [meta-gnome] wv: Don't use ${PN}
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
X-List-Received-Date: Fri, 11 Jan 2019 03:36:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2019 at 5:00 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Thu, Jan 10, 2019 at 10:42 AM Richard Weinberger <richard@nod.at> wrot=
e:
> >
> > Don't use ${PN} for the source dir, it will break multilib builds.
> > The correct variable is ${BPN}.
> >
> > The bitbake defaults are:
> > BP =3D "${BPN}-${PV}"
> > S =3D "${WORKDIR}/${BP}"
> >
> > Therefore we can remove this line.
> >
> > Cc: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> > Signed-off-by: Richard Weinberger <richard@nod.at>
> > ---
> >  meta-gnome/recipes-gnome/wv/wv_1.2.4.bb | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb b/meta-gnome/recip=
es-gnome/wv/wv_1.2.4.bb
> > index 8ed1fcd15ca8..03ee5b4ac4aa 100644
> > --- a/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb
> > +++ b/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb
> > @@ -16,6 +16,4 @@ SRC_URI[sha256sum] =3D "673109910e22d4cf94cc8be4dcb9a=
0c41b5fbdb1736d4b7bdc7778894d
> >
> >  inherit autotools pkgconfig
> >
> > -S =3D "${WORKDIR}/${PN}-${PV}"
> > -
> >  EXTRA_OECONF =3D ""
> > --
> > 2.20.1
> >
> From a quick glance these patches look good to me - should invest more
> on multilib tests...
>

Thanks for reviewing Andreas, I have already staged them in my master
and soon they will be in master-next
hopefully tonight.

> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

