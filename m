Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZjoX-000540-BK
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 14:15:34 +0200
Received: by bwz10 with SMTP id 10so1339482bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 05:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=GtxdXHM9In5y7ryzFISq7P4iQEZqjmMfunCki9BGwxA=;
	b=RnM7zny0DUGj0Pgia8lHonRPohWaoEXGqG2/PT/rfEuf0iMvbWMsvnCGExABc+zd5c
	Kk3oP1D16aLR6+dTFF1hj4YzaMOeSCZhc/I8ucUjZ8cp2EdkcTSBChmvJg80PZbCVo8W
	LXtqQ8sYuqp8u1y9EZtGxB9b8TkXwRpnVfvjk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=buhVGtOpd6JZZu5VP874uVX8JJcDA1DkoyXsb1r0ZG+C7xioKiCHXuWIXVDzFzxm9q
	s5s732Dzv60ssdGt50ijgAnrnhXsBZuAXqRdnOZUxjaQK3zDGe/0Yjl62/s5FcQIYnaH
	+kcnGJZsPHbdeeP/uwR86mQirpLfRbo+aZ5YI=
MIME-Version: 1.0
Received: by 10.204.150.92 with SMTP id x28mr865629bkv.132.1279282484203; Fri, 
	16 Jul 2010 05:14:44 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Fri, 16 Jul 2010 05:14:44 -0700 (PDT)
In-Reply-To: <4C40457A.9070005@balister.org>
References: <AANLkTikabrLWPM53wvdCKrDSKRJdFQTdNsA2MnfwzrI0@mail.gmail.com>
	<4C403F02.8080606@balister.org>
	<AANLkTinyrz_-sC3VCRIj-O5bQoFjx-YJpa3vu7hR0uLx@mail.gmail.com>
	<4C40457A.9070005@balister.org>
Date: Fri, 16 Jul 2010 14:14:44 +0200
Message-ID: <AANLkTikm8pusxOIcMmq2o6hFzuMph_okpKtKkXUvBUVA@mail.gmail.com>
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
Subject: Re: u-boot-utils badness
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
X-List-Received-Date: Fri, 16 Jul 2010 12:15:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/16 Philip Balister <philip@balister.org>

>
>
> On 07/16/2010 07:33 AM, Frans Meulenbroeks wrote:
>
>> 2010/7/16 Philip Balister<philip@balister.org>
>>
>>  On 07/15/2010 02:41 AM, Frans Meulenbroeks wrote:
>>>
>>>
>>>
>>>  As you wish :-)
>>
>> Note that u-boot-tools not only provides mkimage but also things like
>> fw_env
>> Also, to further mess up things: we also have u-boot-mkimage_1.3.2.bb
>> There seems to be room for some quality improvement.
>> Oh well....
>>
>
> It might be worth consolidating these two recipes. But you'll need to
> figure out why they both exist.
>

This info is probably hidden in time. They seem to be recipes from the pre
git era.

Wrt the machines using it:
No idea why Tim added it for sheevaplug.
Guess Leon just used sheevaplug as starting point for openrd base.
Wrt openrd client: I just copied over from openrd base, but openrd client
does not need it.

(btw there is also something called u-boot-env.bb
This is apparently a dummy recipe to get u-boot env into deploy and is only
used by neuros)

Frans.

