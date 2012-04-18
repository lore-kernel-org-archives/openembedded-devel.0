Received: from smtprelay-b22.telenor.se ([195.54.99.213])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf@emagii.com>) id 1SKQ9F-00075i-4p
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 10:21:57 +0200
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id 4532014259
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 10:12:30 +0200 (CEST)
X-SENDER-IP: [83.227.58.214]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AiIxAH52jk9T4zrWPGdsb2JhbAANN4oopSqCEAEBAQE3gj0BAQEBAzhAARALGAkWDwkDAgECATEUBg0BBQIBARfBeZBoBJVvkyI
X-IronPort-AV: E=Sophos;i="4.75,441,1330902000"; d="scan'208";a="316163283"
Received: from c-d63ae353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.243]) ([83.227.58.214])
	by ipb1.telenor.se with ESMTP; 18 Apr 2012 10:12:30 +0200
Message-ID: <4F8E776D.5020005@emagii.com>
Date: Wed, 18 Apr 2012 10:12:29 +0200
From: Ulf Samuelsson <ulf@emagii.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.28) Gecko/20120313 Thunderbird/3.1.20
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <4F8DF031.60109@emagii.com> <2900608.HO3vnnHahd@helios>
	<4F8E1A23.4030606@emagii.com> <7419249.iRUESFeaJl@helios>
In-Reply-To: <7419249.iRUESFeaJl@helios>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Support for R/W git in bitbake
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
X-List-Received-Date: Wed, 18 Apr 2012 08:21:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-04-18 09:28, Paul Eggleton wrote:
> On Wednesday 18 April 2012 03:34:27 Ulf Samuelsson wrote:
>> 1. If I am busy working on an application, then it simplifies the
>> development process.
>>       I can modify the code in the tree and push.
>>       This is mainly for kernel development.
>>
>> 2. If I work on a prerelease of some S/W drivers/Applications under NDA,
>>       then I cannot make that code publicly available
>>       but I still want to put  that on my Internet accessible git server.
>>       Typicailly this is before the release of a new chip and info about
>> the chip should not be
>>       made public before the chip is released.
>>
>> 3.  I want to be able to ship something similar to the Angstrom setup
>> scripts
>>        to someone else, and have them build an image, but it should not
>> be available
>>        to anyone not accepted (without public key at the git server).
>>
>> There are other uses for such a functionality, but those are my
>> immediate needs.
>>
>> As you see, this is mostly for development.
>> Once the code is released, then the recipe would be changed to the
>> normal git access.
>>
>> Didn't know anything about the externalsrc bbclass, but after checking,
>> I would say no.
>> It won't do the two things above. I do see the use of it though.
> externalsrc should handle everything except automatically fetching the source;
> for that you need to have your own local git clone (which of course can be
> r/w). I guess it depends on whether you expect to be sending such recipes to
> non-developers; for developers it ought not to be too much of a hassle to have
> their own local git clone.
>
> The only problem with having an r/w checkout you are doing development in
> under WORKDIR is that if you bitbake -c clean the recipe you will lose
> whatever you are working on - externalsrc avoids this.
>
> Cheers,
> Paul
>
I am working with a company, which OEMs their solution to other companies.
They get tons of questions from those customers, and based on that
I would like to avoid anything which requires manual intervention
of the developer.

As for cleaning out changes, it might happen, but I am prepared to take 
the risk.
Today I am initializing a git after the extract anyway.

I am sure I will use externalsrc for something.

-- 

Best Regards
Ulf Samuelsson
ulf@emagii.com
+46 722 427437



