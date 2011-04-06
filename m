Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q7IjB-0003eG-VT
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 04:44:18 +0200
Received: by qwh5 with SMTP id 5so610670qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 19:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=bLsj2rR832GkHI9kqgFQNZsNsP10r14m4mNfH6QW50k=;
	b=eKTgDslCpnDAlpmHshjLoZjnP+Zz4Ju8l1hvG3GLNFDIEfC5WXovOwJBmR8UpqflGR
	vnCwuUnho6xdnbD6NWZ+TTAHiLmo6a5nFXfujXKm4guTZuymQwuLd0l0rYOEYMV1qwvg
	n9A/4ZNOAzkdN72LfsDxDYJlQo7EouL8DFAVc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=xAlOsutxjMQ9c9ioy69nPIQAUWosj/WIfHcTkq971ndNGDwwMD8gEDI3MpwZfHhdVV
	0Q6OX39P9vArPOHBKgCBMgjGzC7eZY5JEs6AYwK7ZGtqhY6AAww7lwVQnumMY6ACqjfe
	scgi1j1mBQimx0IKaKBysbG/Ff8k7UTxZmRpk=
MIME-Version: 1.0
Received: by 10.224.212.7 with SMTP id gq7mr327495qab.96.1302057730997; Tue,
	05 Apr 2011 19:42:10 -0700 (PDT)
Received: by 10.224.133.195 with HTTP; Tue, 5 Apr 2011 19:42:10 -0700 (PDT)
In-Reply-To: <inff89$hdg$1@dough.gmane.org>
References: <1302016253-10390-1-git-send-email-heroor@gmail.com>
	<inff89$hdg$1@dough.gmane.org>
Date: Wed, 6 Apr 2011 08:12:10 +0530
Message-ID: <BANLkTinEDpEthJ92iS1w=wT=6Ctemum9UQ@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] ti-syslink: Add TI Syslink for TI816x and TI814x devices
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
X-List-Received-Date: Wed, 06 Apr 2011 02:44:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 5, 2011 at 9:46 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 05-04-11 17:10, Siddharth Heroor wrote:
>> From: Siddharth Heroor <heroor@ti.com>
>>
>> * Syslink is an Inter Processor communication layer for ARM/DSP devices.
>
> NAK!
>
> 1) This has way too much copy/paste crud from dsplink that needs to get
> cleaned up, some highlights:
Yes, I did follow precedence and use what was already present in OE.

>
>> +PROVIDES = "ti-syslink-module"
>> +PROVIDES += "ti-syslink-examples"
>> +PR_append = "j"
>
> 2) inconsistent whitespace every where, do_compile is the worst
>
> 3) This really needs to get split into 2 recipes: one for the kernel
> modules using module.bbclass and one for the userspace bits.

I can split the examples and libraries into two recipes, but we may need the
kernel module and libraries to be staged together. What would you suggest
I do to keep them together when staging?

>
> 4) The platform defines seem to be better suited for e.g. ti-paths.inc

Would moving all the defines into a separate ti-syslink-env.inc be good or does
it have to be in ti-paths.inc. I'm not keen on keep all the syslink
defines in ti-paths.inc
as its unrelated to the other recipes that use ti-paths.inc.

-- 
Sid


