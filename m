Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SVNll-0004WM-B2
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 16:03:01 +0200
Received: by werg55 with SMTP id g55so2019962wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 06:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=r8MbVnyhOgr+jKLxFT2/3gabzuI4xeRIkad6vCbI8V8=;
	b=AOZ8WAsf7ptQYgE+50kx+lXss6m74PgRiUdCnk0WAPJyDNtlZF2s5/2cWhscA7WV8Y
	wpFKYMzK/yGoSivEKGvzGMNLL7Ufw5KhZoXTX1FQYaUXnt5GQ+3c7kyoE+A2vx4qLA+h
	nFfqS1hYHthhNLXRzNfg84bxoQYebbMt6626XXJgXWUL4612FRzcuIou9jDT+V8dMauS
	r4R1k1AhjOHfXrH/98u6Zsbd4plnNXoV7abs2rRW+F3lzEMHr4KfIb6o+rtoQlk4nQyP
	m65Ln0/NPtoxy/uiUDtNR9IXBsHppg4oa5l6PpLWwkgaxttN1oOc+BoSqF11UuzTl56j
	Ow0g==
Received: by 10.180.80.228 with SMTP id u4mr495402wix.5.1337349177713;
	Fri, 18 May 2012 06:52:57 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id r2sm1795761wif.7.2012.05.18.06.52.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 May 2012 06:52:56 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
Date: Fri, 18 May 2012 15:52:36 +0200
Message-Id: <331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
	<CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
To: Thilo Fromm <fromm@dresearch-fe.de>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQned/3nW+Rrki6TH3zk36rxnK8JMlKjA0qaTQv78rxDF5x3+FkJMb0B/xa9dFv7QB4X10Nb
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
X-List-Received-Date: Fri, 18 May 2012 14:03:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 mei 2012, om 15:39 heeft Thilo Fromm het volgende geschreven:

> Hello Koen,
>=20
>>>>> sorry for the cross-post (openembedded-devel, meta-ti), I think =
this
>>>>> affects both projects one way or the other.
>>>>>=20
>>>>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5. This =
means
>>>>> with oe-core + meta-oe you now can choose between gcc-4.6 and =
gcc-4.7.
>>>>> However, both compilers break the kernel we're using
>>>>> (ti81xx-psp-linux-2.6.37).
>>>>=20
>>>> What happens when you disable the mailbox? AIUI you shouldn't need =
that on
>>>> Ne/Ce.
>>>=20
>>> How do I disable the mailbox?
>>=20
>> In the .config
>=20
> Wait wait wait, according to drivers/staging/tidspbridge/Kconfig we
> need OMAP_MBOX_FWK (i.e. "the mailbox") in order to use the DSP
> bridge. Disabling it would mean cutting off our DSP. No way.

Are you actually using dspbridge? Or are you using dsplink or syslink?

>=20
>>> What do you mean by Ne/Ce?
>>=20
>> Netra/Centaurus, dm81xx, c6a81xx, am38xx, am39xx or whatever TI is =
calling it nowadays.
>=20
> We're on a "TI DaVinci DM8148", featuring a cortex-a8 combined with a
> C674x DSP.

So a centaurus family SoC.

> I think the only ones left without DSPs are AM-...
> processors. So no, the DSP bridge (and therefore mailboxing) must
> stay.

See what I said above, I doubt you're using dspbridge.=


