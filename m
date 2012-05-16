Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUcVQ-0007K1-AB
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 13:35:00 +0200
Received: by ggnp4 with SMTP id p4so543245ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 04:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Qi/sQSBuh4XDUuR7AraVB+EBG/YQfCfGnm+7TPuMHGI=;
	b=PLWORpFm1tn6lKWTSbqqzeoC+343LTctJrcmSTN2g26x77qHWEBMPOQAtbCggAvOp5
	gnAIkE06HokxS4ZzcIRNFoykbI6QanB1ChAGPQM02EapPUenb9xBtyiGq7ubekXsGVIl
	l9Y/dyyJ3ieLgO0U8jUVwXYDKVq1fNiCThL6qEE8aJ2m7oLpqMJZEL4+A3Dz0NxjDaZm
	rYrxpslt8/tjz2NJdjHS6fe/d5SexjTLcBBx5n0rIr3zvJm6OMU/zS12+/S8DanChJG6
	6BiledKUU7WDCzXNSTj5MjYFDCDm9TRVF10VjeDVAWlncTXIZ/ojyjTidUBcK2hk5eoI
	MDsA==
MIME-Version: 1.0
Received: by 10.101.134.7 with SMTP id l7mr863340ann.84.1337167498549; Wed, 16
	May 2012 04:24:58 -0700 (PDT)
Received: by 10.236.23.9 with HTTP; Wed, 16 May 2012 04:24:58 -0700 (PDT)
In-Reply-To: <CADZ6=avUxq8fBHF3UMCZ3T6A-W+tm7ZOVR-kCa48L_4_J9+2ZA@mail.gmail.com>
References: <1337119302-28549-1-git-send-email-raj.khem@gmail.com>
	<CADZ6=avUxq8fBHF3UMCZ3T6A-W+tm7ZOVR-kCa48L_4_J9+2ZA@mail.gmail.com>
Date: Wed, 16 May 2012 13:24:58 +0200
Message-ID: <CA+chaQfVL395bKdg8CKwbjowx_zxY_rUdAh4iAYhSJ49Kr2p0w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 16 May 2012 11:35:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 12:50 PM, Thilo Fromm <fromm@dresearch-fe.de> wrote=
:
> Hello *.*,
>
>> Khem Raj (3):
>> =C2=A0 =C2=A0 =C2=A0eglibc-2.12: Remove
>> =C2=A0 =C2=A0 =C2=A0binutils-2.20: Remove
>> =C2=A0 =C2=A0 =C2=A0gcc-4.5: Remove
>
> Removing gcc-4.5 would kill Texas Instruments DaVinci (dm814x, dm816x)
> support. You only get a heavily patched 2.6.37 kernel from TI for
> these (linux-ti81xx-psp_2.6.37). Unfortunately gcc >=3D 4.6 is unable to
> build a kernel which boots for these platforms. After
>
> Uncompressing linux ... booting the kernel
>
> there is silence. We can reproduce this reliably on a ti8148-evm
> development board. My best guess is it's because of an ancient kernel
> being compiled with a very recent GCC.
>
> Regards,
> Thilo

if gcc-4.6 was from meta-toolchain (including linaro patch
toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106827.=
patch)
then you need to pass -mno-unaligned-access in your kernel Makefile
like this commit does:
http://git.freesmartphone.org/?p=3Dlinux-2.6.git;a=3Dcommit;h=3D78ffc81db89=
11acdabd026ad3fdefa20b4e34e52

be aware that without this patch -mno-unaligned-access is not valid
option for gcc (older than 4.7).

Cheers.


