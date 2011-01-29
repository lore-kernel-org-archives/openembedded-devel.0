Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pj619-0008LL-IS
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 09:18:47 +0100
Received: by gxk20 with SMTP id 20so1410293gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jan 2011 00:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=OgSuZo7AcC1J8Due0sfjbELrvMVtRamJ7zOC5ROD87E=;
	b=o5AOG7EFiGfXKfZ7u55DVKWOJpZqclFJHE5rFSYROumjAd5OU5iM+5CIohDg7bqIRc
	S25STi6VvvMYxrXwDT/nmpmGfEdtgKjiK2Y9WWozL9JWo+1FYJH+otaM3yS6UXHiEyXZ
	AgllkGlBoACP1+p6OF4reVXSrspG7MTky0G+0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=burBrReE+ELZuLpF43HerphcHQW7qqJrQpxCXmp3Wo5p9fRI6j/Fw189LZzMZB3seb
	3n0MeeWfWBg6Y+areeJv94N34c36XCyXt1ONMnZusKVBg7k7S+xS01nSSMfTsk8NxaeC
	mo7fpyRNrE+wAIFSfIMchtsWLbx42g74ea7CI=
Received: by 10.90.51.20 with SMTP id y20mr6100675agy.115.1296289074444; Sat,
	29 Jan 2011 00:17:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Sat, 29 Jan 2011 00:17:34 -0800 (PST)
In-Reply-To: <4D430E3D.3040207@eukrea.com>
References: <1296219611-14580-1-git-send-email-sujak.marek@gmail.com>
	<AANLkTim0qsgQExvKhTQtPAyZz8cPos4osWFDDmxfEhjx@mail.gmail.com>
	<4D430E3D.3040207@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Jan 2011 00:17:34 -0800
Message-ID: <AANLkTikMzq9D=q127N_F1VjyL_2WKBKzW=CVdoA2kDOO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] VMX25: Add machine support for vmx25
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
X-List-Received-Date: Sat, 29 Jan 2011 08:18:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2011 at 10:43 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Hi Khem,
>
> On 28/01/2011 18:50, Khem Raj wrote:
>>>
>>> +PREFERRED_PROVIDER_virtual/bootloader =3D "barebox"
>>> +PREFERRED_PROVIDER_virtual/kernel =3D "linux"
>>> +PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
>>
>> what xserver is chosen is s distro choice do not lock it here.
>>
> not sure of this point : the distro don't know if you want xserver-xorg o=
r
> xserver-kdrive for your machine.
>>>

what machine features will make one work and other not. IOW
what machine dependency does it have

>>> +
>>> +PREFERRED_VERSION_linux =3D "2.6.35"
>>
>> kernel should not be pinned in conf file but in the kernel recipe itself
>> you should add PREFERRRED_PROVIDER_yourmacine =3D ...
>>
>>> +
>>> +MACHINE_FEATURES =3D "kernel26 alsa ext2 usbhost usbgadget touchscreen
>>> keyboard"
>>> +
>>> +GUI_MACHINE_CLASS =3D "bigscreen"
>>> +XSERVER ?=3D "xserver-xorg \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-tslib \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-evdev \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-mouse \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-keyboard \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-video-fbdev \
>>> +"
>>
>> this two defines should be part of distros to pin not machines.
>>


> I'm not sure of this :
> GUI_MACHINE_CLASS is about the machine not the distro.
> XSERVER's choice depends on the machine not on the distro.

ok I see

>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


