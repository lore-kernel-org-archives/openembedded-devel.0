Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NMruu-0006Ke-0c
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Dec 2009 00:43:59 +0100
Received: by iwn32 with SMTP id 32so3569445iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2009 15:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gtIwAUSc+9hxrLx2bdM2LB7olPzozlWjkWo8GU/BknE=;
	b=d2Mp4yuHRbmb4xReNr5zGJpj+AbbeanF9nyHOW7Vt/E/yb7z3GWv8tswD//4baD4Z5
	dIX/0AlwPSEzSNJuhgJj1ekJAU6y8XhnNQMRjZbQo9rWasiXPbkaMFqSQ6CHPIIhiehU
	cG5fDYh2qEIDN4sQuzJWW+FTE29ICBesIiWpg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HlnMYBnnZUU1Um2Fgbe/OGOJV3jivRrGovR7uBu0HDAwEHra7wxMDa/yWubHvr0tTo
	p/9EMY4E9zwn9K1tcezCD5AAbj+ni0XXY13QRtqU/AQOiYLilAWEyIw59lMoVxTRMz/q
	XGTm/3yxayKV/Ii2QTUEmgO2t802Qo4FhRmSc=
MIME-Version: 1.0
Received: by 10.231.29.149 with SMTP id q21mr2377461ibc.35.1261438924014; Mon, 
	21 Dec 2009 15:42:04 -0800 (PST)
In-Reply-To: <1261430528.3714.0.camel@gnutoo-desktop>
References: <1261091322-11271-1-git-send-email-GNUtoo@no-log.org>
	<1261091322-11271-2-git-send-email-GNUtoo@no-log.org>
	<1261430528.3714.0.camel@gnutoo-desktop>
Date: Mon, 21 Dec 2009 15:42:03 -0800
Message-ID: <19c1b8a90912211542k28a5b7b7pb3b210d1cc1bbaa7@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] udev-141: added support for buglabs's bug device
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
X-List-Received-Date: Mon, 21 Dec 2009 23:43:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2009 at 1:22 PM, GNUtoo <GNUtoo@no-log.org> wrote:
> ping:
> On Fri, 2009-12-18 at 00:08 +0100, Denis 'Gnutoo' Carikli wrote:
>> The udev configurations files are needed for Xorg configuration
>> =C2=A0 for buglabs's bug device that will be commited later,
>> =C2=A0 in order to find the right device nodes for the touchscreens
>>
>> Note that the script creating the bmi(Bug module interface)
>> =C2=A0 event pipe has not been commented out,because it will be needed
>> =C2=A0 when the java bindings for the bug device will be in openembedded
>>
>> Signed-off-by: Denis 'Gnutoo' Carikli <GNUtoo@no-log.org>
>> ---
>> =C2=A0recipes/udev/udev-141/bug/10-mx31.rules =C2=A0 =C2=A0| =C2=A0 49 +=
+++++++++++++++++++++++++++
>> =C2=A0recipes/udev/udev-141/bug/30-BUG.rules =C2=A0 =C2=A0 | =C2=A0 26 +=
++++++++++++++
>> =C2=A0recipes/udev/udev-141/bug/bmi_eventpipe.sh | =C2=A0 =C2=A08 ++++
>> =C2=A0recipes/udev/udev_141.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 16 ++++++++-
>> =C2=A04 files changed, 98 insertions(+), 1 deletions(-)
>> =C2=A0create mode 100644 recipes/udev/udev-141/bug/10-mx31.rules
>> =C2=A0create mode 100644 recipes/udev/udev-141/bug/30-BUG.rules
>> =C2=A0create mode 100644 recipes/udev/udev-141/bug/bmi_eventpipe.sh
>>
>> diff --git a/recipes/udev/udev-141/bug/10-mx31.rules b/recipes/udev/udev=
-141/bug/10-mx31.rules
>> new file mode 100644
>> index 0000000..de427fc
>> --- /dev/null
>> +++ b/recipes/udev/udev-141/bug/10-mx31.rules
>> @@ -0,0 +1,49 @@
>> +KERNEL=3D=3D"ttyS[0-9]", NAME=3D"tts/%n", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0SYMLINK+=3D"tts%n"
>> +KERNEL=3D=3D"ttymxc[0-9]", =C2=A0 =C2=A0 =C2=A0 NAME=3D"ttymxc/%n", =C2=
=A0 =C2=A0 =C2=A0 SYMLINK+=3D"ttymxc%n"
>> +
>> +KERNEL=3D=3D"mxc_mu[0-9]", =C2=A0 =C2=A0 =C2=A0 NAME=3D"mxc_mu/%n", =C2=
=A0 =C2=A0 =C2=A0 SYMLINK+=3D"mxc_mu%n"
>> +KERNEL=3D=3D"fb*", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NAM=
E=3D"fb/%n", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYMLINK+=3D"fb%n"
>> +KERNEL=3D=3D"i2c*", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NAM=
E=3D"i2c/%n"
>> +KERNEL=3D=3D"mxc_ipc*", =C2=A0NAME=3D"mxc_ipc/%n"
>> +KERNEL=3D=3D"video*", =C2=A0 =C2=A0NAME=3D"v4l/video%n"
>> +
>> +KERNEL=3D=3D"rtc", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NAM=
E=3D"misc/rtc"
>> +KERNEL=3D=3D"watchdog", =C2=A0NAME=3D"misc/watchdog"
>> +
>> +KERNEL=3D=3D"mc13783_adc", =C2=A0 =C2=A0 =C2=A0 NAME=3D"mc13783_adc", =
=C2=A0 =C2=A0 SYMLINK+=3D"ts"
>> +KERNEL=3D=3D"pmic_adc", =C2=A0NAME=3D"pmic_adc", =C2=A0 =C2=A0 =C2=A0 =
=C2=A0SYMLINK+=3D"ts"
>> +
>> +# The long class name gets cut off to be mc13783_connectiv in
>> +# /sys/class/mc13783_connectivity/mc13783_connectivit
>> +KERNEL=3D=3D"mc13783_connectiv*", =C2=A0 =C2=A0 =C2=A0 =C2=A0NAME=3D"mc=
13783_connectivity"
>> +
>> +KERNEL=3D=3D"mxc_ssi[0-9]*", =C2=A0 =C2=A0 NAME=3D"mxc_ssi/%n", =C2=A0 =
=C2=A0 =C2=A0SYMLINK+=3D"mxc_ssi%n"
>> +KERNEL=3D=3D"spi[0-9]*", NAME=3D"spi/%n", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0SYMLINK+=3D"spi%n"
>> +
>> +KERNEL=3D=3D"mtdblock*", NAME=3D"mtdblock/%n" =C2=A0 =C2=A0 =C2=A0SYMLI=
NK+=3D"mtdblock%n"
>> +KERNEL=3D=3D"mtd[0-9]", =C2=A0NAME=3D"mtd/%n"
>> +
>> +# A more elegant way of doing this must exist...
>> +KERNEL=3D=3D"mtd0ro", =C2=A0 =C2=A0NAME=3D"mtd/0ro"
>> +KERNEL=3D=3D"mtd1ro", =C2=A0 =C2=A0NAME=3D"mtd/1ro"
>> +KERNEL=3D=3D"mtd2ro", =C2=A0 =C2=A0NAME=3D"mtd/2ro"
>> +KERNEL=3D=3D"mtd3ro", =C2=A0 =C2=A0NAME=3D"mtd/3ro"
>> +KERNEL=3D=3D"mtd4ro", =C2=A0 =C2=A0NAME=3D"mtd/4ro"
>> +KERNEL=3D=3D"mtd5ro", =C2=A0 =C2=A0NAME=3D"mtd/5ro"
>> +KERNEL=3D=3D"mtd6ro", =C2=A0 =C2=A0NAME=3D"mtd/6ro"
>> +KERNEL=3D=3D"mtd7ro", =C2=A0 =C2=A0NAME=3D"mtd/7ro"
>> +KERNEL=3D=3D"mtd8ro", =C2=A0 =C2=A0NAME=3D"mtd/8ro"
>> +KERNEL=3D=3D"mtd9ro", =C2=A0 =C2=A0NAME=3D"mtd/9ro"
>> +
>> +# Note that we want /dev/dsp linked to /dev/sound/dsp1...
>> +KERNEL=3D=3D"dsp", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NAM=
E=3D"sound/dsp"
>> +KERNEL=3D=3D"dspW", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NAM=
E=3D"sound/dspW"
>> +KERNEL=3D=3D"dsp1", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NAM=
E=3D"sound/dsp1", =C2=A0 =C2=A0 =C2=A0SYMLINK+=3D"dsp"
>> +KERNEL=3D=3D"mixer", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NAME=3D"=
sound/mixer", =C2=A0 =C2=A0 SYMLINK+=3D"mixer"
>> +KERNEL=3D=3D"sequencer", NAME=3D"sound/sequencer"
>> +KERNEL=3D=3D"sequencer2", =C2=A0 =C2=A0 =C2=A0 =C2=A0NAME=3D"sound/sequ=
encer2"
>> +
>> +KERNEL=3D=3D"ram[0-9]*", NAME=3D"ram/%n", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0SYMLINK+=3D"ram%n"
>> +
>> +KERNEL=3D=3D"dvfs_dptc", NAME=3D"dvfs_dptc", =C2=A0 =C2=A0 =C2=A0 SYMLI=
NK+=3D"dptc dvfs"
>> +
>> diff --git a/recipes/udev/udev-141/bug/30-BUG.rules b/recipes/udev/udev-=
141/bug/30-BUG.rules
>> new file mode 100644
>> index 0000000..06faa6b
>> --- /dev/null
>> +++ b/recipes/udev/udev-141/bug/30-BUG.rules
>> @@ -0,0 +1,26 @@
>> +##
>> +## BUG/BMI specific
>> +##
>> +KERNEL=3D=3D"event*", ATTRS{name}=3D=3D"bugnav", SYMLINK+=3D"input/bugn=
av"
>> +KERNEL=3D=3D"event*", ATTRS{name}=3D=3D"bmi_motion", SYMLINK+=3D"input/=
bmi_motion"
>> +KERNEL=3D=3D"event*", ATTRS{name}=3D=3D"bug_cam", SYMLINK+=3D"input/bmi=
_cam"
>> +KERNEL=3D=3D"event*", ATTRS{name}=3D=3D"bmi_audio_status_m1", SYMLINK+=
=3D"input/bmi_audio_m1"
>> +KERNEL=3D=3D"event*", ATTRS{name}=3D=3D"bmi_audio_status_m2", SYMLINK+=
=3D"input/bmi_audio_m2"
>> +KERNEL=3D=3D"event*", ATTRS{name}=3D=3D"bmi_audio_status_m3", SYMLINK+=
=3D"input/bmi_audio_m3"
>> +KERNEL=3D=3D"event*", ATTRS{name}=3D=3D"bmi_audio_status_m4", SYMLINK+=
=3D"input/bmi_audio_m4"
>> +DEVPATH=3D=3D"/devices/platform/bugfb.0", SYMLINK+=3D"bugfb"
>> +KERNEL=3D=3D"rtc0", SYMLINK+=3D"rtc"
>> +KERNEL=3D=3D"event*", ATTRS{name}=3D=3D"bmi_lcd_ts0", SYMLINK+=3D"input=
/bmi_lcd_ts0"
>> +KERNEL=3D=3D"event*", ATTRS{name}=3D=3D"bmi_lcd_ts1", SYMLINK+=3D"input=
/bmi_lcd_ts1"
>> +KERNEL=3D=3D"event*", ATTRS{name}=3D=3D"bmi_lcd_ts2", SYMLINK+=3D"input=
/bmi_lcd_ts2"
>> +KERNEL=3D=3D"event*", ATTRS{name}=3D=3D"bmi_lcd_ts3", SYMLINK+=3D"input=
/bmi_lcd_ts3"
>> +KERNEL=3D=3D"event*", ATTRS{name}=3D=3D"bmi_lcd_ts4", SYMLINK+=3D"input=
/bmi_lcd_ts4"
>> +KERNEL=3D=3D"event*", ATTRS{name}=3D=3D"bmi_lcd_ts5", SYMLINK+=3D"input=
/bmi_lcd_ts5"
>> +KERNEL=3D=3D"event*", ATTRS{name}=3D=3D"bmi_lcd_ts6", SYMLINK+=3D"input=
/bmi_lcd_ts6"
>> +ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/conn*", RUN+=3D"/bin/sh /etc/=
udev/scripts/bmi_eventpipe.sh"
>> +ACTION=3D=3D"remove", DEVPATH=3D=3D"/devices/conn*", RUN+=3D"/bin/sh /e=
tc/udev/scripts/bmi_eventpipe.sh"
>> +#
>> +# For USB PBPSD, which we've arbitrarily decided will be module F001
>> +#
>> +ACTION=3D=3D"remove", SUBSYSTEM=3D=3D"usb", DRIVERS=3D=3D"psd_driver", =
ENV{BMIBUS_PRODUCT}=3D"F001", ENV{BMIBUS_SLOT}=3D"%n", RUN+=3D"/bin/sh /etc=
/udev/scripts/bmi_eventpipe.sh"
>> +ACTION=3D=3D"add", SUBSYSTEM=3D=3D"usb", DRIVERS=3D=3D"psd_driver", ENV=
{BMIBUS_PRODUCT}=3D"F001", ENV{BMIBUS_SLOT}=3D"%n", RUN+=3D"/bin/sh /etc/ud=
ev/scripts/bmi_eventpipe.sh"
>> diff --git a/recipes/udev/udev-141/bug/bmi_eventpipe.sh b/recipes/udev/u=
dev-141/bug/bmi_eventpipe.sh
>> new file mode 100644
>> index 0000000..acbae56
>> --- /dev/null
>> +++ b/recipes/udev/udev-141/bug/bmi_eventpipe.sh
>> @@ -0,0 +1,8 @@
>> +#!/bin/sh
>> +#
>> +# This script passes BMI state variables to the running JVM.
>> +#
>> +if [ ${BMIBUS_PRODUCT} !=3D "" ] && [ ${BMIBUS_SLOT} !=3D "" ] && [ ${A=
CTION} !=3D "" ];
>> +then
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0echo $BMIBUS_PRODUCT 0 $BMIBUS_SLOT $ACTION=
 > /tmp/eventpipe
>> +fi
>> diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
>> index e07150d..00ba971 100644
>> --- a/recipes/udev/udev_141.bb
>> +++ b/recipes/udev/udev_141.bb
>> @@ -6,7 +6,7 @@ LICENSE =3D "GPL"
>> =C2=A0# Untested
>> =C2=A0DEFAULT_PREFERENCE =3D "-1"
>>
>> -PR =3D "r18"
>> +PR =3D "r19"
>>
>> =C2=A0# needed for init.d script
>> =C2=A0RDEPENDS_${PN} +=3D "udev-utils"
>> @@ -29,6 +29,14 @@ SRC_URI +=3D " \
>> =C2=A0SRC_URI_append_h2200 =3D " file://50-hostap_cs.rules "
>> =C2=A0PACKAGE_ARCH_h2200 =3D "h2200"
>>
>> +#buglabs's bug device
>> +SRC_URI_append_bug =3D " \
>> + =C2=A0 =C2=A0 =C2=A0 file://30-BUG.rules \
>> + =C2=A0 =C2=A0 =C2=A0 file://10-mx31.rules \
>> + =C2=A0 =C2=A0 =C2=A0 file://bmi_eventpipe.sh "
>> +
>> +PACKAGE_ARCH_bug =3D "bug"
>> +
>> =C2=A0inherit update-rc.d autotools_stage
>>
>> =C2=A0# Put stuff in /lib and /sbin
>> @@ -98,6 +106,12 @@ do_install_append_h2200() {
>> =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/50-hostap_cs.rules =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${sysconfdir}/udev/rules.d/50-hostap_cs.rules
>> =C2=A0}
>>
>> +do_install_append_bug() {
>> + =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/30-BUG.rules ${D}${sysconfdir=
}/udev/rules.d/30-BUG.rules
>> + =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/10-mx31.rules ${D}${sysconfdi=
r}/udev/rules.d/10-mx31.rules
>> + =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/bmi_eventpipe.sh ${D}${syscon=
fdir}/udev/scripts/bmi_eventpipe.sh
>> +}
>> +
>> =C2=A0pkg_postinst_${PN}_append() {
>> =C2=A0if [ -d $D/lib/udev/rules.d ] ; then
>> =C2=A0 =C2=A0 =C2=A0 echo "$D/lib/udev/rules.d is not a symlink, fixing =
that"
>
looks ok


