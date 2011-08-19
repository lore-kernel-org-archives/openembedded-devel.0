Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QuR5G-0006gX-48
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 17:34:10 +0200
Received: by gyg4 with SMTP id 4so2196921gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 08:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=tTwjfu7OvKJF+D5qegZqCdtTVe0cfZWIZkFMf4sgvbg=;
	b=G1gpTjjxKXfHLdBnOZutK4aidteKab33u1a9AyOmQFQrYGuxfnBEzd6cOQXulcMNjA
	QKqyNYBNGX7jB6ak6Uf7jyAf97FIrPsvrki+MhyKRHq5DrIQSaozoO2j8SsTNsjIXf7K
	J6ORX0rNOKwmsoMx3U+Gp/GfF48KHqm9vEfBo=
Received: by 10.236.78.200 with SMTP id g48mr8784983yhe.12.1313767766363;
	Fri, 19 Aug 2011 08:29:26 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id a18sm839805iba.54.2011.08.19.08.29.24
	(version=SSLv3 cipher=OTHER); Fri, 19 Aug 2011 08:29:24 -0700 (PDT)
Message-ID: <4E4E8152.5030500@gmail.com>
Date: Fri, 19 Aug 2011 08:29:22 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E3A3C4B.8040208@dresearch-fe.de>
	<4E40FCA9.7060204@dresearch-fe.de>
	<4E439289.3050005@dresearch-fe.de> <1615282.kebj4eQ1MV@perseus>
	<4E44C076.90407@dresearch-fe.de>
	<4E4E28AB.8010806@dresearch-fe.de> <4E4E717C.2040506@gmail.com>
	<CAGDS+nm0mLkVnv3EKRYYA8d-uMwoedPq+N2Q1iXP_eyf8OUOVw@mail.gmail.com>
In-Reply-To: <CAGDS+nm0mLkVnv3EKRYYA8d-uMwoedPq+N2Q1iXP_eyf8OUOVw@mail.gmail.com>
Subject: Re: [2011.03-maintenance] unsatisfied dependencies to libgcc
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
X-List-Received-Date: Fri, 19 Aug 2011 15:34:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/2011 7:38 AM, Steve Sakoman wrote:
> On Fri, Aug 19, 2011 at 7:21 AM, Khem Raj<raj.khem@gmail.com>  wrote:
>> On 8/19/2011 2:11 AM, Steffen Sledz wrote:
>>>
>>> Regards,
>>> Steffen
>>>
>>> PS: I'm i bit disappointed in the weak help from the maintainers in
>>> solving the problem. :( But i do not bear grudges[1]. ;-)
>>>
>>> [1] Hope that's correct english.
>>
>> personally I would have liked to help more but was short on time and since I
>> could not reproduce the problem at my end. It was not obvious to me what the
>> problem was.
>
> Khem,
>
> Is there an easy way to tell OE to ignore a recommends for either
> libgcc-dev or libgcc-s-dev?  The issue seems to be (at least on my
> machine) that packages more or less randomly recommend one or the
> other.  Then the image build fails because the two packages supply the
> same file.

I dont think there is a way out. I think one of those 2 packages should 
be stopped from building

>
> Steve
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



