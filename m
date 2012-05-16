Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SUcEp-0000rC-Nn
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 13:18:01 +0200
Received: by lags15 with SMTP id s15so403475lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 04:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=jMA1LLplNmVTfQd5hHhc+CzV3MK+hZ0mDtUnYHX4szQ=;
	b=e/toyVxYRkF1jBuiv/ZpxZU2faF52JcFh3pzv0k2Ul48+1OF+o63C05uW6N63CRwmR
	lTjWtDuzg+MVaQF0Seyy7uSDhKXHn1e1V3LOvSnHRV1cLCn36S8U1nPwdGsNnDBtQCkb
	E+fNRice0ohfhEQFsQtafFHfOmYscHsrniVubM2iRs+s9fWO04HGU5CNzfCdPIU6g+H4
	60OiO1P0VUB69U8DLaW9XYvWHgKBcYbhlZJZWOGJiUNdz8lJ63O6iOGYzpv2T6dq5XDl
	iHPEdvSq32mBplypmRS0T8cppC0vbKWFA6bAElDYIVLmLrN/Oiau6TSeMIWm7fd0cspX
	GIDw==
MIME-Version: 1.0
Received: by 10.112.88.34 with SMTP id bd2mr812169lbb.33.1337166470486; Wed,
	16 May 2012 04:07:50 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Wed, 16 May 2012 04:07:50 -0700 (PDT)
In-Reply-To: <4FB388F8.2000802@mlbassoc.com>
References: <1337119302-28549-1-git-send-email-raj.khem@gmail.com>
	<CADZ6=avUxq8fBHF3UMCZ3T6A-W+tm7ZOVR-kCa48L_4_J9+2ZA@mail.gmail.com>
	<4FB388F8.2000802@mlbassoc.com>
Date: Wed, 16 May 2012 13:07:50 +0200
Message-ID: <CADZ6=at=H9cGJcyMvSuwVieMzV0hAPx37TbBcUwGS3yTeTKk6g@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnFPaKVmjbxPBQ8aqH0LE5DWeFTtoWE7ziODMa6UWAqgeZdEz2G5PSiUbym1XKf6bdG60ni
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
X-List-Received-Date: Wed, 16 May 2012 11:18:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Gary,

>> Hello *.*,
>>
>>> Khem Raj (3):
>>> =C2=A0 =C2=A0 =C2=A0eglibc-2.12: Remove
>>> =C2=A0 =C2=A0 =C2=A0binutils-2.20: Remove
>>> =C2=A0 =C2=A0 =C2=A0gcc-4.5: Remove
>>
>>
>> Removing gcc-4.5 would kill Texas Instruments DaVinci (dm814x, dm816x)
>> support. You only get a heavily patched 2.6.37 kernel from TI for
>> these (linux-ti81xx-psp_2.6.37). Unfortunately gcc>=3D 4.6 is unable to
>> build a kernel which boots for these platforms. After
>>
>> Uncompressing linux ... booting the kernel
>>
>> there is silence. We can reproduce this reliably on a ti8148-evm
>> development board. My best guess is it's because of an ancient kernel
>> being compiled with a very recent GCC.
>
>
> I build with GCC 4.6.3 from that tree for the DM8148 all the time and
> it works fine. =C2=A0Maybe there is some option/selection in your configu=
ration
> that's not in mine? =C2=A0Can you send it & I'll give it a compare?

Sure! Our project is on github, and so is our defconfig:
<https://github.com/DFE/HidaV/blob/master/meta-hidav/recipes-kernel-bootloa=
der/linux/files/defconfig>

We added aufs (Another Union File system) and the blockrom MTD FTL to
the kernel, so there are additional options in our configuration.

Thanks for your effort, Gary,
regards,
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


