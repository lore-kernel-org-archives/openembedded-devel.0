Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SbaNL-0005ZY-SG
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2012 18:43:27 +0200
Received: by eaal1 with SMTP id l1so1240573eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2012 09:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=uXb3FhDiit28Dutiq4C8vsY2OS7hBovH+KlJCKm3Cj8=;
	b=nZ8LafmtlZPHbJY43WWFDxFBvRcqSLrxS0HGXwpAqESunEm67tLvSbDWl0D4pVHiGn
	gU9hSxQqLzab22d3sEQJc4MzkNCOOnD34xg0/ZeZC6suCE7ezxYNC9cja/C3TbYVuSus
	YUpVyJFQvmXQmuapqF3zCoFTO9atN702agt2QqAM96RfyYELEwmNwXEHLkdD/TI7wMrN
	EalyNMsucrX+h/rdHEDYmS8xhe24QvmjlU7OYs2XSmG78FZ+iNZT4E+ox0yYCG6QbRaY
	OXA8UPrRIFJUXQkLh+tgH5e43MBisE/2wbSTk7EvLynXw148KScI7Ir+oOfuUgYfxJEA
	hjPA==
Received: by 10.14.188.140 with SMTP id a12mr4942852een.25.1338827582889; Mon,
	04 Jun 2012 09:33:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Mon, 4 Jun 2012 09:32:32 -0700 (PDT)
In-Reply-To: <4FCC5A7B.8040204@gmail.com>
References: <4FCC5A7B.8040204@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Jun 2012 09:32:32 -0700
Message-ID: <CAMKF1spW20v28PG+Te=5nfiGR0upuRqTRTr7G3w3SZTeR1zi7w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gcc-crosssdk-initial can not compile. Get message: this target does not support --with-float
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
X-List-Received-Date: Mon, 04 Jun 2012 16:43:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 3, 2012 at 11:49 PM, Martin Erts=C3=A5s <martiert@gmail.com> wr=
ote:
> Hi.
>
> When trying to compile meta-toolchain, it crashes during
> gcc-cross-initial with the error:
>
> this target does not support --with-float
> Valied --with options are: arch arch_32 arch_64 cpu cpu_32 cpu_64 tune
> tune_32 tune_64


can you post log.do_configure of this package somewhere ?

>
> The reason for this is a commit that happened 2012-05-01 in openembedded
> core, called "gcc: Grok for callconvention-hard to enable hard float".
> Reverting this patches makes it compile, and still I get the
> --mfloat-abi=3Dhard when compiling with the resulting toolchain.
>
> I'm compiling on a x64 Linux machine, with the target being a cortexa9
> processor. I have the DEFAULTTUNE set to cortexa9hf-neon. What should
> the patch do, and what will happen if I disable it?
>
> Best regard
> Martin
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


