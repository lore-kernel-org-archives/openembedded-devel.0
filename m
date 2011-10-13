Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RESEY-00026w-In
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 22:50:30 +0200
Received: by pzd13 with SMTP id 13so3708219pzd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 13:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ZXdgzuLvkiuEcUkBlHX558qpEcFYBtjzdh8c8z60vbU=;
	b=j84zvpqLoDLxmqRW/KkCYOTkavAwqEW3s3o0PhT8CWRhjTxnIj9xsKgMRcge0bxzW8
	KMsbGTyD6fKY3I3XnScdovK+zYnhrX6OdmNgs+tliD00j2d0do/W//dgqiA8GMlxKYau
	CqbQGXCUF+qgNrNO19lApP12bdsMbbNopXICc=
Received: by 10.68.17.193 with SMTP id q1mr11194694pbd.98.1318538685298; Thu,
	13 Oct 2011 13:44:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 13 Oct 2011 13:44:15 -0700 (PDT)
In-Reply-To: <4E974D43.5090509@mlbassoc.com>
References: <4E96E9FE.1060005@mlbassoc.com>
	<6E64F0B8-773E-4558-B470-37BA010F419D@ti.com>
	<4E96F59A.6030206@mlbassoc.com>
	<CAMKF1sroXD8KQE4HPXgUcvC8X35TDrzzf=SVmVLAvM073WD9vA@mail.gmail.com>
	<4E9734B7.2030207@mlbassoc.com>
	<CAMKF1spOdXy2sAAr9J2vdFctPS1T3+U63wbf6DM1Q+fTzuKU7Q@mail.gmail.com>
	<4E974D43.5090509@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Oct 2011 13:44:15 -0700
Message-ID: <CAMKF1sp9HPM8DzxTSuhUKY7-q4QuDPNkDQ2TAQPwoGkZ+Gu4eg@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Oct 2011 20:50:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 1:42 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2011-10-13 14:33, Khem Raj wrote:
>>
>> On Thu, Oct 13, 2011 at 11:57 AM, Gary Thomas<gary@mlbassoc.com> =C2=A0w=
rote:
>>>
>>> On 2011-10-13 12:48, Khem Raj wrote:
>>>>
>>>> On Thu, Oct 13, 2011 at 7:28 AM, Gary Thomas<gary@mlbassoc.com>
>>>> =C2=A0wrote:
>>>>>
>>>>> On 2011-10-13 08:16, Kridner, Jason wrote:
>>>>>>
>>>>>> On Oct 13, 2011, at 8:39 AM, "Gary Thomas"<gary@mlbassoc.com>
>>>>>> =C2=A0wrote:
>>>>>>
>>>>>>> Trying to follow the Angstrom instructions directly.
>>>>>>>
>>>>>>> OE Build Configuration:
>>>>>>> BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.13.3"
>>>>>>> TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D "arm"
>>>>>>> TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "linux-gnueabi"
>>>>>>> MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "beagleboard"
>>>>>>> DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "angstrom"
>>>>>>> DISTRO_VERSION =C2=A0 =C2=A0=3D "v2011.10-core"
>>>>>>> TUNE_FEATURES =C2=A0 =C2=A0 =3D "armv7a vfp neon cortexa8"
>>>>>>> TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "vfp-neon"
>>>>>>> meta-angstrom =C2=A0 =C2=A0 =3D "master:66263650f8548d6b0b5f593ab72=
8f536d5e05a9f"
>>>>>>> meta-oe
>>>>>>> meta-efl
>>>>>>> meta-gpe
>>>>>>> meta-gnome
>>>>>>> meta-xfce =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:1e5d73ec4f4420010=
4de085838f04e31a49435da"
>>>>>>> meta-ti =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:3530f1025efc=
3792334b897a4e70c6d5822ef56d"
>>>>>>> meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "master:5a=
d1ca59dea6d5045f252ed7b786ad193faced64"
>>>>>>>
>>>>>>> Fails with this error:
>>>>>>> | ccache arm-angstrom-linux-gnueabi-gcc =C2=A0-march=3Darmv7-a
>>>>>>> -fno-tree-vectorize =C2=A0 =C2=A0 =C2=A0-mthumb-interwork -mfloat-a=
bi=3Dsoftfp
>>>>>>> -mfpu=3Dneon
>>>>>>> -mtune=3Dcortex-a8 -mthumb-interwork -mno-thumb
>>>>>>>
>>>>>>>
>>>>>>> --sysroot=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sy=
sroots/beagleboard
>>>>>>> -DHAVE_CONFIG_H -I. -I.. -I../include =C2=A0 =C2=A0-O2 -pipe -g
>>>>>>> -feliminate-unused-debug-types -Wall -c walk_test.c
>>>>>>> | libcg_ba.cpp:18:18: fatal error: string: No such file or director=
y
>>>>
>>>> Does this happen with lastest angstrom on oe-core ? or classic oe.dev
>>>> I am unable to reproduce it on my end
>>>
>>> Latest angstrom with layers as above.
>>
>> strange, I have it working well for qemuarm and I cant imagine how C++
>> headers could be broken for beagle
>
> Maybe you could try it using the Angstrom tools? =C2=A0Here's the [docume=
nted]
> sequence I used:
> =C2=A0% MACHINE=3D"beagleboard" ./oebb.sh config beagleboard
> =C2=A0... adjust conf/site.conf for my local DL_DIR
> =C2=A0... adjust conf/local.conf to include MACHINE=3Dbeagleboard, set pa=
rallel
> build flags, etc
> =C2=A0... removed all meta-intel repos from conf/bblayers.conf (to avoid =
xorg-dri
> issues)
> =C2=A0% . ~/.oe/environment-oecore
> =C2=A0% bitbake systemd-image
>

needless to say thats what I have done
but for qemuarm

> --
> ------------------------------------------------------------
> Gary Thomas =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0Consulting for the
> MLB Associates =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A0Embedded world
> ------------------------------------------------------------
>


