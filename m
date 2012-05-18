Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SVOVh-0001cQ-1q
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 16:50:29 +0200
Received: by lags15 with SMTP id s15so2197095lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 07:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=RuZEiwcEePV6s11MaU2LieBj3quJ9oBdO6+V1DzWk7s=;
	b=FCUZPAROFWM9+wH7a94nKGnDaAHXFT6NScrkc2vGhgXKwOHgKypei383CxY0xdtE4+
	aa84cPi5f5aJqN4ZtZKp2BjdY1QQspV9szrjOQf6zRLFBPI0XJRkoGKxildsCfSvaP5I
	QUCtOWf+0KQI+mVqT5RyO2cKZbZrn0+m6XH5dxv00CVAnnRgtN4rEiqGOsp6vEF7bKbK
	L3/pS9m50a9jRJSYtgwaEOX4YMKiMxZNYXjS5GVeJXZeCuq9nHq/UBranmqvL1/nP0OQ
	0aVUvcTOqaYeuavNbLgBqA+b2/SkfEB2XV/v5rYetZN+CuxSv0TMkeDESszdCtqn3iUW
	DOVw==
MIME-Version: 1.0
Received: by 10.152.148.234 with SMTP id tv10mr11276915lab.41.1337352025126;
	Fri, 18 May 2012 07:40:25 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Fri, 18 May 2012 07:40:25 -0700 (PDT)
In-Reply-To: <331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
	<CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
	<331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
Date: Fri, 18 May 2012 16:40:25 +0200
Message-ID: <CADZ6=atZrjgogV7zopSvXEvev6kucn524KG-s3Au7ocQ-+Eyyw@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnT6NuUuEkJrrjaYJ4YJWsloUYREdzimHd6yWq6IJZkO/mHYr+Gv/9pHYUbGUYP9ExWJAVl
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
X-List-Received-Date: Fri, 18 May 2012 14:50:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Koen,

>>>>>> sorry for the cross-post (openembedded-devel, meta-ti), I think this
>>>>>> affects both projects one way or the other.
>>>>>>
>>>>>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5. This me=
ans
>>>>>> with oe-core + meta-oe you now can choose between gcc-4.6 and gcc-4.=
7.
>>>>>> However, both compilers break the kernel we're using
>>>>>> (ti81xx-psp-linux-2.6.37).
>>>>>
>>>>> What happens when you disable the mailbox? AIUI you shouldn't need th=
at on
>>>>> Ne/Ce.
>>>>
>>>> How do I disable the mailbox?
>>>
>>> In the .config
>>
>> Wait wait wait, according to drivers/staging/tidspbridge/Kconfig we
>> need OMAP_MBOX_FWK (i.e. "the mailbox") in order to use the DSP
>> bridge. Disabling it would mean cutting off our DSP. No way.
>
> Are you actually using dspbridge? Or are you using dsplink or syslink?

No, I was wrong. OMAP_MBOX_FWK is forced to "Y" in our config and I
thought DSPBRIDGE forced this. But DSPBRIDGE isn't even active in our
configuration. I cannot turn OMAP_MBOX_FWK off, it's forced to Y, and
I'm currently trying to figure out which part of
ti81xx-psp-linux-2.6.37's wicked configuration is causing this.

>>>> What do you mean by Ne/Ce?
>>>
>>> Netra/Centaurus, dm81xx, c6a81xx, am38xx, am39xx or whatever TI is call=
ing it nowadays.
>>
>> We're on a "TI DaVinci DM8148", featuring a cortex-a8 combined with a
>> C674x DSP.
>
> So a centaurus family SoC.

Thanks for the clarification :) TI didn't approach us with any of the
terms you mentioned. It's just DaVinci for them when they're talking
with us.

>
>> I think the only ones left without DSPs are AM-...
>> processors. So no, the DSP bridge (and therefore mailboxing) must
>> stay.
>
> See what I said above, I doubt you're using dspbridge.

You may be right; I didn't dig into DSP communication so far. Also,
DSPBRIDGE depends on OMAP3, which we don't have (dm8148 is a
"OMAP2PLUS"). So I was wrong with DSPBRIDGE forcing OMAP_MBOX_FWK.
OMAP_MBOX_FWK is just active and I can't switch it off.

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


