Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P7v2h-0006Sa-B5
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 21:06:44 +0200
Received: by ywl5 with SMTP id 5so703164ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 12:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=vxCEbms1iH9fuQXgDb5ojKmoaGGd/6tMMnM71KxlHSE=;
	b=M7WSZ1SoA8l4mSA/+TFoZdRnUGFiqrjbBl6Z7fv3cVnnoMaN5OFtkICg1oQBmXVFCH
	i8vj38OUNxFUl78SI6bAfdgiKbzlGAYSwnIqWnQjuDrjpWjt7AD1Cc+PwyIcUNRX4AE5
	TC1dSmPosN2Pg0cX4d96L+11vvb8vXsecb1dc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=nmlUbGuyyz9Z/Qrl7GW3MPpFLgCmrub+sNmIk7Oot6JjVxc7Rat9uRIQhDmnSS30aK
	RvnWuyiKSggnq6DzfTmNhQOlQyj0ipx9z43GFgMkYxHAiqIpQRo5puH/fZJxKDBM0om5
	V1NOFlYaHwSBwU/AfgfiXOpiZzA8dQfOMWbts=
Received: by 10.90.102.15 with SMTP id z15mr2062120agb.18.1287428765399; Mon,
	18 Oct 2010 12:06:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Mon, 18 Oct 2010 12:05:44 -0700 (PDT)
In-Reply-To: <4CBC7F6A.9040000@atmel.com>
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>
	<201010181520.30454.marcin@juszkiewicz.com.pl>
	<4CBC4DD4.3010908@atmel.com>
	<i9hpii$gf2$1@dough.gmane.org> <4CBC7F6A.9040000@atmel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Oct 2010 12:05:44 -0700
Message-ID: <AANLkTi=xBMvDEKjiaNKy7zijs4DCZwhrSDr=gHVkMh_T@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/5] Use common files for AT91SAM9 configuration
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
X-List-Received-Date: Mon, 18 Oct 2010 19:06:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 18, 2010 at 10:10 AM, Ulf Samuelsson
<ulf.samuelsson@atmel.com> wrote:
> Koen Kooi skrev:
>> On 18-10-10 15:38, Ulf Samuelsson wrote:
>>> Marcin Juszkiewicz skrev:
>>>> Dnia sobota, 16 pazdziernika 2010 o 14:50:02 ulf.samuelsson@atmel.com
>>>> napisaB(a):
>>>>
>>>>> +++ b/conf/machine/include/at91-2.6.30.inc
>>>>> +++ b/conf/machine/include/at91-2.6.32.inc
>>>> Do you plan to duplicate that file with each kernel you will produce?
>>>> Create include/at91-sam9.inc and put it there.
>>>>
>>>> Regards,
>>> This is to allow different kernel versions for different AT91 chips.
>>> This allows both a "stable" version, and a development kernel
>>> to be easily handled.
>>
>>> The file defines (amongst other things) the
>>> * kernel version,
>>> * u-boot version
>>> * at91bootstrap version
>>> so you need one file per version.
>>
>> NAK! Machines don't get to decide versions! Please revert that commit
>> and come up with a better way, e.g. default_preference in the recipes or
>> distro include files.
>
> If I look at the machine files, almost all of them provide
> a preferred kernel / u-boot. Some also provide version.

we should avoid pinning versions there. Choosing a type is fine.

>
> The patch will move the definition from the machine file to the include
> file for a few board, so reverting the patch will not solve the problem,
> just spread it out into multiple files.
> The patch also adds some boards.

it pins a kernel version thats not ok IMO. You should pin this in the
kernel recipes
instead for the machines that should use it using PREFERRED_VERSIONS

>
> Having default preference in recipes is not going to make it easy to
> switch between version so I don't like that method at all.
>

what do you mean by easy here ? Its not difficult to change two
priority numbers. I think we should try to remain inline with our
policies
whatever they are otherwise it will create confusion.

>
> Using the distro to select boot and kernel, seems flawed since none of
> the stuff will reside in the file system (my file system)
> but at least this is easily maintainable.
>

usually in OE distros set policy with sufficient knowledge of machine
characteristics
you can think of ways to use this approach. distro does not decide on
which kernel or u-boot
these are machine specific recipes and you decide which one to feed
for which machine in the recipe.

> The best right now seems to be to make a new distro file for each kernel
> version, which just includes Angstrom and adds version info for kernel,
> u-boot and at91bootstrap.
>
> Long term, I think that there should be something equivalent to DISTRO
> for the files outside the file system, and that you should be able to
> select between multiple variants like you select a DISTRO today,
> but I am not yet into bitbake, so I can't tell where to start.
>
> Since the reversal of the patch, wont solve anything,
> I suggest we agree on how to proceed, and then do the fixes.
> Is including Angstrom from a kernel specific distro file OK?



>
> If a distro file is to include another file, then
> you have to be able to tell different kernels for
>
>
> I guess we could do:
>
> require =C2=A0 conf/distro/include/$(SOC_FAMILY).inc
>
> conf/distro/include/at91.inc would contain:
>
>
> PREFERRED_VERSION_at91bootstrap =3D "2.13"
> PREFERRED_VERSION_u-boot =3D "2009.11"

why is all this needed ?

>
> Not sure how to do machine dependent kernel version
>
> PREFERRED_VERSION_linux_at91sam9g45ek =3D "2.6.30"
> does not feel like it would work.
> Ideas?
>
>
>
>
> --------------------------------------------
>
> ulf@bulwark:~/Skrivbord/home/projects/OE_atmel/openembedded/conf/machine$
> grep PREFERRED_VERSION_linux *
> acern30.conf:PREFERRED_VERSION_linux ?=3D "2.6.14"
> at32stk1000.conf:PREFERRED_VERSION_linux =3D "2.6.28"
> at91cap9adk.conf:PREFERRED_VERSION_linux =3D "2.6.28"
> at91-l9260.conf:PREFERRED_VERSION_linux =3D "2.6.25"
> at91sam9260ek.conf:PREFERRED_VERSION_linux =3D "2.6.28"
> at91sam9261ek.conf:PREFERRED_VERSION_linux =3D "2.6.28"
> at91sam9263ek.conf:PREFERRED_VERSION_linux =3D "2.6.28"
> at91sam9rlek.conf:PREFERRED_VERSION_linux =3D "2.6.28"
> canyonlands.conf:PREFERRED_VERSION_linux =3D "2.6.26"
> ea3250.conf:PREFERRED_VERSION_linux-ea3250 =3D "2.6.27.8"
> eee701.conf:PREFERRED_VERSION_linux ?=3D "2.6.33"
> em-x270.conf:PREFERRED_VERSION_linux =3D "2.6.23"
> gesbc-9302.conf:PREFERRED_VERSION_linux ?=3D "2.6.24"
> ghi270.conf:PREFERRED_VERSION_linux-handhelds-2.6 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D
> "2.6.21-hh11"
> jornada6xx.conf:PREFERRED_VERSION_linux-jlime-jornada6xx =3D "2.6.32"
> kixrp435.conf:PREFERRED_VERSION_linux =3D "2.6.30"
> lsmipsel.conf:PREFERRED_VERSION_linux-lsmipsel =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D "2.6.23.17"
> micro2440.conf:# PREFERRED_VERSION_linux =3D "2.6.29"
> n1200.conf:PREFERRED_VERSION_linux-n1200 =3D "2.6.27-rc9+git"
> n2100.conf:PREFERRED_VERSION_linux =3D "2.6.20"
> netvista.conf:PREFERRED_VERSION_linux =3D "2.6.23"
> rx1950.conf:PREFERRED_VERSION_linux =3D "2.6.35"
> sarge-at91.conf:PREFERRED_VERSION_linux =C2=A0=3D "2.6.21"
> stamp9g20evb.conf:PREFERRED_VERSION_linux =3D "2.6.29"
> storcenter.conf:PREFERRED_VERSION_linux-storcenter =3D "2.6.27.7"
> tx25.conf:PREFERRED_VERSION_linux =3D "2.6.29+2.6.30-rc4"
> tx27.conf:PREFERRED_VERSION_linux =3D "2.6.28"
>
>
> ulf@bulwark:~/Skrivbord/home/projects/OE_atmel/openembedded/conf/machine$
> grep "PREFERRED_PROVIDER_virtual/kernel" *
> acern30.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> adsp-bf537-stamp.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-bfin"
> adzs-bf538f-ezlite.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-bfin=
"
> adzs-bf548-ezlite.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-bfin"
> alix.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> am3517-evm.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap-psp"
> am37x-evm.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap-psp"
> amsdelta.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-amsdelta-2.6"
> archos5.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap-archos"
> archos5it.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap-archos"
> asus620.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> asus730.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> at2440evb.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> at32stk1000.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> at91cap9adk.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> at91-l9260.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> at91sam9260ek.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> at91sam9261ek.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> at91sam9263ek.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> at91sam9rlek.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> atngw100.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> aximx50.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> babbage.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> bd-neon.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> beagleboard.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap-psp"
> ben-nanonote.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-jlime-ben"
> boc01.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> bug20.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap-hah"
> bug.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-bug"
> calamari.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> canyonlands.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> chumby.conf:PREFERRED_PROVIDER_virtual/kernel =3D "${MACHINE}-kernel"
> chumby-falconwing.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-imx"
> cm-x270.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> cm-x300.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> colinux.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-colinux"
> cs-e9302.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> d201gly2.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> davinci-sffsdr.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-davinci"
> db1200.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> devkitidp-pxa255.conf:PREFERRED_PROVIDER_virtual/kernel =3D "${MACHINE}"
> dht-walnut.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-${MACHINE}"
> dm37x-evm.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap-psp"
> dockstar.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> ea3250.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-ea3250"
> eee701.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> efika.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-rt"
> efikamx.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-efikamx"
> em-x270.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> ep93xx.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> epia.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-epia"
> er0100.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-er0100"
> eseries.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> eteng500.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> eten-m800.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-eten"
> fsg3be.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "fsg3-kernel"
> gamecube.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> geodegx.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-geodegx"
> geodelx.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-geodelx"
> gesbc-9302.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> ghi270.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> guinness.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-x86"
> h1910.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> h1940.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-h1940"
> h2200.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> h3600.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> h3900.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> h4000.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> h5000.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> h6300.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-h6300-omap1"
> hipox.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> htcalpine.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6=
"
> htcapache.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6=
"
> htcblueangel.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-=
2.6"
> htcdream.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-leviathan"
> htchimalaya.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2=
.6"
> htcsable.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> htctornado.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-tornado-omap=
2"
> htcuniversal.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-=
2.6"
> htcwallaby.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.=
6"
> hx2000.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-rp"
> hx4700.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> i586-generic.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> i686-generic.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> iei-nanogx-466.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> igep0020.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-igep2"
> imote2.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-zigbee"
> ion.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> jornada56x.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.=
6"
> jornada6xx.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-jlime-jornad=
a6xx"
> jornada7xx.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-jlime-jornad=
a7xx"
> kb9202.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> kilauea.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> kixrp435.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> ks8695.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-${MACHINE}"
> lite5200.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> logicpd-pxa270.conf:PREFERRED_PROVIDER_virtual/kernel =3D "${MACHINE}"
> looxc550.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> lsmipsel.conf:PREFERRED_PROVIDER_virtual/kernel =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "linux-lsmipsel"
> m8050.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> magicbox.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-${MACHINE}"
> magician.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> mainstone.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-${MACHINE}"
> mh355.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> micro2440.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-mini2440"
> micro2440.conf:# PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> mini2440.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-mini2440"
> mini6410.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> mnci.conf:PREFERRED_PROVIDER_virtual/kernel =3D "mnci-ramses"
> mp900c.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-jlime-mobilepro9=
00"
> mpc8313e-rdb.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> mpc8315e-rdb.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> mpc8323e-rdb.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> mpc8544ds.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> mpc8641-hpcn.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> mtx-1.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-mtx-1"
> mtx-2.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-mtx-2"
> mtx-3a.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-mtx-3a"
> mtx-3.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-mtx-3"
> mx21ads.conf:PREFERRED_PROVIDER_virtual/kernel =3D "${MACHINE}-kernel"
> mx27ads.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> mx31ads.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> mx31moboard.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> n1200.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-n1200"
> n2100.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> native.conf:PREFERRED_PROVIDER_virtual/kernel =3D "native-kernel"
> navman-icn330.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-navman"
> neek.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-nios2"
> netbook-pro.conf:PREFERRED_PROVIDER_virtual/kernel =3D "${MACHINE}-kernel=
"
> netvista.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> neuros-osd2.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-neuros"
> neuros-osd.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-neuros"
> nhk15.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> nokia770.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-nokia800"
> nokia800.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-nokia800"
> nokia900.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> om-3d7k.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-openmoko-2.6.2=
9"
> omap1510inn.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap-2.6"
> omap1610h2.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap-2.6"
> omap1710h3.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap1"
> omap2420h4.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap2"
> omap2430sdp.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap2"
> omap3evm.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap-psp"
> omap3-pandora.conf:PREFERRED_PROVIDER_virtual/kernel =3D "${MACHINE}-kern=
el"
> omap3-touchbook.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap-ps=
p"
> omap4430-panda.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap4"
> omap5912osk.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> omapzoom2.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap-zoomsync=
"
> omapzoom36x.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap-zoomsy=
nc"
> omapzoom.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap"
> om-gta01.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-openmoko-2.6.=
29"
> om-gta02.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-openmoko-2.6.=
34"
> overo.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap-psp"
> p1020rdb.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> p2020ds.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> palmpre.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-palmpre"
> palmtt.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-palm-omap1"
> palmz71.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-palm-omap1"
> progear.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> qemuarm.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> qemumips64.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> qemumips.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> qemumipsel.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> qemuppc.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> qemush4.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> qemux86.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> rb500.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-rb500"
> ronetix-pm9261.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> ronetix-pm9263.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> rt3000.conf:PREFERRED_PROVIDER_virtual/kernel =3D "rt3000"
> rx1950.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> rx3000.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-handhelds-2.6"
> sarge-at91.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> sequoia.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> sgh-i900.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-sgh-i900"
> sh7785lcr.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> shark.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-z"
> simpad.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> smartq5.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> smartqv7.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> smdk2440.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-smdk2440"
> smdk2443.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-smdk2443"
> smdk6410.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> stamp9g20evb.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> stb225.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> storcenter.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-storcenter"
> sun4cdm.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-sun4cdm"
> titan.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-titan-sh4"
> topas910.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> tqm8540.conf:PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> triton.conf:PREFERRED_PROVIDER_virtual/kernel =3D "triton-kernel"
> ts72xx.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> tx25.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> tx27.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> wgt634u.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-brcm"
> vmware.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> vortex86sx.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> wrap.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> wrt54.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-wrt"
> x86-32-nocona.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-x86"
> x86.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> x86-prescott.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-x86"
> x86-uml.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-uml"
> xilinx-ml403.conf:#PREFERRED_PROVIDER_virtual/kernel =3D "linux-xilinx-sl=
ab"
> xilinx-ml410.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-${MACHINE}=
"
> xilinx-ml507.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-xilinx-ml5=
07"
> xilinx-virtex4.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-xilinx"
> xilinx-virtex5.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-xilinx"
> xo.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-xo"
> xxs1500.conf:PREFERRED_PROVIDER_virtual/kernel =3D "linux-xxs1500"
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


