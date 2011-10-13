Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1RESfU-0003EQ-M4
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 23:18:21 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id BBB9B16601DB; Thu, 13 Oct 2011 15:12:37 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id AA69216601CA;
	Thu, 13 Oct 2011 15:12:36 -0600 (MDT)
Message-ID: <4E975444.3050507@mlbassoc.com>
Date: Thu, 13 Oct 2011 15:12:36 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E96E9FE.1060005@mlbassoc.com>
	<CAMKF1sp9HPM8DzxTSuhUKY7-q4QuDPNkDQ2TAQPwoGkZ+Gu4eg@mail.gmail.com>
	<4E974E38.5050807@mlbassoc.com>
	<201110132258.27380.schnitzeltony@gmx.de>
In-Reply-To: <201110132258.27380.schnitzeltony@gmx.de>
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
X-List-Received-Date: Thu, 13 Oct 2011 21:18:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011-10-13 14:58, Andreas M=FCller wrote:
> On Thursday, October 13, 2011 10:46:48 PM Gary Thomas wrote:
>> On 2011-10-13 14:44, Khem Raj wrote:
>>> On Thu, Oct 13, 2011 at 1:42 PM, Gary Thomas<gary@mlbassoc.com>   wro=
te:
>>>> On 2011-10-13 14:33, Khem Raj wrote:
>>>>>
>>>>> On Thu, Oct 13, 2011 at 11:57 AM, Gary Thomas<gary@mlbassoc.com>   =
  wrote:
>>>>>>
>>>>>> On 2011-10-13 12:48, Khem Raj wrote:
>>>>>>>
>>>>>>> On Thu, Oct 13, 2011 at 7:28 AM, Gary Thomas<gary@mlbassoc.com>
>>>>>>>    wrote:
>>>>>>>>
>>>>>>>> On 2011-10-13 08:16, Kridner, Jason wrote:
>>>>>>>>>
>>>>>>>>> On Oct 13, 2011, at 8:39 AM, "Gary Thomas"<gary@mlbassoc.com>
>>>>>>>>>    wrote:
>>>>>>>>>
>>>>>>>>>> Trying to follow the Angstrom instructions directly.
>>>>>>>>>>
>>>>>>>>>> OE Build Configuration:
>>>>>>>>>> BB_VERSION        =3D "1.13.3"
>>>>>>>>>> TARGET_ARCH       =3D "arm"
>>>>>>>>>> TARGET_OS         =3D "linux-gnueabi"
>>>>>>>>>> MACHINE           =3D "beagleboard"
>>>>>>>>>> DISTRO            =3D "angstrom"
>>>>>>>>>> DISTRO_VERSION    =3D "v2011.10-core"
>>>>>>>>>> TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
>>>>>>>>>> TARGET_FPU        =3D "vfp-neon"
>>>>>>>>>> meta-angstrom     =3D "master:66263650f8548d6b0b5f593ab728f536=
d5e05a9f"
>>>>>>>>>> meta-oe
>>>>>>>>>> meta-efl
>>>>>>>>>> meta-gpe
>>>>>>>>>> meta-gnome
>>>>>>>>>> meta-xfce         =3D "master:1e5d73ec4f44200104de085838f04e31=
a49435da"
>>>>>>>>>> meta-ti           =3D "master:3530f1025efc3792334b897a4e70c6d5=
822ef56d"
>>>>>>>>>> meta              =3D "master:5ad1ca59dea6d5045f252ed7b786ad19=
3faced64"
>>>>>>>>>>
>>>>>>>>>> Fails with this error:
>>>>>>>>>> | ccache arm-angstrom-linux-gnueabi-gcc  -march=3Darmv7-a
>>>>>>>>>> -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=3Dsoftf=
p
>>>>>>>>>> -mfpu=3Dneon
>>>>>>>>>> -mtune=3Dcortex-a8 -mthumb-interwork -mno-thumb
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> --sysroot=3D/local/new-angstrom/build/tmp-angstrom_2010_x-egli=
bc/sysroots/beagleboard
>>>>>>>>>> -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g
>>>>>>>>>> -feliminate-unused-debug-types -Wall -c walk_test.c
>>>>>>>>>> | libcg_ba.cpp:18:18: fatal error: string: No such file or dir=
ectory
>>>>>>>
>>>>>>> Does this happen with lastest angstrom on oe-core ? or classic oe=
.dev
>>>>>>> I am unable to reproduce it on my end
>>>>>>
>>>>>> Latest angstrom with layers as above.
>>>>>
>>>>> strange, I have it working well for qemuarm and I cant imagine how =
C++
>>>>> headers could be broken for beagle
>>>>
>>>> Maybe you could try it using the Angstrom tools?  Here's the [docume=
nted]
>>>> sequence I used:
>>>>    % MACHINE=3D"beagleboard" ./oebb.sh config beagleboard
>>>>    ... adjust conf/site.conf for my local DL_DIR
>>>>    ... adjust conf/local.conf to include MACHINE=3Dbeagleboard, set =
parallel
>>>> build flags, etc
>>>>    ... removed all meta-intel repos from conf/bblayers.conf (to avoi=
d xorg-dri
>>>> issues)
>>>>    % . ~/.oe/environment-oecore
>>>>    % bitbake systemd-image
>>>>
>>>
>>> needless to say thats what I have done
>>> but for qemuarm
>>
>> Just making sure :-)  I'll try qemuarm here with the same setup.
>>
>>
> Hmm few days ago I had unexplainable effects about iostream [1] which c=
ould be cleaned by rebuild (and I swear I have seen same for string befor=
e)
>
> Some race / parallel install issue?
>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October=
/010869.html

If it fails for me again using qemuarm, I'll try a fresh build
where I don't try to run full-out -I normally run with:
   BB_NUMBER_THREADS =3D "4"
   PARALLEL_MAKE =3D "-j 4"
on a 4-core machine.

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


