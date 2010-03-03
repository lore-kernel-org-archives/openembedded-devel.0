Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NmjhY-0000Gl-5M
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 09:13:13 +0100
Received: by iwn10 with SMTP id 10so1090270iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 00:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=EAFPijEXNSK5a+Tv/51/8YRVp5lH/msjmWPDyeZL4CI=;
	b=Hx8ITZ0Wy7gWpjCijlImg/keBezNhvyZXtaw4vDP1U+gxyFw1FmAKwwesntnwIYNoP
	25Nx6RRvi1etbRmU9XtLjwTULOGM5OPqyD5YW1njiV+LGgLSEA3kTghzwYPtzzledWZn
	9odeOCQqW45lQfA0BoSsm2PU6LHpvqaM+1XlI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=et7Y3ej/nbSF2ICvsWOV/dRdkHP1s2Chg9fTK2e1046YV4buM0pUzRdjDa/At6BzKo
	3JNCXkouiET2PfnUFp/vQnZlZKvQCoLzYsqmYIlP0RyIX291k09D5nb8DiacIwVU8JgP
	xBMIfbo4ZQmOMVHBzrLoGdUbP6keH4tZkLFsk=
MIME-Version: 1.0
Received: by 10.231.158.195 with SMTP id g3mr172228ibx.46.1267603799032; Wed, 
	03 Mar 2010 00:09:59 -0800 (PST)
In-Reply-To: <2b288bf1003022306r17bb8db6xa4c7e585170b153f@mail.gmail.com>
References: <2b288bf1003022053g2dbca134s20b172e94911060e@mail.gmail.com>
	<19c1b8a91003022245w4efed14cs61d162040ea36149@mail.gmail.com>
	<2b288bf1003022306r17bb8db6xa4c7e585170b153f@mail.gmail.com>
Date: Wed, 3 Mar 2010 00:09:58 -0800
Message-ID: <19c1b8a91003030009o2a00101fi3a6991510d57b3a5@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: locale support in OE
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
X-List-Received-Date: Wed, 03 Mar 2010 08:13:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 2, 2010 at 11:06 PM, Vandana Vuthoo
<vandana.vuthoo@gmail.com> wrote:
> I used IMAGE_LINGUAS="en-us", there was a typo in writing the mail
>
>
> On 3/3/10, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Mar 2, 2010 at 8:53 PM, Vandana Vuthoo <vandana.vuthoo@gmail.com>
>> wrote:
>>> Hi,
>>> I need to know how to add diff locale supports in OE, I tried
>>> IMAGE_LINGAUS but it is not working for me.
>>
>> if you used same as above then there is a typo it should be something like
>> IMAGE_LINGUAS = "en-us"
>>

you might want to use bitbake -e  <recipe> | grep "^IMAGE_LINGUAS"
and see what it is set to

>>
>>> Regards,
>>> Vandana
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
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


