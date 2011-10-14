Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1REZc0-0001E6-0Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 06:43:12 +0200
Received: by eyd9 with SMTP id 9so805567eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 21:37:27 -0700 (PDT)
Received: by 10.213.17.203 with SMTP id t11mr1120513eba.19.1318567046235;
	Thu, 13 Oct 2011 21:37:26 -0700 (PDT)
Received: from mail-ey0-f175.google.com (mail-ey0-f175.google.com
	[209.85.215.175])
	by mx.google.com with ESMTPS id y11sm719998eej.5.2011.10.13.21.37.24
	(version=SSLv3 cipher=OTHER); Thu, 13 Oct 2011 21:37:25 -0700 (PDT)
Received: by eyd9 with SMTP id 9so805543eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 21:37:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.213.13.15 with SMTP id z15mr1091397ebz.25.1318567043918; Thu,
	13 Oct 2011 21:37:23 -0700 (PDT)
Received: by 10.213.35.14 with HTTP; Thu, 13 Oct 2011 21:37:23 -0700 (PDT)
In-Reply-To: <4E975444.3050507@mlbassoc.com>
References: <4E96E9FE.1060005@mlbassoc.com>
	<CAMKF1sp9HPM8DzxTSuhUKY7-q4QuDPNkDQ2TAQPwoGkZ+Gu4eg@mail.gmail.com>
	<4E974E38.5050807@mlbassoc.com>
	<201110132258.27380.schnitzeltony@gmx.de>
	<4E975444.3050507@mlbassoc.com>
Date: Fri, 14 Oct 2011 00:37:23 -0400
Message-ID: <CA+T6QPkOQgFSmSsNaaeCOM5zNtzaNcCzgVaXr=t_5jj902w11Q@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 14 Oct 2011 04:43:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 5:12 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2011-10-13 14:58, Andreas M=FCller wrote:
>>
>> On Thursday, October 13, 2011 10:46:48 PM Gary Thomas wrote:
>>>
>>> On 2011-10-13 14:44, Khem Raj wrote:
>>>>
>>>> On Thu, Oct 13, 2011 at 1:42 PM, Gary Thomas<gary@mlbassoc.com> =A0 wr=
ote:
>>>>>
>>>>> On 2011-10-13 14:33, Khem Raj wrote:
>>>>>>
>>>>>> On Thu, Oct 13, 2011 at 11:57 AM, Gary Thomas<gary@mlbassoc.com>
>>>>>> wrote:
>>>>>>>
>>>>>>> On 2011-10-13 12:48, Khem Raj wrote:
>>>>>>>>
>>>>>>>> On Thu, Oct 13, 2011 at 7:28 AM, Gary Thomas<gary@mlbassoc.com>
>>>>>>>> =A0 wrote:
>>>>>>>>>
>>>>>>>>> On 2011-10-13 08:16, Kridner, Jason wrote:
>>>>>>>>>>
>>>>>>>>>> On Oct 13, 2011, at 8:39 AM, "Gary Thomas"<gary@mlbassoc.com>
>>>>>>>>>> =A0 wrote:
>>>>>>>>>>
>>>>>>>>>>> Trying to follow the Angstrom instructions directly.
>>>>>>>>>>>
>>>>>>>>>>> OE Build Configuration:
>>>>>>>>>>> BB_VERSION =A0 =A0 =A0 =A0=3D "1.13.3"
>>>>>>>>>>> TARGET_ARCH =A0 =A0 =A0 =3D "arm"
>>>>>>>>>>> TARGET_OS =A0 =A0 =A0 =A0 =3D "linux-gnueabi"
>>>>>>>>>>> MACHINE =A0 =A0 =A0 =A0 =A0 =3D "beagleboard"
>>>>>>>>>>> DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D "angstrom"
>>>>>>>>>>> DISTRO_VERSION =A0 =A0=3D "v2011.10-core"
>>>>>>>>>>> TUNE_FEATURES =A0 =A0 =3D "armv7a vfp neon cortexa8"
>>>>>>>>>>> TARGET_FPU =A0 =A0 =A0 =A0=3D "vfp-neon"
>>>>>>>>>>> meta-angstrom =A0 =A0 =3D
>>>>>>>>>>> "master:66263650f8548d6b0b5f593ab728f536d5e05a9f"
>>>>>>>>>>> meta-oe
>>>>>>>>>>> meta-efl
>>>>>>>>>>> meta-gpe
>>>>>>>>>>> meta-gnome
>>>>>>>>>>> meta-xfce =A0 =A0 =A0 =A0 =3D
>>>>>>>>>>> "master:1e5d73ec4f44200104de085838f04e31a49435da"
>>>>>>>>>>> meta-ti =A0 =A0 =A0 =A0 =A0 =3D
>>>>>>>>>>> "master:3530f1025efc3792334b897a4e70c6d5822ef56d"
>>>>>>>>>>> meta =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D
>>>>>>>>>>> "master:5ad1ca59dea6d5045f252ed7b786ad193faced64"
>>>>>>>>>>>
>>>>>>>>>>> Fails with this error:
>>>>>>>>>>> | ccache arm-angstrom-linux-gnueabi-gcc =A0-march=3Darmv7-a
>>>>>>>>>>> -fno-tree-vectorize =A0 =A0 =A0-mthumb-interwork -mfloat-abi=3D=
softfp
>>>>>>>>>>> -mfpu=3Dneon
>>>>>>>>>>> -mtune=3Dcortex-a8 -mthumb-interwork -mno-thumb
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> --sysroot=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglib=
c/sysroots/beagleboard
>>>>>>>>>>> -DHAVE_CONFIG_H -I. -I.. -I../include =A0 =A0-O2 -pipe -g
>>>>>>>>>>> -feliminate-unused-debug-types -Wall -c walk_test.c
>>>>>>>>>>> | libcg_ba.cpp:18:18: fatal error: string: No such file or
>>>>>>>>>>> directory
>>>>>>>>
>>>>>>>> Does this happen with lastest angstrom on oe-core ? or classic
>>>>>>>> oe.dev
>>>>>>>> I am unable to reproduce it on my end
>>>>>>>
>>>>>>> Latest angstrom with layers as above.
>>>>>>
>>>>>> strange, I have it working well for qemuarm and I cant imagine how C=
++
>>>>>> headers could be broken for beagle
>>>>>
>>>>> Maybe you could try it using the Angstrom tools? =A0Here's the
>>>>> [documented]
>>>>> sequence I used:
>>>>> =A0 % MACHINE=3D"beagleboard" ./oebb.sh config beagleboard
>>>>> =A0 ... adjust conf/site.conf for my local DL_DIR
>>>>> =A0 ... adjust conf/local.conf to include MACHINE=3Dbeagleboard, set
>>>>> parallel
>>>>> build flags, etc
>>>>> =A0 ... removed all meta-intel repos from conf/bblayers.conf (to avoi=
d
>>>>> xorg-dri
>>>>> issues)
>>>>> =A0 % . ~/.oe/environment-oecore
>>>>> =A0 % bitbake systemd-image
>>>>>
>>>>
>>>> needless to say thats what I have done
>>>> but for qemuarm
>>>
>>> Just making sure :-) =A0I'll try qemuarm here with the same setup.
>>>
>>>
>> Hmm few days ago I had unexplainable effects about iostream [1] which
>> could be cleaned by rebuild (and I swear I have seen same for string bef=
ore)
>>
>> Some race / parallel install issue?
>>
>> [1]
>> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/0108=
69.html
>
> If it fails for me again using qemuarm, I'll try a fresh build
> where I don't try to run full-out -I normally run with:
> =A0BB_NUMBER_THREADS =3D "4"
> =A0PARALLEL_MAKE =3D "-j 4"
> on a 4-core machine.
>

I started over and reduced my BB_NUMBER_THREADS to 2, but left my
PARALLEL_MAKE at -j24 and the issue went away.  I had it set for 8
threads before when it failed.


