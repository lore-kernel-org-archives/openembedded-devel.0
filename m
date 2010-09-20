Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oxkbr-0008QD-6G
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 19:57:08 +0200
Received: by gya6 with SMTP id 6so1547878gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 10:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=o6Ymi3n8/m92+pPsDe++jCaaHxllWDp4NCuAoW6ej9w=;
	b=SnwIK0PyjN7O6iO0Gx2eYREJADtydiMqyB5lmGNs3pLnjWCcOQcwGM54wA4/iYBD0i
	xuEogGt30PSe9ygoyk6X7vgyqyWzQukgdjHPQcMOGT6nYU5DTv27DYBHM+bBeEDDs8N2
	w0HrQck+6WyzYJ6ezGJI4seUg2p+vkIMC6kMo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=r/tbOZQYGTMvhfenSb4YuOn2mvEHuE2fu5KGvxrf5+55rJFrMPxWOGnUotfM91JLD5
	oa1Xe926Fb3NPvwGarZo2D7Se72s+Yyh/7m28n05eO0yagQB1k+cQ1SjgNr41IP4TuYq
	KL726UsDMbVlVH7JMVT0f+vJq2PjSj6kaBCTY=
Received: by 10.100.58.15 with SMTP id g15mr9840135ana.10.1285005412303; Mon,
	20 Sep 2010 10:56:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.194 with HTTP; Mon, 20 Sep 2010 10:56:32 -0700 (PDT)
In-Reply-To: <4C97723F.7010401@mentor.com>
References: <E1OxTYC-0004Sl-3k@melo.openembedded.org>
	<4C97723F.7010401@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Sep 2010 10:56:32 -0700
Message-ID: <AANLkTimSpV1UQgFg5-PgvhwhmGj-NZ-QMg-wOkLtzZtw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Khem Raj : iphone: Exclude from world.
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
X-List-Received-Date: Mon, 20 Sep 2010 17:57:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2010 at 7:39 AM, Tom Rini <tom_rini@mentor.com> wrote:
> git version control wrote:
>>
>> Module: openembedded.git
>> Branch: master
>> Commit: 0319f8878547c6e8a78373cfc86a85cea60450ae
>> URL:
>> =C2=A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=
=3D0319f8878547c6e8a78373cfc86a85cea60450ae
>>
>> Author: Khem Raj <raj.khem@gmail.com>
>> Date: =C2=A0 Sun Sep 19 16:38:38 2010 -0700
>>
>> iphone: Exclude from world.
>>
>> apple-csu overwrites the C startup files and nothing works after that
>> we can not select them with normal linux toolchain being staged and
>> used
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Shouldn't this be a COMPATIBLE_something case? =C2=A0You'd want this for =
world if
> that was what you were targeting... no?

yes. Actually its a distro iphone-compat that can be used to
differentiate. but then will COMPATIBLE_<distro> work ?

>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


