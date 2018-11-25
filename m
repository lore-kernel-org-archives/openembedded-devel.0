Return-Path: <nathan@nathanrossi.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id BCEE86D1C1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2018 15:40:06 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 131so10883875qkd.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2018 07:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1pX4baZRjWc+or5PYV5aWiNwLqaqcRpmUtV62yTMfxw=;
	b=Ht2MsF2aUA8wuehIER4vgRIZd65sfqwRdCrIgIU0t7xGnCY/OKeHy8RRcBns7XwO4s
	Tjjhj94D/l2cmm/1t2VIP35eaJqzr1Nr/WTuzAaoPfuCs6uqm8xpMbx57za02Jne8bAf
	tRwG7iWA1wLZ3hHS2UDUTMFgoiD9NWMJuJgu1eOG+oLPgKmF3o9HMTTp9Xg8v8Ej+d/o
	RVYKu9+ZdwLqBAzscJFMmc0Tkb+T0r8PnorLmxKR/OPtRr+SsAiMzqVUzTyScgBJcinW
	lq1UveHSKzA9AUlzTfPkEpC2AvVr4+tT7YD7TEZwIHprKyrJVr0hJThm/F/y+J1+OEH5
	T4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1pX4baZRjWc+or5PYV5aWiNwLqaqcRpmUtV62yTMfxw=;
	b=VrLO5ks4i19o+bHex1AvcuImBAt2Fg10B2XNgOgJ++egKL72S+49nQguf2pqdRb06j
	moVN7h22x0IXnvAqv6wziunO+p18BAQPXGJkQD1C/4IKR155VpjemD6j2IEh84NLd6xV
	eVNLaiXlENGjJDpccC854QFeUhpEpYHoj1ej+92+R23kIFV656BKy5WvMYankzlQN3Q0
	Vl3do0PzjMISJMEcZ02pyMxB+7vb6lfANtD5Y0xrPaiu/hsNE5PmqD95bShuNZSRljXz
	7goEVPa3Xle/6kV4f3D8bGpQRo54ncGv2cZbdz/airnUOVn42bqBWmdhx8CvbrIarjJP
	5dYA==
X-Gm-Message-State: AA+aEWZpkyq4QJaOwGgivx0ZUums4Wp+8OvN+7SQ9vqvhbMCEv64PAOP
	/jQiWS8x1i8OcsFM4ZwsI6hjqZc919LNbiLn1FTsiA==
X-Google-Smtp-Source: AFSGD/WWAH00w3yxUTPQO+5y9Q/yJjmwZDHJxKo58VRn6A6n9wW2z957nMIglihKwHMWdv8/jcN97RwFOAGJmRjGid8=
X-Received: by 2002:a37:492:: with SMTP id 140mr21327645qke.95.1543160407604; 
	Sun, 25 Nov 2018 07:40:07 -0800 (PST)
MIME-Version: 1.0
References: <20181123153941.10186-1-brgl@bgdev.pl>
	<CA+aJhH0KL7nzmkGUgUyD-h-ghf6u65uqeGOVavjV=u1fW6QQvg@mail.gmail.com>
	<CAMRc=MebuMRhQgzrZKU_0Gu9pNOPgJYitVMLFSPGm0B9hHfC3w@mail.gmail.com>
In-Reply-To: <CAMRc=MebuMRhQgzrZKU_0Gu9pNOPgJYitVMLFSPGm0B9hHfC3w@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Mon, 26 Nov 2018 01:39:56 +1000
Message-ID: <CA+aJhH2_yYkLCdY6C0XSuj9vB_k+VLioKh8ArSUZqo7XYydsDg@mail.gmail.com>
To: brgl@bgdev.pl
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sun, 25 Nov 2018 15:40:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Nov 2018 at 01:12, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> niedz., 25 lis 2018 o 07:04 Nathan Rossi <nathan@nathanrossi.com> napisa=
=C5=82(a):
> >
> > On Sat, 24 Nov 2018 at 01:39, Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > >
> > > This series adds recipes for libsigrok and accompanying libraries and
> > > tools. The eventual goal is to add pulseview - the graphical interfac=
e
> > > for sigrok - to meta-qt5-extra.
> > >
> > > First two patches add external packages used by libsigrok. The third
> > > patch adds a recipe for native doxygen, which is needed to generate
> > > libsigrok C++ bindings which will in turn be necessary to build
> > > pulseview.
> > >
> > > Last three patches add recipes for the sigrok suite including the
> > > command-line utility - sigrok-cli.
> > >
> > > Bartosz Golaszewski (6):
> > >   libzip: new package
> > >   libserialport: new package
> > >   doxygen: new native package
> > >   libsigrok: new package
> > >   libsigrokdecode: new package
> > >   sigrok-cli: new package
> >
> > Anything against marking all the recipes (excluding doxygen) with
> > BBCLASSEXTEND =3D "native nativesdk"?
> >
>
> What would be the reason for that? Also: you'd need to do that for ALL
> non-direct sigrok dependencies and I think there are quite a few.

It makes it really easy to ship with a nativesdk toolset or use on
your build host. I have personally been using it this way and made
some recipes for it a few months ago
(https://github.com/nathanrossi/meta-random/tree/master/recipes-toolbox/sig=
rok).

With the recipes in this series the only dependency that is not also
enabled for native/nativesdk is glibmm. However that is not enabled by
default (since its a dependency of 'cxx' config).

>
> > Also any plans to include recipes for any of the firmware data
> > packages that sigrok provides? (e.g. sigrok-firmware-fx2lafw)
> >
>
> I don't personally need it and it seems like it requires integrating
> the sdcc compiler into yocto. Probably more work than I can spend on
> that.

I was only referring to the pre-built firmware binaries that are
released by the sigrok project.
https://sigrok.org/download/binary/sigrok-firmware-fx2lafw/.

Regards,
Nathan

