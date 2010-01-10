Received: from mail-iw0-f202.google.com ([209.85.223.202])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NTr2Z-0005gF-Ly
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 07:12:46 +0100
Received: by iwn40 with SMTP id 40so4017487iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2010 22:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=LwLiAnYhQVEemJKCbDooevR4JYBsKlzJjiAnUo/xb5k=;
	b=trieP2Aqu1FhlQDj5v3YjwjPW9yFqHGn8bTOS5hd1xP1G4HC9RVx4PuUJa192zPXuE
	H66eYpr/ERc8he4AEk2xH59cBp7bFl+ZAs3EXeAKjDsRdgizhTrK9HC5IJ6kYcll6ejb
	vmozEYe+o7J6G1XXaNAXOiDXXI5K3mjv3gFTI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=mlMf8uyUTjyUYF8vGEHEFPwHDOEKp1+iRYG0qNZEbOd9ZypeuMgnlrZ6oZMhvvePlA
	BdtYKVF15VBrZZ2FMnAR2TpNR153erzVGseDjf/dIWuoqy1RZle+IaCCl/40v5V607CG
	fors1V9kgXLJNaM3POuxAssYQ1uWBJVcj4Ri4=
MIME-Version: 1.0
Received: by 10.231.121.69 with SMTP id g5mr870549ibr.44.1263103835632; Sat, 
	09 Jan 2010 22:10:35 -0800 (PST)
In-Reply-To: <op.u6ax2r1qmn1qzu@guohr-laptop-ubuntu>
References: <op.u6ax2r1qmn1qzu@guohr-laptop-ubuntu>
Date: Sat, 9 Jan 2010 22:10:35 -0800
Message-ID: <19c1b8a91001092210k7aa59b12l4417d8654c9b5954@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Guo Hongruan <camelguo@gmail.com>
X-SA-Exim-Connect-IP: 209.85.223.202
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [Bug 5362] compilation of gcc-cross-intermediate-4.4.2 failed due to lack of fenv.h
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
X-List-Received-Date: Sun, 10 Jan 2010 06:12:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 9, 2010 at 9:41 PM, Guo Hongruan <camelguo@gmail.com> wrote:
> Hi raj,khem:
> =A0I think the change you made is not equivalent with before. Please see =
the
> following patch. When TARGET_ARCH =3D=3D powerpc, the
> EXTRA_OECONF_append_linux-uclibc should be set "--disable-decimal-float
> --without-long-double-128", but in your change, it will be set
> "--without-long-double-128"

No, thats not correct this patch is unnecessary. Its using _append
override which I guess is self explanatory.

>
> Thanks a lot!
>
> diff --git a/recipes/gcc/gcc-4.4.2.inc b/recipes/gcc/gcc-4.4.2.inc
> index 4b11f31..32a27c0 100644
> --- a/recipes/gcc/gcc-4.4.2.inc
> +++ b/recipes/gcc/gcc-4.4.2.inc
> @@ -36,4 +36,4 @@ EXTRA_OECONF_BASE =3D " --enable-libssp \
> =A0EXTRA_OECONF_append_linux-uclibc =3D " --disable-decimal-float "
> =A0EXTRA_OECONF_append_linux-uclibceabi =3D " --disable-decimal-float "
> =A0EXTRA_OECONF_append_linux-uclibcspe =3D " --disable-decimal-float "
> -EXTRA_OECONF_append_linux-uclibc =3D " ${@base_contains('TARGET_ARCH',
> 'powerpc', '--without-long-double-128', '',d)}"
> +EXTRA_OECONF_append_linux-uclibc +=3D " ${@base_contains('TARGET_ARCH',
> 'powerpc', '--without-long-double-128', '',d)}"
>
> --
> Guo Hongruan, Embedded Linux Consultant
> Skype: camelguo
> Twitter: camelguo
> http://www.gulessoft.com
>


