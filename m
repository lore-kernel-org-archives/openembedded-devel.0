Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2003660169
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 17:52:55 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id lj1so11398062pab.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 09:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=4trL6GHEKVM8aJPIFnGqnn6TdKmuBo2ejluWOPOkd+U=;
	b=U7IwhUk22xms9bEBByLYK2wjYUUwBSWcLjglnS1qrYXNyz7XKhWyWaYD7etZ73a5Ju
	cA/JbmBnfoxs0xjXx0ahtXTCswlc1Gq22NvrsGT7/76Vom1YynpwnydXzqxDBrZdmh+B
	5TR/Vki3mS3jZtugnrGs2OJsejNebFmAsHmAifFaR1Yh3EISMZfzbR9mb2zdVkj/KccP
	9tIq46FTigTr86sNN2Apj35xHeu1JUi8pcHAUPtC+3ZqRI3gLIaYOzIWEgJslu2xMa1g
	RQfXsUxQb14rynZS5T8n7IDu9VE+lXaiHuL5fvDnCRkEKp5TfLv6hJzmEzJ8k45biXHO
	u+sw==
X-Received: by 10.70.42.47 with SMTP id k15mr7636046pdl.134.1423158776016;
	Thu, 05 Feb 2015 09:52:56 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:acea:9e83:df56:5ad8?
	([2601:9:3580:84c:acea:9e83:df56:5ad8])
	by mx.google.com with ESMTPSA id wt1sm5671672pbc.52.2015.02.05.09.52.54
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Feb 2015 09:52:55 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <3700387.1Q9y16bqhG@peggleto-mobl5.ger.corp.intel.com>
Date: Thu, 5 Feb 2015 09:52:53 -0800
Message-Id: <C89D77F8-3BC6-412A-B220-67AD52600F5F@gmail.com>
References: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0D86B1@dor-sms-xch01.digi.com>
	<3777411.pG0mYOicST@peggleto-mobl5.ger.corp.intel.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB0D891E@dor-sms-xch01.digi.com>
	<3700387.1Q9y16bqhG@peggleto-mobl5.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: "Viguera, Javier" <Javier.Viguera@digi.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking] crda-1.1.3 broken in dylan, dora, daisy and dizzy
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
X-List-Received-Date: Thu, 05 Feb 2015 17:53:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Feb 5, 2015, at 8:49 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Tuesday 03 February 2015 09:05:54 Viguera, Javier wrote:
>>> -----Original Message-----
>>> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
>>>=20
>>> I agree, #2 is the best option to take care of the older branches.
>>>=20
>>> Tom, can you please fetch the following files and add them to the OE
>>> source
>>>=20
>>> mirror:
>>>  http://distfiles.lesslinux.org/crda-1.1.3.tar.bz2
>>>  http://distfiles.lesslinux.org/2013.01.11-regulatory.bin
>>>=20
>>> I've verified the md5sums match the recipe:
>>>  29579185e06a75675507527243d28e5c  crda-1.1.3.tar.bz2
>>>  e0c8a5ca63fb8bf803213f9a0c90b50b  2013.01.11-regulatory.bin
>>=20
>> Good to know we agree on the best option.
>>=20
>> Could I make a humble request to speed up the copy of the packages to =
OE
>> source mirror?
>>=20
>> We have a BSP layer that depends on this and currently our build is =
broken
>> fetching crda.
>=20
> I've been thinking about this, and this is getting ridiculous. Instead =
of=20
> manually adding files to the OE source mirror, I think it's time we =
simply had=20
> a populated fallback source mirror that has all the sources for at =
least the=20
> recipes in layers hosted on openembedded.org (if not other commonly =
used=20
> layers) aside from OE-Core which is already handled by the =
yoctoproject.org=20
> mirrors. This issue keeps coming up far too often.
>=20
> Is there a possibility we can set this up?

We can infact setup a rsync from download directory of Martin=E2=80=99s =
world build jobs
looking at Tom for help=

