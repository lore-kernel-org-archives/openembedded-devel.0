Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pp2ib-0003Ef-HR
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 19:00:13 +0100
Received: by fxm17 with SMTP id 17so5156016fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 09:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=CRjvVvmJB8jF82mqr4ZwD7IMNWLIu4/C3hNv1R8kGgs=;
	b=H9BuLRD89BD+bgLdFuArZbBHhAl2WfugyrZZFSmw1OKaAQiv77iWyD4WmiLgK0MMh9
	koW+3y+GT2X1m9d6OnSMTLLnOxznl5KpJTZsQPMrvePE9yTNGZjNBX1Hpz4VJ0eMSrhQ
	SsxADfn5RmC/kjd4HXtkADgfDcQ/E9TwuKKSo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=OnmF5auFeTaQHla77tt8rStGKARlmWbJDReL/7pVLBVKBttgETkVl4ekJBOLctka6l
	mTrThqE5dxtTn2Qjurn61GPhJgimNnOAQUqkMLgl+UKOPqGf5PTebexEbzZCf5/jsAba
	1QugP16Kau1L3DHO3WbQcLX88qdkpPVctTYgo=
Received: by 10.223.79.74 with SMTP id o10mr4970760fak.63.1297706344294; Mon,
	14 Feb 2011 09:59:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Mon, 14 Feb 2011 09:58:44 -0800 (PST)
In-Reply-To: <4D58E883.8030606@dresearch.de>
References: <1285777033-19478-1-git-send-email-t.fromm@dresearch.de>
	<AANLkTikWLrAZaejWvnBGf4hn0CdKV2FgYiMxLEkDn+Wi@mail.gmail.com>
	<4CA46AD8.2070205@dresearch.de>
	<AANLkTimOEDXH3=OrROehD+sVtNdihoO8Q3P6Vy0oJscQ@mail.gmail.com>
	<4CA5B348.1000404@dresearch.de>
	<AANLkTinw6Tz0fDEGPBDyvv85KRk4w3v+ygeNemSHceh2@mail.gmail.com>
	<AANLkTimviE5VqivppJTVZvhspZtsiUNpqVjGD4=p=No+@mail.gmail.com>
	<4CA98B66.3060404@dresearch.de>
	<AANLkTi=mw3h2vqEav+yz2begWJVR++V6823_QmjdNqAg@mail.gmail.com>
	<4D58E883.8030606@dresearch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Feb 2011 09:58:44 -0800
Message-ID: <AANLkTimD19GdMuFTnuZpw2Od22G3LXxmC1+_uVUtEkH7@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libunwind: force gcc to be built first
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
X-List-Received-Date: Mon, 14 Feb 2011 18:00:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2011 at 12:32 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Am 04.10.2010 18:00, schrieb Khem Raj:
>> On Mon, Oct 4, 2010 at 1:08 AM, Thilo Fromm <t.fromm@dresearch.de> wrote=
:
>>> Hello Frans,
>>>
>>>>>> I tracked it down - libunwind publishes unwind.h, and gcc uses an
>>>>>> internal
>>>>>> file of the same name while being built.
>>>>>
>>>>> Yes gcc has its own version of libunwind which it used unless
>>>>> configured with --with-system-libunwind
>>>>> IIUC the problem happens with target gcc not with cross-gcc. target
>>>>> gcc is built using cross-gcc and
>>>>> <sysroot>/use/include could be preferred over the location of
>>>>> libunwind.h which is in gcc sources
>>>>> If thats the case then we need to fix gcc build to not look into
>>>>> standard sysroot/usr/include but prefer
>>>>> the local unwind.h when its using internal libunwind. The problem
>>>>> would not show up if the libunwind versions
>>>>> were matching but that may not be the case always and I dont know of
>>>>> hand how we can fix the gcc configury/build
>>>>> to ignore installed unwind.h
>>>>>
>>>>> You workaround would only work if build sequence was followed if some
>>>>> one just cleaned gcc and rebuild it
>>>>> the problem will resurface.
>>>>>
>>>> Thanks for the analysis Khem.
>>>> This is indeed more or less what I had expected.
>>>>
>>>> For me this patch gets a NAK as it does only masks the problvem in
>>>> some cases but not really solves it.
>>>
>>> You're right with this analysis; however, the patch enables Openembedde=
d to
>>> be built *at all*. If you care less about whether you're able to actual=
ly
>>> build and if you have the time to wait until someone ventures deep into=
 the
>>> gcc build and fixes the cause, then this is the way to go.
>>>
>>> For us, however, this patch is a valid workaround. It will make Openemb=
edded
>>> work for us until the original issue is fixed.
>>
>> I think we should try to fix it in right way.
>
> Ping!

I think this patch does not fix the problem but hides it. It will not
be worth to get it upstream


>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@DResearch.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
>
>


