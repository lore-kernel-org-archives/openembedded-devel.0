Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id A21C060602
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 08:45:01 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b130so78641412wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Z0DUkohwVLK1JazOIO7YmKqST1Lt2EHjDDw4WJdZ2yI=;
	b=EttTpxhzfE1ClnUU7PfzV+vY8hIcoMhxq70YSf9SSNYNTArOxzBtUeZ1qs7pAboWCj
	Z0XF1KLnUAQbLIOJozZ5NOH0R7UekucXC+Ej4nb1kjguzB1X4gu70NgEG9Jhy0kjx6Ml
	q1b/qTqT1SFe2CyPMFMNyIWihWFUzC51GOXEC0+Gyk0mrGARF/Cv5IPJ01JO8KlH9IiC
	l3aTCaGKHTAXHZa1hdM86OaYQqBVhq+8A0yXlr8zbp4PKEkWIHdjxHHjHmN9OlR/g9dh
	OGR7tJdmsvKVdkdbT4S9qNbOl5Xgz37LpzuCMNhctyzc+e1qBFP1tbGJBZSIS8B+5aCD
	kLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Z0DUkohwVLK1JazOIO7YmKqST1Lt2EHjDDw4WJdZ2yI=;
	b=P9HWZnk45vipUtYNLu7IdacXmb1fI3XvkYF7LmmtbBmNNhi4Y8mIAk9a+6AFvHFoSV
	BRroQP5bu/2o0pasoZQbX7Qv+sDcrshVrT722YK0Ds77OAg0dnw6QK0bTY436KCSuaxg
	P/IxcuOCuOPsxNwDlP30I2RMfFLed1Y/kKmxcaApWOLyq9DeKb2FE6yyjVyVm2GzsHDk
	xh9jqMCdAEbTyJ2s38DDZy5RIkRrcIFXWk6NlKAHf5Zr+pcnEw1cKm9rm0TL/T60tokj
	0Hl9JNQ3eOgef/9QcnBBKvCS1thH3xYcstJzbnuGIIN+PzujCKpNtnuxrf5H+/cRCXeZ
	U5Og==
X-Gm-Message-State: AE9vXwPGaIguCZ0z/3wts9i47gz6QvsQgseo12LVu1yf93pgYG1lg0XZcSDrksO4fKcQiT/0+a4jvFC0dLZqpA==
X-Received: by 10.194.141.163 with SMTP id rp3mr38108890wjb.124.1474447502276; 
	Wed, 21 Sep 2016 01:45:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.130.68 with HTTP; Wed, 21 Sep 2016 01:45:01 -0700 (PDT)
In-Reply-To: <CALbNGRSa9k2ws4viwiv+vL4un+TofNy7UGxn_9bjzGdONcBqmg@mail.gmail.com>
References: <20160921073909.18711-1-jackie.huang@windriver.com>
	<CALbNGRSa9k2ws4viwiv+vL4un+TofNy7UGxn_9bjzGdONcBqmg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Sep 2016 10:45:01 +0200
Message-ID: <CA+chaQfrUotycPHv=9g2aWijqK3GHOpcJwmMteU=0k+W=O0yCQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] samba: remove blacklist
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
X-List-Received-Date: Wed, 21 Sep 2016 08:45:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Yes, and libpam autodetected dependency wasn't fixed by the change
mentioned in the commit message, but in new change provided by Andreas
(also in master-next).
https://patchwork.openembedded.org/patch/131789/

On Wed, Sep 21, 2016 at 10:38 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Wed, Sep 21, 2016 at 9:39 AM,  <jackie.huang@windriver.com> wrote:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > * The libpam dependency issue is fixed by:
> >
> >   12a118989296d13e036d0daa9f9a3d45eee03ded
> >   waf-samba.bbclass: Add PACKAGECONFIG_CONFARGS to CONFIGUREOPTS
> >
> > * I can't never reproduce the issue with new binutils-2.27,
> >   but it should be fixed by:
> >
> >   b60c60806e57f69233db582ef88d113867c2ecd1
> >   samba: fix build by linking with bfd instead of gold
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> > index 7d7fa02..3686faa 100644
> > --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> > +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> > @@ -317,8 +317,3 @@ FILES_${PN}-python-dbg =3D "${libdir}/python${PYTHO=
N_
> BASEVERSION}/site-packages/.d
> >
> >  RDEPENDS_${PN}-pidl_append =3D " perl"
> >  FILES_${PN}-pidl =3D "${bindir}/pidl ${datadir}/perl5/Parse"
> > -
> > -# http://errors.yoctoproject.org/Errors/Details/81004/
> > -# before this issue it was also failing in do_package and
> > -# autodetecting libpam dependency
> > -PNBLACKLIST[samba] ?=3D "BROKEN: fails to build with new binutils-2.27=
"
> > --
> > 2.8.3
> >
> > --
> Same patch from Joe MacDonald is in master-next and I assume it is
> under Martin's world test currently.
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

