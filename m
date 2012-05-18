Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SVNYv-0007aS-Tf
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 15:49:45 +0200
Received: by lags15 with SMTP id s15so2143295lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 06:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=BcagSHV8Hf3tmi60tZK25jfJYli+rAudSlzhR0Ev4GE=;
	b=Ca6N2qsXCDowPKIOuOHNK4vsO6cTHhBkZ0MJbqmp2SeLEpuiciqGYG/RU5b0KwuhVm
	8V7WAU/0th0Rv/EUubjgdUDoiiNhjX1q4L+vDPWRoAUgwTzsRxUgH5c8mqpWU1YOF1IN
	9U7YfyZL9C4gN7/8oPaJmzgu2M+7vnAm5u8ZeiNox93jb8EU7rQcDW+pw3RKPJf70CUa
	6/GbW/b/TOFbRGN6V923+0YbXFMyA4l/BfSJhZ2cVrrOO2cHPxZJYLnNaOUd2F6bM1Fe
	U5glpgEXdBsCoU6be3k8Ap+ec8YL2UrTxSsQCTEcF7PplcRVnN+B6L1eGZUpUpSaIKwa
	ty1g==
MIME-Version: 1.0
Received: by 10.112.86.132 with SMTP id p4mr4793582lbz.22.1337348381813; Fri,
	18 May 2012 06:39:41 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Fri, 18 May 2012 06:39:41 -0700 (PDT)
In-Reply-To: <C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
Date: Fri, 18 May 2012 15:39:41 +0200
Message-ID: <CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm3KfqWTdEsY7PWOI8MTa8kIMit8Ta8xQC4S/F6Yh1eXfieaCP6Od0Qn0oqWWcJdVv7CYtp
Cc: meta-ti@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-ti] ti81xx-psp-linux-2.6.37: broken kernel with gcc > 4.5
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
X-List-Received-Date: Fri, 18 May 2012 13:49:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Koen,

>>>> sorry for the cross-post (openembedded-devel, meta-ti), I think this
>>>> affects both projects one way or the other.
>>>>
>>>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5. This mean=
s
>>>> with oe-core + meta-oe you now can choose between gcc-4.6 and gcc-4.7.
>>>> However, both compilers break the kernel we're using
>>>> (ti81xx-psp-linux-2.6.37).
>>>
>>> What happens when you disable the mailbox? AIUI you shouldn't need that=
 on
>>> Ne/Ce.
>>
>> How do I disable the mailbox?
>
> In the .config

Wait wait wait, according to drivers/staging/tidspbridge/Kconfig we
need OMAP_MBOX_FWK (i.e. "the mailbox") in order to use the DSP
bridge. Disabling it would mean cutting off our DSP. No way.

>> What do you mean by Ne/Ce?
>
> Netra/Centaurus, dm81xx, c6a81xx, am38xx, am39xx or whatever TI is callin=
g it nowadays.

We're on a "TI DaVinci DM8148", featuring a cortex-a8 combined with a
C674x DSP. I think the only ones left without DSPs are AM-...
processors. So no, the DSP bridge (and therefore mailboxing) must
stay.

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


