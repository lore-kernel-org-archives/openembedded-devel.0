Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdcyR-0006LM-0V
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 09:54:11 +0200
Received: by eaal1 with SMTP id l1so1637792eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 00:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=ec9L8GTb97TjEAzsW5Ib1n6jLip7uB8QWDGOEX6PNtw=;
	b=0LqLTjOdjNo9A6HC8Phczn2Zt9ylGks6zf5itFldD9O/MnqYOUP5MjfrHbBTkzuVHb
	4zevVdqoXAcQKevmpQvrkQlF9MqOYkrNaX0hzKeGMZRdyx+Cc0gv/Q3mMRTyu5q1iIco
	9Ksw9Rlqlyofy/By9AYzIkqo3lHd1rHyIoVlbs4bILRjuxE3k8Kqd9NQr6tiVt0cVaZA
	huKQwPwk9J5kp/8LNBI7ZlvGixgYv9zVF9npSZM2dLll+zXkr53/Gb7DNLPcgvchjxFh
	j8seC9Ns8ZnNShHZLA75IV0EVqsgWlia1+9q/AZB4wfgR17NIEpaTe84ZLfnXIkgsR/S
	fDDA==
Received: by 10.14.119.197 with SMTP id n45mr4960768eeh.180.1339314219155;
	Sun, 10 Jun 2012 00:43:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Sun, 10 Jun 2012 00:43:09 -0700 (PDT)
In-Reply-To: <94B716D7-1C23-4BA7-980C-A7858FA3C5DA@gmail.com>
References: <94B716D7-1C23-4BA7-980C-A7858FA3C5DA@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Jun 2012 00:43:09 -0700
Message-ID: <CAMKF1sptdy164Yf0O6uB+UiyTA_wzSz69_Jd69JnK7Yis_A9Vg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [poky] Impact of tune configuration in meta/conf/machine/qemuppc.conf
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
X-List-Received-Date: Sun, 10 Jun 2012 07:54:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 7, 2012 at 2:28 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote=
:
> Hi,
> =C2=A0 =C2=A0 What would the impact be, if I change the tune configuratio=
n in poky/meta/conf/machine/qemuppc.conf, from tune-ppc603e to tune-ppc440 =
?

its a different cpu all the more. it has fpu emulation. We emulate
mac99 in qemu, If you change it to ppc440 then its without fp and you
have to change
the machine type as well.

I think best thing for you would be to add a qemuppce440 machine to your la=
yer.

>
> #@TYPE: Machine
> #@NAME: qemu PPC Emulator setup
> #@DESCRIPTION: Machine configuration for running an PPC system under qemu=
 emulation
>
> require conf/machine/include/qemu.inc
> require conf/machine/include/tune-ppc603e.inc
>
> KERNEL_IMAGETYPE =3D "vmlinux"
>
> SERIAL_CONSOLE =3D "115200 ttyS0"
>
> Best regards,
>
> Elvis Dowson
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


