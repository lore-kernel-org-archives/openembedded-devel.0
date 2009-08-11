Received: from [209.85.220.216] (helo=mail-fx0-f216.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MamXb-0002E5-Dh
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 10:17:08 +0200
Received: by fxm12 with SMTP id 12so2927074fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2009 01:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=z3xjEEfIul6pgv5urS6MjVWnaD4ojToWsn6APqG+HIA=;
	b=qzHNTsm2ONMtT+yGdWUJOlBnoPy5pEr+QYwPxnw3rDkfQd0V73ZlE3LLwS8+pkXf2B
	NzBai+3drmF7LmYiNelKkmN+bBYHswxxjsu3GRjeFnUukECckZkF6rxkat162emqduGa
	XDX372mFgCIGOQY7mhygUuP7f62jZsDEADYf4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wvotJA5/zZmrLEgQco5ztZXc+1guKgXakNJG1gkI2PxeDLoNtSzLExKlf+u241M1QM
	LYlpNkxbrg3Sd2ua1rLmwzsUktyTyHXhGfKX4z7Zk0CkvER2N0sSu6kjYenM/un6/Gm5
	IdaSagKoT9Mnl0J7tIvMfXvwSXA8mt+KuecUw=
MIME-Version: 1.0
Received: by 10.103.6.18 with SMTP id j18mr2294752mui.117.1249977647108; Tue, 
	11 Aug 2009 01:00:47 -0700 (PDT)
In-Reply-To: <19c1b8a90908110034j73e16bacqcf7c7c8c1d3a3607@mail.gmail.com>
References: <20090810205124.GA15812@gmail.com>
	<4A80976B.6020108@soundmetrics.com> <20090811014358.GA8250@denix.org>
	<19c1b8a90908110034j73e16bacqcf7c7c8c1d3a3607@mail.gmail.com>
Date: Tue, 11 Aug 2009 11:00:47 +0300
Message-ID: <fce2a370908110100m2347b6fag409721b7f024b847@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
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
X-List-Received-Date: Tue, 11 Aug 2009 08:17:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, Aug 11, 2009 at 10:34 AM, Khem Raj<raj.khem@gmail.com> wrote:
> On Mon, Aug 10, 2009 at 6:43 PM, Denys Dmytriyenko<denis@denix.org> wrote:
>> On Mon, Aug 10, 2009 at 02:55:55PM -0700, John Faith wrote:
>>> Khem Raj wrote:
>>>> ...
>>>> It seems like this file
>>>> /home/kraj/work/oe/openembedded/recipes/powervr-drivers/libgles-omap3/OMAP35x_Graphics_SDK_setuplinux_3_00_00_08.bin
>>>> is missing in my case.
>>>>
>>>> Where should it come from
>>>
>>> The Graphics SDK installer must be downloaded from Ti and manually put in
>>> place before building libgles:
>>> http://code.google.com/p/beagleboard/wiki/HowtoUseSGXunderAngstrom
>>
>> By the way, should it be done the same way as DVSDK - i.e. expect the
>> installer in the downloads/ instead of the recipes/? Which way is better?
>
> FWIW I would prefer if it downloads the file for me somehow

Texas Instruments doesn't allow it.

>>
>> Denys
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


