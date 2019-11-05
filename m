Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF887E21C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 08:58:44 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id s17so21722090iol.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Nov 2019 00:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CTxgpJ/rWjJ5qyZuH4/Nbo4k6SzBFV6L0/0eNCi6Oyo=;
	b=NP5XShBzP2y2m1TltJhCOgdPqwv2Brnn8/yvY4DhorA5S6vX/JksVQNcrJn7eNImgr
	B+9H8cC2Yy2X+qnImNoI2aYEorgZk8XvFerIToqSlJgCiLcvXnYmvyJLc15SJrPnUi2f
	g9xgk+M99/JKCcj/oBgfveLZ0pELkjRaeatBfl0GXPPYFUBhlHhSjLRkBfJtwPalXPVX
	0ooAWCNYVsMcf8mnO5uV5ddJYVC9zPv/LBYNdFtoclj0MzMfC2Nt1B6CTEAvF4j3daQ7
	7KWQ/MI1PQC1bWAGQGylWrWaxB1ckYAxB7o8A/DzdgXP/vetAMizrqW8DckWChNMWyod
	lWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CTxgpJ/rWjJ5qyZuH4/Nbo4k6SzBFV6L0/0eNCi6Oyo=;
	b=jVDjhaPCkgolW6h9WseXin/pIh56vcM0ynIEqauQxcRTR2AG2P8N4u17ey9CWJhP/g
	3GE8rMwM9U1nif2wHOg/g3k0tAq3xRgDtZ5lAjHqriw+THtG/k5TPnbPMvZn5KiTj1Or
	6TXCI0IuNVdsv6+wk3zW0VSr+JZbjg3RctoZijbXq0JZ0kY7P9iUYhDdcjrBoGOIGm0Q
	8a29L7aIAIGMXOuCrJqvI2eJFBXT7GGQKb9WV46m16ZhylCkGH4C82QzcqcLImZFlN19
	1o26bplEtLvlxx4zrq4zS5jlbb6IwI3AY2qmjvtMur7REfQv4uhSrv9PN5AhW1u/E8Md
	Kadg==
X-Gm-Message-State: APjAAAX8krnfJCcacXqAdLlHNze/kwi+P8VgxExC5O6AAF6rc1oYDqEX
	b0EXSHZj63dOy/f5NNpok0S1iMW6+vEMRTEOQek=
X-Google-Smtp-Source: APXvYqxYEXWNrSh/WfPZdTO2dm0M0naEWcrdqSwrlGKwbJaOTjCer0MekxTXjzCfzd/rHEEIR0OaRJ7N43seMjc/fOE=
X-Received: by 2002:a05:6602:234e:: with SMTP id
	r14mr12839626iot.102.1572944325183; 
	Tue, 05 Nov 2019 00:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20191011212120.11453-1-alistair.francis@wdc.com>
	<CAB2nKc8MA7uLUxbJrzh-a48AHe66XoghYaGLxF0PRH7y45RiWQ@mail.gmail.com>
	<e3824981-20c0-b5e2-752b-e63ad6df771b@skidata.com>
In-Reply-To: <e3824981-20c0-b5e2-752b-e63ad6df771b@skidata.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Tue, 5 Nov 2019 09:58:04 +0100
Message-ID: <CAB2nKc9VVvMDFKJ6oD972qV2grS5m26Mzg0tujFX-+Uqy7nM5g@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@gmail.com>
Subject: Re: [meta-java][PATCH] layer.conf: Mark as compatible with zeus
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
X-List-Received-Date: Tue, 05 Nov 2019 08:58:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Richard, no problem for delay, we all have lot of work (and
hopefully it will continue)

Le mar. 5 nov. 2019 =C3=A0 09:35, Richard Leitner
<richard.leitner@skidata.com> a =C3=A9crit :
>
> Hi,
> sorry for the delay.
>
> The patch was applied to master-next and master-next will be merged to
> master after some tests.
> Then also a zeus branch will be created.
>
> Any testing, feedback and help in maintaining this layer is highly welcom=
e!
>
> regards;Richard.L
>
> On 01/11/2019 11:44, Vincent Prince wrote:
> > Hi Team,
> >
> > Would it be possible to create Zeus branch for meta-java?
> > By the way, master branch didn't move since April, any issue
> > maintaining this layer?
> >
> > Kind regards,
> > Vincent
> >
> > Le ven. 11 oct. 2019 =C3=A0 23:26, Alistair Francis
> > <alistair.francis@wdc.com> a =C3=A9crit :
> >>
> >> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >> ---
> >> Also, can the master-next branch be pushed to master?
> >>
> >>   conf/layer.conf | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/conf/layer.conf b/conf/layer.conf
> >> index 90236be..cdba2cd 100644
> >> --- a/conf/layer.conf
> >> +++ b/conf/layer.conf
> >> @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/=
recipes*/*/*.bbappend"
> >>   BBFILE_COLLECTIONS +=3D "meta-java"
> >>   BBFILE_PATTERN_meta-java :=3D "^${LAYERDIR}/"
> >>   BBFILE_PRIORITY_meta-java =3D "10"
> >> -LAYERSERIES_COMPAT_meta-java =3D "thud warrior"
> >> +LAYERSERIES_COMPAT_meta-java =3D "thud warrior zeus"
> >>
> >>   LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> >>
> >> --
> >> 2.23.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

