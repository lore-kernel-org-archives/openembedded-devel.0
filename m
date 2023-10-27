Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA1AC25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 16:53:37 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.12049.1698425607511345126
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Oct 2023 09:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RJY9E5iB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-32f760cbff3so297874f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 09:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698425606; x=1699030406; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8NMvN8NtPLltfrgxD/O1WglqvW9prg8HChw72gaXkwM=;
        b=RJY9E5iBgD2tyWG116qmLJo1f3NNgT4I5JMf1ncsA+9mzJ1Qd4hJTyx3RvjGZHLMr7
         lNBur4z5N/IzCmjlnEf4UwE37T2txeK7eM0rIkFhYXJd2qiCbWFBj9H/2cwdgzuB+LmW
         qkK4gZeUIh95oalnQl2kukN4C3Zd7VgXWMCys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698425606; x=1699030406;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8NMvN8NtPLltfrgxD/O1WglqvW9prg8HChw72gaXkwM=;
        b=mbm1zYVEK0Pp6sPK6CO66M10baod0tWYpplkgvBcDYIr5D6of+LHuMvCqiq+3tSDL9
         DcV2fpAYWtG5VjZ8rPjF9nfWV05Ggu2FfNZQQq9FhesWQndnPef4sHPt1pZ7Q6FMO4hy
         O0W1jXYu9lS8HGklOdJPdpGleHXBiVyQfAW/qwQVmLWKmZLdTskluQrK0+BqGphbzpU/
         Uq9bF8TGy2vGC+zNISNOqyTgnZvQxgFkBgwnnqnF/2c2b2GvNB566jVko6HNKbDNwsgo
         scB1YQYH08NtGgd5IQFAsIR6bGy7umw+KU32BaSCBv3UEShzgal+AhPgobtz4mlHo/ez
         N7/g==
X-Gm-Message-State: AOJu0YxLZMOXUfoB2uacxFNbaOllQmV9poGW9SiRXZT+MICceelZwcpZ
	wp1+7X6B//A8ktY7z/OOUYvcng==
X-Google-Smtp-Source: AGHT+IEDAB2ps3s085EpegKib1nvJudDWZbPakQbuY4upevkevAc46B4yTT4amCOdg4Yd/SUnT3kTQ==
X-Received: by 2002:adf:e44a:0:b0:32d:a2d7:ae88 with SMTP id t10-20020adfe44a000000b0032da2d7ae88mr2180928wrm.43.1698425605621;
        Fri, 27 Oct 2023 09:53:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:35e4:65b9:f46b:317d? ([2001:8b0:aba:5f3c:35e4:65b9:f46b:317d])
        by smtp.gmail.com with ESMTPSA id d16-20020adfef90000000b0032326908972sm2117078wro.17.2023.10.27.09.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 09:53:25 -0700 (PDT)
Message-ID: <b07976f49a6a948c28950f68069bfeec926fe0d5.camel@linuxfoundation.org>
Subject: Re: meta-oe source mirroring
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Rini <trini@konsulko.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, Armin
	Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Oct 2023 17:53:24 +0100
In-Reply-To: <20231027163016.GX496310@bill-the-cat>
References: 
	<f928e9f7f4e98eeb45db886a70b26cd7c292702f.camel@linuxfoundation.org>
	 <20231027163016.GX496310@bill-the-cat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 16:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105780

On Fri, 2023-10-27 at 12:30 -0400, Tom Rini wrote:
> On Thu, Oct 26, 2023 at 03:22:26PM +0100, Richard Purdie wrote:
>=20
> > I'm happy to say that meta-openembedded source mirroring is now working
> > via the Yocto Project's infrastructure and available through the
> > project's source mirrors.
> >=20
> > An example successful run with master is here:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/19
> >=20
> > Nanbield should also work.
> >=20
> > kirkstone is here and is now error free but does show a lot of
> > warnings:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/27
> >=20
> > dunfell is also error free but also shows warnings:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/31
> >=20
> > I did have to disable two recipes as one uses mercurial (the other has
> > it as a dependency) and the mercurial checkout format changed between
> > versions. The mirrors from later releases don't work with the version
> > of mercurial-native from dunfell meta-oe. Disabling it was the
> > easiest/safest path forward.
> >=20
> > Currently these are all scheduled to run automatically. If we can fix
> > the warnings, that can stay. If there isn't a desire to fix the
> > warnings in stable branches, we'd probably disable the scheduler for
> > them since we have a policy of no warnings on the autobuilder.
>=20
> Maybe it's because I'm missing a different step, but I've always had to
> setup source mirrors for SCM archives to be in a subdirectory, not just
> for mercurial style problems but for hash changes. For example I have:
> $ ls -d ~/work/OE/downloads/*/git2_sourceware.org.git.glibc.git.tar.gz
> /home/trini/work/OE/downloads/dunfell/git2_sourceware.org.git.glibc.git.t=
ar.gz
> /home/trini/work/OE/downloads/honister/git2_sourceware.org.git.glibc.git.=
tar.gz
> ...
>=20
> And then have in my PREMIRRORS:
> git://.*/.*     ${SOURCE_MIRROR_URL}/${LAYERSERIES_COMPAT:core} \n \
> gitsm://.*/.*   ${SOURCE_MIRROR_URL}/${LAYERSERIES_COMPAT:core} \n \
>=20
> So that I get the right thing. Might this be closer to the path forward
> to solve the above issue? Or is mine because I'm not generating the
> archives correctly to start with (and so the mercurial issue really is
> special) ?

The idea is that information is not removed from the archives so that a
newer archive should always have everything the older one had plus
more. In that sense, DL_DIR should be shareable between newer and older
releases and the mirror tarballs should to. They don't have to be
identical, newer ones may contain new revisions, as long as the older
ones are still there.

For YP, we only have one source mirror for all releases.

With mercurial, they changed the on disk format newer tooling creates
so it doesn't work with the mercurial-native from dunfell. If you
ASSUME_PROVIDED it, or update the recipe it would work. Since it is a
single recipe on an fairly old release (now) I'm not worrying too much
about it. The mirrors do have the data and people would make it work if
they needed to.

Cheers,

Richard




