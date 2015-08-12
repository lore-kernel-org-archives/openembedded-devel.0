Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9EAF7607A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 18:33:50 +0000 (UTC)
Received: by pacgr6 with SMTP id gr6so19743131pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 11:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=2a4n3DsT//Q0DfHsfmUnOnB5nDa/5y71lpsnsK0qA3k=;
	b=Z+UYDStz9YmuPqNTJnYPAdzuDywnxEuDgNSkawk0hui+O2Dovh+cbgy1HmMbbjtvNS
	fVbSJphbxBkydlgeMBiCwj156sfcym99DbVp5ou9feCWf5QzHjZ30eBBpKVdHjC3qwNg
	TuBWCEqJOsJTrlTRmJLOQ5+2l8w9EIQevlekR15S0NoRaBrv3OT0qcnkqUle9Knxg0WO
	IuI4qPl7ivMiHA2N/2U8MOAPZHFw+/SNeFFVxcSC2ihyiGAcz4RF5TuEwNvms2AdWsuP
	EvUP2lbl0YdFQYfPzOyV8JIJqtYVZaLXmlyf9mJY3f6ouEkzqzfBL8sNILyCe6gKu3cj
	Cheg==
X-Received: by 10.69.27.68 with SMTP id je4mr7335196pbd.163.1439404430346;
	Wed, 12 Aug 2015 11:33:50 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e0cb:bccb:39a5:3887?
	([2601:646:8601:4580:e0cb:bccb:39a5:3887])
	by smtp.gmail.com with ESMTPSA id
	qp13sm7272941pbb.9.2015.08.12.11.33.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Aug 2015 11:33:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55CB2853.3040104@exceet.de>
Date: Wed, 12 Aug 2015 11:33:45 -0700
Message-Id: <B8E073FD-9854-4E89-9375-F204E7E1D726@gmail.com>
References: <55CB2853.3040104@exceet.de>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-qt5] qtwebengine in master fails to build
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
X-List-Received-Date: Wed, 12 Aug 2015 18:33:54 -0000
X-Groupsio-MsgNum: 56672
Content-Type: multipart/signed;
	boundary="Apple-Mail=_688CC9A0-2C00-4C61-B630-4FC435B60C40";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_688CC9A0-2C00-4C61-B630-4FC435B60C40
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 12, 2015, at 4:04 AM, Schrempf Frieder =
<frieder.schrempf@exceet.de> wrote:
>=20
> I have the same problem on a current fido build.
> Can anyone with some knowledge about this have a look?
> Ridiculously it works on a clean build for me and the error only =
occurs while rebuilding.
>=20
>=20

there could be few things. Try to add
CLEANBROKEN =3D =E2=80=9C1=E2=80=9D to the recipe and see if it helps
secondly it could be a parallel make race condition
so you might want to disable parallel make for tests.

> Carlos Rafael Giani, on Mon Jan 26 08:13:45 UTC 2015:
>> Hello,
>>=20
>> I tried to build qtwebengine, but there is a linker error:
>>=20
>> [6/6694] LINK genmacro
>> FAILED:
>> =
/home/dv/misc/yocto-fsl-setup-0002/poky/build/tmp/sysroots/x86_64-linux/us=
r/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-g++
>> -march=3Darmv7-a -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9
>> =
--sysroot=3D/home/dv/misc/yocto-fsl-setup-0002/poky/build/tmp/sysroots/cub=
ox-i
>> -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,now =
-Wl,-z,relro
>> -Wl,--fatal-warnings -pthread -Wl,-z,noexecstack -fPIC
>> -Wl,--disable-new-dtags -Wl,--gc-sections -o genmacro =
-Wl,--start-group
>> =
obj.host/src/3rdparty/chromium/third_party/yasm/source/patched-yasm/tools/=
genmacro/genmacro.genmacro.o
>> -Wl,--end-group
>> =
obj.host/src/3rdparty/chromium/third_party/yasm/source/patched-yasm/tools/=
genmacro/genmacro.genmacro.o:
>> file not recognized: File format not recognized
>> collect2: error: ld returned 1 exit status
>>=20
>> Looking at the ninja
>> =
fileqtwebengine-opensource-src-5.4.0/src/core/Release/obj.host/src/3rdpart=
y/chromium/third_party/yasm/genmacro.ninja
>> , apparently this part is causing problems:
>>=20
>> build genmacro: link $
>> =
obj.host/src/3rdparty/chromium/third_party/yasm/source/patched-yasm/tools/=
genmacro/genmacro.genmacro.o
>>=20
>> It is linking with arm-poky-linux-gnueabi-g++ , but the object file =
is
>> built with the host's compiler. Considering the name "genmacro", I
>> suspect this is some kind of generator tool that is supposed to be =
run
>> as part of the build process, so therefore the linker should be the =
host
>> one. But I have no knowledge about ninja or the webengine internals, =
so
>> I do not know how to fix that. Any suggestions?
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_688CC9A0-2C00-4C61-B630-4FC435B60C40
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXLkYwACgkQuwUzVZGdMxQ92ACgkPSSh1kiyAYW7KupZ7mTSq4k
JOsAn0dj1rIIiUYN4E+eN9hSyEVe8hQk
=MDwe
-----END PGP SIGNATURE-----

--Apple-Mail=_688CC9A0-2C00-4C61-B630-4FC435B60C40--
