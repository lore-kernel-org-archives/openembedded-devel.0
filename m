Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2D6317CC09
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 20:37:47 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id a132so24656607qkb.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 13:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=X13KYsOijYCa/AeY0Xb3dftjbHrhp2e2kRDyv1F/8U0=;
	b=M58g+x9sampuIkUnuyvZcc9HtGJpdnFK52wA+c5jU5u+53Dvs1R/lkWQUVUD8IGsTk
	1OJerDxZxqGyu71LQm+ySmFPwWFSh3+M9oPI5jAxEKsjUUIkP3OLtkTQA5i44NN2gmsX
	0Dq/dwKhcg+LYoHxUwAo8EpYVJ4MhkDqWY0LSu6PIT8pGyjTs8JoXLgplq3yUg87PHMi
	G5AfstBzr+d8aRFySSi95Q4e9eUv0qc12VpO24yAaR7bFTBWQmf+ydTF7I2wT7j/fIAO
	3/qLt3hZiJq4ZwhQUB7H9T/0R2qNd8Geov2+h1sT6O8j6z6XUFxrXIYdV0xTmxaZ2u43
	ubNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=X13KYsOijYCa/AeY0Xb3dftjbHrhp2e2kRDyv1F/8U0=;
	b=DJUynj3CdV9ffg9Djq7KCnPyPdghar3MUcuZHmweAcw5PKVsCPWosW2MZLNHf040ti
	FME3s/BOgfnf/C66yPv6AW6DwbpgzDbW7/SmbVRqjjqIv8/1OGvl5xFqw+mykKpWATL3
	5VbdrI5Y1oWVrqe//Xo0N8esSJWdNdh0uJrl5JsZP/K7rRPWkfVD4RROtyRVdMkB7BTv
	vz/DJRjfXG14UZN9uJdNvqgZvDgwX1bF6k9tnzOrOkeJCoklGUtUnyL3kCZK9YOXz+ze
	i5MBtHi9y89dE+oaKO6P9Im4/I0E/y3jR11wmYPTXeSQYpt2ew3CO+/48bGfnevi1mPj
	V9mA==
X-Gm-Message-State: APjAAAULBAxddF3XbQTwKGDakvL6yY6wyeH0tvjx8YW4L1TivKUD74s6
	A/4nyqOgW8lnDN/I5q0AmFudPpRDBfmhtX7b1Ll+XnnjJss=
X-Google-Smtp-Source: APXvYqx6KxKlMbMr8auNr8rQFTKp5CpSf9yUOrsH8hG2jjZLNM7SmS08t0SKMOuw/86sEUIplpemaHh51McyRDEQsDg=
X-Received: by 2002:a37:8102:: with SMTP id c2mr21097387qkd.208.1559075868645; 
	Tue, 28 May 2019 13:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190522131345.10392-1-andrei@gherzan.ro>
	<CAMKF1srfV74+4jODJtnOtgKwSBtBgznGENOZFOvkp+vZ7BdAoQ@mail.gmail.com>
	<119819b9-eee8-442e-f4bd-b4005b0a1a6d@gherzan.ro>
	<CAMKF1srx8acL-pQu6HWt3KutcvTNu=X-Fweos2XZ6vO-mLyK7Q@mail.gmail.com>
	<20190528180655.GA14708@localhost>
In-Reply-To: <20190528180655.GA14708@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 May 2019 13:37:21 -0700
Message-ID: <CAMKF1sqAzXc+iMFqqWU_-p_3e5aifuQtZWMPwxcBghwrPm9vmA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Andrei Gherzan <andrei@gherzan.ro>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkmanager: Update to 1.18.0
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
X-List-Received-Date: Tue, 28 May 2019 20:37:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2019 at 11:06 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, May 28, 2019 at 09:14:17AM -0700, Khem Raj wrote:
> > On Tue, May 28, 2019 at 8:37 AM Andrei Gherzan <andrei@gherzan.ro> wrot=
e:
> >
> > > On 28/05/2019 16.13, Khem Raj wrote:
> > > > Hi Andrei
> > > >
> > > > The musl patches need to be forward ported as well. They dont apply
> > > > cleanly anymore on top of this update.
> > >
> > > Seems like. So all the contributions now need to go through local mus=
l
> > > and glibc testing? This sounds a little bit of an overhead and might
> > > discourage people in contributing because usually everyone is working=
 on
> > > one libc variant. Just raising it as a concern. As per this specific
> > > case, I'm going to fix it and push a V2.
> >
> >
> > I understand that and in some cases it=E2=80=99s even narrower where on=
e might just
> > be working on one distribution alone for single architecture for that c=
ase
> > failure on architectures they don=E2=80=99t care is
> > also a nuisance
> >
> > It=E2=80=99s wide and far testing we can achieve is good for end user s=
ame goes for
> > multiple architectures if someone tests a given architecture and report=
s
> > build  failures then it=E2=80=99s good to acknowledge that imo
> >
> > It=E2=80=99s not a blocker I expect someone interested in a given regre=
ssion of
> > this kind to chime and help if possible so don=E2=80=99t see it as an i=
mpediment
>
> Is anyone actually using networkmanager with musl?
>

Yes.

> There are no obvious usecases where it makes sense, and OE seems to be
> adding security vulnerabilities in the musl build that are not in the
> glibc build (e.g. -Dsecure_getenv=3Dgetenv) so users should better not
> use it in any case.
>

That could be improved. Probably adding this function to musl is not a bad =
idea

something like

char *secure_getenv(const char *name)
{
 return issetugid() ? NULL : getenv(name);
}

will do the job. Once I am back I might propose this to musl if someone doe=
s
that before would be fine too.

> > If we remain cognizant of the fact that upstream might have wider useca=
ses
> > we will generally be better off cumulatively
>
> Upstream ships a copy of systemd code for use as library.
>
> This already implies that trying to support it for musl will be a
> long-term pain of not upstreamable patches for OE contributors.
>

so far it has not been so much a pain but its good to monitor.

> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

