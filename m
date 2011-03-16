Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PzlgF-0002PL-CD
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 09:02:07 +0100
Received: by iyb26 with SMTP id 26so1430962iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 01:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=njR+pSa7vUwKsVNXBg3OPxIN/7JqvP4hEi1aQ96G67A=;
	b=Jsuz2aoYGBdUKrJV5LLhctA4qpNQQ1d6PGk7fLYGXpH+dNnIl8BuWDUmWQV1bQxoSv
	LuXfq/MBP6EVp6BVGs3DeYp3sJUiKggR/Y8jKjNafTVwRPeGqAJLGQyuWW90tPT64N2t
	YPSIloolkO/1wEvu4sOi3JY80EirHLlUlrj14=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NHlWaDGXO5p/WQzMkN+VIyKqJD52zvlQJ3iP2YI0sJLYGIiKeL0RNO2lWIBJrYsKcZ
	5n/ktlZtRZz3aWiAwzBPwk2Mu8nTanloP1+K/vTymnL7QagfcgFNv6BO6gpZjbSbAIj3
	TEYalTDMHOwYiho3ZaMWmCMUpD9xM8rXwRO8c=
MIME-Version: 1.0
Received: by 10.231.177.193 with SMTP id bj1mr398056ibb.145.1300262420707;
	Wed, 16 Mar 2011 01:00:20 -0700 (PDT)
Received: by 10.231.13.69 with HTTP; Wed, 16 Mar 2011 01:00:20 -0700 (PDT)
In-Reply-To: <4D806A30.1070003@gmail.com>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha> <20110315220301.GC3042@denix.org>
	<1300254477.2818.5.camel@eha>
	<989A078976CDAD4CB2DC976EEF70E2A50547990E@eu2-mail.mgc.mentorg.com>
	<4D8061DE.6030106@gmail.com>
	<AANLkTikfnLb0XW6B6M0s+w=VuOkaeq0=MrYwUniQ6B_x@mail.gmail.com>
	<4D806A30.1070003@gmail.com>
Date: Wed, 16 Mar 2011 09:00:20 +0100
Message-ID: <AANLkTik_Azau5kZcLwqw6PyXC0Ttaxzf+8XyJj833LHF@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Python-native dependency in libxml2
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
X-List-Received-Date: Wed, 16 Mar 2011 08:02:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/3/16 Khem Raj <raj.khem@gmail.com>:
> On 3/16/2011 12:28 AM, Frans Meulenbroeks wrote:
>>
>> 2011/3/16 Khem Raj<raj.khem@gmail.com>:
>>>
>>> On 3/15/2011 11:22 PM, Ahsan, Noor wrote:
>>>>
>>>> Hello,
>>>>
>>>> I was looking at the libxml2 package. While going through the recipes I
>>>> came to know that its native package depends on python-native package as
>>>> well. This dependency is defined in libxml2.inc file.
>>>>
>>>> DEPENDS_virtclass-native = "python-native"
>>>>
>>>> This package build fine after removing this dependency. I am not clear
>>>> why this dependency is being added in libxml2 package. Can somebody
>>>> clear that to me. While looking at the git log I came to know that this
>>>> change is coming from libxml2-native.inc file. But I am not clear why
>>>> this dependency was added as this package build fine without it.
>>>>
>>>> Please help me in understanding this dependency. Thanks.
>>>
>>> Try to build this recipe from scratch and see if it still works then we
>>> can
>>> remove the dep
>>
>> I'm not sure if that is the right way.
>> It might well be that typically python-native is already there in a
>> scratch build because some earlier package needed it (or even because
>> of the scheduling of build steps.
>>
>> Probably a better way is to build with packaged staging (with staging
>> dir outside TMPDIR) then rm TMPDIR and bake the package.
>> Alternately peek into the package to see if it needs python. If it is
>> needed then the DEPENDS should stay.
>
>
> Did you read carefully what I wrote ?

Yes. From scratch for me (and maybe also for others) means rm TMPDIR
(including pstaging).
In that case you might pick up stray packages.
You probably meant keeping pstaging, but at least for some of the
readers that is not obvious.

Frans


