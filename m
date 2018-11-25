Return-Path: <brgl@bgdev.pl>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 622776C45F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2018 15:12:44 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id i7so24587029iti.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2018 07:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MzEhmxYAI5fIIOjjr3jd52F9txV/gZ1V6PomXO+fOx8=;
	b=TSVWf8dwDH4+VOqMfq0aVsx2l38vMel3tQHxxfgWPn5gH4QIz4V3LNnRhNOczc2udE
	+WUNMg/NdGFX+P8KNEJtDvLSunvgsUZc2LsyLNrGPU05ba88iYWqaYgd35jddcPFkOcH
	0Bl7CuDWvZmcx4EbqE+ZS5yO+yfCaxqSss0KMzQ/NkUrf/aXXzOooCE7lVUsc5N0AHK8
	rK8Y7/aCON3JkYd7r5HZIpLjGESmp3rnwi1oH9NsIoKIhcyH6sW7xDfQU2F1zSBvi2LF
	IIEJjclHlrzbcVjNZ8xl0b4DQKSBa+BqXY2iH5QEdWIwzYg5sxrZV5jKjx89msL0ZCHU
	xurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MzEhmxYAI5fIIOjjr3jd52F9txV/gZ1V6PomXO+fOx8=;
	b=Vp0nnyIVYR1hjHkRPTQ/friFpymdEMORLe7BdjxbvBYy5UFuVWyW92p6b0LYt0DZCZ
	fdv5o+HpS5w1Xz0c9Yy6xeksP3v2ut9O+EdkSWY7A2slbHx9GoTfGzfwklZvybRVBRYN
	o/joigBvKrLzZSjD+8bXmLZJmxSdhPwXRq5toq/cdezRKFAG/Kc00F/YgrcudtxRGS6U
	tBu7jq0nuyZbU4IRofpP3OiHQpdop779TVwGIFwBy2t3LKXD4bvZNxlOsEaJZHaSN8x1
	g9Y5wX5nj590d2a9BsFLPsL/4RiscFTyFSvfg4aYm3/1Ky5mbzUW4qrqqIeEB8dePgs/
	mJvA==
X-Gm-Message-State: AA+aEWZXB+qjyZRKgyO26cmN8/sNkwcGBClUy5ntwzmMtQFgTZUzvbnt
	Ez8xi4OUk3DKhgvhpeQvDwcS1MvnfUdlTKnFVXlnag==
X-Google-Smtp-Source: AFSGD/U4IoONCQrU3U5F6a//cKqdpfzAMbPJozj7lVAWXg4yITqCpiBcOU2L8t7SlRT84e9gfE4PQ1K961Nw2fKOuIE=
X-Received: by 2002:a02:3d42:: with SMTP id n63mr21343955jan.136.1543158765364;
	Sun, 25 Nov 2018 07:12:45 -0800 (PST)
MIME-Version: 1.0
References: <20181123153941.10186-1-brgl@bgdev.pl>
	<CA+aJhH0KL7nzmkGUgUyD-h-ghf6u65uqeGOVavjV=u1fW6QQvg@mail.gmail.com>
In-Reply-To: <CA+aJhH0KL7nzmkGUgUyD-h-ghf6u65uqeGOVavjV=u1fW6QQvg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 25 Nov 2018 16:12:34 +0100
Message-ID: <CAMRc=MebuMRhQgzrZKU_0Gu9pNOPgJYitVMLFSPGm0B9hHfC3w@mail.gmail.com>
To: nathan@nathanrossi.com
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/6] sigrok: set of new packages
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
X-List-Received-Date: Sun, 25 Nov 2018 15:12:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

niedz., 25 lis 2018 o 07:04 Nathan Rossi <nathan@nathanrossi.com> napisa=C5=
=82(a):
>
> On Sat, 24 Nov 2018 at 01:39, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > This series adds recipes for libsigrok and accompanying libraries and
> > tools. The eventual goal is to add pulseview - the graphical interface
> > for sigrok - to meta-qt5-extra.
> >
> > First two patches add external packages used by libsigrok. The third
> > patch adds a recipe for native doxygen, which is needed to generate
> > libsigrok C++ bindings which will in turn be necessary to build
> > pulseview.
> >
> > Last three patches add recipes for the sigrok suite including the
> > command-line utility - sigrok-cli.
> >
> > Bartosz Golaszewski (6):
> >   libzip: new package
> >   libserialport: new package
> >   doxygen: new native package
> >   libsigrok: new package
> >   libsigrokdecode: new package
> >   sigrok-cli: new package
>
> Anything against marking all the recipes (excluding doxygen) with
> BBCLASSEXTEND =3D "native nativesdk"?
>

What would be the reason for that? Also: you'd need to do that for ALL
non-direct sigrok dependencies and I think there are quite a few.

> Also any plans to include recipes for any of the firmware data
> packages that sigrok provides? (e.g. sigrok-firmware-fx2lafw)
>

I don't personally need it and it seems like it requires integrating
the sdcc compiler into yocto. Probably more work than I can spend on
that.

Best regards,
Bart

