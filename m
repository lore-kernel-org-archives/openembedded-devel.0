Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QDyog-0000o3-60
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Apr 2011 14:53:36 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id A1A6416601E6; Sun, 24 Apr 2011 06:51:04 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 881DA16601AD;
	Sun, 24 Apr 2011 06:51:02 -0600 (MDT)
Message-ID: <4DB41CB6.6020809@mlbassoc.com>
Date: Sun, 24 Apr 2011 06:51:02 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1301955176-14829-1-git-send-email-ynezz@true.cz>
	<BANLkTik92_-9VB08Rfgx-ewWscrbCyspnQ@mail.gmail.com>
In-Reply-To: <BANLkTik92_-9VB08Rfgx-ewWscrbCyspnQ@mail.gmail.com>
Subject: Re: [PATCH RFC] modutils-initscripts: fix wrong order of module loading happening in udev
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
X-List-Received-Date: Sun, 24 Apr 2011 12:53:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 04/23/2011 03:31 PM, Khem Raj wrote:
> On Mon, Apr 4, 2011 at 3:12 PM, Petr =C5=A0tetiar<ynezz@true.cz>  wrote=
:
>> In the current state, udev init script is loaded as 3rd and modutils.s=
h as
>> 20th, so udevadm called in udev init script loads all kernel modules i=
n some
>> unpredictable order, not honoring in any way specified order of module=
s in
>> /etc/modules. This causes some troubles mainly in the first boot. So t=
o fix
>> this we now move loading of the kernel modules just before we exec ude=
v init
>> script. Example of the current state:
>>
>>         Starting udev
>>         rtc-m48t86 rtc-m48t86: rtc core: registered m48t86 as rtc0
>>         rtc-m48t86 rtc-m48t86: battery ok
>>         ep93xx-rtc ep93xx-rtc: rtc core: registered ep93xx-rtc as rtc1
>>
>>         root@ts72xx:~# cat /etc/modules
>>         rtc-ep93xx
>>         ohci-hcd
>>         ts72xx_sbcinfo
>>         rtc-m48t86
>>
>> As you can guess, this is really wrong behaviour, because I've rtc1 as=
 the
>> main time source for my system.
>>
>>         root@ts72xx:~# cat /etc/default/hwclock
>>         HWCLOCKACCESS=3Dyes
>>         HWCLOCKDEVICE=3D/dev/rtc1
>>
>> Expected behaviour with this patch applied:
>>
>>         Please wait: booting...
>>         ep93xx-rtc ep93xx-rtc: rtc core: registered ep93xx-rtc as rtc0
>>         usbcore: registered new device driver usb
>>         ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
>>         ...
>>         rtc-m48t86 rtc-m48t86: rtc core: registered m48t86 as rtc1
>>         rtc-m48t86 rtc-m48t86: battery ok
>>         Starting udev
>>
>> Signed-off-by: Petr =C5=A0tetiar<ynezz@true.cz>
>
> Looks ok.
>
> Acked-by: Khem Raj<raj.khem@gmail.com>
>
>> ---
>>   recipes/modutils/modutils-initscripts.bb |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes/modutils/modutils-initscripts.bb b/recipes/moduti=
ls/modutils-initscripts.bb
>> index 07f4810..797acb3 100644
>> --- a/recipes/modutils/modutils-initscripts.bb
>> +++ b/recipes/modutils/modutils-initscripts.bb
>> @@ -2,10 +2,10 @@ SECTION =3D "base"
>>   DESCRIPTION =3D "modutils configuration files"
>>   LICENSE =3D "PD"
>>   SRC_URI =3D "file://modutils.sh"
>> -PR =3D "r3"
>> +PR =3D "r4"
>>
>>   INITSCRIPT_NAME =3D "modutils.sh"
>> -INITSCRIPT_PARAMS =3D "start 20 S ."
>> +INITSCRIPT_PARAMS =3D "start 2 S ."
>>
>>   inherit update-rc.d
>>
>> --
>> 1.7.1

I'm not clear why this information is duplicated, but shouldn't these
changes also be applied to modutils/modutils_2.4.27.bb as well?

Something like this:
diff --git a/recipes/modutils/modutils_2.4.27.bb b/recipes/modutils/modut=
ils_2.4.27.bb
index 791707c..ef3f152 100644
--- a/recipes/modutils/modutils_2.4.27.bb
+++ b/recipes/modutils/modutils_2.4.27.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "These utilities are intended to make a L=
inux modular kernel \
  manageable for all users, administrators and distribution maintainers."
  LICENSE =3D "GPLv2"
  DEPENDS =3D "bison-native"
-PR =3D "r8"
+PR =3D "r9"

  SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/utils/kernel/modutils/v2.4/m=
odutils-${PV}.tar.bz2 \
             file://lex.l.diff \
@@ -46,7 +46,7 @@ if test -n "$D"; then
                 done
         fi
  fi
-update-rc.d $D modutils.sh start 20 S .
+update-rc.d $D modutils.sh start 2 S .
  }

  pkg_prerm_modutils () {

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


