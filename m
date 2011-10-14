Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1REaF0-0002Cv-1d
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 07:23:30 +0200
Received: by iafi7 with SMTP id i7so2187138iaf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 22:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=i5ueRjiz+bUDOS1g94x4VbeVNbvixp2R8iBV0RM6U2k=;
	b=mNMUspmuGtIIcLFM6eLO4Ob0A2BC4tTeAoNOHR2ZQ5an3fHOK6wDO0fFNUxNUmxSSI
	h1doq80SBkaZN426cmdefEhRfeS43bCwPvWNy/hOxwNOMdDgrsgxHwHggR9YBvgp/cP8
	YUv0VFrrTiNTJODEWilDct20iY4JO+6Gb1MXE=
MIME-Version: 1.0
Received: by 10.42.157.135 with SMTP id d7mr13234809icx.19.1318569464606; Thu,
	13 Oct 2011 22:17:44 -0700 (PDT)
Received: by 10.42.218.133 with HTTP; Thu, 13 Oct 2011 22:17:44 -0700 (PDT)
In-Reply-To: <CA+T6QPkOQgFSmSsNaaeCOM5zNtzaNcCzgVaXr=t_5jj902w11Q@mail.gmail.com>
References: <4E96E9FE.1060005@mlbassoc.com>
	<CAMKF1sp9HPM8DzxTSuhUKY7-q4QuDPNkDQ2TAQPwoGkZ+Gu4eg@mail.gmail.com>
	<4E974E38.5050807@mlbassoc.com>
	<201110132258.27380.schnitzeltony@gmx.de>
	<4E975444.3050507@mlbassoc.com>
	<CA+T6QPkOQgFSmSsNaaeCOM5zNtzaNcCzgVaXr=t_5jj902w11Q@mail.gmail.com>
Date: Thu, 13 Oct 2011 22:17:44 -0700
Message-ID: <CAMKF1srDzFzjkoWAs2k8wP45xskCuwhyLb_dCpiT2GMarC_s5w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Fri, 14 Oct 2011 05:23:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thursday, October 13, 2011, Jason Kridner <jkridner@beagleboard.org>
wrote:
> On Thu, Oct 13, 2011 at 5:12 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> On 2011-10-13 14:58, Andreas M=C3=BCller wrote:
>>>
>>> On Thursday, October 13, 2011 10:46:48 PM Gary Thomas wrote:
>>>>
>>>> On 2011-10-13 14:44, Khem Raj wrote:
>>>>>
>>>>> On Thu, Oct 13, 2011 at 1:42 PM, Gary Thomas<gary@mlbassoc.com>
wrote:
>>>>>>
>>>>>> On 2011-10-13 14:33, Khem Raj wrote:
>>>>>>>
>>>>>>> On Thu, Oct 13, 2011 at 11:57 AM, Gary Thomas<gary@mlbassoc.com>
>>>>>>> wrote:
>>>>>>>>
>>>>>>>> On 2011-10-13 12:48, Khem Raj wrote:
>>>>>>>>>
>>>>>>>>> On Thu, Oct 13, 2011 at 7:28 AM, Gary Thomas<gary@mlbassoc.com>
>>>>>>>>>   wrote:
>>>>>>>>>>
>>>>>>>>>> On 2011-10-13 08:16, Kridner, Jason wrote:
>>>>>>>>>>>
>>>>>>>>>>> On Oct 13, 2011, at 8:39 AM, "Gary Thomas"<gary@mlbassoc.com>
>>>>>>>>>>>   wrote:
>>>>>>>>>>>
>>>>>>>>>>>> Trying to follow the Angstrom instructions directly.
>>>>>>>>>>>>
>>>>>>>>>>>> OE Build Configuration:
>>>>>>>>>>>> BB_VERSION        =3D "1.13.3"
>>>>>>>>>>>> TARGET_ARCH       =3D "arm"
>>>>>>>>>>>> TARGET_OS         =3D "linux-gnueabi"
>>>>>>>>>>>> MACHINE           =3D "beagleboard"
>>>>>>>>>>>> DISTRO            =3D "angstrom"
>>>>>>>>>>>> DISTRO_VERSION    =3D "v2011.10-core"
>>>>>>>>>>>> TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
>>>>>>>>>>>> TARGET_FPU        =3D "vfp-neon"
>>>>>>>>>>>> meta-angstrom     =3D
>>>>>>>>>>>> "master:66263650f8548d6b0b5f593ab728f536d5e05a9f"
>>>>>>>>>>>> meta-oe
>>>>>>>>>>>> meta-efl
>>>>>>>>>>>> meta-gpe
>>>>>>>>>>>> meta-gnome
>>>>>>>>>>>> meta-xfce         =3D
>>>>>>>>>>>> "master:1e5d73ec4f44200104de085838f04e31a49435da"
>>>>>>>>>>>> meta-ti           =3D
>>>>>>>>>>>> "master:3530f1025efc3792334b897a4e70c6d5822ef56d"
>>>>>>>>>>>> meta              =3D
>>>>>>>>>>>> "master:5ad1ca59dea6d5045f252ed7b786ad193faced64"
>>>>>>>>>>>>
>>>>>>>>>>>> Fails with this error:
>>>>>>>>>>>> | ccache arm-angstrom-linux-gnueabi-gcc  -march=3Darmv7-a
>>>>>>>>>>>> -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=3Dsoftf=
p
>>>>>>>>>>>> -mfpu=3Dneon
>>>>>>>>>>>> -mtune=3Dcortex-a8 -mthumb-interwork -mno-thumb
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
--sysroot=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/b=
eagleboard
>>>>>>>>>>>> -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g
>>>>>>>>>>>> -feliminate-unused-debug-types -Wall -c walk_test.c
>>>>>>>>I started over and reduced my BB_NUMBER_THREADS to 2, but left my
> PARALLEL_MAKE at -j24 and the issue went away.  I had it set for 8
> threads before when it failed.

Hmm so is it possible that gcc-runtime was not staged
Wish I had such monster machines :)

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>th

