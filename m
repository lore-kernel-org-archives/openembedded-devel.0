Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SUhXz-0007kR-RF
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 18:57:59 +0200
Received: by lbol5 with SMTP id l5so700592lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 09:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=Mn1IfBtho8YMTLOxybWNef6MEquphmauW9eofiSfoBg=;
	b=iTRF8diubZYr5nNCnBxzw1VJcyhnK+odocVe5wvS/LYmkPnHqgsv0ybIdjsy9RZ2A4
	1VT+iOdUOiEM4e8ukkcbWuAnsqVhqgy0+AdnbSolJnlji+yLTU1/O+PKakKE3xm5MWK0
	EUvBGM9bpc4hUpwBXSPSsrC9nqeJLCOXxpiuv8517cFTxtMaZhbtXhpkSXGWmbRw19q9
	ux9iIIJ9djiSW3arDw54VcjvxfKu+U3io6DcJ8aqLsn5ks6vxJHVrglWr33sNq5Ufb83
	XBj0XYxNiR+c3914d/9YEWm2D90Ug6nc2WkeM8l+X5pr5zy6q2t4MPm4LnhmRWFbTvfN
	uh/Q==
MIME-Version: 1.0
Received: by 10.152.148.101 with SMTP id tr5mr3610755lab.36.1337186875298;
	Wed, 16 May 2012 09:47:55 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Wed, 16 May 2012 09:47:55 -0700 (PDT)
In-Reply-To: <CAMKF1sp4c4bvh32evDREWKQr92A4q=xFGzBdqQn1ecZYBt1kQw@mail.gmail.com>
References: <1337119302-28549-1-git-send-email-raj.khem@gmail.com>
	<CADZ6=avUxq8fBHF3UMCZ3T6A-W+tm7ZOVR-kCa48L_4_J9+2ZA@mail.gmail.com>
	<4FB388F8.2000802@mlbassoc.com>
	<CADZ6=at=H9cGJcyMvSuwVieMzV0hAPx37TbBcUwGS3yTeTKk6g@mail.gmail.com>
	<4FB391D1.10607@mlbassoc.com>
	<CADZ6=av1G6NsBOZu=sCt47OoK=OPDn2MP7gZTnfD+7NdrwzG2A@mail.gmail.com>
	<4FB3A136.8020607@mlbassoc.com>
	<CADZ6=auEEjJn38PcJTaW=-HKwBz0sPj4OouQtNfCP_rc1x0xGA@mail.gmail.com>
	<CAMKF1sp4c4bvh32evDREWKQr92A4q=xFGzBdqQn1ecZYBt1kQw@mail.gmail.com>
Date: Wed, 16 May 2012 18:47:55 +0200
Message-ID: <CADZ6=asQ37VTM9RE5b53KYn6-dMTgnnXCbC50=c7SdKvCrziXw@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlBt5Tq73tLa4whLiHvyWCQHnWXY1mIctVs2nNqcZ3vvvq0+q6KKlErX5XZOLkcFcvZUum3
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
X-List-Received-Date: Wed, 16 May 2012 16:58:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Khem,

>> Thanks, looks like I'll need it :) =C2=A0By the way, we successfully pul=
led
>> gcc-4.5 in our layer and are building with gcc-4.5 on angstrom-v2012.x
>> right now. Since you're on 8148 as well, and in case you would like to
>> stay up-to-date on what we're doing, just check
>> https://github.com/DFE/HidaV from time to time.
>
> btw. angstrom/master will be using gcc 4.7 so you are on your own if you =
use
> 4.5 with angstrom/master and it can be a long battle.

Thanks for the warning, Khem, but I'm well aware of this, I just had
my first round: making gcc-4.5 + eglibc build with the Binutils gold
linker. There is an issue in gcc/configure[.ac]. I won this time :)
(see <https://github.com/DFE/HidaV/blob/master/meta-hidav/recipes-devtools/=
gcc/gcc-4.5/gcc-4.5-detect-gold-linker-version-correctly.patch>

> Best course for you is to
> use 2012.05 angstrom stable where you will get gcc 4.5 from toolchain-lay=
er
> and it will be maintained there if any issues found. So you dont need
> to duplicate the efforts.

Actually we'd like to stay on HEAD and build our own distribution on
top of that. Hence I'm more interested in getting ti81xx-psp-2.6.37 to
work with gcc-4.7. I'll try Martin Jansa's hint
(-mno-unaligned-access) next.

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


