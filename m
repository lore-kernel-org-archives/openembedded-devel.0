Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1M6OOs-00047W-4M
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 14:26:30 +0200
Received: by yw-out-1718.google.com with SMTP id 9so2187275ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2009 05:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6veP/t9NE/rd8nPgT9WgKFkxUuZvgdleick9eW0Ml4I=;
	b=uNy6Vzx5UQV+p5RuJqZcbGWZQkOKC6gkAdy6EzbyywR8cCuCmHoQ+WrRNyX0KpI0Hw
	Y3rhf8xBve7qSCfLWd6+ePNClpdbugvI1d1Vqe9EuB1Hyay6UwkrYe3wzRWWEd6jCRGP
	KqeyRWDxInW28WBCrP8Qk3pDsZYwlRNdIgMFY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=n9yDKqJkTlxrgpVacBm+GRkWYeZkdIC37RGQ9aLE8VhTU+EJ8x7Guf//fUkFpmBwm/
	9YhBlqJKBVq8p2bI8VmE0PxuC+J9eqG9RiYrxox5JkKkB9yZGkynEo7KjloXX9GcSRAy
	hQ83TMkiExgPt21qM67fiUdJul+1xiMWypTAk=
MIME-Version: 1.0
Received: by 10.100.241.17 with SMTP id o17mr8246359anh.134.1242735548116; 
	Tue, 19 May 2009 05:19:08 -0700 (PDT)
In-Reply-To: <guq6vh$tmi$1@ger.gmane.org>
References: <go498c$bqq$1@ger.gmane.org>
	<200902261144.46548.openembedded@haerwu.biz>
	<guq6vh$tmi$1@ger.gmane.org>
Date: Tue, 19 May 2009 14:19:08 +0200
Message-ID: <ac9c93b10905190519h5cfa8a96h688bbc00271de76d@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Tue, 19 May 2009 12:26:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/5/18 Rolf Leggewie <no2spam@nospam.arcornews.de>:
> Marcin Juszkiewicz wrote:
>>
>> My addition to this:
>>
>> mkdir recipes-broken
>> git add =A0recipes-broken
>> git mv recipes/obsolete recipes-broken/obsolete
>> git mv recipes/nonworking recipes-broken/nonworking
>>
>> As this will allow users to set:
>>
>> BBFILES =3D "/somewhere/oe/recipes/"
>>
>> which is supported by BitBake for years.
>
> I'd like to revisit this suggestion from Marcin which came up during the
> discussion of the packages->recipes renaming. =A0I think the above makes =
sense
> and should be committed. =A0I think it would be nice if the folder was na=
med
> broken-recipes instead of recipes-broken. =A0First of all, it sounds nice=
r
> IMHO ;-) but more importantly, this works better with bash-completion.
>
> Reopening discussion for this change.

I think adding recipes-broken (or broken-recipes) is a bad idea.
It is quite possible that a recipe is broken only for some platforms
(e.g. because they use an older libc or gcc, or because functionality
is not working in the machine specific parts.
In that case I can image we end up in a recipe being shifted around.
Not really a good plan.
Unless of course we end up with some good rules on when a recipe
should be moved to broken.

If I look at tinderbox I see various recipes that do not build for
some archtectures or configurations.

Just my two cents

Frans


