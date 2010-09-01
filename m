Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OquUi-0003DM-7E
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 23:05:20 +0200
Received: by wwb31 with SMTP id 31so223650wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 14:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=kE0V0Cc/YAMo/yjnQi2+j6mehrpm7bZyxKtz4HIqQW4=;
	b=skwmYlsfbP8SNJddpjRk9dPvnZd5AaRuT4igME52gwO+lVwG+CNvwSRo2cDk/LqLOx
	ufrIdkHIMI2T2t6UPHDPVSVCO2HBJnlWYmdC09ARucuLAv6XC+mGLzR4JMDHzZVjfE6S
	bgV5Fo+1OgdW1WxQaDf8geVGtOm+IWJS1W7L8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Ot9OJLQkQEPXHea65ciiya/zkc2dO0sgJxUgnKpcs+thw/kawV50rMqjaa9/CDnE7q
	QTGeKvzYSX3F+5UPz/DCpLtmjnBAOyiHhXQHM3ZpqzZmZ8UMgmPB80p2pA0IHOIUNo1j
	DOrjt702zJbXoVor87bmaRqETeNkwIK49NtTM=
MIME-Version: 1.0
Received: by 10.216.236.226 with SMTP id w76mr8412666weq.7.1283375085782; Wed,
	01 Sep 2010 14:04:45 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Wed, 1 Sep 2010 14:04:45 -0700 (PDT)
In-Reply-To: <AANLkTimamK0_tQw32zWAuANT2fBTDgSHUdPZPWbe-E-3@mail.gmail.com>
References: <AANLkTimeV1FbwQCMYL7WH3tuo_zwcYX1o9cs1H66VPhu@mail.gmail.com>
	<AANLkTinqVEs+Uh6jNJJVzqjE2SXMbM1ni60nUx+qtXka@mail.gmail.com>
	<AANLkTimamK0_tQw32zWAuANT2fBTDgSHUdPZPWbe-E-3@mail.gmail.com>
Date: Wed, 1 Sep 2010 14:04:45 -0700
Message-ID: <AANLkTimEE4VSR3C6XSQUCYXTgbA1m=Zdw1f8w9vm76_X@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libxml-namespacesupport-perl stuck in do configure
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
X-List-Received-Date: Wed, 01 Sep 2010 21:05:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks Frans that fixed it by setting up CPAN on the build machine :)



On Wed, Sep 1, 2010 at 1:16 PM, J. L. <vwyodapink@gmail.com> wrote:
> so if i set up CPAN properly on the build machine that should get
> through that part? Did I understand that properly? I will try that out
> though, thanks a ton for the response. I will post if that works or
> doesnt regardless
>
>
>
> On Wed, Sep 1, 2010 at 1:08 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2010/9/1 J. L. <vwyodapink@gmail.com>:
>>> I am trying to get this to build and it seems to be stuck on the
>>> do_configure part, I let it run for over 24 hours before killing it
>>> and when I tried to alt C to kill it, it endlessly looped showing
>>> something about selecting the country your in and loops through the
>>> choices endlessly the only way I could kill it fully was to close the
>>> terminal. I noticed in May someone else brought up this or a very
>>> similar issue, what is the work around and or fix for this? Thanks for
>>> any help or tips
>>
>>
>> I think I had this once too.
>> Not sure how I solved it, it is quite some time ago.
>> However, it could be that I configured cpan manually on the host system
>>
>> No idea how to fix this permanently.
>>
>> Frans
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>


