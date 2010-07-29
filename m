Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OeS1y-0003hk-Ii
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 14:16:12 +0200
Received: by bwz10 with SMTP id 10so153316bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 05:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=GDVy+h/k9mAO5bG6917YzI5dMaowYO4vwucnqwx8e1I=;
	b=ufsmxp1iUZlLF90w0EbnBEsqhYYMY0lXMQqKEGg0i2jvvWj3zfxzkpIGzafNf7TBVu
	6rvgpN3qCnp8hiQWptdZS8wbqX3b/kZJklUgu3qYe0yIbjrsbubXpXHxSGBQaGL8E7M9
	RGBD5lQfNQBWaSeXnFYyqyd5l9nXUcmteDxz4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gbb+5addSFVqQkFyn9N0wZ0qS1IZftZSGJ05C5QzijWRmFIcurWYXAUZktLhDLaRIx
	HaG6cxY2tWp2agvsxYs0H7gapuOOTG5/RxwyUktOcCLxVFOz4JDl6OIgiGmh5zoMZZ7J
	iPWsmVy8kjueg99hZ05zodBMHKgnf2hLGdiuw=
MIME-Version: 1.0
Received: by 10.204.74.195 with SMTP id v3mr19781bkj.35.1280405752591; Thu, 29 
	Jul 2010 05:15:52 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Thu, 29 Jul 2010 05:15:52 -0700 (PDT)
In-Reply-To: <4C516EF8.3080804@balister.org>
References: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>
	<i2rik7$ds1$1@dough.gmane.org> <4C516EF8.3080804@balister.org>
Date: Thu, 29 Jul 2010 14:15:52 +0200
Message-ID: <AANLkTi=Vyw=1e6enaVLRq+QMFMOh9cktdVFb0kQyzEko@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: OE recipe tree quality
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
X-List-Received-Date: Thu, 29 Jul 2010 12:16:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/29 Philip Balister <philip@balister.org>

>
>
> On 07/29/2010 05:45 AM, Koen Kooi wrote:
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 29-07-10 10:50, Frans Meulenbroeks wrote:
>>
>>> Dear all,
>>>
>>> Given the discussions on quality that sometimes pop up (and also
>>> triggered
>>> by Robert's message), I decided to kick off a bitbake -k world.
>>>
>>
>> Could you first explain to me why 'bitbake world' is a good way to
>> measure quality?
>>
>> I would think that building something like console-image and looking at
>> the following would be a much better metric:
>>
>> * does it build?
>> * are all the rootfs types working?
>> * does the image do what it is supposed to do?
>> * Are all the licenses of the output packages correct?
>> * Do the output packages have any spurious deps?
>> * Is the content of the output packages correct?
>> * Are there any known CVEs in the resulting packages?
>> * Did packaged-staging do its job?
>> * What kind of QA errors and warnings were raised?
>> * Did all recipes pass recipe_sanity?
>> * Did all recipes conform to oe-stylize.py?
>>
>> etc
>>
>> I would actually advocate removing the 'world' feature from bitbake/OE
>> to stop people from wasting time on looking at bitbake world and have
>> them fix actual problems.
>>
>
> bitbake world seems to be the source of pointless listserv discussions.
> Does it serve any purpose?
>

If you feel that in principle every recipe should be buildable, I'd say yes.
Also ideally bitbake -g world should give you a nice list of dependencies
allowing you to find out who the actual users of a recipe are.
But unfortunately last time I tried that it didn't work because of broken
dependencies or so.

Frans


>
> Philip
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

