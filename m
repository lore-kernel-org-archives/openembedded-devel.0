Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pt4e3-0001Vz-HM
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 21:52:11 +0100
Received: by fxm8 with SMTP id 8so1990042fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 12:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pG/bPXGwkEQDdxxtulCi7kyYQLSq0e9WK+/oDcA3GAI=;
	b=uZdoj2FVpAs/X/mhY6H9V5pXZtfZT6gbWxTUTP48Fu8cIb1vsIvvmiO5DqbNy39KyJ
	cfpXSfM6Zv88uVHll5cyS2XtL6ts0GO6jHmwLwV62dxpuUcLLwbMHNZJA0lQaAUgmQi3
	GiaoB4+OpvG6LzWrsyBC2VxalCHeRWKuXThQs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=RbWyU6kCF5Gsgpjqx67kvh4EV0mKcvKdG+i1yqXZfjQjwhUB9boXUwmoWdj8vJx0D+
	DERPEKeNPIfKNpo2N/Qu9OzjFzaDBtycUAkLDFQEsvdc8+RSmjVPWYtIHkORvL1vy5SM
	Jcx0G6yPjuP8lV/wRxMjvvzsV3Jj9d4alNCjA=
Received: by 10.223.114.203 with SMTP id f11mr3296689faq.20.1298667001091;
	Fri, 25 Feb 2011 12:50:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Fri, 25 Feb 2011 12:48:31 -0800 (PST)
In-Reply-To: <1298664172.3818.2.camel@lenovo.internal.reciva.com>
References: <4D5A5871.7000005@dresearch.de> <4D5A89CD.803@opendreambox.org>
	<4D5A92BC.1010906@dresearch.de> <4D5E422B.3040703@dresearch.de>
	<AANLkTi=+vnLLOeP2umN3kdK3YzZBgLAwQgAvEKSjqd5f@mail.gmail.com>
	<4D665D92.7000100@dresearch.de> <4D6671C2.7060604@opendreambox.org>
	<4D675D08.6050301@dresearch.de>
	<AANLkTikv_D9xz3MYHwz0=eoJ+Q_p8TsCJC9k2Ps0SBw7@mail.gmail.com>
	<4D679C54.9060202@opendreambox.org>
	<AANLkTi=7ZpNFo+7+g4ymwHFRwAWx5PGUqOYRHeGN4XD8@mail.gmail.com>
	<1298664172.3818.2.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Feb 2011 12:48:31 -0800
Message-ID: <AANLkTimEcxahuuhUZaMZdo=5-Go09QGJ=GCmgBcOT0-6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: linux-libc-headers version (reloaded)
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
X-List-Received-Date: Fri, 25 Feb 2011 20:52:11 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 25, 2011 at 12:02 PM, Phil Blundell <philb@gnu.org> wrote:
> On Fri, 2011-02-25 at 09:28 -0800, Khem Raj wrote:
>> On Fri, Feb 25, 2011 at 4:11 AM, Andreas Oberritter
>> <obi@opendreambox.org> wrote:
>> > The point I was trying to make is that feature detection at compile time
>> > is impossible, if the feature can be disabled by the kernel config
>> > (which is the case for epoll and inotify, which in turn were the
>> > examples discussed on the mailing list in May 2010). You need to do
>> > runtime tests in programs intended to be portable.
>>
>> which may not be easy to do for cross compiled packages unless they are patches
>> to make this test dynamic
>
> Isn't a runtime test dynamic by definition?

yes thats what I meant

I'm not quite sure how
> cross-compiling is relevant to this.

fact that we may not be able to do the runtime tests to configure a
package while cross compiling is what I was thinking of


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


