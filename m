Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P7Cim-0002Sv-Ha
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 21:47:13 +0200
Received: by iwn2 with SMTP id 2so2288246iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 12:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ML69rq3qmb9tUoxdWJgPYYdvLg44jUdMaVtOqB1fFEE=;
	b=RWMWDh5J4YTQUz4x9uswQ0jdXkrhcZvKybrGGVxJwtIKpvjWUCzylxXA/6VNrnsU3i
	dPRcK9xYWspqN0GtNFC96lQDpq65SyWlQhDrPU4MS2ldlnd/ro2aHwa13s2PWmRfouGt
	X+zy/OIIPaPTOW3v837bZbfVg4PAhFOxlleGQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DGpbd55QreRRFsM1S4nEUbBzxf4NLy4wsHRxOJxqsBfQzpTFtPYW24otCRBNB9DUai
	ydVzCpCk1SefsLowwu04fXd66xHMdELFSTTLnGNNBnglGhJQdHGfAmNPkgecfLFe6Pzv
	cs2rLkCPk2zwDXmpSfhg+2+bwR2+/Rs459eP8=
MIME-Version: 1.0
Received: by 10.231.190.149 with SMTP id di21mr1855791ibb.166.1287258401842;
	Sat, 16 Oct 2010 12:46:41 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 16 Oct 2010 12:46:41 -0700 (PDT)
In-Reply-To: <4CB9FEB6.9000905@freyther.de>
References: <1287230170-20745-1-git-send-email-fransmeulenbroeks@gmail.com>
	<4CB99A9C.2060507@freyther.de>
	<20101016125032.GA32732@rhein.zuhause.netz>
	<4CB9A189.7060402@freyther.de>
	<AANLkTimNeL_4EMGnrtDC452ySEkHGBALbLi=57O5eNSN@mail.gmail.com>
	<4CB9FEB6.9000905@freyther.de>
Date: Sat, 16 Oct 2010 21:46:41 +0200
Message-ID: <AANLkTinwngKBuSMpaN_scw7B22_HNqbYjYLus-EW1wJd@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gnutols_2.10.1: remove the libtool-m4-macros
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
X-List-Received-Date: Sat, 16 Oct 2010 19:47:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/16 Holger Freyther <holger+oe@freyther.de>:
> On 10/16/2010 03:16 PM, Frans Meulenbroeks wrote:
> =
>> Yes, Paul already pointed that out. Will fix that.
>> And if you both agree that the patch is sound, please add an ack.
>>
>
> Acked-by: Holger Hans Peter Freyther <holger@moiji-mobile.com>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Thanks for the acks.
Pushed, patchwork update.

One last thing:
I only fixed 2.10.1. I guess the patch is applicable to 2.8.* too, but
I have no easy way to test it (and no real interest to work on legacy
versions either).
Should we punt the 2.8.* versions. No-one is pinning them.

Frans.


