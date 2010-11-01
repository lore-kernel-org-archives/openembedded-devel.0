Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PD3Ln-0000tw-IU
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 23:59:40 +0100
Received: by iwn42 with SMTP id 42so7208348iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 15:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=qbkAWyVMjb/Y97QWygBlBfeYotYObxMPHiszpnekkI4=;
	b=L91/0BQbDC8gSRAWoRw/ABP0QTQHfaCKtjsYiZpN1TvI68YAEdsnD9s3j5tPe0NmSO
	2r5AeIL9vIlYdyISry9+yu7NE8poLh9nOUj/xQEQNrgNb9Qxu2kQVR9rcF0Ge6fEuPdJ
	3cprB7mp6g/L2RIrEaDKEbGgCXVaAf+DpDpP0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qH2xyhYO7mzajS0jS3waRzwQ2jLCWKt08qhHKiOUbrDQ5jtKIiHGhTzldYRPO9b2xa
	kNlFU6FOsRckDZcAucTjeoDhdTOZl0vsTm8+PJXJHxYzWhj4cjCYcYb08a3KH4whxWg5
	p+YJmghwFB8KATIj4VQaRkcdAoSFnQparKvQs=
MIME-Version: 1.0
Received: by 10.42.176.195 with SMTP id bf3mr2614950icb.188.1288642817031;
	Mon, 01 Nov 2010 13:20:17 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Mon, 1 Nov 2010 13:20:16 -0700 (PDT)
In-Reply-To: <ian3er$i8i$1@dough.gmane.org>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikQvYRyaMspRo9Skt_jmfNjz2MuOT+ff4wv=a82@mail.gmail.com>
	<AANLkTi=zxQ1AxJ9chbFjLJzps1LB8RCyaNkJk5HApTZ=@mail.gmail.com>
	<20101101183327.GD15069@ibawizard.net>
	<AANLkTimN4Rq2bWZXjs84FUtxNgD_BAQy=5=4gXJqfPGe@mail.gmail.com>
	<ian3er$i8i$1@dough.gmane.org>
Date: Mon, 1 Nov 2010 21:20:16 +0100
Message-ID: <AANLkTimc18mm2zgi3o9OdKBLp_hzNDK022yimHcwwzEh@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Mon, 01 Nov 2010 22:59:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/1 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 01-11-10 19:49, Frans Meulenbroeks wrote:
>
>> Disadvantage of an incremental build is that you need to keep all the
>> tmp dirs around, which, at least for me, is probably prohibitive (I'll
>> verify this later)
>
> rm tmp -rf
> git checkout tag-for-testing-prev
> bitbake foo
> git checkout tag-for-testing-next
> bitbake foo
>
> That will only use slightly more diskspace than a build from scratch

Yes, but I don't think it will catch errors like the one we had with
introspection (and libgee failing to build).
Of course ideally both a clean and incremental build should work, but
if I must choose, I prefer that the clean build works.

FM

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMzxEaMkyGM64RGpERAlQSAJ0bGeZ6m/V9ZpBe7bgLmqdpUZIJMQCeINEV
> nNvFg26kSX5BqwvVQaVM4CE=
> =DyxS
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


