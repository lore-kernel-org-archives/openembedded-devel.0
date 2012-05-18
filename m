Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SVOkO-00015r-TG
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 17:05:40 +0200
Received: by lbol5 with SMTP id l5so2234948lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 07:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=1auNEPNNxkQhcH+BKv9LVp99DYnseNevU4GmyaZZtU8=;
	b=d//q9Vqw9AyEtiCgg5n15uNB2IjzA8AsiAZQ8X0LAhzdKztyS0i+n8sjhrt7TOR4Hc
	rmMVVl8uxtBL/HJsUIqLDKhZuRixODhASp9+J2wiauckeWHrWomYMgXLaO7c6kXzeraD
	RX8Y6X4eSGoKNq+uqNvyt6Oj840AWsbK0iLrMqR/CxAEoECVNZ5r6RxArb08rBJoaw9S
	ojkm1iH0kVzLIzYpqox9cVTc/I7HUvihs9yP+BVClJ2UNaDFmuPZcRKnVfeXIgIdtFSa
	NygWMtv59W99R5xprxLR2rBuDfiNhEZNcyr03Alq//V4OlxYERezLan5JMdpFOsVodak
	yMfg==
MIME-Version: 1.0
Received: by 10.152.48.6 with SMTP id h6mr11376536lan.30.1337352936974; Fri,
	18 May 2012 07:55:36 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Fri, 18 May 2012 07:55:36 -0700 (PDT)
In-Reply-To: <4C82F39BABFE6A429733A300DEBF52240B76E4EE@DNCE05.ent.ti.com>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
	<CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
	<331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
	<4C82F39BABFE6A429733A300DEBF52240B76E4EE@DNCE05.ent.ti.com>
Date: Fri, 18 May 2012 16:55:36 +0200
Message-ID: <CADZ6=avtEDxL1jHTyc218+1Qzf79w0p+YLwPiLOibN6KgC1jsQ@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: "Monk, Roger" <r-monk@ti.com>
X-Gm-Message-State: ALoCoQlOZmS2WqpWlX+YWv6SLccHdqj4nTAAc/Z9YNMfyEKHCsFXBL69oU+RBozNS7k7tnuWnG9x
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 18 May 2012 15:05:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Roger,

>> >>>>> sorry for the cross-post (openembedded-devel, meta-ti), I think
>> >>>>> this affects both projects one way or the other.
>> >>>>>
>> >>>>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5.
>> >>>>> This means with oe-core + meta-oe you now can choose between
>> >>>>> gcc-4.6 and gcc-4.7.
>> >>>>> However, both compilers break the kernel we're using
>> >>>>> (ti81xx-psp-linux-2.6.37).
>> >>>>
>> > We're on a "TI DaVinci DM8148", featuring a cortex-a8 combined with
>> > a C674x DSP.
>>
>> So a centaurus family SoC.
>
> Can you put some printk's in omap_mbox_register (plat-omap/mailbox.c) to =
print the list objects, in particular the mbox->name?

What are you trying to do? printk-debugging? Via E-Mail? Are you
serious? I provided a simple procedure to reproduce the issue. Please
reproduce and fix the problem.

> Would also be useful to see the same in omap_mbox_get() before the call t=
o strcmp().

Please do that, go there and take a look.

We'll be using gcc-4.5 in the HidaV layer until TI fixes this mess.

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


