Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id AD638606BF;
	Tue, 19 Apr 2016 01:13:33 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id f74so755651qge.2;
	Mon, 18 Apr 2016 18:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BjxfplMYMX1Wpt+PI6p/tHqR8ULt6IDaGpx5OavR+W4=;
	b=YldSRw6FVgQQ3/JbzZu13cHDcG7FZ39RvttMkKtP90swIBGytb9sHSgxW4bi0JfYKk
	MEsUEfIGjwaJXm1+kVzzqUiQ4QqB7ojm+JVgrkRJlCKf6KFynSWGe9BCD5+ZiREJl9Ny
	b/m+geKzdg5Cd2es9Z/Z9nXknX+ciVGUkl2dnmjJVaRGXqKyrDjJJnKuCRSk8Z+Nt3Yv
	g9+2o/WTQWHwngztD2cCu/R1EgQrxpIxD9KNKAmmNfiNnQq/fhp8VyOEk2q4y9pXgHBo
	sZx2R0pCzaokPeX9DwtErz+Qvi4+zbeNifc0TcOH/71RO3LJqDYudd8CNWGST5G9mVEY
	HJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BjxfplMYMX1Wpt+PI6p/tHqR8ULt6IDaGpx5OavR+W4=;
	b=KQHAAUWF+4s/d3pgEBqVjLYLa9QwxAagid5GmHiUO+l2+kqwZC7E4pAzSqLO7hLCxS
	KBL56EPSxozr1rlUy5mCsT6/4HnA/BSAbYuNPGIVdIax9PtASg/M2rdX0dPns7v4n3wC
	XXkEQGj8mX7DnaKG6UZGEVC+d9MhOOQg6epI13QLJ8bkTUmAyTiXOEikru3nzI2SaDjZ
	g3eBjsYFZezjKzVJFUVYm+EDboCxt/AquodlBUmE8nRSDPA0QVUwMuNYZ8YweJ7ePm1B
	Kfcm+UIWxpkdJvK7asjeK40wZJZ+Mp6Fb0S4JKTzu6ra7xCjzYWoAKkq1bmeyxu75ZQc
	zkAw==
X-Gm-Message-State: AOPr4FX1J1jsNW3Lgr+tJG0nO6qvWBa4aiFAd8XUxdL90tECLdW5xhfufqfsT5doWD55F3mfBDRdr8Kd0ws3TA==
X-Received: by 10.140.41.203 with SMTP id z69mr185870qgz.57.1461028414418;
	Mon, 18 Apr 2016 18:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
	<CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
In-Reply-To: <CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Apr 2016 01:13:24 +0000
Message-ID: <CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFT] GCC 6 Recipes
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
X-List-Received-Date: Tue, 19 Apr 2016 01:13:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 12:48 PM Dan McGregor <danismostlikely@gmail.com>
wrote:

> On 17 April 2016 at 23:15, Khem Raj <raj.khem@gmail.com> wrote:
> > Hello all,
> >
> > I have put together a potential gcc6 upgrade recipe set, and pushed the
> branch to tree here
> >
> >
> > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc=
-6
> >
> > and also at github fork of mine.
> >
> > https://github.com/kraj/openembedded-core/tree/kraj/master
> >
> > You need to set
> >
> > GCCVERSION =3D =E2=80=9C6.%=E2=80=9D
> >
> > in local.conf to enable it.
> >
> >
> > There are few recipes in OE-Core which still don=E2=80=99t compile e.g.
> >
> > see
> >
> > http://errors.yoctoproject.org/Errors/Build/14782/
> >
> > any help in fixing them or otherwise fixing other layers is appreciated=
.
> >
> > gcc6 is a major release for some info see
> >
> > https://gcc.gnu.org/gcc-6/changes.html
> >
> > and porting guide
> >
> > https://gcc.gnu.org/gcc-6/porting_to.html
> >
> >
>
> I haven't built an image with gcc6 as the compiler yet, but I did
> check out your branch to try building with gcc 6 as the host compiler
> (Fedora 24). I needed a few more fixes, available at
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Ddankm/gcc-=
6.
> I fixed lzop, pkgconfig, and disabled werror on binutils.
> core-image-minimal appears to be well on its way to building.
>
>
I had fixed lzop locally meanwhile. I cherry-picked the pkgconfig and
binutils fixes into my branch


>
> > Thanks
> >
> > -Khem
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

