Received: from [85.158.138.51] (helo=mail174.messagelabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <luciani@microsol.ie>) id 1M9eVx-0005jM-Em
	for openembedded-devel@openembedded.org; Thu, 28 May 2009 14:15:19 +0200
X-VirusChecked: Checked
X-Env-Sender: luciani@microsol.ie
X-Msg-Ref: server-9.tower-174.messagelabs.com!1243512417!15855206!1
X-StarScan-Version: 6.0.0; banners=microsol.ie,-,-
X-Originating-IP: [87.198.251.22]
Received: (qmail 13484 invoked from network); 28 May 2009 12:06:58 -0000
Received: from 87-198-251-22.ptr.magnet.ie (HELO mail.microsol.ie)
	(87.198.251.22)
	by server-9.tower-174.messagelabs.com with RC4-SHA encrypted SMTP;
	28 May 2009 12:06:58 -0000
Received: from mail.microsol.ie ([192.168.32.3]) by mail.microsol.ie
	([192.168.32.3]) with mapi; Thu, 28 May 2009 13:06:57 +0100
From: Lucian Ion <luciani@microsol.ie>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 28 May 2009 13:06:56 +0100
Thread-Topic: [oe] console-image trying to build X?
Thread-Index: AcnfQh7sd6nDC87yQAimdXmcTqPZLgARX5cJ
Message-ID: <974C3B6C9F0A4A43918BACCA33390AC270D44F3459@mail.microsol.ie>
References: <87d49uaq9f.wl%peter@chubb.wattle.id.au>
In-Reply-To: <87d49uaq9f.wl%peter@chubb.wattle.id.au>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, en-IE
MIME-Version: 1.0
Subject: Re: console-image trying to build X?
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
X-List-Received-Date: Thu, 28 May 2009 12:15:21 -0000
Content-Language: en-IE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi=20Peter,

I=20had=20the=20same=20problem=20after=20updating=20today.

I've=20removed=20the=20files=20'xproto_7.0.15.bb'=20'xproto-native_7.0.15.=
bb'=20'xproto-sdk_7.0.15.bb'=20from
~/stuff/openembedded/recipes/xorg-proto

Then=20bitbake=20console-mage=20completed=20succesfully.

MACHINE=20=3D=20"qemuarm"
I've=20moved=20files=20to=20a=20ex3=20file=20system

qemu-img=20create=20-fraw=20hda.img=20160M
mkfs.ext3=20hda.img
sudo=20losetup=20/dev/loop0=20hda.img
sudo=20mount=20/dev/loop0=20/mnt/jffs2
cd=20/mnt/jffs2/
sudo=20tar=20-xf=20~/stuff/tmp/deploy/glibc/images/qemuarm/Angstrom-consol=
e-image-glibc-ipk-2009.X-test-20090528-qemuarm.rootfs.tar
cd=20~/.qemu
sudo=20umount=20/mnt/jffs2
sudo=20losetup=20-d=20/dev/loop0

start:
qemu-system-arm=20=20-M=20versatilepb=20-show-cursor=20-m=2064=20-kernel=20=
zImage-2.6.25+2.6.26-rc4-r6-qemuarm.bin=20-drive=20file=3Dhda.img=20-appen=
d=20"root=3D/dev/sda"

The=20boot=20freeze.=20The=20last=20message:

Thu=20May=2028=2012:53:00=20UTC=202009
hwclock:=20can't=20open=20'/dev/misc/rtc':=20No=20such=20file=20or=20direc=
tory

Anyone=20managed=20to=20start=20this=20image=20on=20qemu?
Do=20I=20need=20to=20use=20the=20buid=20qemu=20or=20the=20one=20from=20ubu=
ntu=20distro=20will=20do?

Regards,
Lucian=20Ion
Software=20Engineer
Microsol=20Ltd.

________________________________________
From:=20openembedded-devel-bounces@lists.openembedded.org=20[openembedded-=
devel-bounces@lists.openembedded.org]=20On=20Behalf=20Of=20Peter=20Chubb=20=
[peter.chubb@nicta.com.au]
Sent:=2028=20May=202009=2003:57
To:=20openembedded-devel@lists.openembedded.org
Subject:=20[oe]=20console-image=20trying=20to=20build=20X?

Hi,
=20=20=20=20=20=20=20=20I'm=20using=20the=20tip-of-tree=20as=20of=20this=20=
morning=20openembedded
recipes=20to=20build=20a=20console=20image=20for=20the=20Beagleboard.=20=20=
After=20a=20while,
I=20see:
...
NOTE:=20collecting=20binary=20locales=20from=20locale=20tree
NOTE:=20Multiple=20libraries=20(libnss_nis.so.2,=20libnss_nisplus.so.2,=20=
libnss_hesiod.so.2)=20found,=20but=20LEAD_SONAME=20'libc.so'=20doesn't=20m=
atch=20any=20of=20them
NOTE:=20Couldn't=20find=20shared=20library=20provider=20for=20libgcc_s.so.=
1
NOTE:=20Tasks=20Summary:=20Attempted=20554=20tasks=20of=20which=200=20didn=
't=20need=20to=20be=20rerun=20and=201=20failed.
ERROR:=20'/home/peterc/src/OpenEmbedded/openembedded/recipes/xorg-proto/xp=
roto-native_7.0.15.bb'=20failed

Why=20are=20the=20recipes=20even=20trying=20to=20build=20X=20for=20a=20con=
sole-image?=20=20(to
me,=20console=20means=20no=20X=20or=20graphics)=20And=20how=20can=20I=20wo=
rk=20out=20how=20to=20fix
the=20error?

--
Dr=20Peter=20Chubb=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20peter=20DOT=20chubb=20AT=20nicta.com.au
http://www.ertos.nicta.com.au=20=20=20=20=20=20=20=20=20=20=20ERTOS=20with=
in=20National=20ICT=20Australia
=20=20=20=20=20=20=20=20=20=20=20Kernel=20Engineering=20Group=20(KEG):=20W=
here=20Systems=20Brew.

_______________________________________________
Openembedded-devel=20mailing=20list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

________________________________________________________________________
This=20email=20has=20been=20scanned=20for=20all=20viruses.
________________________________________________________________________

_______________________________________________________________________

This=20email=20and=20any=20files=20transmitted=20with=20it=20are=20confide=
ntial=20and=20intended=20solely=20for=20the=20use=20of=20the=20individual=20=
or=20entity=20to=20which=20they=20are=20addressed.

If=20you=20have=20received=20this=20email=20in=20error=20please=20notify=20=
the=20originator=20of=20the=20message.=20
This=20footer=20also=20confirms=20that=20this=20email=20message=20has=20be=
en=20scanned=20for=20the=20presence=20of=20computer=20viruses.

Any=20views=20expressed=20in=20this=20message=20are=20those=20of=20the=20i=
ndividual=20sender,=20except=20where=20the=20sender=20specifies=20and=20wi=
th=20authority,=20states=20them=20to=20be=20the=20views=20of=20Microsol.

If=20you=20have=20received=20this=20mail=20in=20error=20you=20are=20reques=
ted=20to=20e-mail=20us=20(info@microsol.ie)=20or=20by=20telephoning=20Micr=
osol=20on=20+353=2014153700.

Please=20Visit=20our=20website=20at
http://www.microsol.com

_______________________________________________________________________

This=20email=20has=20been=20scanned=20for=20all=20viruses.
_______________________________________________________________________


