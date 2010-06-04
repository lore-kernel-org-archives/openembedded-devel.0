Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKRYi-00009S-AZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 09:43:32 +0200
Received: by fxm9 with SMTP id 9so591728fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 00:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PUk+MrnkDB7/BEPDxm4qr4Gc6wy7+1PLyVURVUwUdf0=;
	b=JEBB8nguhaMx7hH2tGrQ4Gi5WMICvwxH2vBpAFmcfirbLMU8fMFIag+GUskVMsYn8u
	tAJEyviBmQ9kDiwqR08st/stcZ0XEQPmacJgrwXpgvfNBP54ZOVFESV5BV+THsGlZ/SS
	bNjYWNXrtqtvYD0rppeVhzLSNpk7DA0JIrLdw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tcmk6kMdV5cBg/eo3XOrQn3hzIDVRL/lus0GPb2BAX2A4sjiukPTxcQdubXy2D4LPx
	43aTKxotHbrZHlJrNOFmp2wUr0JTK+OxilxJZnFjMH/drdE3U3t389kadeA7dCPj/d7C
	SZt3vv7DRRYvIalNgQMWZIW8H/mm7yE2PLdW8=
MIME-Version: 1.0
Received: by 10.223.58.83 with SMTP id f19mr2317518fah.88.1275637139774; Fri, 
	04 Jun 2010 00:38:59 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Fri, 4 Jun 2010 00:38:59 -0700 (PDT)
In-Reply-To: <20100604002902.GA24343@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-7-git-send-email-raj.khem@gmail.com>
	<hu6fm8$gg4$2@dough.gmane.org> <20100604002902.GA24343@gmail.com>
Date: Fri, 4 Jun 2010 09:38:59 +0200
Message-ID: <AANLkTimLGz3yNOafixBe0Mfkb1f_jLUK44Ubq68W1eUa@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 06/16] db_5.0.21: Add recipes for target and native packages.
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
X-List-Received-Date: Fri, 04 Jun 2010 07:43:37 -0000
X-List-Received-Date: Fri, 04 Jun 2010 07:43:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 4, 2010 at 2:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On (02/06/10 22:41), Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 02-06-10 22:34, Khem Raj wrote:
>> > * Get rid of old style staging.
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> > =A0recipes/db/db-native_4.2.52.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 -
>> > =A0recipes/db/db-native_5.0.21.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +
>>
>> Can these get converted to BBCLASSEXTEND?
>
> Yes. I have intended to do that afterwards

Then

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>
>>
>> regards,
>>
>> Koen
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.5 (Darwin)
>>
>> iD8DBQFMBsIIMkyGM64RGpERAqLBAJ9T1EGUDygy/NfaND/5EO0hSebLqgCfUPHo
>> 7eD81HjkwQFLTl3APVx7mFg=3D
>> =3DmMkU
>> -----END PGP SIGNATURE-----
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


