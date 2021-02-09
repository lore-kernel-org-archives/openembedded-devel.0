Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.307.1612909905396045621
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 14:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nsLfagEV;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.47, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f47.google.com with SMTP id m13so4950wro.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Feb 2021 14:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GABZi787Wp8y2jP5j911R8ypXUTd8yW4lOUQBM0rSuo=;
        b=nsLfagEVjvElOOjNxBfZ9x0hWi+YF3hzqpfwKgG8aSDVg4/T9U+oRoqSfImxtUsIKm
         8IQTwY4qO8HLk3cuQJYm5F+NWmERP+7cn8XYwxq7WZsGW8QYJlHuFMxvnZv/JEvalPuC
         nhJtPttLD0BV5YexLqhPp/4sy9XYVtlJSRX30TVU4oxZ+XcG3bndP6p1cZxUO+0l32C9
         zTC9HawK+mWLuiJYaASfiaIp/bF+28LA9qGQP8kPax52jIf2dXSZ7ptHKx8I7pbXmWWz
         zSmAgwrTopdK6+79j63o02dE8mkshi16/pGILDW9QvfNAy+45mrubdWEVaru7uA4nyG8
         d1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GABZi787Wp8y2jP5j911R8ypXUTd8yW4lOUQBM0rSuo=;
        b=h/0gtURV9fv3wV+AUA1zRPvBip+uonqwTL1fNiv/OYTCFS19mT3OeUvGxtihe/1HyF
         Dk03VJqXKP4HVko5ShekgcIRNzKfpymeeVzBx8rEDMkyJ+qMTeS5alc5l36cfc7mn+yu
         c4dTfZuzddGUa7XFJe8iBeNV6GHcws8TWBabW5aZ6VynwdqCoRA0z7hcCY2uqjMcgIUv
         BwdZ/Bm687V0Z6zSxLEqslbpkH55Actt2gOpVj+/Zk/KMCu5/EmhqzOmIZ28x3fLhrXQ
         s/xARcsvuTDMTynNIQzE98v6SU2jgMh7yT6VVt6iBvBzqAi969fhrEOawHNvkKKmCI5S
         YTdQ==
X-Gm-Message-State: AOAM531fsm9IJZYuLiHZ7IKB6vF6V4LCPKe1J/zE6cf+huO0EkADB1Yy
	NBDT9v7silnmCksEP0pYGSrUtz5mFid6IP3nggHHxQ==
X-Google-Smtp-Source: ABdhPJy3+rp+dpriLNC0waxWLbZV8faXasxrqie99CRHKokdk44M0FSKRLUuCR8PdQtt2Fq3YftS7BovSw2eoPZNHlk=
X-Received: by 2002:a05:6000:1815:: with SMTP id m21mr271920wrh.350.1612909903610;
 Tue, 09 Feb 2021 14:31:43 -0800 (PST)
MIME-Version: 1.0
References: <17b543581ffb421b812323891405dcfb@XBOX03.axis.com>
 <CA+chaQc0anOg2E=o1ouEca-QJDGqKxDoXm6aPVXzsc8TELW3zA@mail.gmail.com>
 <d9185d19-1f09-a1b6-2926-f54309190b24@gmail.com> <16614BA6A53B3779.25597@lists.openembedded.org>
 <CA+chaQdbZwyBTbyctEh_y8x_p=txiwqy8gjmkwDrh6rqX_ztng@mail.gmail.com>
 <f190d3e175a9413994caf1c73a9f9125@XBOX03.axis.com> <CAGDS+n=fBJad4LPWfpA3A-S3_aHfNKXbZQTpsaw56MtQ3miTRQ@mail.gmail.com>
In-Reply-To: <CAGDS+n=fBJad4LPWfpA3A-S3_aHfNKXbZQTpsaw56MtQ3miTRQ@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 9 Feb 2021 12:31:31 -1000
Message-ID: <CAOSpxdZsU9vPHLPnc6ZCnJXZBURp3FqKLxnUQ9UbXTqPqtU23w@mail.gmail.com>
Subject: Re: [oe] [bitbake-devel] Backport changes for _PYTHON_SYSCONFIGDATA_NAME to Gatesgarth and Dunfell
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, akuster808 <akuster808@gmail.com>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>, 
	"OE Core (openembedded-core@lists.openembedded.org)" <openembedded-core@lists.openembedded.org>, 
	"OE Development (openembedded-devel@lists.openembedded.org)" <openembedded-devel@lists.openembedded.org>, 
	"BitBake Development (bitbake-devel@lists.openembedded.org)" <bitbake-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 9, 2021 at 4:11 AM Steve Sakoman <sakoman@gmail.com> wrote:
>
> On Mon, Feb 8, 2021 at 1:45 PM Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > As agreed upon on the Yocto Project Technical Team Meeting a week ago,=
 I have created branches for both Gatesgarth and Dunfell in openembedded-co=
re-contrib and meta-openembedded-contrib with the required patches. The bra=
nches are called pkj/_PYTHON_SYSCONFIGDATA_NAME-gatesgarth and pkj/_PYTHON_=
SYSCONFIGDATA_NAME-dunfell (ok, horrible names, but they should be easy to =
spot). There is one additional patch for bitbake, but I forgot to ask for a=
ccess to bitbake-contrib, so you will have to cherry-pick it from commit 47=
b64cfa (it is not strictly necessary as it is just clean up made possible a=
fter the changes in OE-Core).
> >
> >
> >
> > @jansa, @akuster: I have included the two extra patches in meta-openem=
bedded that Martin mentioned, which were lacking from my original mail. The=
re were other patches mentioned, which fixed missing spaces related to the =
use of _append. However, as they were not necessary (they changed other var=
iables than DEPENDS for target), I did not include them.
> >
> >
> >
> > I have not done any excessive testing of these branches. I have verifi=
ed that I can run `devtool modify libxml2`, which I could not do before, an=
d I have run `bitbake core-image-minimal`.
>
> Thanks Peter!  I'll start testing with dunfell this morning.

I did an autobuilder run with your meta-openembedded branch, my
stable/dunfell-nut branch with the 6 patches, and my bitbake
stable/1.46-nut branch with the single patch:

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/921

All was fine except for an error in sysdig: do_compile, which doesn't
appear to be related:

https://errors.yoctoproject.org/Errors/Details/570303/

Unless someone has an objection I'll add the oe-core and bitbake
patches to my next set of review patches.

Steve


> > From: Martin Jansa <martin.jansa@gmail.com>
> > Sent: den 7 februari 2021 12:15
> > To: Martin Jansa <Martin.Jansa@gmail.com>
> > Cc: akuster808 <akuster808@gmail.com>; Peter Kjellerstedt <peter.kjell=
erstedt@axis.com>; Steve Sakoman <steve@sakoman.com>; Mittal, Anuj <anuj.mi=
ttal@intel.com>; OE Core (openembedded-core@lists.openembedded.org) <openem=
bedded-core@lists.openembedded.org>; OE Development (openembedded-devel@lis=
ts.openembedded.org) <openembedded-devel@lists.openembedded.org>; BitBake D=
evelopment (bitbake-devel@lists.openembedded.org) <bitbake-devel@lists.open=
embedded.org>
> > Subject: Re: [oe] [bitbake-devel] Backport changes for _PYTHON_SYSCONF=
IGDATA_NAME to Gatesgarth and Dunfell
> >
> >
> >
> > On Sun, Feb 7, 2021 at 12:15 AM Martin Jansa via lists.openembedded.or=
g <Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > On Sat, Jan 16, 2021 at 6:52 PM akuster808 <akuster808@gmail.com> wrot=
e:
> >
> >
> >
> > On 1/16/21 9:44 AM, Martin Jansa wrote:
> > > Aren't the missing spaces in appends fixes also needed for meta-oe
> > > recipes?
> >
> >
> > >
> > > I think at least top 5 commits from:
> > > https://git.openembedded.org/meta-openembedded/log/?qt=3Dgrep&q=3Dsp=
ace.*append
> > > were also follow-up from these changes in oe-core.
> > >
> > Do you mean something beyond the meta-openembedded commits mentioned
> > near the bottom of the email?
> >
> >
> >
> > Yes I mean these 5 commits at least.
> >
> >
> >
> > 50bbf80abf python3-pykwalify: Do not unset _PYTHON_SYSCONFIGDATA_NAME
> >
> > 6b3e3bdaf8 python-grpcio-tools: Add missing space for append
> >
> >
> >
> > The first one is just an additional cleanup, but without the 2nd one a=
nd with the cherry-picks from the first e-mail applied you would get:
> >
> > ERROR: Nothing PROVIDES 'python3python3-grpcio' (but meta-oe/meta-pyth=
on/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb DEPENDS on or oth=
erwise requires it). Close matches:
> >   python-grpcio
> >   python3-grpcio
> >
> >
> >
> > my world build is still running..
> >
> >
> >
> >
> >
> > with c99bb790 DEPENDS variable doesn't end with a space, so the missin=
g leading space in these appends (which was fine until now because of trail=
ing space from DEPENDS set in bbclass) is now causing wrong dependency (sho=
uld be easily reproducible with the patches backported, just by parsing the=
 recipes).
> >
> >
> >
> > I need clarity so I can open an issue in gitlab for tracking purposes =
as
> > I am sure I will forget this
> >
> >
> >
> > we're using gitlab?
> >
> >
> >
> >
> >
>
>=20
>
