Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 614347D168
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 16:17:54 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q1so19328584wrp.0
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 09:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=rLjp4n7dHtBIoXM58yO6pl1OyCgTgUuzJHr/JgkbMe0=;
	b=tGyy037KBHG4ypVpEdszdPWHnd+KJPyJchYMBiHPiKF1xsBu13bM70jwdKyxAJyEyK
	be15Pc2ugSgKMHFRciPN0edmbJAO82oZOKKXWjWOxqa0ezmXhZsWopU6LDbkzmqGnHAp
	AJ9NqDagAl/l74DqXN9f6DLheSPLIyURnGWJXNzw6fFUJCGsssQC0ZUTYu8aivj3tS8K
	naBWnWXWFnAiE3+BUQ9Wtks+7CB88k8wVVceV6bdtPiGI8VcOf6iJ41lEMQeFpTlBcZ3
	NZbXV/EdqnblQyPPiUi3e9EIh7Z6PaEj/+6zoFUUHl8wGXENfMW+ic5KsUYgilEnJsl9
	sOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rLjp4n7dHtBIoXM58yO6pl1OyCgTgUuzJHr/JgkbMe0=;
	b=O4nZ/tfee0PE/DxriaKqNE5b3mUPd/me4evoEDoSIrzuxtwirlJjuxqL1VMHcKL7zC
	2FXUVv7WIKxAOct8mHJ5RQgklIWDOFJAlF2IPkNXFIQH77xMO2LQ6qUOjB0KFtqw+gxg
	auJ2URnKi4F9dkN7iBn5PbwGUNW9BXuS8rSUJjlP42E2lFdS7uQcD+9SNf4Waabx43SO
	BlhY1B8bQjl9KVJ/sW4SusWhSOJfOE8u8hj47dkQKBiV+TMa1KH06UnhsMXsRM8/Ajp5
	eaQle6s+BCF3Am6jNW39Qwd5g3FdZMlBnKIM0/j8CoJKTXisueJh2zzv/TJclqJzKTsb
	I3Bg==
X-Gm-Message-State: APjAAAUFdGfP/cDAJRPgUN7MjnmE7H3f9P5/jUouuhtidycDPq2H97KR
	6HVuBrK8cBNzBOsM6Hxmcy4=
X-Google-Smtp-Source: APXvYqzMbWYVhdMDe67GdXKYxkMys046PUJ0d7stfsfxsd5I0Mu4tfWC8MoIec6dOW1i3A+nVm+/pw==
X-Received: by 2002:a5d:53d0:: with SMTP id a16mr3361767wrw.309.1553703475111; 
	Wed, 27 Mar 2019 09:17:55 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id t24sm535859wmi.10.2019.03.27.09.17.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 09:17:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Mar 2019 17:17:54 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190327161754.GD1598@jama>
References: <CAMKF1so7w4i4Kw-ymWayPx1Z_mmetRKcNeyb9pADFZwDY=jqmw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so7w4i4Kw-ymWayPx1Z_mmetRKcNeyb9pADFZwDY=jqmw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: State of OE World, 2019-03-16
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
X-List-Received-Date: Wed, 27 Mar 2019 16:17:54 -0000
X-Groupsio-MsgNum: 76867
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jL2BoiuKMElzg3CS"
Content-Disposition: inline

--jL2BoiuKMElzg3CS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 17, 2019 at 08:26:37AM -0700, Khem Raj wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> =3D=3D Failed tasks 2019-03-16 =3D=3D
>=20
> INFO: jenkins-job.sh-1.8.45 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.2019031=
7_082308.log
>=20
>     * sources/openembedded-core/meta/recipes-gnome/gobject-introspection/=
gobject-introspection_1.58.3.bb:do_compile

I was hit by this one as well on some arm targets.

http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20=
190321_215508.log/bitbake.log

shows that it's actually from qemu-arm segfault inside g-ir-scanner-qemuwra=
pper

| qemu: uncaught target signal 11 (Segmentation fault) - core dumped
| /home/jenkins/oe/world/yoe/build/tmpfs/work/armv7vet2hf-neon-yoe-linux-gn=
ueabi/gobject-introspection/1.58.3-r0/build/g-ir-scanner-qemuwrapper: line =
6:  1959 Segmentation fault      (core dumped) PSEUDO_UNLOAD=3D1 qemu-arm -=
r 3.2.0 -L /home/jenkins/oe/world/yoe/build/tmpfs/work/armv7vet2hf-neon-yoe=
-linux-gnueabi/gobject-introspection/1.58.3-r0/recipe-sysroot -E LD_LIBRARY=
_PATH=3D$GIR_EXTRA_LIBS_PATH:.libs:/home/jenkins/oe/world/yoe/build/tmpfs/w=
ork/armv7vet2hf-neon-yoe-linux-gnueabi/gobject-introspection/1.58.3-r0/reci=
pe-sysroot//usr/lib:/home/jenkins/oe/world/yoe/build/tmpfs/work/armv7vet2hf=
-neon-yoe-linux-gnueabi/gobject-introspection/1.58.3-r0/recipe-sysroot//lib=
 "$@"

The interesting part is that this happens only when glibc is built with gol=
d enabled.

I've put a bit more details in temporary work-around here:
https://github.com/shr-distribution/meta-smartphone/commit/8f06eb355ead8546=
4b1a1bbaa82584504df15743

I'm comparing qemuarm glibc build with bfd and gold to see if there is some
significant difference which might cause this and I plan to flash some small
image on my targets to see if libc is broken in runtime as well or only when
running inside qemu-arm.

Is anyone else seeing this as well?

Regards,

--jL2BoiuKMElzg3CS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXJuiMQAKCRA3VSO3ZXaA
HDUbAJ9SbFokQzshRTCLdxWx+ZwLVft8bQCeKd6fExHaf1UQgSsZZwbn4ZctPDQ=
=sc5d
-----END PGP SIGNATURE-----

--jL2BoiuKMElzg3CS--
