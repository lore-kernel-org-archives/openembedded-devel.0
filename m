Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDf6o-0006MY-Sy
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 16:18:44 +0100
Received: by gwaa11 with SMTP id a11so550893gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=nNZimXVsy8dfeR+uvRblg1DKOHfyhpg3FNTJSu4lHdo=;
	b=PTdwbQSV6ZQDWVQt4/t4FL29OGlhsgI9708x6DxIzG+f/ksiWht1n3LXX6aJNYAHwq
	ZZzw1cFUPqUjM689A1yyFCprCAQAHhg4jJk1nVHPwWscoEzmA6bYEnRMkmV2hemjLmzG
	EkTHJph3v45o8kXdmunm/dRWKJKVwJ+88NwHk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=TqGlpqcUUGWDtoTUH7klKOYUEc+Z0YRuc9DSydQGuuyqw5XX2uRJaMIcLQPM9CN8/b
	nDFFcVrU4pB51jcUnTX72HXg3BL7JrEceJQHsT5olcmibTcAbhXefKcK3Ic6P6jrE26T
	7nrhQTC0BRXay5jbky/2gbHFw472Lq/oLIq2M=
Received: by 10.90.20.1 with SMTP id 1mr1096373agt.145.1288797470198; Wed, 03
	Nov 2010 08:17:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Wed, 3 Nov 2010 08:17:29 -0700 (PDT)
In-Reply-To: <AANLkTinjMC_Eou5Bt9FE07Vn-4xXD_2ugrgCGKgcPxvP@mail.gmail.com>
References: <4CCF64DD.9080709@gmail.com>
	<AANLkTin5-JTEH=Zk__6MWxY53t_WYufSX4x+w6sonE7t@mail.gmail.com>
	<AANLkTiktvcs1HsktTWaFATVDR492tPCHb_d7JU1xm_uW@mail.gmail.com>
	<AANLkTinjMC_Eou5Bt9FE07Vn-4xXD_2ugrgCGKgcPxvP@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Nov 2010 08:17:29 -0700
Message-ID: <AANLkTinN5pGVW6-aos16m7gZo2ytaF1cgh+9uO3k+G+9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gphoto2_2.4.8.bb: Stop configure from looking in /usr/local/include
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
X-List-Received-Date: Wed, 03 Nov 2010 15:18:44 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 3, 2010 at 2:42 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/11/2 Khem Raj <raj.khem@gmail.com>:
>> On Mon, Nov 1, 2010 at 11:38 PM, Frans Meulenbroeks
>
>>> I have some concerns here.
>>> For configure it seems best to explicitly set and reset the flags in
>>> it, otherwise you may just pick up whatever happened to be build
>>> before.
>>>
>>
>>
>> this is the case with any package that uses configure tools. But assumption here
>> is that when you are building you are not building stuff thats not
>> meant to be in
>> the given image.
>
> True. However we should enforce that. If e.g. gphoto has no depends on
> exif it autotools will still pick up exif if it happens to be there
> because some other package build it.
> Funtionally this is not necessarily bad (as your image has exif
> anyway), but from a point of reproducability it is undesirable.
> E.g. if you build the recipe the first time, you might not get exif
> and if you rebuild you do get exif. (because the build system does not
> know the dependency is there so it might not have build exif yet).
>
> Actually the results might even differ for between builds of the same
> image (especially if you build machines with different speeds etc
> and/or use different flags for parallellism.
> Therefore I feel it is highly desirable to have all optionals that you
> have in configure either explicitly disabled or explicitly added to
> depends.
>

this is everlasting problem with autoconf and autotools. There is a
set of options
which are enabled based on what autoconf guesses on the sysroots. Unfortunately
it will be very tedious if you want to explicitly enable and disable
every option as well.
and there are quite a lot of packages using autotools. However I think
that the sysroot is minimal
when we build from scratch so most of options should be disabled which
are decided by autoconf
so we may not get unneeded features which is better than having them
enabled at build time
and needed support being missing at run time.

> Wrt exif & readline: I agree with koen.
>
> Frans.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


