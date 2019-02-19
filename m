Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 236256C498
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 16:47:03 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id r21so41623qkl.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 08:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=F/X6oQCI2lAeCxU0Cn3W67A2dJOwa2gY+cKWwqVn/70=;
	b=FYm7MHyrwa3XF1LP2SmLC0NBV8mBI6tbcy0dqxFMc0juRys2X67it/OzyOxZMRllp7
	bqvdKaJipZb/C2fRYnvj+XNhC8ngkOdJinF6gkKUQrRQVmuyVR+M7dEGyqyIKWCXvj4T
	5jw3Hl70/7huaZqym82v2oJffweK9weuccoymQhuil2oXV+2x3np904NFb+1tWnfbxRT
	M62D5einjjB3dDqVm+PpHF0UPrY4UWVw7I/7eAT8GEmklg4c4rj4IJLV46UO/AdUl4l2
	tXkxLSeeVsVjKxN4/VWfsbX1Pd61hi7ju5dwp+zYzYimR6hoKvuJV7m35ILCgOr2jgmD
	Ae/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=F/X6oQCI2lAeCxU0Cn3W67A2dJOwa2gY+cKWwqVn/70=;
	b=es6kBEKIVkSwDgx5E2Mk3Y6xLLzaQAR9nVijf1PLI/7NRAhfyLecicWKujVqvq0TXw
	gyOcIESW40BJa6FU+2/DHmDx6IZnivqm63FDPZwPXp0D3o2MzFk45XSb5SN9ClukMBsi
	4V9SER5uNHN+aWJWrE2WfCA7PshQSAAoRnRlhOOneO6LG5BS6gGhhGUPH4ZAAblN5SVZ
	/lae+jDLv95W6jIJ41U337GQ19MQhZM1DAREWQi09wWhWHareaX4df97r71NVyaghPV4
	iVA3xnlOlQg22us0XheGGAZATVLd1OLTzzdjXcKOOMU5jTxEFn3904cisPFTXY+Jc8aM
	QBgA==
X-Gm-Message-State: AHQUAuYzmZxDGhGoxEx1UWO9tdrt7akMevzUoiciXYdHdZWQLp1h17ib
	FbWYAjLNsnZpaH5X4ipi3smwRDB9a9vt4tWL0eJA6A==
X-Google-Smtp-Source: AHgI3Ib6LBdZL+R3W91L5LZtbxKh+s8jnBw3ZRqMNYD9meOlVOSNo/6WX6E8GZ5x1VUCF3w4WxGJ48y9zQybSG5Ak+g=
X-Received: by 2002:a37:9e15:: with SMTP id h21mr22214286qke.2.1550594823829; 
	Tue, 19 Feb 2019 08:47:03 -0800 (PST)
MIME-Version: 1.0
References: <20190216170354.10645-1-zboszor@pr.hu>
	<20190218104704.14623-1-zboszor@pr.hu>
	<CAMKF1spwdGaXKr51oZM-g5Pmw8jNsUQLOs=DRsOfD3pYfAYRZg@mail.gmail.com>
	<5ed76350-b384-bfa8-5e21-5373a9bf4a91@pr.hu>
In-Reply-To: <5ed76350-b384-bfa8-5e21-5373a9bf4a91@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Feb 2019 08:46:37 -0800
Message-ID: <CAMKF1sqhjRVsLSqPQwoPRnO5hndaoHXar7zY+ZnRyMjwp0FU5g@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 0/6 v2] Run dracut from rootfs
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
X-List-Received-Date: Tue, 19 Feb 2019 16:47:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 19, 2019 at 1:00 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbo=
szor@pr.hu> wrote:
>
> Please fix the author for my patches in Patchwork and in GIT history.

Don't worry, I am aware of this problem, and I will fix that once that
patches are in good shape.
you should enquire your email provider also on this issue since it
might also be related to them.

>
> Who is this William A. Kennington III who claimed ownership over my patch=
es?
>
> 2019. 02. 19. 8:01 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> > https://errors.yoctoproject.org/Errors/Details/228793/
> >
> > On Mon, Feb 18, 2019 at 2:47 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n =
<zboszor@pr.hu> wrote:
> >>
> >> This patchset adds the necessary pieces to create the initramfs
> >> with dracut during do_rootfs.
> >>
> >> The 6th patch references a GitHub branch for which a pull request
> >> was made against dracut. See https://github.com/dracutdevs/dracut/pull=
/535
> >>
> >> Best regards,
> >> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
> >>
> >>
> >
>

