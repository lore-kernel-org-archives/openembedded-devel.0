Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id C177F7F69B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 23:47:54 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id w127so6293691qkb.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 15:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wuE+n19jCcxOtzU7Mfbr5V0dN9BfDHxxT2FFed2hPpQ=;
	b=u3gBwDzWTa7IQulyBeCCAy0PSGgYe/DkAgNnrFBeiDBZZ90VF/Mjidz2k8XDC6Xqg6
	m7POPz5bipl6PMAZTKd/KfAp+Jn1u5zfkthIYiPx5UlMDTAHIWe+q98r+ieVJ3LlbrN8
	8ssuWnAzqgA2ycRh/FukrZp1LG3Y/RSN1Pa0rEL2HKAQ8bPSA0RPG4bmw7V7emIFcW75
	rva4K9Zu/ASmY+s+T4k0JoizJ5xYhPJJrYG1gH+0a4tUPEXP7IFF+/CjWuZX/3aXoAu9
	U4L/MRnLMNIN5FoDoeMPIjHAidIkdDCm/zjjHUgPLu5zX6m4VZg6kCnuAua3VnayePQs
	c1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wuE+n19jCcxOtzU7Mfbr5V0dN9BfDHxxT2FFed2hPpQ=;
	b=M7V4J6PcJyd12k3ztBO5y+qzwMMDsU7jnAOLMpQaRfljqZQ2QP2q6KeqkOoPCXTQyL
	ZxdwTD/LssJLlNQVmyUfBS+R3kV9dCa7fZfnd4xH3k4grHxq4phxQQlWmLHhn8B5ckO7
	893ABhroXhYIna+lXSzFWD3aDoq0Hy0mwxWOP/RRfN7FaXlHEnyK4r+QQLKDYVmAPZnj
	yagps7/6sxdvXRtoySbblQe4BQCFDxTH3N/3IYZArAzHrUDpUgbl7tP2qMdZUpV05cfi
	nM4kEHbA5dHtULhyouYFasc08ig/oTZluOI25ulcDHjWh3VyoXm537L46M+Q7l7MUZaJ
	f+Nw==
X-Gm-Message-State: APjAAAVVqudN1mO+Xlrm2DHBot79g7deGEzCDMfwGpDIB7+VfkxmWKFO
	xxkgSBPEk+bBN/Jt0goxW2hkua206JwGXTgfDx0=
X-Google-Smtp-Source: APXvYqwbbCjXNGrMJxjGyjYGAnsTe/C8JLzcCjBU7Om4RNXbuLcm8G19kfKmSe0lha1WFh5UQ31udlOBy8vkzogNI8c=
X-Received: by 2002:a37:de05:: with SMTP id h5mr356497qkj.474.1576021675368;
	Tue, 10 Dec 2019 15:47:55 -0800 (PST)
MIME-Version: 1.0
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
	<20191209083612.23922-6-schnitzeltony@gmail.com>
	<CAMKF1spG5KPsiw7PkDG0JwPVGwJudMFduieEcmf73trCUMSG-g@mail.gmail.com>
	<CALbNGRRdspaYTVH_0Zmbrs-fUJBtJOjpVSiy24kBN_bHmR1yXA@mail.gmail.com>
In-Reply-To: <CALbNGRRdspaYTVH_0Zmbrs-fUJBtJOjpVSiy24kBN_bHmR1yXA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Dec 2019 15:47:29 -0800
Message-ID: <CAMKF1spq0EWDJg8gL14SQoGZRu7e_PTV9YcEiqQ_jEQ4BnqK_Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][v3 05/20] accountsservice: initial add 0.6.55
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
X-List-Received-Date: Tue, 10 Dec 2019 23:47:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 1:53 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Tue, Dec 10, 2019 at 8:57 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Mon, Dec 9, 2019 at 12:37 AM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
> > >
> > > It is a dependency for upcoming gnome-control-center
> > >
> >
> > This seems to have hard dependency on systemd ? or can it be
> > configured without systemd as well see
> >
> > https://errors.yoctoproject.org/Errors/Details/296904/
> >
> > in case it can not, then we need to exclude it from parsing when
> > systemd is not in DISTRO_FEATURES
> For systemd not in PACKAGECONFIG it needs
> -Dsystemd_system_unit_dir=3D'no' to avoid this error.
>
> Test would take some hours so my question: oe-core's master has
> already removed python2 from hosttools and to be honest I expect huge
> fallout all over. So my question: How much time do I still have for
> tests?

The python2 removal code is in my tree for few weeks, so your patches
should be testing against that already.

I have already built an image with gnome3 packagegrroups for
qemuarm64 it went fine. So its looking to be making good progress
thus far.

>
> Andreas

