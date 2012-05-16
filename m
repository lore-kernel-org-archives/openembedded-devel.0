Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SUfum-0002Za-D7
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 17:13:24 +0200
Received: by lbol5 with SMTP id l5so604228lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 08:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=86aWPKq5+98Xr6wkHmDLC/OJAt9CJVXAwOZjyFmHMCc=;
	b=MkqwkuE1MSsHnCFtrpc6tmcfVrBPtPytn62KL+S5II+ojJJWCPFOdJirwHP3U4Ner+
	nKwIhRUkV6pb5LyMh0bdHUdbMsOGHt/3uMoHKxsfk+Y/AT7tbxGzhz54Rukd/kJC5dR4
	YWHt8CNLTv8oygaquOFa81h02maILIdYPeOBMEg9YGbgrTHpM/L7/i2dWIiTJ7HQ5CI9
	l00UTOtEIpfADD+CB0FohfnD9h4u/ZgI0SvWjpR2RmiJn6HDLuQhsFNV5/+9cEkT0yiH
	KOUk00mkG9fKFZzvkx3gXuW/lkXC5aAQOLUFDBiOs+U1/3rJYbn3Wun8efNOUTegQe9E
	rkzQ==
MIME-Version: 1.0
Received: by 10.112.88.34 with SMTP id bd2mr1154378lbb.33.1337180602853; Wed,
	16 May 2012 08:03:22 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Wed, 16 May 2012 08:03:22 -0700 (PDT)
In-Reply-To: <4FB3A136.8020607@mlbassoc.com>
References: <1337119302-28549-1-git-send-email-raj.khem@gmail.com>
	<CADZ6=avUxq8fBHF3UMCZ3T6A-W+tm7ZOVR-kCa48L_4_J9+2ZA@mail.gmail.com>
	<4FB388F8.2000802@mlbassoc.com>
	<CADZ6=at=H9cGJcyMvSuwVieMzV0hAPx37TbBcUwGS3yTeTKk6g@mail.gmail.com>
	<4FB391D1.10607@mlbassoc.com>
	<CADZ6=av1G6NsBOZu=sCt47OoK=OPDn2MP7gZTnfD+7NdrwzG2A@mail.gmail.com>
	<4FB3A136.8020607@mlbassoc.com>
Date: Wed, 16 May 2012 17:03:22 +0200
Message-ID: <CADZ6=auEEjJn38PcJTaW=-HKwBz0sPj4OouQtNfCP_rc1x0xGA@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmLyxbnUP6XdNURoG6RAFGW8UB+Ury7Vuy06dulq569ChZJ2twipKGjzOncU/bJ2WAR/ska
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
X-List-Received-Date: Wed, 16 May 2012 15:13:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Gary,

[ ti81xx-psp-2.6.37 defconfig ]
>>> The only real differences (modulo the hardware/peripherals in use)
>>> are some of the kernel debugging settings. =C2=A0Perhaps they are causi=
ng
>>> some problems with the newer compiler. =C2=A0The diffs between our
>>> configurations
>>> are attached.
>>
>> Thanks, but I don't think I will disable most of the debugging
>> features for now. We have e.g. memory leak reports by the kernel
>> memchecker in ext4. Given the pitiful state of linux-ti81xx-psp_2.6.37
>> in general I'm not willing to give up the little debug info I get.
>
> BTW, do you know if TI ever plans on updating the kernel? =C2=A02.6.37 is=
 so
> painfully old...

This is subject to speculation. David Illies, our TI field application
engineer, keeps telling us that 3.2 will be supported "eventually". I
personally don't think they ever will - the commit history in their
public git does not look like anyone is doing any portage work. Plus
3.2, the version they keep mentioning, is starting to smell oldish as
well. I would very much like to see support for dm81xx in something
_current_, but it's unrealistic given previous experiences with TI.

>>> the stock one from meta-ti + some platform patches. =C2=A0Perhaps there=
's
>>> something else to look at.
>>> =C2=A0meta-ti/recipes-kernel/linux/linux-ti81xx-psp_2.6.37.bb
>>
>> We're almost using this recipe too. We just appended AUFS integration
>> and custom package management installer scripts for the kernel. I'll
>> look into -mno-unaligned-access w/ gcc-4.7 as Gary suggested as soon
>> as I am finished moving gcc-4.5 into HidaV so we can actually build
>> firmware again :)
>
>
> Good luck
>

Thanks, looks like I'll need it :)  By the way, we successfully pulled
gcc-4.5 in our layer and are building with gcc-4.5 on angstrom-v2012.x
right now. Since you're on 8148 as well, and in case you would like to
stay up-to-date on what we're doing, just check
https://github.com/DFE/HidaV from time to time.

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


