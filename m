Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SUdhL-0000a4-VV
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 14:51:24 +0200
Received: by lbol5 with SMTP id l5so474242lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 05:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=ER3CHo0fUJTzT+OnVD+4XpZn8rPEHsOCaLNucTphfTs=;
	b=PVzhYs1QGNByJijFT1eZmuLiXvBrDXCyTZg0g9/OIjTO4hb5bD77ePO65zddPq8lOi
	vOHYZVLJbDmvCiuKL30FWsXyu5xLld1p5jo6F9nLJXa0PDOwpY0cT+HhRnaY2rX04zmV
	pz/0wsPkXalSr155u/Dw/SlHATN6e++LIlDaWO79DWUbtMM/Bz8XdVf80dtLhghTu4t1
	Rx+12SNdlMEyJOMuX5CxL1ebeiJJ9/df4XQY8Bdp54zWqtCiFj1yD6UdVe4awF8XicF4
	0AWTLi+e/kSGommAAFOctBtjlerfn9oOXhLnOav0+q3FB6/rDWD9xXKzy2y2yDRHM3N+
	O6mQ==
MIME-Version: 1.0
Received: by 10.152.129.74 with SMTP id nu10mr2708606lab.50.1337172082683;
	Wed, 16 May 2012 05:41:22 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Wed, 16 May 2012 05:41:22 -0700 (PDT)
In-Reply-To: <4FB391D1.10607@mlbassoc.com>
References: <1337119302-28549-1-git-send-email-raj.khem@gmail.com>
	<CADZ6=avUxq8fBHF3UMCZ3T6A-W+tm7ZOVR-kCa48L_4_J9+2ZA@mail.gmail.com>
	<4FB388F8.2000802@mlbassoc.com>
	<CADZ6=at=H9cGJcyMvSuwVieMzV0hAPx37TbBcUwGS3yTeTKk6g@mail.gmail.com>
	<4FB391D1.10607@mlbassoc.com>
Date: Wed, 16 May 2012 14:41:22 +0200
Message-ID: <CADZ6=av1G6NsBOZu=sCt47OoK=OPDn2MP7gZTnfD+7NdrwzG2A@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkNIIbVCeVLLIPol441Z647+pG6b1ecM2KlPitt3oCeeQOCDDu0rw99e3p1MrSeCg6b7mlR
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
X-List-Received-Date: Wed, 16 May 2012 12:51:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Gary,

>>>>> Khem Raj (3):
>>>>> =C2=A0 =C2=A0 =C2=A0eglibc-2.12: Remove
>>>>> =C2=A0 =C2=A0 =C2=A0binutils-2.20: Remove
>>>>> =C2=A0 =C2=A0 =C2=A0gcc-4.5: Remove
>>>>
>>>>
>>>>
>>>> Removing gcc-4.5 would kill Texas Instruments DaVinci (dm814x, dm816x)
>>>> support. You only get a heavily patched 2.6.37 kernel from TI for
>>>> these (linux-ti81xx-psp_2.6.37). Unfortunately gcc>=3D 4.6 is unable t=
o
>>>> build a kernel which boots for these platforms.
>>>
>>> I build with GCC 4.6.3 from that tree for the DM8148 all the time and
>>> it works fine. =C2=A0Maybe there is some option/selection in your
>>> configuration
>>> that's not in mine? =C2=A0Can you send it& =C2=A0I'll give it a compare=
?
>>
>> Sure! Our project is on github, and so is our defconfig:
>>
>> <https://github.com/DFE/HidaV/blob/master/meta-hidav/recipes-kernel-boot=
loader/linux/files/defconfig>
>>
>> We added aufs (Another Union File system) and the blockrom MTD FTL to
>> the kernel, so there are additional options in our configuration.
>>
>
> The only real differences (modulo the hardware/peripherals in use)
> are some of the kernel debugging settings. =C2=A0Perhaps they are causing
> some problems with the newer compiler. =C2=A0The diffs between our config=
urations
> are attached.

Thanks, but I don't think I will disable most of the debugging
features for now. We have e.g. memory leak reports by the kernel
memchecker in ext4. Given the pitiful state of linux-ti81xx-psp_2.6.37
in general I'm not willing to give up the little debug info I get.

> As Martin points out, the newer compilers can have problems with unaligne=
d
> access. =C2=A0I've also [sometimes] had better success if I disable
> OPTIMIZE_FOR_SIZE
>
> The only other thing I see is the kernel version & recipe used. =C2=A0I a=
m using
> the stock one from meta-ti + some platform patches. =C2=A0Perhaps there's
> something
> else to look at.
> =C2=A0meta-ti/recipes-kernel/linux/linux-ti81xx-psp_2.6.37.bb

We're almost using this recipe too. We just appended AUFS integration
and custom package management installer scripts for the kernel. I'll
look into -mno-unaligned-access w/ gcc-4.7 as Gary suggested as soon
as I am finished moving gcc-4.5 into HidaV so we can actually build
firmware again :)

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


