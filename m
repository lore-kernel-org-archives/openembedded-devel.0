Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NLN1f-00071D-Jq
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Dec 2009 21:32:46 +0100
Received: by iwn32 with SMTP id 32so1226000iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2009 12:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=+9TsSs/q+AKcxtba9nx5PC0DJpw8gq3cC9QSumhGWo4=;
	b=O2pA2EtLBhldVivOh9pwgu47gOr5/fyMEpnJ9FzuufNHf6Ud3lG2Q2OMnz0enmAxaq
	b7bw8VuB/nh7xl72kfuLnZG+p4UfI/gUzNP8QTJXbywHugq6wuQLSiVPabUZ+Ek8NhUn
	Ty27Temw3LY5S936yIqBCUZ8ZINN6CeN3bWJ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DypakEceN912/E4n2HIjjoC0zx1AxB3u51FTF+xeZJIPSdUczJrMDlOoxxIb6KLYbV
	+KC2+5CWCh0DbjzTPJ8Oumrdtj/w48D2Moo0XcqXVru3Ml/MSnYGsNlofmpTycQSl6nm
	ezHOdtoeXGyH30xxAnwZmO7Db4/xmrK2IqQV0=
MIME-Version: 1.0
Received: by 10.231.26.131 with SMTP id e3mr2976909ibc.0.1261081854919; Thu, 
	17 Dec 2009 12:30:54 -0800 (PST)
In-Reply-To: <1261081378.6896.472.camel@lenovo.internal.reciva.com>
References: <1261080453-12752-1-git-send-email-raj.khem@gmail.com>
	<1261081378.6896.472.camel@lenovo.internal.reciva.com>
Date: Thu, 17 Dec 2009 12:30:54 -0800
Message-ID: <19c1b8a90912171230k6f0dfc47lb67ea8b4722f48ea@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] conf/machine: Add x86_64 machine.
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
X-List-Received-Date: Thu, 17 Dec 2009 20:32:46 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 17, 2009 at 12:22 PM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2009-12-17 at 12:07 -0800, Khem Raj wrote:
>> * This is not supporting multilib
>> * Only 64-bit userspace can be built.
>>
>> --- /dev/null
>> +++ b/conf/machine/include/tune-x86_64.inc
>> @@ -0,0 +1,4 @@
>> +TARGET_CC_ARCH = "-mtune=generic"
>> +BASE_PACKAGE_ARCH = "x86_64"
>> +FEED_ARCH = "x86_64"
>> +PACKAGE_EXTRA_ARCHS += "x86 i386 i486 i586 i686"
>
> If this is a pure 64-bit environment, surely you don't want that stuff
> in PACKAGE_EXTRA_ARCHS.

right I will remove it.

>
> It's also not completely obvious to me that this stuff belongs in a
> tune-* file at all, or indeed that it makes much sense to talk about
> "tuning" for generic x86-64 in the first place.

most of tune files have PACKAGE_EXTRA_ARCHS so it could be another
cleaning which needs in tune files.

as the machine is for x86_64 generic I think tuning for generic is a good match
infact chosing mcpu=generic should be done too.


>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


