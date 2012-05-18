Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SVHmq-0000ny-JI
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 09:39:44 +0200
Received: by lags15 with SMTP id s15so1943869lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 00:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=wERpPXzhjV/caO54M2mEPJwCp0lJ9cUdbjh+WvWoHyg=;
	b=hwhq4aasGKgEH80u7HOxziyp0yddHDEVtF5GmMCBSTJHSEL/fIJFTBIckqW2MSODWb
	jd3ylbcM7mFzCveu6tSHtunjlBjVt1skvArGQiTFgPLAb2N0SexHxrrSeBfps/o7jDec
	sz4pTxcchJ4Tu7x/TpvnN+8H/xMhyRDemQLsHNjsl+XerDUqUNR0vvynZc9Gm0PKPI4z
	2AU09RVnHNgSJQEqNRqPIK2U0Wz/HzscIcx9bY3X6lNyPJ2lQTPXneua4IEiCYTtBTJd
	LZ1NhInCe55VMQsoEdBYDBjo08SH/uB3i2akKRhtvVdJ9IAD1BraRX0ibmD2lMzxGXur
	jong==
MIME-Version: 1.0
Received: by 10.152.48.6 with SMTP id h6mr10019017lan.30.1337326180942; Fri,
	18 May 2012 00:29:40 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Fri, 18 May 2012 00:29:40 -0700 (PDT)
In-Reply-To: <CAMKF1sqJ3Bq0g0wr0i48D85n1gGGR3dtdbMUsOKnrUAr5wMvnw@mail.gmail.com>
References: <1337119302-28549-1-git-send-email-raj.khem@gmail.com>
	<CADZ6=avUxq8fBHF3UMCZ3T6A-W+tm7ZOVR-kCa48L_4_J9+2ZA@mail.gmail.com>
	<4FB388F8.2000802@mlbassoc.com>
	<CADZ6=at=H9cGJcyMvSuwVieMzV0hAPx37TbBcUwGS3yTeTKk6g@mail.gmail.com>
	<4FB391D1.10607@mlbassoc.com>
	<CADZ6=av1G6NsBOZu=sCt47OoK=OPDn2MP7gZTnfD+7NdrwzG2A@mail.gmail.com>
	<4FB3A136.8020607@mlbassoc.com>
	<CADZ6=auEEjJn38PcJTaW=-HKwBz0sPj4OouQtNfCP_rc1x0xGA@mail.gmail.com>
	<CAMKF1sp4c4bvh32evDREWKQr92A4q=xFGzBdqQn1ecZYBt1kQw@mail.gmail.com>
	<CADZ6=asQ37VTM9RE5b53KYn6-dMTgnnXCbC50=c7SdKvCrziXw@mail.gmail.com>
	<CAMKF1sqJ3Bq0g0wr0i48D85n1gGGR3dtdbMUsOKnrUAr5wMvnw@mail.gmail.com>
Date: Fri, 18 May 2012 09:29:40 +0200
Message-ID: <CADZ6=asH0kdO4+qz22bm9SE6BFtn8-RjSyarH7Xro9GEzfF-zw@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnxCUPfDhjPTxHQnjdOvMArT26cGxuLXIHZ7u1qPkDZB5Uv0mMMPdML6tR7F78mcxKr8vFD
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
X-List-Received-Date: Fri, 18 May 2012 07:39:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Khem,

>> Actually we'd like to stay on HEAD and build our own distribution on
>> top of that. Hence I'm more interested in getting ti81xx-psp-2.6.37 to
>> work with gcc-4.7. I'll try Martin Jansa's hint
>> (-mno-unaligned-access) next.
>
> then use the default gcc that angstrom head is using which is 4.7

We switched back to gcc-4.5 by pulling into our layer what meta-oe has
thrown out of their toolchain-layer and fixing up a minor issue with
the binutils GOLD linker. Right now we're using everything from
Angstrom _except_ gcc-4.7. This is because ti81xx-psp-2.6.37 will not
run out of the box when built with this version of gcc.

Using latest Angstrom w/ gcc-4.5 from our own layer is just an
intermediate step. It is necessary so we remain with a working
platform.

> and also be
> ready to experience some bugs as well yes -mno-unaligned-access is
> needed for kernel
> in some cases but eventually I think new kernel should be able to handle =
them

This is the next step. Now that we are on latest Angstrom (and, w/
gcc-4.5, can build firmware that boots) let's look into that gcc-4.7
issue. If it's really just a missing flag then we should be on 4.7 in
no time. I would remain skeptical, though, since TI's kernel fork for
DaVinci, ti81xx-psp-2.6.37, is very old and lacks of code quality.

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


