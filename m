Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mateusz.kijowski@gmail.com>) id 1MDx0Y-0000iy-KX
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jun 2009 10:48:38 +0200
Received: by bwz19 with SMTP id 19so3724282bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jun 2009 01:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Tn+ez02jIfXHUhm3yws/G0hXl5z+hDpdpJjXZOxwSBM=;
	b=cpthz1p3R3EE7KWM2hChLnWtQD/2qet1aL3bVKirQeHypeMkY7mT/1K1SH3EffS19d
	BVXwCTJFhjflAqbcm0sP3XCYOUYJrC71RP5JZPVdbv/WDoNHxM+KwRcpDfj9uZnvDPQX
	91qVqyHBEwO91T97Dyl7SI5mVd0SKXbv28iD0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=RXTphDdC5uoLSH/vDu8yN9b0P9Jvn8tvJY5btapaWSJ5Ep0gcacDn20LMjCSbzvFN5
	t8Qq/Apqm8SWYhj1FMOd8qQOq1wMLtIEtu3Vvp+B1ds0aXdFceswbDmlkVAdGHB+lUg7
	NpDPdBDJ61xAvxqCogNPn7iAFrtEYDPTMWgK0=
MIME-Version: 1.0
Received: by 10.223.113.9 with SMTP id y9mr4947877fap.61.1244536741489; Tue, 
	09 Jun 2009 01:39:01 -0700 (PDT)
In-Reply-To: <921557650906071533v6555e1fbt52e33bcbb17e05d@mail.gmail.com>
References: <921557650906061408x129a09c6j53d0e0a971a5eac8@mail.gmail.com>
	<1244372045.4151.19.camel@lenovo.internal.reciva.com>
	<921557650906070935r60adc48enb8ac30fc56a7d319@mail.gmail.com>
	<200906072108.55900.marcin@juszkiewicz.com.pl>
	<921557650906071533v6555e1fbt52e33bcbb17e05d@mail.gmail.com>
Date: Tue, 9 Jun 2009 10:39:01 +0200
Message-ID: <921557650906090139j2e0e2302q3b87374d076af5c7@mail.gmail.com>
From: Mateusz Kijowski <mateusz.kijowski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] netvista 8363/N2200 machine support
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
X-List-Received-Date: Tue, 09 Jun 2009 08:48:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>>> Ok, I rearranged things a bit.
>>
>> You can use tune-geode.inc instead of tune-x86.inc file. Also please add
>
> I created tune-geodegx1.inc. Well, I copied it from tune-x86.inc
> actally. It seems a good idea to separate this from other Geodes, sice
> GX1 is quite different from GX and LX.
>
>> those URLs from commit description into machine description so other
>> will get them without 'git log'. I am also not sure are
>
> Done.
>
>> "FILES_kernel-image" works in this way which you use.
>
> It works as I expect it to - right now do_install() installs bzImage
> which I don't need and I want to explicitly select files for inclusion
> in kernel-image package.
>
>>> Right now the patch and defconfig are in
>>> recipes/linux/linux/netvista8363 and all kernel related stuff is in
>>> linux_2.6.24.bb including the overriden do_install().
>> Fix indenting in linux_2.6.24.bb in do_kernel_2x00_image().
>
> Got rid of tabs it this is what you meant.
>
>> Instead of copying kernel_do_install() as do_install_netvista8363() use
>> do_install_append_netvista8363() which will do only required stuff. It
>> will allow you to concentrate on your device working instead of having
>> to track kernel.bbclass do_install() changes (when they will happen).
>
> Done. Updated patch is attached.

Can anyone review this and commit? Or should I post this patch to the
bugtracker?

Thanks,


Mareusz


