Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id E4D097FA40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 21:54:41 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id y18so3537135qve.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 13:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=stWiP/9D7Nq303PGIxa29uzaiRU6OLB2SnSI9EXAFnM=;
	b=XN4jenhoW8BicbRBoOxAtpyibVDyyUEUYiDHQIQhdaWCSKqyN5oV79YJRaSOmBeeEQ
	sBETLePdtm9QkZcSFujH8eKjMvKFDXH6wTW87bxx94uttsyOK0sHOnq1CoET1vTYbe18
	gRyF3jL7COC0bfauRk/aWhcwwbEekHrgKysqI04qKbUPCM7wJAUr3wjDJTpRtys0IXNs
	jCAYlQ1XSoH63kh09hZH/zRmtr7eyB/nIbZWE8s9s+YNo7l6d5IL9mEmKuXtE/ZQiLDb
	HVgaZj/3UkcVHHjKzg/GG6EQRVg9DpqqR2UfVaTtHdTmHnOpqgZ5OqwBzXXQ8amBFPel
	Dd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=stWiP/9D7Nq303PGIxa29uzaiRU6OLB2SnSI9EXAFnM=;
	b=qbki+ZPsWxP66OcCKAaV1cMZxEES31J6x1e0YluQ13DfSSWTD+hdFzwxjWfABsvo/z
	E9fB8eVmdZZYDzoXz+4CCG/Oz14CtAdff3jIUZHR0c+mYDig2pUCo5aLrooLrfgf+VFp
	VtruyTVO+5vADojPKVy7hCyxfCN5wjrWMPJFEkqlXcog5EE0UQxyV9/8L4HNpICpbk3S
	0DroK8BrxDjJU4bXuiwnDps4jOubBYjCarAoi87uDhHcibtnKdTQwOWuvl2dEG2xSXL6
	tea1QPR7MZJWT7TeKfQdFEi2uUfMaVaXLYOgqH1XdXwo1FKqAcBF1vGpfm1Lo42OGHPr
	fZXQ==
X-Gm-Message-State: APjAAAU4WEkeMJkEMvqwjuVyBB7jdGjvfAG87Pp9xCM4G71oZ2zh0Anj
	PWC+w6pJHJuP1bsfDgnSzU5LPCvBf9G0470dcAI=
X-Google-Smtp-Source: APXvYqztTh7hpQac3Icn8SVOzDPZD7YJqhLFduxmT3lSb6W5/ZA6fQshJtF8Gk+GhWA9Q+YT4E/WlowR6TvGPwh4414=
X-Received: by 2002:a05:6214:901:: with SMTP id
	dj1mr4135207qvb.99.1574459682280; 
	Fri, 22 Nov 2019 13:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20191119071730.2682-1-schnitzeltony@gmail.com>
	<20191119071730.2682-4-schnitzeltony@gmail.com>
	<CAMKF1sp-CsNE6A0MPBYCgbD0cXXHU89zQyeCTSjP83UtTh6krA@mail.gmail.com>
	<CALbNGRRAw_57dRRufUzWK6KEu6qTjG4deM_UwvswQFUnJLFesw@mail.gmail.com>
	<CALbNGRQPRqVcsApRiESjm53+Sr7DyOvf-ZMagYd=cPBmzTxnXA@mail.gmail.com>
In-Reply-To: <CALbNGRQPRqVcsApRiESjm53+Sr7DyOvf-ZMagYd=cPBmzTxnXA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Nov 2019 13:54:15 -0800
Message-ID: <CAMKF1sr9f9aC98XVW-R_CS24CELLfUWi96RTWr+cX9zLqQDdqg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/9] tracker-miners: initial add 2.3.1
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
X-List-Received-Date: Fri, 22 Nov 2019 21:54:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2019 at 1:49 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Wed, Nov 20, 2019 at 9:04 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> > > fails to build on x86
> > >
> > > https://errors.yoctoproject.org/Errors/Details/277884/
> > >
> This turns tricky so I first try explain the issue and then ask for
> suggestions/discussion:
>
> 1.
> meson.build contains:
>
> | libseccomp =3D dependency('libseccomp', version: '>=3D 2.0', required: =
false)
> | ...
> | host_system =3D host_machine.system()
> | host_cpu =3D host_machine.cpu()
>
> | # You can find a list of architectures that seccomp supports in the sec=
comp
> | # project README. See: https://github.com/seccomp/libseccomp/
> | unsupported_cpus =3D [
> |  'alpha',
> |  'ia64',
> |  'm68k',
> |  'parisc',
> |  'parisc64',
> |  'sh4',
> |  'sparc',
> |  'sparc64',
> |]
> |
> | system_supports_seccomp =3D host_system =3D=3D 'linux'
> | cpu_supports_seccomp =3D not unsupported_cpus.contains(host_cpu)
> | seccomp_required =3D system_supports_seccomp and cpu_supports_seccomp
> |
> |if not libseccomp.found() and seccomp_required
> |  error('Libseccomp is mandatory for sandboxed metadata extraction')
> | endif
>
> That means:
> * tracker-miners' developers make libseccom a _mandatory_ dependency-
> except for those arches not supported by libseccomp
> * my test build passed accidentally because host_machine.system()
> reports 'linux-gnueabi' and that is not detected as 'linux'
>
> 2.
> I see the following ways to go:
> a. Patch the check away and add a comment in the recipe like: "For
> security reasons it is strongly recommended to set add meta-security
> in your layers and 'libseccomp' to PACKAGECONFIG".
> b. Move libseccomp form meta-security -> meta-oe. That would need some
> COMPATIBLE_HOST dance (at leas for riscv) in libseccomp and
> tracker-miners
> c. Give up nautilus because it crashes without tracke-miners
>
> After looking into e.g [1] I
> * don't think that riscv support will ever come to libseccomp
> * am afraid that libseccomp can cause strange effects with very
> old/new kernel versions
> * prefer a.
>
> OK - long talk: What do others think?
>

there has been attempts to bring libseccomp to meta-oe [1] since it
was used in wide
variety of packages. I am willing to maintain it in OE if someone can
make the needed changes
and address review comments from last attempt.

secondly, if the support is optional, then we can make it so via
packageconfig and keep it disabled
but seems thats not the case, in such a case, I think your proposal 'a' is =
ok

[1] https://patchwork.openembedded.org/patch/163384/
> Cheers
>
> Andreas
>
> [1] https://github.com/seccomp/libseccomp/blob/master/src/arch-arm-syscal=
ls.c

