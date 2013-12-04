Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id CCD266D2A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 14:13:47 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id h16so16795796oag.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 06:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=N8syA5sMiQoE7Zo3mm8sj28MF2jcMQz9rjzNqAeqWI4=;
	b=bFmLarRebn7qELgSI25R4e3teHu6ScEOm6yVQjkTXMAeZeboq+pDDcDuZKrsLtM231
	tvH8IkJj3shuBh1cN6NfTqH9NnSyDq3N6s6E4sXSticFT4xnUq6Rd00A4UsUu5e1mBAz
	irUrNxUSaQr9ewxXjom6XxjlKSdoK+0Y1tu0vPIJYlvmql/6Sqsf6JpRDWRn39oRGZVh
	yX19NML2egiKkiRMBWQmjnX0aL5JWrI/IUgxfPf7h41shmjsueehQk3xRv+2uwba66BG
	HzMjDxvfbVXpDR36618Eg3R2QZVC6X2Rcxc4IY00vxthdHzGngqCM94NyAvjQ3ZefQvJ
	W/kw==
MIME-Version: 1.0
X-Received: by 10.182.45.195 with SMTP id p3mr64244941obm.29.1386166427083;
	Wed, 04 Dec 2013 06:13:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 4 Dec 2013 06:13:47 -0800 (PST)
In-Reply-To: <l7nag8$s69$1@ger.gmane.org>
References: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>
	<1386107047-27409-2-git-send-email-otavio@ossystems.com.br>
	<l7mogt$5cp$1@ger.gmane.org>
	<CAP9ODKpy+pLLboraV=nNeEB1i3oVdg=DarEmF9Mem+do4sGC9w@mail.gmail.com>
	<l7nag8$s69$1@ger.gmane.org>
Date: Wed, 4 Dec 2013 12:13:47 -0200
X-Google-Sender-Auth: e1-G1uKohoI_EiaDDPguXdi_crw
Message-ID: <CAP9ODKoahD-SLwSmA5oKTuoeVkZeVCgjHRUF3RgXqkef1tj3Tw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe 2/5] proj: Use 'lib_package' class and add data files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Dec 2013 14:13:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 4, 2013 at 11:25 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Otavio Salvador schreef op 04-12-13 14:16:
>> Hello Koen,
>>
>> On Wed, Dec 4, 2013 at 6:20 AM, Koen Kooi <koen@dominion.thruhere.net>
>> wrote:
>>>> -inherit autotools pkgconfig +inherit autotools pkgconfig
>>>> lib_package
>>>>
>>>> +FILES_${PN} += "${datadir}/proj"
>>>
>>> Will this cause renaming of the output packages?
>>
>> It does:
>>
>> tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj-bin_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
>>
>>
> tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj-dbg_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
>> tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj-dev_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
>>
>>
> tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj-doc_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
>> tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj-staticdev_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
>>
>>
> tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj0_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
>>
>> Do you want me to add a transitional package?
>
> No, just being curious. I couldn't remember how it was before the change.

It had all in proj, as the binaries were not split.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

