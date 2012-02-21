Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1RzyYo-0003jx-0i
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 23:51:50 +0100
Received: by iaby12 with SMTP id y12so10296717iab.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 14:43:29 -0800 (PST)
Received-SPF: pass (google.com: domain of giuseppe.condorelli@gmail.com
	designates 10.50.207.72 as permitted sender)
	client-ip=10.50.207.72; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	giuseppe.condorelli@gmail.com designates 10.50.207.72 as
	permitted sender) smtp.mail=giuseppe.condorelli@gmail.com;
	dkim=pass header.i=giuseppe.condorelli@gmail.com
Received: from mr.google.com ([10.50.207.72])
	by 10.50.207.72 with SMTP id lu8mr23091962igc.0.1329864209655 (num_hops
	= 1); Tue, 21 Feb 2012 14:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ktZf7W8Qhxhu4EJZHxU32n5ey9akjtLommq6WOSz8Dg=;
	b=tPmsnyz/lPIrIGu09jmIzn9SAupjn449uqDxAw8mubZrb0VLc0Xgq4WXiJdfE8CLor
	yI/Kb1PTGT5rBt/zstyR0Kp6dHkig+7gDcbA+6xHbDe80N6mBw7yiJ1rcRL5o2zxaHLV
	5t0q91CPN590Tc3Ur+SYWbD8atBw5wK+Mp7u8=
MIME-Version: 1.0
Received: by 10.50.207.72 with SMTP id lu8mr18654111igc.0.1329864209573; Tue,
	21 Feb 2012 14:43:29 -0800 (PST)
Received: by 10.231.183.67 with HTTP; Tue, 21 Feb 2012 14:43:29 -0800 (PST)
In-Reply-To: <CABcZANmqnYRC4Gx+HPwJ8k7Dd7-apMFAuuwRT7aH1dy-Fa2kBg@mail.gmail.com>
References: <CAOHjBZvHtGh1v0LSUkDA=o9F0cHxD1TZ8CtrOQdzeXy8yZk-Dg@mail.gmail.com>
	<CABcZAN=c1Hi9B5WL96XaDQScypRO4ETF9GtKKdPdZ=Gxqmfq5A@mail.gmail.com>
	<CAOHjBZtEx8atBFuAji1ba7Lurda4fqG-HTiSOmn8W_w1Yp76jA@mail.gmail.com>
	<CABcZANmqnYRC4Gx+HPwJ8k7Dd7-apMFAuuwRT7aH1dy-Fa2kBg@mail.gmail.com>
Date: Tue, 21 Feb 2012 23:43:29 +0100
Message-ID: <CAOHjBZt8iEt=z8kqiTdcBJF3b35Wm0KRopzSTi+JGkK_fa3H5w@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: CONFIG_SITE usage
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2012 22:51:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I'll try and I 'll let you know. Many thanks Chris. :)

Il giorno marted=EC 21 febbraio 2012, Chris Larson ha scritto:

> On Tue, Feb 21, 2012 at 2:15 PM, Giuseppe Condorelli
> <giuseppe.condorelli@gmail.com <javascript:;>> wrote:
> > Il giorno marted=EC 21 febbraio 2012, Chris Larson ha scritto:
> >
> >> On Tue, Feb 21, 2012 at 3:48 AM, Giuseppe Condorelli
> >> <giuseppe.condorelli@gmail.com <javascript:;> <javascript:;>> wrote:
> >> > I'm in trouble trying to set CONFIG_SITE to allow my build process t=
o
> >> load
> >> > cache from a given file. I've understood CONFIG_SITE can be set from
> .bb
> >> > file, but I'm wondering if it could be set on local.conf or
> >> distro/machine
> >> > conf file to be inherited by all packages.
> >>
> >> CONFIG_SITE is automatically set for all autotools recipes. Read
> >> siteinfo.bbclass and autotools.bbclass.
> >
> >
> > Yes I know this but I'm wondering how I can overwrite the CONFIG_SITE
> > default setting (made by autotools) for all packages in one single shot=
.
> I
> > mean, I think that exporting CONFIG_SITE =3D "my *.site files" on one o=
f
> the
> > .conf files I can say to the system to read those instead of the ones s=
et
> > as default by autotools.
>
> CONFIG_SITE is set by a class, which means it overrides the config
> metadata (e.g. local.conf). You could either set it in the recipes, or
> set it in the config metadata using an appropriate override (see
> OVERRIDES).
> --
> Christopher Larson
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

