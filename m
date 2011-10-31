Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RKrxX-0007eD-Ii
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 14:31:27 +0100
Received: by ggnj1 with SMTP id j1so5667156ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2011 06:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=3K4WDRINb5SzAFg5dym43HhUYo5lGyMzhHX1okboLX4=;
	b=QRkxesVd7tw5Zq7t1BacV+gYssNnATIsZ8RnqWU8ZwSD1ao+T2eVyi0i53FLU0mcZy
	CfIRK1gWfHtFBTKFs9COCMEi4tXUTQmjwz+C63MTm9NGpR4RkBq8MTENVndDDrKLVMjc
	xERRk/iXhMUkeHlcKkQGb+4IpxVWnrJ0LxGO0=
MIME-Version: 1.0
Received: by 10.151.20.11 with SMTP id x11mr1560907ybi.33.1320067519860; Mon,
	31 Oct 2011 06:25:19 -0700 (PDT)
Received: by 10.150.196.18 with HTTP; Mon, 31 Oct 2011 06:25:19 -0700 (PDT)
In-Reply-To: <j8lunf$7vb$6@dough.gmane.org>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<1dd29bc4f6b05d60b8b7a5d01c3c2cb94c9d9c46.1319884094.git.Martin.Jansa@gmail.com>
	<j8lunf$7vb$6@dough.gmane.org>
Date: Mon, 31 Oct 2011 14:25:19 +0100
Message-ID: <CA+chaQfQggvhvDD7LuW3iTXbRGT98=6BnkMK5-5NKox+T3K9KA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-efl][meta-oe 11/12] systemd-serialgetty: use better default SERIAL_CONSOLE
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
X-List-Received-Date: Mon, 31 Oct 2011 13:31:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2011 at 11:53 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 29-10-11 12:29, Martin Jansa schreef:
>> * having /dev/ttySO fails with: | ln: failed to create symbolic link
>> `/OE/shr-core/tmp/work/nokia900-oe-linux-gnueabi/systemd-serialgetty-1.0=
-r0/image/etc/systemd/system/getty.target.wants/serial-getty@/dev/ttyS0.ser=
vice':
>>
>>
> No such file or directory
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> ---
>> .../recipes-core/systemd/systemd-serialgetty.bb =C2=A0 =C2=A0| =C2=A0 =
=C2=A02 +- 1 files
>> changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
>> b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb index
>> 86d833e..9294869 100644 ---
>> a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb +++
>> b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb @@ -2,7 +2,7 @@
>> DESCRIPTION =3D "Systemd serial config" LICENSE =3D "GPLv2+" LIC_FILES_C=
HKSUM
>> =3D "file://${WORKDIR}/LICENSE;md5=3D751419260aa954499f7abaabaa882bbe"
>>
>> -SERIAL_CONSOLE ?=3D "115200 /dev/ttyS0" +SERIAL_CONSOLE ?=3D "115200 tt=
yS0"
>>
>> SRC_URI =3D "file://LICENSE \ file://serial-getty@.service"
>
> Missing PR bump

Nobody without SERIAL_CONSOLE already overwritten could build it
before to have old binary package in feed (because it fails) and those
with SERIAL_CONSOLE overwritten won't be influenced by change of
default value and binary package won't change for them too. That's why
PR bump was missing..

But to make you happy added in branch :).

Cheers,

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFOrn4vMkyGM64RGpERAkzGAJ42j+LXz7GZQfUCtdrk2hgzBjuhDwCdHs6q
> UjxgP+htyH+rTcU7/oPfikw=3D
> =3DjTYz
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


