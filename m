Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OlyGF-0000ZZ-EC
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 08:06:00 +0200
Received: by iwn38 with SMTP id 38so1452378iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 23:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=XUFlHnyfxIVvYnPUYmzS56EIUAYhhhntK6xNd+KWLRI=;
	b=VcwuWqZGXFmvZ2X37KBHNfZfIA2SVHuvanij1slIwjT6cjhFvpPjTSXPPqTM9BhLfm
	Hh7wM8IJMNPYoyWI9sALdsrRZzNT/9HII0G6CycEeLOaD9H1AwRKooPENK0gw73yBASt
	fkQLErI4VHNP6C2Ft4atAHdQgrXcfZOIVMebw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=fBW+5eEdiVmcy9CsyG0fEXS2yjW9x+tHIf1WbYA2AP0sV+pX3XqNQGWBVU1/8KiAXB
	MYFxhaVWRwaSVufS4hp5BY44kK6mPIBr9eZv6cLLy3urKr8vMiPw1Ez8vPK4qDql73na
	h7fZLHtrFkr8v6AqvreXhlTeHljpDzYHBvwQA=
Received: by 10.231.30.134 with SMTP id u6mr10719819ibc.121.1282197941158;
	Wed, 18 Aug 2010 23:05:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.199 with HTTP; Wed, 18 Aug 2010 23:05:21 -0700 (PDT)
In-Reply-To: <AANLkTi=WhXyczDLG0_Lt66RxTKfQswu4dNfGAyRHyKja@mail.gmail.com>
References: <AANLkTi=WhXyczDLG0_Lt66RxTKfQswu4dNfGAyRHyKja@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Aug 2010 23:05:21 -0700
Message-ID: <AANLkTik1kB09u203gue2RGAyD7-6yPoodqs=Lqg4+Eau@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cmake-native dependency
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
X-List-Received-Date: Thu, 19 Aug 2010 06:06:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 18, 2010 at 10:46 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Dear all,
>
> Yesterday I noticed a cmake error due to pstaging on boost and
> usbmuxd. I noticed cmake-native was not in the dependency list, so I
> added it. However after doing so Koen told me that this dependency is
> automatically added by
> inherit cmake.
>
> Questions:
> - what to do next (options: leave as is, revert commit (probably not a
> good idea as that would decrease PR), or undo change with a separate
> edit (no PR bump needed).

yes undo commit and bump PR again.

> - should we note somewhere what dependencies are included by inherits
> (e.g. I was unaware that inherit cmake would drag in cmake-native, so
> I guess this will at least for some others be the case)
> E.g. we could do something like
> inherit cmake # adds dependency to cmake-native
> in the bb files that inherit cmake.
>
> Your suggestions are appreciated.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


