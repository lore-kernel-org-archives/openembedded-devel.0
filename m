Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1POAdr-0000Xd-Ql
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 16:00:16 +0100
Received: by iwn8 with SMTP id 8so7240875iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Dec 2010 06:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=sji1BjMg90NnUJ4r3YAsM513Cniql7TZfnrJZZKbKkE=;
	b=pmPiaP6BK7o0aWQFjiU2R3J2YgWf4WN9p+MLGqChjOkAPVcIFrBh08OSxK1644vlUk
	fCBIca8Frs59gSvTG0wgTJgTpLRJNSykUSBetbxxWfHnUJUCyNag7m7ga766MEdtd83T
	JgPwAmYbGTs23meZ3dEVVfp4lCineyzedb7lE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=IVZGxpl2Xz+qMdqAINjURCIUwsSuSo1IXSEeVyzdcX8S/BIqkj3Z9GLTZBP9uT8xX2
	vx6qqMBbsFsm6peYJtP9aU0J9YfKQKoqYOW4Gyq//AJfBem0fn1PK9WkHNSYwE5JRbAb
	UGUOEdpAw1Yy+/OlhOXn3DYKAn2O9lABKs5dU=
MIME-Version: 1.0
Received: by 10.231.35.75 with SMTP id o11mr330071ibd.107.1291301933041; Thu,
	02 Dec 2010 06:58:53 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Thu, 2 Dec 2010 06:58:52 -0800 (PST)
In-Reply-To: <4CF7AFE7.3060201@phoenixsoftware.it>
References: <4CF78E73.7010401@phoenixsoftware.it>
	<AANLkTikriTQaU5yXKWkn9xyavdXZyfD2phaXbpgEBxRG@mail.gmail.com>
	<4CF7AFE7.3060201@phoenixsoftware.it>
Date: Thu, 2 Dec 2010 15:58:52 +0100
Message-ID: <AANLkTinNd_jhP4Put1qKLaCoS30xVv4RE-R4sM6H23ZK@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010.12: PHP build issues
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
X-List-Received-Date: Thu, 02 Dec 2010 15:00:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/2 Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>:
> Hi Frans,
> thanks for your quick reply.
> I tested your solution without any building issue.
>
> Who need to be advised for pushing either your or mine fix to
> release-2010.12 branch?
>
> Thanks
> Regards
> Pierluigi


Thanks for the testing!
I feel Khem Raj is the person to choose the patch in this case.
I'm quite sure that a thread with release2010 in the name will draw
his attention, so I don' tthink additional action is needed.

Frans
> Frans Meulenbroeks wrote:
>>
>> 2010/12/2 Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>:
>>
>>>
>>> Hi all,
>>> I still have problem compiling PHP 5.2.13 with release-2010.12 branch.
>>>
>>> I fixed the problem with the following patch regarding iconv option. Ca=
n
>>> anyone confirm the issue?
>>>
>>> Thanks
>>> Regards
>>> Pierluigi
>>>
>>> --- a/recipes/php/php_5.2.13.bb
>>> +++ b/recipes/php/php_5.2.13.bb
>>> @@ -21,7 +21,7 @@ export LIBS=3D" -lpthread "
>>>
>>> EXTRA_OECONF =3D " =A0 =A0--enable-mbstring \
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --enable-discard-path \
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-iconv \
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--without-iconv \
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --enable-sockets \
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --enable-shared \
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --enable-pcntl \
>>>
>>> --
>>> Ing. Pierluigi Passaro
>>> Via Pasqualigo 31
>>> 30174 Venezia Mestre
>>> Cel: +39 348 355 4119
>>> Tel: +39 041 862 3373
>>> Fax: +39 041 862 3173
>>> Web: www.phoenixsoftware.it
>>> P.IVA 03884060272
>>>
>>
>> Pierluigi,
>>
>> This indeed fixes the build problem.
>> The disable has been a mistake at my side.
>> A better solution is to merge
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dfa117e41=
7c1f2277c9c0fff0367edb678ea0d844
>> into the release version.
>> This fixes the problem and adds iconv support (which is needed by some
>> other recipes).
>>
>> Anyway either your patch or my git patch above needs to be applied.
>>
>> Frans. (who spent quite some time debugging php configure to find the
>> cause iconv support was not working properly)
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


