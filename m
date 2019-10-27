Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id DEAB17FA6E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 15:56:37 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id c25so65972qkk.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 08:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=EJGB6lQw7Icp0HHnwLb+noGEUvcuAAb2dJtFd0/j6wc=;
	b=ZDQ13trzeP4eDNA6ZZR0qqAv2cQyy35SvwZgTqNWGGemPuqzKQ8xKjjiXzTiTM4bsL
	gwDhKnNOkXzG06Ir/BMWFbIyZxkypheQjojq2sprMhlNk59RQEehy+Sa6LumYw8hYZ8B
	nn8VK4NbkXY33/LRwI2k3Q4dgXmq5fvq0MeegXT6bOvue6KulCUJ0Sb3vAgtHPqCB6sG
	mL1ENzN7xntxAC+lttt5SG6Mmms1VeaEJhP0txYKwBpIQYwmNuL0wZYjIlw9Jtn5aT3z
	+pJstNEyQUjh17icorpqz2pocdZZxT5nMA/1d9lJtmelMjByNWLib3fbaumJ9iICokjC
	MJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=EJGB6lQw7Icp0HHnwLb+noGEUvcuAAb2dJtFd0/j6wc=;
	b=UCwmDjBODlKiRT0i1yHkYQKlbsaeHJ0vJknWjPIzZIZma5vIsFcy9JOIzI+geij/ph
	tU/ZOP/puAAgvQT/mp3iUSD9smKXZLYj5M3LLrH9dxqr1XouqGN+1EbZzq4EcRDnJLkc
	/zbvVUCcYKR+ykYG83bpNSEGFIrxIOegvhtramebSirt9/DfD9sQw3784AQzvsFlaA/F
	IRLW0Da4bFLgjRGFyfPuQ4MyvaLVWgJbCS+Z1TkgDOro+GcZz+uqALI8+T6iEoB1fxQp
	VV81n0eP9wp9Yi+H//tTbgk4sJSjdwr2+z+FP1GeiuDLo76g5eG5jkh9f35SYXXY46ML
	ePJQ==
X-Gm-Message-State: APjAAAV7U30B6zVv1DlQLPY8Vx5VRUWfcohyAGR3l4M8uSxo18tG+aCE
	VJynH0MKuLemIRqEVyhfrfdyxz7aL4ZhANO4yzk=
X-Google-Smtp-Source: APXvYqxVJEoa1m1auYmIS63i9TmcZpV44cNZrzwUV6POhQi7vkzwoxf6cVXgRdjyX4EhVQE0YMASlDzNHXyz6CKYHog=
X-Received: by 2002:a05:620a:134b:: with SMTP id
	c11mr11704099qkl.71.1572191798490; 
	Sun, 27 Oct 2019 08:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
	<CALbNGRShkF=Qn1nSD5MaavPUN0hr9VAYaZ9GfhUUh_ej7e7rsQ@mail.gmail.com>
In-Reply-To: <CALbNGRShkF=Qn1nSD5MaavPUN0hr9VAYaZ9GfhUUh_ej7e7rsQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Oct 2019 16:56:12 +0100
Message-ID: <CAMKF1spmQFC5YRBfXQ3eoHeLvH_NaMpODFQqNbVQkOEsTJWcFA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/15] Upgrades & GNOME preparations
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
X-List-Received-Date: Sun, 27 Oct 2019 15:56:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 27, 2019 at 4:33 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Fri, Oct 25, 2019 at 9:21 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > Upgrades & tiny preparations for GNOME crusade
> >
> > Andreas M=C3=BCller (15):
> >   gtkmm3: upgrade 3.24.1 -> 3.24.2
> >   geany: upgrade 1.34.1 -> 1.36
> >   geany-plugins: upgrade 1.34 -> 1.36
> >   libstemmer: initial add 2.0.0
> >   appstream-glib: initial add 0.7.16
> >   yelp-xsl: initial add 3.34.0
> >   yelp-tools: initial add 3.32.2
> >   yelp: initial add 3.34.0
> >   zenity: pretify recipe a bit
> >   glibmm: upgrade 2.60.0 -> 2.62.0
> >   libsigc++-3: initial add 3.0.0
> >   ibus: initial add 1.5.21
> >   libgusb: initial add 0.3.0+
> >   colord: initial add 1.4.4
> >   colord-gtk: initial add 0.2.0
> >
> Hi Khem,
>
> Just saw you added some of this series to master. Since the
> zenity/itstool issue [1] requires rework on many recipes please
> ignore/remove ALL the pending from this series in master-next - I'll
> come back with a reworked series addressing all issues.
>
> Thanks for your support and patience
>

no worries I have removed ibus, colord colord-gtk and zenity which I
am expecting new revs
others all look fine so they are merged.

> [1] https://errors.yoctoproject.org/Errors/Details/274743/
>
> Andreas

