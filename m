Return-Path: <alfonso@tames.com>
Received: from mail.tames.com (tames.com [72.2.119.182])
	by mail.openembedded.org (Postfix) with ESMTP id 34FF372369
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Dec 2014 17:21:39 +0000 (UTC)
Received: from [10.178.247.115] (unknown [187.189.165.189])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alfonso@tames.com)
	by mail.tames.com (Postfix) with ESMTPSA id 07929253E7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Dec 2014 17:21:30 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: =?utf-8?Q?Alfonso_Tam=C3=A9s?= <alfonso@tames.com>
In-Reply-To: <CAPbeDCkN02Rsk8a92t_vApn5i6FCG2VRK+x0fUwWjx0ZOYsKXA@mail.gmail.com>
Date: Sun, 14 Dec 2014 11:21:36 -0600
Message-Id: <EB25247B-D2D2-4EB0-853E-F6B752960F5D@tames.com>
References: <548D4051.5080504@tames.com>
	<CAPbeDCkN02Rsk8a92t_vApn5i6FCG2VRK+x0fUwWjx0ZOYsKXA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1993)
X-Virus-Scanned: clamav-milter 0.98.1 at 56cb6755-5e21-c698-f8be-a3023abd5444
X-Virus-Status: Clean
Subject: Re: Cross canadian gcc configuration
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Dec 2014 17:21:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks Jakob, I am indeed sourcing the environment script. I suppose it =
is lacking something.

Alfonso

> On Dec 14, 2014, at 7:30 AM, Jacob Kroon <jacob.kroon@gmail.com> =
wrote:
>=20
> Hi Alfonso,
>=20
> On Sun, Dec 14, 2014 at 8:46 AM, Alfonso Tam=C3=A9s =
<alfonso@tames.com> wrote:
>>=20
>> When I try to compile a hello world program with the
>> arm-poky-linux-gnueabi-gcc compiler, first I get an error not finding
>> <stdio.h>, and when I pass the directory through the -I flag, I get =
the
>> classic"stubs.h:7:29: fatal error: gnu/stubs-soft.h: No such file or
>> directory" error which I supposed is being thrown since gcc cross =
canadian
>> is not being configured by default (as my image) hard float.
>>=20
>> I noticed in the gcc-cross-canadian.inc that the =
--with-gxx-include-dir
>> and --with-sysroot in EXTRA_OECONF_PATHS have a "/not/exist" string:
>>=20
>> EXTRA_OECONF_PATHS =3D "\
>> --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${BINV} \
>> =
--with-build-time-tools=3D${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_S=
YS}/bin
>> \
>> --with-sysroot=3D/not/exist \
>> --with-build-sysroot=3D${STAGING_DIR_TARGET} \
>> "
>>=20
>>=20
>=20
> The sysroot is poisoned by intention. Try sourcing the environment =
script
> from the SDK, and use $CC instead of invoking the compiler binary =
directly.
>=20
> See git commit 04b725511a505c582a3abdf63d096967f0320779 in
> openembedded-core.
>=20
> Jacob
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


