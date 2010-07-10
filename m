Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OXUBK-0000yt-Kj
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Jul 2010 09:09:03 +0200
Received: by iwn34 with SMTP id 34so3066799iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Jul 2010 00:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=pPR7TwyIo42b/L5AE6kAcp64XbW3tJp9XsSmoUgv9bI=;
	b=I1mTbuHRs+hg4NV79R6MRzgdBS/20eAUTQssHF/IGumx1l6n280rVupzi52IWu4ARe
	jxO+cKtuCTGqeT72eGAc4QVLT654+gOPMsl+peVGt3iuJItLlMwYfO6Bv1TN0jfmUy4H
	jyGAxUDJcgMwoaXMnBPxOSPBxHm998fCaos5A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BSSx3uJTe8dyT+j8gWEVyvBIm6CDJM74GyT/f+YCiZ5jSbR59T+R2thYpCzh/pDbv6
	wNEn394Sa6DOtaRLoo03q/Ypthu/TxUED6I3Y2fSQzXc+3/n3pUmYs8TwRE4yuMyIA73
	yAY9trCcaakbQN9YSKK0dZ5caJxlBdeKCYNSo=
MIME-Version: 1.0
Received: by 10.231.12.136 with SMTP id x8mr2804943ibx.54.1278745444323; Sat, 
	10 Jul 2010 00:04:04 -0700 (PDT)
Received: by 10.231.157.196 with HTTP; Sat, 10 Jul 2010 00:04:04 -0700 (PDT)
In-Reply-To: <1278672294.28835.95.camel@rex>
References: <4C356475.2060208@gmail.com> <4C35F08F.1040705@freyther.de>
	<1278672294.28835.95.camel@rex>
Date: Sat, 10 Jul 2010 16:34:04 +0930
Message-ID: <AANLkTikGwqe9_4JsW_pNZKn6f5rwO0gvfkG9uwg-iQdq@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Badness with -ibad, a replacement for 	zecke-no-host-includes.patch.
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
X-List-Received-Date: Sat, 10 Jul 2010 07:09:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 9 July 2010 20:14, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Thu, 2010-07-08 at 23:36 +0800, Holger Freyther wrote:
>> On 07/08/2010 01:39 PM, Graham Gower wrote:
>> > This patch introduces a new command line parameter to gcc (at
>> > Zecke's suggestion), -ibad, which may be used to specify
>> > blacklisted include prefixes. E.g.
>> >
>> > grg@eye7:/tmp$ ~/oe2/tmp/cross/mipsel/bin/mipsel-angstrom-linux-gcc -c test.c -ibad /usr/include -I /usr/include
>> > CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include
>>
>> nice! The only thing that is worrying is the question how we make sure
>> these bad path's are enforced.
>>
>> E.g. a recipe not honoring our CPPFLAGS might silently pass this check
>> (while before it was hardcoded into the compiler). My proposal would be
>> to extend the sanity check and grep the compile log for gcc and -ibad
>> and fail if gcc exists but -ibad does not occur?

I haven't tried this, but I suspect it wouldn't be too difficult to
put them into gcc's default spec file.
That would fix the problem of breaking things for an external toolchain too.

>
> How about making this option an environmental variable rather than a
> flag? I've seen that technique used to great effect for this exact
> reason before...

That would work too.

-Graham


