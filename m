Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SAhOR-00080O-Rr
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 13:45:27 +0100
Received: by wibhj13 with SMTP id hj13so606345wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 05:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=7EVCgly9pORhEIsSXGL8EcQqGLO54FP2bZOg/f+Ivfw=;
	b=hyscs9bmKcFxHxAGIP/dyM4B75CTMw0tzXHIMarSpYBEWxnKqydyO8uVWrweRxOnxz
	i2aJ8bJeLzpB2VB0K4/+AgE1JTx+kpG1Mcs47zGus9NsySgVj+22j0u6qwZ9iorHUw1h
	qw3RDn4V6AnjdWuPclTzShc3h1xN3gcyh/ChksvywJh5jDtL+wbX12gXr3nbDiq3pxGW
	8ciYylMQ4lVpgDrNfSO7qvSAKRRcRb7rqWluUi7Uwy+to3tmR87ZmaQ5lGBPZoEl4qtj
	y/s01uloPF8DFGCJuGFgu00gKr5wjcMCuZB4eMiD5hIH3FZWlVQDlYHikwbj+zGpWnCb
	lCSg==
MIME-Version: 1.0
Received: by 10.180.100.2 with SMTP id eu2mr4886078wib.1.1332419793039; Thu,
	22 Mar 2012 05:36:33 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Thu, 22 Mar 2012 05:36:32 -0700 (PDT)
In-Reply-To: <jkf4r1$u81$1@dough.gmane.org>
References: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
	<jkdg34$om0$1@dough.gmane.org>
	<CAGiJk9cG0mySg454zxYS8VJLc9etr2jAAxxtBSMbN9boq0EnRg@mail.gmail.com>
	<20120322092859.GE4010@jama.jama.net>
	<CAGiJk9ex0qxUQrxyCSjH33dpH_sg40MmLj+Gq5SSgW2AkyoL_w@mail.gmail.com>
	<20120322104009.6a4ed04e@eb-e6520>
	<CAGiJk9cUPhrLHQicRsDfa-e_vn=0OdmE=BuyXxvi7cJX1XUfrw@mail.gmail.com>
	<jkf2bu$9pb$1@dough.gmane.org>
	<CAGiJk9fXnA24HKjF9rkhkoimDO1etb9eEExNG1Div1bze=XQSA@mail.gmail.com>
	<jkf4r1$u81$1@dough.gmane.org>
Date: Thu, 22 Mar 2012 13:36:32 +0100
Message-ID: <CAGiJk9eyv-rb5opXU6s3PC935yD0yLABrSu6_syzFpy6QaSJhw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] [meta-oe] giflib: Move to OE-Core
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
X-List-Received-Date: Thu, 22 Mar 2012 12:45:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/3/22 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 22-03-12 12:38, Samuel Stirtzel schreef:
>> 2012/3/22 Koen Kooi <koen@dominion.thruhere.net>: Op 22-03-12 11:12,
>> Samuel Stirtzel schreef:
>>>>> 2012/3/22 Eric B=C3=A9nard <eric@eukrea.com>:
>>>>>> Le Thu, 22 Mar 2012 10:35:31 +0100, Samuel Stirtzel
>>>>>> <s.stirtzel@googlemail.com> a =C3=A9crit :
>>>>>>> 2012/3/22 Martin Jansa <martin.jansa@gmail.com>:
>>>>>>>> why not add meta-oe dependency to meta-kde/README?
>>>>>>>
>>>>>>> It is already listed as dependency [1]. But somehow it seems
>>>>>>> like that there are users, interested in testing this layer,
>>>>>>> with an use case which excludes the meta-oe layer.
>>>>>>>
>>>>>>>
>>>>>> can you describe this use case so that meta-oe gets a chance to
>>>>>> adapt.
>>>>>
>>>>> Since I have the common use case of the installation provided from
>>>>> the setup-scripts and I don't know the exact use case, I cannot
>>>>> provide this information myself right now.
>>
>> So you can't explain why it should move to oe-core, that should be enoug=
h
>> to NAK this patch without even looking at it.
>>
>>> If the explanation that an user group that has another use case
>
> No, an *alledged* user group that *might* have an *alledged* use case for
> which you say yourself you cannot provide the information. That is what I=
'm
> complaining about, the degrees of hearsay and hypotheticals in your argum=
ent.

Ok I will send a V2 with a proper commit message and a proper target
audience / use case.

>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iQIcBAEBAgAGBQJPaxajAAoJEHZqAkdh1vT6+PgP/13/oayQIuLVdpEx2uslB0LZ
> XV5ctwGBoPW6VCIXg/GpTe0BzdIe8hUdnCLZt0gLf2UMN44Wy3RNVZ86000s0GM3
> R1/cJ+qNCjrjvNQtUYazG5fklvOk1MtHQnhvyznmkhrSYdaPsMQeeZHkdGey35X6
> MZavWe0ufOdKwJG7xgRb5LETduk8IgK6l7sYXr8lIvqq+TRzOqwkDO8ny1cQz1O6
> yKFPDisAQGsn4IKwwxPnpoS9/78y8HK4oo6jq5KWoLkQHIGmqe224mTTv7F+EV0b
> Ph/TwCQO6oNFLj64oaW9lQpBO1sSTBAMj51Oxvs8cHdQsZeswiAYH9qm8rbrNlRy
> QM0QRPxx6aB1K242ZcQfAlMXjgiw0akiMxtxMknJJTzVIpXINV+ZLn2TxsRVHRh+
> buuL7HCOiwGYXXzheXLaX4fS+Ctf4i6y0oI8o1F3vscAcj5z7n0YCEG0xu4wWddd
> bVbKQ/NHAnkdEE2PKYoP3jJirzFAfh/1X2NCWgD0CJSYoNkukZ3Tx1reINHg4mW5
> r3pFkaxo3B/5QaEHgo6Q8w/bGHu6toOjc3xt7yZPVp1Ita8yRxFEulrBcecd+UbO
> zzorKmBkJ96y98C6q2ihbo+SqrCGn/5Sx1b/8y7r70DWXyuECasdWM+5ASBmiiJs
> TAl4oHGfVVoedxmuD7fJ
> =3DAxKX
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--=20
Regards
Samuel


