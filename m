Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SUdWy-0000Qz-Ir
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 14:40:40 +0200
Received: by lags15 with SMTP id s15so454586lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 05:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=KEbr/XpcY0Dgkx9/iCGX0dvcIoffXYyq1350MlkWsMs=;
	b=BI2tqL2gRItJiMU7QRM3DLrxejJdN4ISGksQoda8mlLBNFq01KIJWNxbIt/pcez1y9
	rPjVF8vWOxJlEmCnXZH0Uh0+uDlbp3sf2Bz1HtVnkcmn1ldXVnlaYl/Abi5smQt0WoC7
	susGZlsm7YjZ6OggGqYXzwd/LxNqkDSIPS3j2yTHcN8fl8A2YGeLoPbRme3ZlKrS5VyE
	hQ6tk/iq3hu2jmDOY0/JRO0msyz1o5NoZWVQpEVd72jTajc9tlKkAzuitbU4B12GNciN
	z+9iyzLFMwVQGrK0Dx8nXLNQ5OPx5QuXgZxVA3hoB8ZrjexDtvcf4a2yufzB2jDy7qJL
	X3Bw==
MIME-Version: 1.0
Received: by 10.152.129.74 with SMTP id nu10mr2674363lab.50.1337171439136;
	Wed, 16 May 2012 05:30:39 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Wed, 16 May 2012 05:30:39 -0700 (PDT)
In-Reply-To: <CA+chaQfVL395bKdg8CKwbjowx_zxY_rUdAh4iAYhSJ49Kr2p0w@mail.gmail.com>
References: <1337119302-28549-1-git-send-email-raj.khem@gmail.com>
	<CADZ6=avUxq8fBHF3UMCZ3T6A-W+tm7ZOVR-kCa48L_4_J9+2ZA@mail.gmail.com>
	<CA+chaQfVL395bKdg8CKwbjowx_zxY_rUdAh4iAYhSJ49Kr2p0w@mail.gmail.com>
Date: Wed, 16 May 2012 14:30:39 +0200
Message-ID: <CADZ6=asaFdV+2n80CMB2a0to18PYdqY7Ggydbjej-B6yqfvnyw@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlk+sNke3J0awL2S6KIOeBGhxRnaQzzc+3OBFe+J1SnVSMb7W7zpbwAQsU7XeBgq6Sdkf17
Subject: Re: [toolchain-layer][pull-request] Remove old toolchain recipes
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
X-List-Received-Date: Wed, 16 May 2012 12:40:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Martin,

>> Hello *.*,
>>
>>> Khem Raj (3):
>>> =C2=A0 =C2=A0 =C2=A0eglibc-2.12: Remove
>>> =C2=A0 =C2=A0 =C2=A0binutils-2.20: Remove
>>> =C2=A0 =C2=A0 =C2=A0gcc-4.5: Remove
>>
>> Removing gcc-4.5 would kill Texas Instruments DaVinci (dm814x, dm816x)
>> support. You only get a heavily patched 2.6.37 kernel from TI for
>> these (linux-ti81xx-psp_2.6.37). Unfortunately gcc >=3D 4.6 is unable to
>> build a kernel which boots for these platforms. After
>>
>> Uncompressing linux ... booting the kernel
>>
>> there is silence. We can reproduce this reliably on a ti8148-evm
>> development board. My best guess is it's because of an ancient kernel
>> being compiled with a very recent GCC.
>>
>> Regards,
>> Thilo
>
> if gcc-4.6 was from meta-toolchain (including linaro patch
> toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r10682=
7.patch)
> then you need to pass -mno-unaligned-access in your kernel Makefile
> like this commit does:
> http://git.freesmartphone.org/?p=3Dlinux-2.6.git;a=3Dcommit;h=3D78ffc81db=
8911acdabd026ad3fdefa20b4e34e52
>
> be aware that without this patch -mno-unaligned-access is not valid
> option for gcc (older than 4.7).

Thanks a lot for the hint, it's greatly appreciated. I'll revisit 4.7
to check whether this fixes our issue after I restored 4.5 for us. I
prefer small steps :) I guess I'll move the whole gcc-4.5... stuff
into our own layer for now.

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle


