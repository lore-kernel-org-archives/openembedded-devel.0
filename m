Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RES4T-0001mu-Uf
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 22:40:08 +0200
Received: by qadc1 with SMTP id c1so443144qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 13:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=3WKBZ3k0f0JSjuitVlU3Gz53peNXHf5o0aBmOEsg2kQ=;
	b=v7TvsBR/eHqF9JxAmN11w+BQlwGCJZr/iuwnzUfJ0lJb0cKm3jBiCcpaYzAAfRSaEb
	m5zRWwokQCvP+k06mfld6ckB+JxVnF33UDzpn8icy3bHCtQiZ2ZXO3bB8Ch6EfoAr7n0
	owBSkX3M+SVeSarvcDihvj/QWGexPVCiPmWG0=
Received: by 10.68.32.162 with SMTP id k2mr11099082pbi.132.1318538061121; Thu,
	13 Oct 2011 13:34:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 13 Oct 2011 13:33:51 -0700 (PDT)
In-Reply-To: <4E9734B7.2030207@mlbassoc.com>
References: <4E96E9FE.1060005@mlbassoc.com>
	<6E64F0B8-773E-4558-B470-37BA010F419D@ti.com>
	<4E96F59A.6030206@mlbassoc.com>
	<CAMKF1sroXD8KQE4HPXgUcvC8X35TDrzzf=SVmVLAvM073WD9vA@mail.gmail.com>
	<4E9734B7.2030207@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Oct 2011 13:33:51 -0700
Message-ID: <CAMKF1spOdXy2sAAr9J2vdFctPS1T3+U63wbf6DM1Q+fTzuKU7Q@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Can't build libcgroup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2011 20:40:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 11:57 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2011-10-13 12:48, Khem Raj wrote:
>>
>> On Thu, Oct 13, 2011 at 7:28 AM, Gary Thomas<gary@mlbassoc.com> =C2=A0wr=
ote:
>>>
>>> On 2011-10-13 08:16, Kridner, Jason wrote:
>>>>
>>>> On Oct 13, 2011, at 8:39 AM, "Gary Thomas"<gary@mlbassoc.com> =C2=A0 =
=C2=A0wrote:
>>>>
>>>>> Trying to follow the Angstrom instructions directly.
>>>>>
>>>>> OE Build Configuration:
>>>>> BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.13.3"
>>>>> TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D "arm"
>>>>> TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "linux-gnueabi"
>>>>> MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "beagleboard"
>>>>> DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "angstrom"
>>>>> DISTRO_VERSION =C2=A0 =C2=A0=3D "v2011.10-core"
>>>>> TUNE_FEATURES =C2=A0 =C2=A0 =3D "armv7a vfp neon cortexa8"
>>>>> TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "vfp-neon"
>>>>> meta-angstrom =C2=A0 =C2=A0 =3D "master:66263650f8548d6b0b5f593ab728f=
536d5e05a9f"
>>>>> meta-oe
>>>>> meta-efl
>>>>> meta-gpe
>>>>> meta-gnome
>>>>> meta-xfce =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:1e5d73ec4f44200104d=
e085838f04e31a49435da"
>>>>> meta-ti =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:3530f1025efc37=
92334b897a4e70c6d5822ef56d"
>>>>> meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "master:5ad1=
ca59dea6d5045f252ed7b786ad193faced64"
>>>>>
>>>>> Fails with this error:
>>>>> | ccache arm-angstrom-linux-gnueabi-gcc =C2=A0-march=3Darmv7-a
>>>>> -fno-tree-vectorize =C2=A0 =C2=A0 =C2=A0-mthumb-interwork -mfloat-abi=
=3Dsoftfp
>>>>> -mfpu=3Dneon
>>>>> -mtune=3Dcortex-a8 -mthumb-interwork -mno-thumb
>>>>>
>>>>> --sysroot=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysr=
oots/beagleboard
>>>>> -DHAVE_CONFIG_H -I. -I.. -I../include =C2=A0 =C2=A0-O2 -pipe -g
>>>>> -feliminate-unused-debug-types -Wall -c walk_test.c
>>>>> | libcg_ba.cpp:18:18: fatal error: string: No such file or directory
>>
>> Does this happen with lastest angstrom on oe-core ? or classic oe.dev
>> I am unable to reproduce it on my end
>
> Latest angstrom with layers as above.

strange, I have it working well for qemuarm and I cant imagine how C++
headers could be broken for beagle


