Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P4zQR-00035s-HT
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 19:11:08 +0200
Received: by wyf23 with SMTP id 23so2166018wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 10:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=o7xAW97IGXhdgAeKXLJqjDObQfr+/uOPhpVxRPqDrb0=;
	b=mh9wcTtVRlCEElZHRB0rltNXV7YWY2oiWByMvQijKsHpXnDT1cF5VzhdsA77BA4G5H
	3jHjmlGPNHCbe+SrGy5O2MfxMKrTv0tW9K89YXanWZZLEmp/4dcxM8nheWQZ92jdr3W/
	CpN1k+zy3j1JXafR86+RapneiZfsL25uMjaEo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=s7hlTGJunlUXCtYsx7WHMPQQkZNeCwvTPzINnCcvuI3hgnjrvWWbvNpaYFLkvdiMb+
	wuMdTzVlT62zVsl/WQksfA80aC8C03Ee5ipuQ7Dov7kkESBgTEIiTXmvXXjfZmjdY/G2
	UBqxn7gPE3RbO8bD2azEjaerynCUlJw5muzLY=
Received: by 10.216.45.16 with SMTP id o16mr2868902web.45.1286730639458; Sun,
	10 Oct 2010 10:10:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Sun, 10 Oct 2010 10:10:19 -0700 (PDT)
In-Reply-To: <4CB1EEFA.7080607@mlbassoc.com>
References: <98B362E0-7357-4934-82C7-9BBA35FEF271@mac.com>
	<4CB1EEFA.7080607@mlbassoc.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 10 Oct 2010 10:10:19 -0700
X-Google-Sender-Auth: nCofYhN4TNK1Qmr2-s-vW9g8TQw
Message-ID: <AANLkTinGHx=rrAA-cv9W-MafZZp04-YfYmnQAuxrKcAe@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: arm-angstrom-linux-gnueabi-gcc compiler
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
X-List-Received-Date: Sun, 10 Oct 2010 17:11:08 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 10, 2010 at 9:51 AM, Gary Thomas <gary@mlbassoc.com> wrote:

> On 10/10/2010 10:49 AM, Elvis Dowson wrote:
>
>> Hi,
>>       I just built the omap3-console-image using a recently synced version
>> of the overo-oe repository.
>>
>> It no longer generates the /tmp/cross folder with the
>> arm-angstrom-linux-gnueabi-gcc cross compiler.
>>
>> Has somethings changed? Which recipe should I use to generate the cross
>> compiler? Is it gcc-cross?
>>
>
> The compiler is still there - look in tmp/sysroots


And of course, if your intent is to use the toolchain from outside of OE, it
may be better to look at meta-toolchain.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

