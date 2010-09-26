Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OzfuQ-0001M1-Dt
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 03:20:07 +0200
Received: by iwn2 with SMTP id 2so1774513iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 18:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=KIfcRTd8hwpwzS6yg2hVsGNOfi2TGRL3CgBQQvcEjew=;
	b=Wv3qWb7vRMqLMNVUHbfz89UaBChDYNkN6A6fq3C+qTtVc4RaT7e2IbsCU7D42OxXMX
	3CQTcm9eL1d4/wTAtnwraXGJtkkZPx/PgLLqJhocmdQJE6HemVBg+S7rVzDmcoTbuYKj
	Xoxzg9qWHR9Db5W/J/fnRKXfFtYFU2plQcsOw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Swy3cDHjhbdgkR0QEvVbkiCrDTFerSVBKFh4HeLjs2KwGPmXeR8E7bAkqpzTJSlobL
	Nlyodtec6x3mpOC36uP0oG9h1QnpiIQXQi9BTJz5Ex/3Da28WA3cFO8DfuI4qK1E0uBH
	Sq8sI+AQPGceWhvI6gv1W74msMK3fDQYPM2mI=
Received: by 10.231.10.139 with SMTP id p11mr6258001ibp.179.1285463995053;
	Sat, 25 Sep 2010 18:19:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Sat, 25 Sep 2010 18:19:33 -0700 (PDT)
In-Reply-To: <AANLkTi=Ot8PQi0+0CgtiNDP85FkKcvxssPQOhSbbDgk+@mail.gmail.com>
References: <AANLkTi=yzQKfFvBDGM2JtTGoz+Zq40M0VcaZVYOxcaWy@mail.gmail.com>
	<AANLkTi=Ot8PQi0+0CgtiNDP85FkKcvxssPQOhSbbDgk+@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Sep 2010 18:19:33 -0700
Message-ID: <AANLkTim6Gf_1M58R0v9cS2pf3wQMFC7hdcj7NcYJshYj@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc 4.5 - linaro into OE
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
X-List-Received-Date: Sun, 26 Sep 2010 01:20:07 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Sep 25, 2010 at 5:05 PM, Graham Gower <graham.gower@gmail.com> wrote:
> On 26 September 2010 03:18, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi
>>
>> I have ported some patches from linaro into OE gcc 4.5, they work fine
>> and the tests results look good
>> it should improve the performance too. It would be nice if somebody
>> could try this out and report any
>> issues. Results of my gcc testsuite run are here
>>
>> http://uclibc.org/~kraj/gcc-results/
>>
>> I will post any performance results if I do
>>
>> The git branch is khem/import-linaro-gcc-4.5
>>
>> Thanks
>>
>> -Khem
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> Forgive my ignorance, what is the nature of the linaro patches?
>

they are generally targetted for ARM code gen improvements specifically
for armv7

Thx
-Khem


