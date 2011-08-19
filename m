Received: from smarthost.techfak.uni-bielefeld.de ([129.70.137.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sherbrec@cit-ec.uni-bielefeld.de>)
	id 1QuSTk-00027b-6D for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 19:03:32 +0200
Received: from [192.168.1.122] (blfd-4db18788.pool.mediaWays.net
	[77.177.135.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: sherbrec)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id 148059A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 18:58:51 +0200 (CEST)
Message-ID: <4E4E964A.6090607@cit-ec.uni-bielefeld.de>
Date: Fri, 19 Aug 2011 18:58:50 +0200
From: Stefan Herbrechtsmeier <sherbrec@cit-ec.uni-bielefeld.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20110818131043.GC26690@golden>	<1313689684.7918.2.camel@eng-phousel-ubuntu>	<4E4E2DFB.5050106@cit-ec.uni-bielefeld.de>	<4E4E62AB.1050603@balister.org>
	<4E4E7416.1070105@gmail.com>
In-Reply-To: <4E4E7416.1070105@gmail.com>
Subject: Re: [beagleboard] Unable to build Angstrom meta-toolchain
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
X-List-Received-Date: Fri, 19 Aug 2011 17:03:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 19.08.2011 16:32, schrieb Khem Raj:
> On 8/19/2011 6:18 AM, Philip Balister wrote:
>> On 08/19/2011 02:33 AM, Stefan Herbrechtsmeier wrote:
>>> Am 18.08.2011 19:48, schrieb Peter Housel:
>>>> On Thu, 2011-08-18 at 15:10 +0200, fabian b=C3=BCttner wrote:
>>>>> Hi,
>>>>>
>>>>> I am having troubles compiling the Angstrom SDK.
>>>>>
>>>>> I used the angstrom-setup-scripts to configure OE, sourced the
>>>>> environment settings and built the base-image/console-image with
>>>>> bitbake.
>>>>>
>>>>> While trying to compile the meta-toolchain, just when bitmake=20
>>>>> finishes
>>>>> downloading task-sdk-bare_1.0-r2.6_armv7a.ipk, I am getting an erro=
r
>>>>> output like this:
>>>>>
>>>>> http://pastie.org/2390409
>>>>>
>>>>> After that, I tried building the meta-toolchain(i did a bitmake cle=
an
>>>>> meta-toolchain) without '-j2' but the error I receive is ultimately
>>>>> the same:
>>>>> * satisfy_dependencies_for: Cannot satisfy the following dependenci=
es
>>>>> * for task-sdk-bare:
>>>>> * libstdc++-dev *
>>>>> * opkg_install_cmd: Cannot install package task-sdk-bare.
>>>>>
>>>>> Unfortunately I am too unexperienced with OE/Angstrom to fix bugs
>>>>> like that.
>>>>> Maybe someone could give me a hint how to get around this=20
>>>>> show-stopper?
>>>> I can confirm that I've been seeing this as well on recent
>>>> 2011.03-maintenance, but haven't had a chance to troubleshoot the ro=
ot
>>>> cause yet.
>>>>
>>> It was inbtroduced with commit 105d881227d06f31c180dffb777ee63361b2f2=
b8
>>> "gcc: Package libstdc++ gdb python helpers into dev package".
>>> If no helpers exist the empty package will not be generated.
>>> I have try to add
>>> ALLOW_EMPTY_libstdc++-dev =3D "1"
>>> to gcc-package-cross.inc but this breaks meta-toolchain as the files =
in
>>> ${prefix}/${TARGET_SYS}/usr/include/c++ are missing.
>>>
>>> Only removing libstdc++-dev package from gcc-package-cross.inc fix th=
e
>>> problem.
>>
>> Does anyone know if dv has the same problem? I can't check easily at t=
he
>> moment.
>
> what happens if you remove  libstdc++-dev libgcc-dev from PACKAGES in=20
> recipes/gcc/gcc-package-cross.inc ?
Maybe I was not precise enough above, but removing libstdc++-dev from=20
PACKAGES
in recipes/gcc/gcc-package-cross.inc and bump INC_PR in gcc-4.3.3.inc=20
fix the problems.




