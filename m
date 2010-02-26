Received: from mail-yx0-f203.google.com ([209.85.210.203])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NkzE8-0000u5-0I
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 13:23:28 +0100
Received: by yxe41 with SMTP id 41so4675yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 04:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=BAZ0WHYfmgtNfdJjyiW4EV1Ov25YMTU96Xbc5rC5cag=;
	b=aLgooP+GgI0rroLsMmW+HOkZG/85dHRw72JCynq4Kk1d1rYJViy29o72UWGv2I8uEP
	jV3koGD/8FqktBE4GAP2t0sg+ddRuGuUhx4+ivRlgy07c+W5OHfAjC3xkUsAm3C2GH+S
	XXAvEFxJpY38Lv3OjVGto17+D0ht6q0thTteA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=FXIyZF/hikOlUkVySfI/RMzrzF6HzZmi4vFuj9Zu22+KwADVMSsSQpf85s6VeZ/6MM
	E41oJiVaQqC4qYdRwwC8tQGenR0s9vsNUiyHTxSGgBYY9DevxAvQp9cZVwTk3lIzHUf8
	GHUKDB12Pk3yScMQebS9aafcyUjp13LgFuqx8=
MIME-Version: 1.0
Received: by 10.101.36.16 with SMTP id o16mr437977anj.122.1267186840458; Fri, 
	26 Feb 2010 04:20:40 -0800 (PST)
In-Reply-To: <4B87B283.20009@atmel.com>
References: <4B87B283.20009@atmel.com>
Date: Fri, 26 Feb 2010 13:20:40 +0100
Message-ID: <ac9c93b11002260420j1f1e88c1td3e38dcc95882f18@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.203
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC; Building multiple u-boot images for a single board
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
X-List-Received-Date: Fri, 26 Feb 2010 12:23:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/26 Ulf Samuelsson <ulf.samuelsson@atmel.com>:
> If you want to support multiple boot memories, you have to
> have multiple boards in the conf/machine directory
>
> I currently testing a change to at91bootstrap, where a defconfig
> is not provided by openembedded.
> Instead you provide a list of defconfig's in your machine description:
>
> I.E: in conf/machien/at91sam9g45ek.conf you have:
>
> AT91BOOTSTRAP_BOARD = "at91sam9g45df at91sam9g45ek at91sam9g45nf"
>
> when at91bootstrap is built it will loop through all the boards.
> and build three versions.
>
> I think it would make sense to do the same for u-boot,
> so that you can build u-boot for several configurations.
>
> This change would happen from u-boot-2009.11 an onwards.
>
> In your machine conf you would supply:
> UBOOT_MACHINES = "at91sam9g45ekes_nandflash at91sam9g45ekes_dataflash"
>
> A loop goes through the list
> and runs make on each element in the list.
>
> make at91sam9g45ekes_nandflash_config
> make
> make at91sam9g45ekes_dataflash_config
> make
>
> if UBOOT_MACHINES is not set, then a single build is done using
> UBOOT_MACHINE as usual.
>
> This will allow u_boot to be built for every boot configuration
> without having to add a lot of files.
>

I fully agree (as I also need two different versions for my board, one
for flash, one for sd).


