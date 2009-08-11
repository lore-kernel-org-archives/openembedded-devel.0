Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mam7m-0001Qt-Fp
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 09:50:26 +0200
Received: by qyk35 with SMTP id 35so3200419qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2009 00:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JNkjeZkbN3yTa8ZbK5n9g1kTHo0UmRv63FrHPUhC0XU=;
	b=KlIvXWMut35Z/wi9OOysweOvQhlFyg7yPPZ/nCTLqZifYw1atQHxDvmmGmTuxM/XKv
	l3R83/iLrT69ejGx8ewA3UmeQd5/3EK+9X5VEwYkVMQXyEY5dB2VKrnKL/SATi8+RxBV
	oI3j7CJ4Qt0kXshCW3xXG8kE5broP/dvYSirk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qs0OtWkA8JA2Bclr07wdWI+4kxgNZqviddDHy6or/UwpTUEniYHXVIb7v6dN8FG5q1
	v8Kro85+CD3ahgQryw4E51dhfxV1JqBpAlO0nh4RngUVZ7M7v5ocazWibCtOf4yUq8On
	DxHlbQIW5RjoRT6IQ4Bj1Kl147z/aESM2Gwog=
MIME-Version: 1.0
Received: by 10.229.99.210 with SMTP id v18mr1730775qcn.34.1249976047929; Tue, 
	11 Aug 2009 00:34:07 -0700 (PDT)
In-Reply-To: <20090811014358.GA8250@denix.org>
References: <20090810205124.GA15812@gmail.com>
	<4A80976B.6020108@soundmetrics.com> <20090811014358.GA8250@denix.org>
Date: Tue, 11 Aug 2009 00:34:07 -0700
Message-ID: <19c1b8a90908110034j73e16bacqcf7c7c8c1d3a3607@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Missing OMAP35x_Graphics_SDK_setuplinux_3_00_00_08.bin during libgles-omap3_3.00.00.08.bb
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
X-List-Received-Date: Tue, 11 Aug 2009 07:50:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, Aug 10, 2009 at 6:43 PM, Denys Dmytriyenko<denis@denix.org> wrote:
> On Mon, Aug 10, 2009 at 02:55:55PM -0700, John Faith wrote:
>> Khem Raj wrote:
>>> ...
>>> It seems like this file
>>> /home/kraj/work/oe/openembedded/recipes/powervr-drivers/libgles-omap3/OMAP35x_Graphics_SDK_setuplinux_3_00_00_08.bin
>>> is missing in my case.
>>>
>>> Where should it come from
>>
>> The Graphics SDK installer must be downloaded from Ti and manually put in
>> place before building libgles:
>> http://code.google.com/p/beagleboard/wiki/HowtoUseSGXunderAngstrom
>
> By the way, should it be done the same way as DVSDK - i.e. expect the
> installer in the downloads/ instead of the recipes/? Which way is better?

FWIW I would prefer if it downloads the file for me somehow
>
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


