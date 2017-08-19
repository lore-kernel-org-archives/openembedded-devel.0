Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD5D783F4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 22:08:33 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id t80so53171634pgb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 15:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=U3qQDs+QwKG49GPe7xPoXlWcYCoaQBVi/jMKtvr0SLI=;
	b=W/2Y3silgEneHneYjf3s3bX05vCHiSzxdUQX4qpD9ihZJZjVUaSCeaMgKsRS1DhgO6
	BkbLnUXN/Qku7sSSTn5oIUOXC9a3RiRPO1hAeGGGr/SlnBYZ90t9DEqy6ykGWgQSZRED
	zG5v7FdfmkszGq2KxbuQ2rWL3KEe3x4ew9ScIUBqx7b/OXwbCWjigkxcM4P6Iu7kZZzI
	DORwgKO0+21pHCEkkPNAhRjicU9FQRUS9P0Jec2mtLO5LV0NFiA9hwAAhDkKkMx8RY3D
	JoeM9iVtcv+UWI4La5Ti73VfY8NuhVg4o+NcnX6vXbEyEPXyT4LGFa+dZrTiaZhieIZQ
	dI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=U3qQDs+QwKG49GPe7xPoXlWcYCoaQBVi/jMKtvr0SLI=;
	b=WdkW8TIPjxpe5sjCdo1uC2gaSU5Tbpx5ofXbTCXCEr+vdhx6D3OgWG5CKiiELwMWmL
	o13Nsbf2jIRug3jX/m6RzmD9tVs9tGRNAwwmpG0t+KZ1+xeGcm6s5wSdROW0AkOsRt/Y
	q0AWSg+gyvYBO9uZUvaoBgyG1oJm6LEz8iZo63xW3//qn491GEwwugKj+ctTNAZVdDjO
	F53LYR6aeKYmgDouXD1MMPXgh3DgODKpKI1ht4C6pTOcDqM6oZWO1lVWWhVLpJC/xnEe
	0rCuHEu4PvC1bovuGbXjwsf96rltn0pCP07tnamUontJU9BWg/s69g23kNww2z1PnWO7
	BRXg==
X-Gm-Message-State: AHYfb5hBO6dcxKmCa0nBgv3rbkavsxXjIS2UxABR20ZfiOOvi9UyYoBJ
	f6EM+JthYMCVy56gmZe8JIpMGFgw3Q==
X-Received: by 10.99.133.65 with SMTP id u62mr11724984pgd.100.1503180515327;
	Sat, 19 Aug 2017 15:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <55765cc3-9a1c-14fb-35ea-005ee7e833b9@laposte.net>
	<d02f9878-0bfe-a2d5-a3a9-0ebb5392ba06@laposte.net>
In-Reply-To: <d02f9878-0bfe-a2d5-a3a9-0ebb5392ba06@laposte.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Aug 2017 22:08:23 +0000
Message-ID: <CAMKF1sqynVC2GoE4cyWrzB1QCJWw7nGP588DvEH7etAUrd+Sog@mail.gmail.com>
To: idealsim <idealsim@laposte.net>, openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: <DKIM> [meta-qt5] populate_sdk error in pyro
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
X-List-Received-Date: Sat, 19 Aug 2017 22:08:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 19, 2017 at 2:06 PM idealsim <idealsim@laposte.net> wrote:

> I have resolve this issue like this thread explain, but i think this is
> not the good way :
>
> https://stackoverflow.com/a/45754078
>
> An idea ?
>

Look at the content of conflicting file and consolidate the changes into
one of the file
Delete the file from other package

>
>
> Le 19/08/2017 =C3=A0 18:10, idealsim a =C3=A9crit :
> > Hi all, i'm trying to build the sdk with "-c populate_sdk" but i have
> > this error at end :
> >
> > /Transaction Summary//
> >
> //=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D//
> >
> > //Install  103 Packages//
> > //
> > //Total size: 108 M//
> > //Installed size: 310 M//
> > //Running transaction check//
> > //Transaction check succeeded.//
> > //Running transaction test//
> > //Error: Transaction check error://
> > //  file
> > /opt/poky/2.3.1/sysroots/x86_64-pokysdk-linux/environment-setup.d
> > conflicts between attempted installs of
> > nativesdk-cmake-3.7.2-r0.x86_64_nativesdk and
> > nativesdk-qtbase-tools-5.8.0+git0+49dc9aa409-r0.x86_64_nativesdk/
> >
> >
> > Complete log here :
> > https://gist.github.com/modjo756/c8a6eeebc1ab0787ee72033f09d99ac2
> >
> > Do you already meet this issue ?
> >
> > regards
> >
> >
> > Micka=C3=ABl
> >
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

