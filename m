Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PfcIT-0007md-8G
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 18:58:18 +0100
Received: by yxd5 with SMTP id 5so425281yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 09:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=SN4XjT9G9PDxYE2A2I99oreJh+G31VEGNhV7UtHpUDU=;
	b=vr9sDVQuuk/h3YRC7aBULLwMByqlQlwHa+8nmB0x5tC8DO/bmC2UWCSPaVjCWgFJz6
	NdfpCWFQozfysz2fuK9GfZBIZr2uLu69y8izpqRgX5Z7kMIquGotk/mTcK7KgSbTybJI
	lYtjxlLJ1gyaeDlQOjedoWNDwEwoWmchS6vdk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=IM+weQCsUE90MjM0LVH1TwE1QRh1rDDrS2Tg/KqqS1JcU/CBqHJ9HaT41A6nQBnrzr
	a0imJSylfJo9ApjpwWKXYzT5jtfVnZIbjSBZMpnDeZvbUVH72bdJWpG7Leh6t6XGNtvY
	a/JzBmrudAgV4898UAl0t9La2qx53AyuSb9B4=
Received: by 10.90.35.17 with SMTP id i17mr670468agi.166.1295459856665; Wed,
	19 Jan 2011 09:57:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Wed, 19 Jan 2011 09:57:15 -0800 (PST)
In-Reply-To: <4D37215D.7050209@mentor.com>
References: <1295286639-4901-1-git-send-email-raj.khem@gmail.com>
	<4D34952B.607@mentor.com> <201101180730.29536.roman@khimov.ru>
	<4D3661AC.8030708@mentor.com> <20110119042954.GA30752@gmail.com>
	<4D37215D.7050209@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Jan 2011 09:57:15 -0800
Message-ID: <AANLkTimdiodUzAED=HN7-0BBy4q8yQ+zMTPWK9tngUFc@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] minimal.conf: Prefer perl 5.10.1 and opie 1.2.5
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
X-List-Received-Date: Wed, 19 Jan 2011 17:58:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2011 at 9:37 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 01/18/2011 09:29 PM, Khem Raj wrote:
>>
>> On (18/01/11 20:59), Tom Rini wrote:
>>>
>>> On 01/17/2011 09:30 PM, Roman I Khimov wrote:
>>>>
>>>> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=
=D1=82 =D0=9F=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA 1=
7 =D1=8F=D0=BD=D0=B2=D0=B0=D1=80=D1=8F 2011 22:14:51 =D0=B0=D0=B2=D1=82=D0=
=BE=D1=80 Tom Rini
>>>> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
>>>>>
>>>>> On 01/17/2011 10:50 AM, Khem Raj wrote:
>>>>> I see different problems with perl 5.10.1 + uclibc + p2020ds, so I
>>>>> guess
>>>>> this is fine with me.
>>>>
>>>> What kind of problems?
>>>
>>> Khem fixed it tonight. =C2=A0At heart, there's been a need to make much
>>> better use of the libc-uclibc override rather than testing TARGET_OS
>>> as there's at least 'linux-uclibc', 'linux-uclibceabi' and
>>> 'linux-uclibcspe' as valid TARGET_OS combinations.
>>
>> I thought about it and indeed it would be better to have a LIBC override
>> but its defined in .inc files which may not be included by all
>> distributions, if this makes into bitbake.conf somehow then that would
>> be better or we can decide to have a global data var called LIBC or some
>> sort.
>
> We already did this. =C2=A0A distro that doesn't pull in the right libc i=
nc file
> is either broken or on its own (I forget and can't check atm if Angstrom
> uses the files eventually or just also has the libc-foo OVERRIDES, but is
> correct here).

yes angstrom does. Ok I moved slugos to use it recently so its no more brok=
en :)

We also have LIBC as a global env way to say what LIBC to
> use (Angstrom has ANGSTROMLIBC and LIBC since they originated the feature=
).

nice we can use LIBC as well if need be but override is more elegant
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


