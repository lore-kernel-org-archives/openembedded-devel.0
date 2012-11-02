Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1TUHGP-00085C-7V
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 14:26:21 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so1268220bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Nov 2012 06:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=/5MiBZFGJiJLCIHL4Vlva03GFAJuNKVBBbmFnj45Glk=;
	b=F55iluSOiDnJZiI+M3hlHMrG9+aencCr1aoUqXqnE5MSK/0KSwCHpFZ3RU89/eft5R
	18JD+CA4eIjcCNwh0DnvF5B8+5E6sCF4BS+JvpHfVlrSl09WS70REeJXplvER1hCiR7f
	CJM4LNAZL9Kpzf3JVhlsJEEawv204UN+uoZFTzQy12u7Bkq+P8Cqr+Fqzeg0qBKkScfo
	/8ZlxhzItSC+jb1c+3p5GLO3fPlDjvbWJoZpL10t1RPAb4rQyj+y2BeV8eezycRkh/7J
	3rtevEDJ/HJm7JzKScRgryp0bRICz2ePOppMYTVo1dT+3Tz0H+9DW7EAHz8v0DIdaSxq
	jUrA==
Received: by 10.205.122.137 with SMTP id gg9mr375871bkc.34.1351861961801;
	Fri, 02 Nov 2012 06:12:41 -0700 (PDT)
Received: from [10.54.74.11] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id 9sm6607755bkq.13.2012.11.02.06.12.39
	(version=SSLv3 cipher=OTHER); Fri, 02 Nov 2012 06:12:40 -0700 (PDT)
Message-ID: <5093C620.2030706@gmail.com>
Date: Fri, 02 Nov 2012 14:09:52 +0100
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.9) Gecko/20121025 Thunderbird/10.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<20121101143114.GF4673@windriver.com>
	<FCBA1E696337B442ADB5A7C30428F0689A9978@ALA-MBB.corp.ad.wrs.com>
	<1363930.E51Pa0kBDd@helios> <20121101173240.GV4673@windriver.com>
	<50936F79.2040507@gmail.com> <20121102130111.GB4416@windriver.com>
In-Reply-To: <20121102130111.GB4416@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes
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
X-List-Received-Date: Fri, 02 Nov 2012 13:26:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 11/02/12 14:01, Joe MacDonald wrote:
> [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes] On 12.11.02 (Fri 08:00) Martin Ertsås wrote:
>
>> On 11/01/12 18:32, Joe MacDonald wrote:
>>> [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes] On 12.11.01 (Thu 17:19) Paul Eggleton wrote:
>>>
>>>> On Thursday 01 November 2012 17:09:59 Little, Morgan wrote:
>>>>> My rational behind splitting like that is if it is just ntpdate and you try
>>>>> to add ntp-ssl and ntpdate it will use ntp to provide ntpdate. It could be
>>>>> change add RPROVIDES so ntp will provide ntpdate and ntp-ssl provides a
>>>>> uniquely named version.
>>>> The ssl version could be ntpdate-ssl if it needs to be unique. I think 
>>>> originally though these recipes weren't intended to be built side-by-side - 
>>>> rather they were mutually exclusive and the distro would make a choice as to 
>>>> which one was built.
>>> Hmm, good point.
>>>
>>> Does it make sense to have both on a system?  That is, if you build
>>> ntp-ssl does that imply it will only use SSL for communications?  If
>>> that's not the case (which I suspect it isn't, but I haven't checked
>>> myself) then there's not really a strong reason to install both on the
>>> same system.  Which then seems fine to provide ntpdate-ssl as the
>>> alternative.
>>>
>>> Now that I think about it a bit more, maybe a RPROVIDES is appropriate
>>> since ntp and ntpdate are overlapping in a lot of places.
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> Are you thinking of ntp providing ntpdate then? In my mind at least,
>> this makes sense, as ntp seems able to do whatever ntpdate does, so I
>> don't really see the rational of having both on the same system.
> Yeah, exactly.  The only time I've ever wanted both ntp and ntpdate on
> the same system at the same time was when I had a system with a clock
> that was so badly damaged occasionally ntp couldn't recover it and I
> needed to just do a reset on the time.  But I could have even
> accomplished that with ntp -q.  In fact, a quick check of the ntp
> manpage on my system says:
>
>        -q     Exit the ntpd just after the first time the clock is set.
>               This behavior mimics that of the ntpdate  program, which
>               is to be retired.  The -g and -x options can be used with
>               this option.  Note: The kernel time discipline is disabled
>               with this option.
>
> So I'm thinking that ntpdate can be completely replaced with ntp if
> you're putting that on your system.  The obvious fallout would be in any
> scripts specifically relying on something called 'ntpdate', but it looks
> to me like the ntp package is already providing an ntpdate binary.
> Seeing that, it seems to me that ntp/ntp-ssl and ntpdate actually
> conflict with each other.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Then I agree, and think a nice solution to this would be that ntp
provides ntpdate, as we don't want both. If you install ntp, you won't
need ntpdate, and if you want ntpdate, you don't need all of ntp, and
therefor just install ntpdate, and the same goes of course if what you
want is ntp-ssl.

If ntp is actually providing a ntpdate binary, I agree that it should
actually conflict, and not only provide ntpdate.

- Martin

