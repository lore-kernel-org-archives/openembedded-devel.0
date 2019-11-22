Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 289C07FCCE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 21:49:52 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id p6so8407918ilp.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 13:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UyH1Ptt/tTjtZiiy4+cVcNxaLwHmcrUutXVEL8HlVv0=;
	b=XaOgJH0H3+nDv/+NuDHpkQezD0BGZpdtFIID34pkr6wm0LuW1OzQu1xQ/891p3w1Qm
	Vg9IaB+D61K1+w1usIrKP9lkjr8dge/DNUJOBt71nX3aB877vhzlWzItpRwjt4Jsox5L
	sj2HTsUzfCbyp0Vi93jUdEVt24vno2zh7Rx45/1Qpb5YUjQhuC68p+22ZP4uzCicLUoX
	dKwNKRsNaYNXzLD/4Y+Zodk5DrIuJlKZzg8lbRV5P0yfQ2YpaP0AjNsnvZHk8yycv6ux
	N9toaPAvlX9o1fCAlf+LCrX7cz/AyEevYogG8eketmiErlVvF8xGqdAxxPtpIn8U7hmV
	C/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UyH1Ptt/tTjtZiiy4+cVcNxaLwHmcrUutXVEL8HlVv0=;
	b=GtsYn5GUZPhG+PtQFtYC8bIb17DVubPIG4Ju5WGPLPxvj6WjoPRKPqEvP7O1t0hCDn
	+0k/Yze5eAkRi4C+z0DUbXTHAHnNKTGSP0q/gv7sLUljinAPlUDqybQj/3gRVwOKN4Gx
	QnicsEj7fCj9ajwr7q2Sas919+UQaD5Sev0J+BGsgQFtNtgfnzj9DdNk0eAXfGsloRnX
	P/5Yu9VwAjXcgnrsqlwE5CjByh8yiW/mkjAZ+ZVVpTYFzrzcTN9z/Y0JXTXFzuX0VQRc
	D8gDysC3+9N4nTrpGi6L9rnmI67xtF7eUR39nUBn+d/CWv7IhU+vEPBmW88A/4Z14Ceb
	vHIQ==
X-Gm-Message-State: APjAAAVWZgFiQLBRi3gQAxalWc/llEZ3kXPjtlroAr3OL9DYOHaVNx8c
	AVMK3S+kLB7KzjAHO8IjonyLdHu0i3Zx0uNb3fw=
X-Google-Smtp-Source: APXvYqzLuF/H7810gTAMWXtX/FHHETGutG/jWwlGDtfmSM/vr3Hbmw8aFyVqhyUIpc6Efy1LoMPpv5RoG2gpqqDnyNo=
X-Received: by 2002:a92:5cce:: with SMTP id d75mr19346103ilg.299.1574459393796;
	Fri, 22 Nov 2019 13:49:53 -0800 (PST)
MIME-Version: 1.0
References: <20191119071730.2682-1-schnitzeltony@gmail.com>
	<20191119071730.2682-4-schnitzeltony@gmail.com>
	<CAMKF1sp-CsNE6A0MPBYCgbD0cXXHU89zQyeCTSjP83UtTh6krA@mail.gmail.com>
	<CALbNGRRAw_57dRRufUzWK6KEu6qTjG4deM_UwvswQFUnJLFesw@mail.gmail.com>
In-Reply-To: <CALbNGRRAw_57dRRufUzWK6KEu6qTjG4deM_UwvswQFUnJLFesw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 22 Nov 2019 22:49:42 +0100
Message-ID: <CALbNGRQPRqVcsApRiESjm53+Sr7DyOvf-ZMagYd=cPBmzTxnXA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 22 Nov 2019 21:49:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2019 at 9:04 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
> > fails to build on x86
> >
> > https://errors.yoctoproject.org/Errors/Details/277884/
> >
This turns tricky so I first try explain the issue and then ask for
suggestions/discussion:

1.
meson.build contains:

| libseccomp =3D dependency('libseccomp', version: '>=3D 2.0', required: fa=
lse)
| ...
| host_system =3D host_machine.system()
| host_cpu =3D host_machine.cpu()

| # You can find a list of architectures that seccomp supports in the secco=
mp
| # project README. See: https://github.com/seccomp/libseccomp/
| unsupported_cpus =3D [
|  'alpha',
|  'ia64',
|  'm68k',
|  'parisc',
|  'parisc64',
|  'sh4',
|  'sparc',
|  'sparc64',
|]
|
| system_supports_seccomp =3D host_system =3D=3D 'linux'
| cpu_supports_seccomp =3D not unsupported_cpus.contains(host_cpu)
| seccomp_required =3D system_supports_seccomp and cpu_supports_seccomp
|
|if not libseccomp.found() and seccomp_required
|  error('Libseccomp is mandatory for sandboxed metadata extraction')
| endif

That means:
* tracker-miners' developers make libseccom a _mandatory_ dependency-
except for those arches not supported by libseccomp
* my test build passed accidentally because host_machine.system()
reports 'linux-gnueabi' and that is not detected as 'linux'

2.
I see the following ways to go:
a. Patch the check away and add a comment in the recipe like: "For
security reasons it is strongly recommended to set add meta-security
in your layers and 'libseccomp' to PACKAGECONFIG".
b. Move libseccomp form meta-security -> meta-oe. That would need some
COMPATIBLE_HOST dance (at leas for riscv) in libseccomp and
tracker-miners
c. Give up nautilus because it crashes without tracke-miners

After looking into e.g [1] I
* don't think that riscv support will ever come to libseccomp
* am afraid that libseccomp can cause strange effects with very
old/new kernel versions
* prefer a.

OK - long talk: What do others think?

Cheers

Andreas

[1] https://github.com/seccomp/libseccomp/blob/master/src/arch-arm-syscalls=
.c

