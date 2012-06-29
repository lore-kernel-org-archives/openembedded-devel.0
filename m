Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SkVaG-0008CN-FP
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jun 2012 09:25:40 +0200
Received: by lbol5 with SMTP id l5so4090619lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2012 00:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=Rx/9BE1lBVEFGPNkGvnt77k0GUbfJMRCG6vdlKSmYR4=;
	b=lrkRY/sYfIOW13ue81QxcjNgLsbblYRKv6M11WtGTJFFwCmrI1iN09eAhEadxMk9lG
	8PWgoyNReRb5QrYQx3Nw7CbslmgkyKDc1NGPC1UiCyRP1Dq7lVpxRWEcCJDS/b/F9n/F
	6QXnfrEUE4OLS68E5eyxSEPdH2qOwgfJEa3EUFAidsSYBcR6XMs+UpM1j5aQJnRN2fDA
	1fg2iN8P/ek2KT5qDjzp7Ngay0FwTWEcQ/SunUGWBracg1LXbKE/WTiKfocevnIdAryh
	uysO8c02rVHuyxqmUlRm0FDbmnmRF1ZexxSbEjCQaWJxgWpx87mfvw0WX35NX5CHS3vo
	WEbg==
MIME-Version: 1.0
Received: by 10.112.49.227 with SMTP id x3mr660208lbn.73.1340954084784; Fri,
	29 Jun 2012 00:14:44 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Fri, 29 Jun 2012 00:14:44 -0700 (PDT)
In-Reply-To: <CAMKF1spLCxsBLtUKpFzF18xM3Wa7FNTRiM8BCX-V0EmdbGUPPw@mail.gmail.com>
References: <CADZ6=avV5=3g9CkMMDc9cKLUpw_-Bk_q7fb5MceJmtR0gH6YvQ@mail.gmail.com>
	<20120628174041.GB24537@localhost.jama.net>
	<CAMKF1spLCxsBLtUKpFzF18xM3Wa7FNTRiM8BCX-V0EmdbGUPPw@mail.gmail.com>
Date: Fri, 29 Jun 2012 09:14:44 +0200
Message-ID: <CADZ6=au8hwxpkFfLJPiK5DO-kx9dPDvEC1XExACXxE+S8xeomQ@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnPrGYUbiuXiENhrarNfiyJQO+PsUgi3sFQz9RpfILMD7SwgtULuby0JlIqgAMQoJk8MRHZ
Subject: Re: meta-oe breakage since oe-core removed gcc-4.6
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
X-List-Received-Date: Fri, 29 Jun 2012 07:25:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello list,

>> khem's patches which removed it from oe-core said:
>> gcc-4.6: Retire into toochain-layer
>>
>> so I guess he has some patches adding whole recipes to toolchain-layer
>> (I had a feeling that I've even seen them somewhere, but cannot find
>> them later).
>

That was my guess, too. However, if Khem would have waited for Koen to
pull his patches for meta-oe before removing gcc-4.6 from oe-core then
no build would have been broken, I suppose.

> the patch is here
> http://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dkraj/move-=
gcc-4.6
>
> Koen
>
> Please pull it
>
> I did not post it since it would hog patchwork
>

Thanks for those patches, Khem!

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


