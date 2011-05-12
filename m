Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QKN3s-0002lX-W3
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 05:59:41 +0200
Received: by qyk27 with SMTP id 27so842532qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 20:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=6xGprw/cKnkva32J9M9/xQZk0+yTFkWPdR8YmIOuQxg=;
	b=OrVl+CMaaUslqxAA8bQC+8pPjGKdqtFQPgRpRkXMdIgWTe4qVK0nesbSXIIlv0gc8u
	Dtn/Gd54VibhYQ1dwfQMDziJqQcZWNbn6GcIRsohaJ8oDfbhtcaSK55qlF3S6h1kKi/I
	TEBoLjlEkn6l32VgOfeUu+wWPhuO6UGsVnVgc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kWqwfXMpgu8eaTq5eqvOa9w6yVj4BZXkNkUmeuz3/2JxHVYBnS3IVfc34Hhpoob7Tt
	XBE+p3NlRSVYjKUTWXqnBqArjNSTyQDj5B+ZjFFVFnaSMDpMSD8cSk8iflKNXxHL85i6
	tRi1SLjVmzEmoAbm/aoQqvpDGD6hdS8XM32fM=
MIME-Version: 1.0
Received: by 10.224.40.205 with SMTP id l13mr8693771qae.42.1305172613173; Wed,
	11 May 2011 20:56:53 -0700 (PDT)
Received: by 10.224.6.79 with HTTP; Wed, 11 May 2011 20:56:53 -0700 (PDT)
In-Reply-To: <iqd9ml$t2p$1@dough.gmane.org>
References: <1305088881-3527-1-git-send-email-heroor@gmail.com>
	<1305088881-3527-2-git-send-email-heroor@gmail.com>
	<iqd9ml$t2p$1@dough.gmane.org>
Date: Thu, 12 May 2011 09:26:53 +0530
Message-ID: <BANLkTinDHxiLtUcmqhb41KNzwyinhMWA4Q@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] ti816x machine: Update for latest kernel version
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
X-List-Received-Date: Thu, 12 May 2011 03:59:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2011 at 11:47 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 11-05-11 06:41, Siddharth Heroor wrote:
>> From: Siddharth Heroor <heroor@ti.com>
>>
>> * In 2.6.37 the console is tied to ttyO2.
>> * Bump PR.
>>
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> ---
>> =A0conf/machine/include/ti816x.inc | =A0 =A04 ++--
>> =A01 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/conf/machine/include/ti816x.inc b/conf/machine/include/ti81=
6x.inc
>> index 9db1df8..ca0b4f5 100644
>> --- a/conf/machine/include/ti816x.inc
>> +++ b/conf/machine/include/ti816x.inc
>> @@ -7,7 +7,7 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap3"
>> =A0PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot"
>>
>> =A0# Increase this everytime you change something in the kernel
>> -MACHINE_KERNEL_PR =3D "r1"
>> +MACHINE_KERNEL_PR =3D "r2"
>
> for the tty change you need to change the PR of sysvinit, not
> machine_kernel_pr.
Right. I'll rework this patch.

>
> regards,
>
> Koen
>
>>
>> =A0KERNEL_IMAGETYPE =3D "uImage"
>>
>> @@ -22,5 +22,5 @@ EXTRA_IMAGEDEPENDS +=3D "u-boot"
>> =A0# Ship all kernel modules
>> =A0IMAGE_FSTYPES +=3D "jffs2 tar.bz2"
>> =A0EXTRA_IMAGECMD_jffs2 =3D "-lqn -e 128"
>> -SERIAL_CONSOLE =3D "115200 ttyS2"
>> +SERIAL_CONSOLE =3D "115200 ttyO2"
>> =A0MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 ethern=
et"
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNyioUMkyGM64RGpERAkIPAJ42UkTECbOnuCaCb5ryHnRkztoMbQCdFXFK
> w+/QLkyjus44CRHnATQU2og=3D
> =3DJoQj
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Sid


