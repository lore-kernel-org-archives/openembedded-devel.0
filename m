Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.6092.1599049787995825112
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 05:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A1QNiqrB;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id d26so6418389ejr.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 05:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YLqKvgylPOc7VgNoHEw92LvPar3P9WiKqQv8rkARB9A=;
        b=A1QNiqrB98c9ngrofHKroYhSq6zjoVS6LvBLysM5gp875hycst2HTYg/A8RORRQKbv
         9zP8KVI4GOKQWSnAkns/W/91F9xhbrHyIxZu6T3mx3XhaU3YIb7fDjLD0aG5pP3baRnZ
         I8yMIKyaeU7uZ+x/O8sNahm/wrf7l7mPxRFiX2i8NSImauHwkGL8TyrfQfTzL8eDVCBO
         Uw2+6YN/vjPwat/YVjQFVzvBVgVsEogAkAJ9I6c6WHAku/qqDx7T3oO/SjeeeA+Vuyd0
         gzV+KJu/ciKz9mGRGjkqDNOmuUJs1sRhEszlS5cTTlV/WinIF4mNFtztFm2anmrfiVsV
         qGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YLqKvgylPOc7VgNoHEw92LvPar3P9WiKqQv8rkARB9A=;
        b=Eh/UeRiYZ0c53h1FlqOnYfTSEPyaA0vYVRTW9+FTzQ8VEP4i0uQBXH0FsS93CFg1dd
         MUlNIg/ZL/7KERiM0rvfMyRLumb7FX6sg3RzRVs/9GZP7FSNTc8l3ZR4mWYVnGBhaacA
         C17Rdyj96mQsKMg+1WiIyBH1Q7jU6q6vNRukeyDTq4haGtHAPTYgaiWQxG0ZElCqrYNI
         deNIKfTA1nJi3c09TfCDKFGp9JkZE6Bvf247avDNjDb1yx38Pk4w1yXiebzsOz1GX2eI
         kqw/CICvS3ASezLpUN8ASkIM+qfbashzNJbZvgeQg00Ss5ND8h8ECdftRKfMmJWZH7JE
         Dwag==
X-Gm-Message-State: AOAM531Bdo8sQB4eXEcdt0HuDZydaaaWHMXxxp3rTizgG4nZmBpYR/2M
	fRc/OCE5TDKR14KFB55sZVY=
X-Google-Smtp-Source: ABdhPJyQpd0uEgsF7nf7LskGmj3QLRZoXAcDXo4mGRHSRo9KwpCD7MDO8LAW23Dq5F8W9GSH3nr7MA==
X-Received: by 2002:a17:906:560a:: with SMTP id f10mr5920390ejq.35.1599049786472;
        Wed, 02 Sep 2020 05:29:46 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s30sm3929653edc.8.2020.09.02.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 05:29:45 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Sep 2020 14:29:44 +0200
To: Diego Rondini <diego.rondini@kynetics.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] libeigen: update SRC_URI to download from gitlab
Message-ID: <20200902122944.ajmfg6b4jqlbavb4@jama>
References: <20200825154524.188696-1-diego.rondini@kynetics.com>
 <CA+chaQdtuKCqc31WB1s=-K29kv-4G2fh9g87PpBzBywxE6djRQ@mail.gmail.com>
 <CAMfw5YowytuBeL3hr_82NEwrCTJjSqvJO8N-8dFVvYCH6cDHiw@mail.gmail.com>
 <CA+chaQf0ZC1pts6MtZzsu+bfxzppnzjaBY=ENq3sQbazpgosVw@mail.gmail.com>
 <CAMKF1sqQGujU46Xk1Pn47uapZDMW9kigK_9CUqwaENCNkKZYGw@mail.gmail.com>
 <CAMfw5YoY0Yty2sWQjNa-zZpTh0-UfC5gDrSSyLJ3zaYxV6q0pw@mail.gmail.com>
 <CAMfw5Yo0iRaV8-cas1MPwRmCD6SWR66k-8yph5mVgnQM9GieDw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMfw5Yo0iRaV8-cas1MPwRmCD6SWR66k-8yph5mVgnQM9GieDw@mail.gmail.com>
X-Groupsio-MsgNum: 86803
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fg7t6gfzdebjgurx"
Content-Disposition: inline

--fg7t6gfzdebjgurx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 02:25:10PM +0200, Diego Rondini wrote:
> Hi,
>=20
> On Wed, Aug 26, 2020 at 9:16 AM Diego Rondini
> <diego.rondini@kynetics.com> wrote:
> >
> > Hi Khem,
> >
> > On Tue, Aug 25, 2020 at 8:40 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Tue, Aug 25, 2020 at 10:59 AM Martin Jansa <Martin.Jansa@gmail.com=
> wrote:
> > > >
> > > > OK, I've overlooked that it's from gitlab, but are you sure that gi=
tlab archives aren't re-generated from time to time like the github archive=
s are?
> > > >
> > > > Or are you sure that https://gitlab.com/libeigen/eigen/-/releases a=
re developer uploaded archives? It looks like gitlab creates them automatic=
ally:
> > > > https://docs.gitlab.com/ee/user/project/releases/
> > > > like github does with tag archives.
> > > >
> > >
> > > while it fixes the issue it is trying to fix, it would be better to
> > > fix the non-deterministic archive issue as well while here, I dont
> > > know if gitlab's archiving is reproducible perhaps a question for
> > > gitlab, but it would be ok to switch to using git fetcher to avoid
> > > that suspicion. What do you think?
> >
> > I've posted the question, so we get an answer for all the other gitlab
> > projects that are out there:
> > https://forum.gitlab.com/t/gitlab-release-tarball-stability/41888
> >
> > Let's see what the answer is.
>=20
> So we have an initial answer:
> https://forum.gitlab.com/t/gitlab-release-tarball-stability/41888/3?u=3Dd=
iegorondini
>=20
> The summary is: tarballs can be regenerated, but they are regenerated
> identical by git archive according to the manual.
> The use of git archive in the source code is not guaranteed in the
> future as at the moment there is no immutability test in the gitaly
> service.
>=20
> Martin, Khem, what do you suggest to do?

I would you git fetcher to be safe, like we already do for github
archives.

Extending the QA check to cover gitlab would be for bonus points :).

Thanks
>=20
> Regards,
> Diego Rondini
> Sr. Embedded Engineer
>=20
> Kynetics
> www.kynetics.com

--fg7t6gfzdebjgurx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCX0+QOAAKCRA3VSO3ZXaA
HKSqAJ92HFeLbWhUx7GM9+S5STdMKUdPjACfTZi+5XL0tQgXaCgF1vr8qwle9t4=
=amoM
-----END PGP SIGNATURE-----

--fg7t6gfzdebjgurx--
