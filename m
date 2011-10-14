Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1REf05-0003EE-Ad
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 12:28:25 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 0B98F5AE7F7; Fri, 14 Oct 2011 04:22:39 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id DF6985AE533;
	Fri, 14 Oct 2011 04:22:37 -0600 (MDT)
Message-ID: <4E980D6D.7090307@mlbassoc.com>
Date: Fri, 14 Oct 2011 04:22:37 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E96E9FE.1060005@mlbassoc.com>
	<CAMKF1sp9HPM8DzxTSuhUKY7-q4QuDPNkDQ2TAQPwoGkZ+Gu4eg@mail.gmail.com>
	<4E974E38.5050807@mlbassoc.com>
	<201110132258.27380.schnitzeltony@gmx.de>
	<4E975444.3050507@mlbassoc.com>
	<CA+T6QPkOQgFSmSsNaaeCOM5zNtzaNcCzgVaXr=t_5jj902w11Q@mail.gmail.com>
	<CAMKF1srDzFzjkoWAs2k8wP45xskCuwhyLb_dCpiT2GMarC_s5w@mail.gmail.com>
In-Reply-To: <CAMKF1srDzFzjkoWAs2k8wP45xskCuwhyLb_dCpiT2GMarC_s5w@mail.gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2011 10:28:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011-10-13 23:17, Khem Raj wrote:
> On Thursday, October 13, 2011, Jason Kridner<jkridner@beagleboard.org>
> wrote:
>> On Thu, Oct 13, 2011 at 5:12 PM, Gary Thomas<gary@mlbassoc.com>  wrote=
:
>>> On 2011-10-13 14:58, Andreas M=C3=BCller wrote:
>>>>
>>>> On Thursday, October 13, 2011 10:46:48 PM Gary Thomas wrote:
>>>>>
>>>>> On 2011-10-13 14:44, Khem Raj wrote:
>>>>>>
>>>>>> On Thu, Oct 13, 2011 at 1:42 PM, Gary Thomas<gary@mlbassoc.com>
> wrote:
>>>>>>>
>>>>>>> On 2011-10-13 14:33, Khem Raj wrote:
>>>>>>>>
>>>>>>>> On Thu, Oct 13, 2011 at 11:57 AM, Gary Thomas<gary@mlbassoc.com>
>>>>>>>> wrote:
>>>>>>>>>
>>>>>>>>> On 2011-10-13 12:48, Khem Raj wrote:
>>>>>>>>>>
>>>>>>>>>> On Thu, Oct 13, 2011 at 7:28 AM, Gary Thomas<gary@mlbassoc.com=
>
>>>>>>>>>>    wrote:
>>>>>>>>>>>
>>>>>>>>>>> On 2011-10-13 08:16, Kridner, Jason wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> On Oct 13, 2011, at 8:39 AM, "Gary Thomas"<gary@mlbassoc.com=
>
>>>>>>>>>>>>    wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>> Trying to follow the Angstrom instructions directly.
>>>>>>>>>>>>>
>>>>>>>>>>>>> OE Build Configuration:
>>>>>>>>>>>>> BB_VERSION        =3D "1.13.3"
>>>>>>>>>>>>> TARGET_ARCH       =3D "arm"
>>>>>>>>>>>>> TARGET_OS         =3D "linux-gnueabi"
>>>>>>>>>>>>> MACHINE           =3D "beagleboard"
>>>>>>>>>>>>> DISTRO            =3D "angstrom"
>>>>>>>>>>>>> DISTRO_VERSION    =3D "v2011.10-core"
>>>>>>>>>>>>> TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
>>>>>>>>>>>>> TARGET_FPU        =3D "vfp-neon"
>>>>>>>>>>>>> meta-angstrom     =3D
>>>>>>>>>>>>> "master:66263650f8548d6b0b5f593ab728f536d5e05a9f"
>>>>>>>>>>>>> meta-oe
>>>>>>>>>>>>> meta-efl
>>>>>>>>>>>>> meta-gpe
>>>>>>>>>>>>> meta-gnome
>>>>>>>>>>>>> meta-xfce         =3D
>>>>>>>>>>>>> "master:1e5d73ec4f44200104de085838f04e31a49435da"
>>>>>>>>>>>>> meta-ti           =3D
>>>>>>>>>>>>> "master:3530f1025efc3792334b897a4e70c6d5822ef56d"
>>>>>>>>>>>>> meta              =3D
>>>>>>>>>>>>> "master:5ad1ca59dea6d5045f252ed7b786ad193faced64"
>>>>>>>>>>>>>
>>>>>>>>>>>>> Fails with this error:
>>>>>>>>>>>>> | ccache arm-angstrom-linux-gnueabi-gcc  -march=3Darmv7-a
>>>>>>>>>>>>> -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=3Dso=
ftfp
>>>>>>>>>>>>> -mfpu=3Dneon
>>>>>>>>>>>>> -mtune=3Dcortex-a8 -mthumb-interwork -mno-thumb
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>
> --sysroot=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroo=
ts/beagleboard
>>>>>>>>>>>>> -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g
>>>>>>>>>>>>> -feliminate-unused-debug-types -Wall -c walk_test.c
>>>>>>>>> I started over and reduced my BB_NUMBER_THREADS to 2, but left =
my
>> PARALLEL_MAKE at -j24 and the issue went away.  I had it set for 8
>> threads before when it failed.
>
> Hmm so is it possible that gcc-runtime was not staged
> Wish I had such monster machines :)

Indeed, I did a rebuild from scratch with BB_NUMBER_THREADS=3D1 and
PARALLEL_MAKE=3D"-j1" and it worked fine.  When I set both to 2 I had
failures, but of a different sort (openssl failed to build).

Seems to be some real gremlins in the parallel builds :-(

Odd that I've never seen this when building Poky (I _always_ use
BB_NUMBER_THREADS=3D4 and PARALLEL_MAKE=3D"-j4")

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


