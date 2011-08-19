Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QuXGv-0002Z5-8c
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Aug 2011 00:10:37 +0200
Received: by pzk2 with SMTP id 2so7670451pzk.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=LFXgR7GAGw217W328p+H/+LEU1tZ+Tz+AAT8TNw/zq0=;
	b=yGs98SlkXq9uY46GR9ClXwP/8QpW8BCsA4IMBkEp758rNx/IsDHXCWnD0na47rIdYW
	HmV+6Zb3ab5or15mWn9D44nFadpA9ylAkP/TpPn6tsUX5uAfkZoK54GPntdIIEkOpj/M
	Zh1l4ajWQefgcpwFXNi7MzwEuC9GL/TXE/tAk=
Received: by 10.142.215.10 with SMTP id n10mr117290wfg.290.1313791555153; Fri,
	19 Aug 2011 15:05:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.40.168 with HTTP; Fri, 19 Aug 2011 15:05:24 -0700 (PDT)
In-Reply-To: <20110819210316.GB3730@golden>
References: <20110818131043.GC26690@golden>
	<1313689684.7918.2.camel@eng-phousel-ubuntu>
	<4E4E2DFB.5050106@cit-ec.uni-bielefeld.de>
	<4E4E62AB.1050603@balister.org>
	<4E4E7416.1070105@gmail.com> <20110819210316.GB3730@golden>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Aug 2011 15:05:24 -0700
Message-ID: <CAMKF1squXK1aVRy7pHtL_X9niEn6_pJiuTMao8Dd_32o042YEA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 19 Aug 2011 22:10:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2011 at 2:03 PM, fabian b=C3=BCttner <fabian-buettner@gmx.d=
e> wrote:
> On 07:32 Fri 19 Aug =C2=A0 =C2=A0 , Khem Raj wrote:
>> On 8/19/2011 6:18 AM, Philip Balister wrote:
>> > On 08/19/2011 02:33 AM, Stefan Herbrechtsmeier wrote:
>> >> Am 18.08.2011 19:48, schrieb Peter Housel:
>> >>> On Thu, 2011-08-18 at 15:10 +0200, fabian b=C3=BCttner wrote:
>> >>>> Hi,
>> >>>>
>> >>>> I am having troubles compiling the Angstrom SDK.
>> >>>>
>> >>>> I used the angstrom-setup-scripts to configure OE, sourced the
>> >>>> environment settings and built the base-image/console-image with
>> >>>> bitbake.
>> >>>>
>> >>>> While trying to compile the meta-toolchain, just when bitmake finis=
hes
>> >>>> downloading task-sdk-bare_1.0-r2.6_armv7a.ipk, I am getting an erro=
r
>> >>>> output like this:
>> >>>>
>> >>>> http://pastie.org/2390409
>> >>>>
>> >>>> After that, I tried building the meta-toolchain(i did a bitmake cle=
an
>> >>>> meta-toolchain) without '-j2' but the error I receive is ultimately
>> >>>> the same:
>> >>>> * satisfy_dependencies_for: Cannot satisfy the following dependenci=
es
>> >>>> * for task-sdk-bare:
>> >>>> * libstdc++-dev *
>> >>>> * opkg_install_cmd: Cannot install package task-sdk-bare.
>> >>>>
>> >>>> Unfortunately I am too unexperienced with OE/Angstrom to fix bugs
>> >>>> like that.
>> >>>> Maybe someone could give me a hint how to get around this show-stop=
per?
>> >>> I can confirm that I've been seeing this as well on recent
>> >>> 2011.03-maintenance, but haven't had a chance to troubleshoot the ro=
ot
>> >>> cause yet.
>> >>>
>> >> It was inbtroduced with commit 105d881227d06f31c180dffb777ee63361b2f2=
b8
>> >> "gcc: Package libstdc++ gdb python helpers into dev package".
>> >> If no helpers exist the empty package will not be generated.
>> >> I have try to add
>> >> ALLOW_EMPTY_libstdc++-dev =3D "1"
>> >> to gcc-package-cross.inc but this breaks meta-toolchain as the files =
in
>> >> ${prefix}/${TARGET_SYS}/usr/include/c++ are missing.
>> >>
>> >> Only removing libstdc++-dev package from gcc-package-cross.inc fix th=
e
>> >> problem.
>> >
>> > Does anyone know if dv has the same problem? I can't check easily at t=
he
>> > moment.
>>
>> what happens if you remove =C2=A0libstdc++-dev libgcc-dev from PACKAGES =
in
>> recipes/gcc/gcc-package-cross.inc ?
>> I will see if I can reproduce it here
>> >
>> > Philip
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> Hi Khem,
>
> I removed libstdc++-dev and I was able to build meta-toolchain.
>

OK now can you send me list of files you have in
packages-split dir in gcc-cross build tree do

$ find

and send the output please

> regards,
> fabian
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


