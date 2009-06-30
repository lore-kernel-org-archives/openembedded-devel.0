Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1MLiyC-0002LS-8O
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Jun 2009 21:26:20 +0200
Received: by qw-out-1920.google.com with SMTP id 4so170785qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2009 12:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7y9NlgsondgHvf0Ovclmub+v4js164QSe6uqCAmmjks=;
	b=qPJFHUoFn6KmZDn0TCEgi8I+l6Igc+uTzYXMeP9dncmN25mZ592Qej4FGc0CmpTbcU
	UfvyAeEkepLFOWjUsssT+EHmv/6TmNAaDo6UXD199yHSBWQUnnLOIDz4KtPcd8F4jD8v
	fG/uQrDJzsRmVPzVNqfhwd5Ci0QBMZQD+HcNY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=lh0/FU9/g8SaYYfIGeqgQoE34Iq3ixN3A22oSoyHraJpnfIlAvApnc80UL/CryHpHa
	xBlegV8wmv4+OPrGmdj+ry/x0jwYDYTeNFZW6v7cRWz06FOY8yZwcmjsbpkBo5Nl+YYW
	EpkzsVQfhQDMVuLAe8zGm0ggehS7uBUaUIrgA=
MIME-Version: 1.0
Received: by 10.229.110.20 with SMTP id l20mr2457479qcp.60.1246389270168; Tue, 
	30 Jun 2009 12:14:30 -0700 (PDT)
In-Reply-To: <20090630170533.GC6573@denix.org>
References: <5f2b60906300444w31cdcf67o6b3eeab0d1fb85ab@mail.gmail.com>
	<20090630170533.GC6573@denix.org>
Date: Tue, 30 Jun 2009 21:14:30 +0200
Message-ID: <5f2b60906301214u229a7095ne17b77afa08c8656@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake virtual/kernel fails for davinci
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
X-List-Received-Date: Tue, 30 Jun 2009 19:26:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2009/6/30 Denys Dmytriyenko <denis@denix.org>:
> On Tue, Jun 30, 2009 at 01:44:43PM +0200, Bj??rn Forsman wrote:
>> Hi,
>>
>> I am a bit new to OpenEmbedded, but have successfully built angstrom
>> for davinci and qemu in the past. Today I tried to "bitbake
>> virtual/kernel" for a davinci (dm6446) system. The build fails during
>> unpack of linux-davinci kernel because git cannot find a given object
>> hash (see output below). Has anybody else experienced this? How come
>> OE references a non-existent git object?
>>
>> The non-existent git object hash is specified in
>> "recipes/linux/linux-davinci_git.bb" and was lastly modified by commit
>> 160616d5f2a57ba828ed5ec06e37fc1cd4713af7.
>
> Since then linux-davinci tree was updated to 2.6.30 final and more
> specifically, staging/vpfe branch was rebased from v2 to v3 vpfe patches.
> Unfortunately, rebase rewrites the history and changes commit numbers, he=
nce
> the old commit cannot be found any more...

Ok. Thanks for explaining.

> I'll update the recipe with the latest state of the linux-davinci tree. B=
ut,
> it may brake in the future again, as this is a moving target. If you want
> something, which does not break that often, I'd suggest you don't use the
> "git" version of the recipe - try setting PREFFERED_PROVIDER/VERSION for
> 2.6.28 or 2.6.29...

Ok. I'll try setting PREFERRED_PROVIDER/VERSION next thing tomorrow.

BTW, the currently missing git object was specified as a SHA1 hash in
a variable called SRCREV. Could this variable be used for specifying
git objects in other formats? For example "staging/vpfe" or "HEAD"? Or
is it unwise to have recipes which uses "floating" revisions?

Regards,
Bj=C3=B8rn Forsman


