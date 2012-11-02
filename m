Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1TUBUn-0004nL-QE
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 08:16:49 +0100
Received: by mail-ee0-f47.google.com with SMTP id t10so1636555eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Nov 2012 00:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=qL3spQ7i8QhfUNCxaYWYPBjP9N0pEsThwj4M9nM8Qxw=;
	b=E8arwXam03nIQO59OMZfRAL0WB1uEKu1dTqCUd4bwynGpwHoMru5U5dE92z8Bqb1+j
	EDk3B7Vmuu5h1qExYCPmdZuojwBCHr3EfglxU4t+DlSrRK/p+7fzka35LhXNtWJ8appY
	ABDKcgH1NiONVmZqOjx7wtba2ihK44Y127k6KHwGJ5N5zTObbs+yH7oKRe3V5X1SzISM
	JtVSwF+csTCbqZzBy4b4XykWG7jWg1T5nnSlSSFTZjyEARF0CoYIoWGTA7ZxPXK8kn2U
	Z4B+dGCszz+0lKs7OqzNF4xh4o8TsZekRQT1SCwJeAX+9/R5EPaiKGi0TdwwZaULIItQ
	agmg==
Received: by 10.14.172.195 with SMTP id t43mr3510949eel.17.1351839790709;
	Fri, 02 Nov 2012 00:03:10 -0700 (PDT)
Received: from [10.54.74.11] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id s1sm20726755eem.9.2012.11.02.00.03.08
	(version=SSLv3 cipher=OTHER); Fri, 02 Nov 2012 00:03:09 -0700 (PDT)
Message-ID: <50936F79.2040507@gmail.com>
Date: Fri, 02 Nov 2012 08:00:09 +0100
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.9) Gecko/20121025 Thunderbird/10.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<20121101143114.GF4673@windriver.com>
	<FCBA1E696337B442ADB5A7C30428F0689A9978@ALA-MBB.corp.ad.wrs.com>
	<1363930.E51Pa0kBDd@helios> <20121101173240.GV4673@windriver.com>
In-Reply-To: <20121101173240.GV4673@windriver.com>
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
X-List-Received-Date: Fri, 02 Nov 2012 07:16:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/01/12 18:32, Joe MacDonald wrote:
> [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes] On 12.11.01 (Thu 17:19) Paul Eggleton wrote:
>
>> On Thursday 01 November 2012 17:09:59 Little, Morgan wrote:
>>> My rational behind splitting like that is if it is just ntpdate and you try
>>> to add ntp-ssl and ntpdate it will use ntp to provide ntpdate. It could be
>>> change add RPROVIDES so ntp will provide ntpdate and ntp-ssl provides a
>>> uniquely named version.
>> The ssl version could be ntpdate-ssl if it needs to be unique. I think 
>> originally though these recipes weren't intended to be built side-by-side - 
>> rather they were mutually exclusive and the distro would make a choice as to 
>> which one was built.
> Hmm, good point.
>
> Does it make sense to have both on a system?  That is, if you build
> ntp-ssl does that imply it will only use SSL for communications?  If
> that's not the case (which I suspect it isn't, but I haven't checked
> myself) then there's not really a strong reason to install both on the
> same system.  Which then seems fine to provide ntpdate-ssl as the
> alternative.
>
> Now that I think about it a bit more, maybe a RPROVIDES is appropriate
> since ntp and ntpdate are overlapping in a lot of places.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
Are you thinking of ntp providing ntpdate then? In my mind at least,
this makes sense, as ntp seems able to do whatever ntpdate does, so I
don't really see the rational of having both on the same system.

- Martin

