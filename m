Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWJIB-0005Qv-JN
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 05:28:19 +0200
Received: by eekd49 with SMTP id d49so1344627eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2012 20:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=D9mrIpUL0s8zDqb5X2kO9bJozLEUevoYrydIjLXaAQk=;
	b=xJDOCLDVfKFMSG1uBrdfO0T07iy7islpscTphq2NfbMFxYq5uAdZZnRlPW9Czth6L/
	UkiNQkoN/SUheJqoAcPoT71nrEDNgo22wZ88ADsdIkhr4zfJ+okBj+xSDvN/VmKoVjed
	ezlDW1q7onjTKAO+JZ5whikOjp2DU3Kd1zA1aZ3t9pEtlWplM4LTLaGD+0T+5fKC+ZSP
	NtK3hrFEbVIrOTZUiPcGcm0JWN3Y8rUveDy7xgFyW8mhqXqwknUfn8+KAPUjjYI/z3G7
	Th1btmQ9fiM5yTpQ//nBcgkC0EOzpmqL2z3PMcbVTCc32Q9SJlwDZv+U+bXowb+eXhdb
	mLyw==
Received: by 10.213.105.196 with SMTP id u4mr4110294ebo.92.1337570292654; Sun,
	20 May 2012 20:18:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Sun, 20 May 2012 20:17:42 -0700 (PDT)
In-Reply-To: <1337549842-1438-1-git-send-email-andrea.adami@gmail.com>
References: <1337549842-1438-1-git-send-email-andrea.adami@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 May 2012 20:17:42 -0700
Message-ID: <CAMKF1so+__G_LDzj5DDZgQpae63EytLbaZNR5dnwTUAD+3r-3g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-initramfs][PATCH 1/3] klibc.bbclass: use klcc as CPP
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
X-List-Received-Date: Mon, 21 May 2012 03:28:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 20, 2012 at 2:37 PM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
> =C2=A0meta-initramfs/classes/klibc.bbclass | =C2=A0 =C2=A01 +
> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classe=
s/klibc.bbclass
> index d553bd7..e8cdb6d 100644
> --- a/meta-initramfs/classes/klibc.bbclass
> +++ b/meta-initramfs/classes/klibc.bbclass
> @@ -2,6 +2,7 @@
> =C2=A0DEPENDS =3D+ "klcc-cross"
>
> =C2=A0export CC =3D "${TARGET_PREFIX}klcc"
> +export CPP =3D "${CC} -E"

I think you might also need to capture CPPFLAGS as well

>
> =C2=A0# klcc uses own optimizations by default. See klcc(1) man file.
> =C2=A0export CFLAGS=3D""
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


