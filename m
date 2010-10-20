Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P8f4D-0000uW-M6
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 22:15:22 +0200
Received: by gxk6 with SMTP id 6so977994gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 13:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=sYUZnFSeY60lB0JEESZr/fq/xuho/kk1t1Uhn/nw44E=;
	b=hYig5J3trOAQr8VfNU8RXRz5HknLrRyU7MlVtWWBqt1nCIs0fWveYvV4BvlU36A67b
	5TfC6d29lQA+JxVQmSa36k2QzxQEaR/mWos48LZaWT740cxwzBUpaA6ynqWj2n11tccb
	hfqtU66catZacKQ5zlosXdWHe+cm1y3FGw00Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BQq+LVBzkGMFonFMxc4nKkFeC3dJbpjeE4ad2H92vVTGnY2D11GdFZjHscTsA2xEKQ
	HEOazcizPCjQDoC39+l57XRdQrTtnJtrtBBPQHBWsZ6h461b+NoZSXD4oZhcjSPbUyE3
	pUxjtmeXVBvpTB3aeVSxUKCosX3kTjANa7QPM=
MIME-Version: 1.0
Received: by 10.150.148.19 with SMTP id v19mr1981048ybd.342.1287605684596;
	Wed, 20 Oct 2010 13:14:44 -0700 (PDT)
Received: by 10.151.47.14 with HTTP; Wed, 20 Oct 2010 13:14:44 -0700 (PDT)
In-Reply-To: <20101020192501.GS11514@denix.org>
References: <AANLkTikvPnJupAjwCps+3Zc73jVNyd7Mm-X1PP307a-D@mail.gmail.com>
	<20101020192501.GS11514@denix.org>
Date: Wed, 20 Oct 2010 22:14:44 +0200
Message-ID: <AANLkTi=PsAVK5x5vZdsd9nwCmkwoSSQbuC5eKOkKjzxP@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: LICENSE, LICENSE and LICENSE
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
X-List-Received-Date: Wed, 20 Oct 2010 20:15:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/20 Denys Dmytriyenko <denis@denix.org>:
> On Sat, Oct 16, 2010 at 09:15:54PM +0200, Frans Meulenbroeks wrote:
>> Dear all,
>>
>> Being bored while waiting for a build to finish, I decided to to a
>> grep for LICENSE on recipes/*/*
>>
>> As already reported on an earlier email about 375 recipes have no
>> LICENSE (according to recipe_sanity).
>>
>> After a little bit of editing and sorting I came to the list at the
>> end of this email.
>> First digit is the number a license occurs, 2nd field is the license itself.
>>
>> Some concerns:
>> - GPL seems to be the most widely string used, but this does not say
>> too much. Is this v1, v2, v3, or maybe v1+, v2+, v3+
>> - Using ${PN} as license string might seem as a nifty way to save
>> typing a few letters, but it does not help with scripts that process
>> recipes
>> - we seem not too consistent wrt spelling wand writing things (for
>> example: GPLv2, GPLV2, GPL-2, GPL2)
>> - some of these use licenses that I have never heard of and for some I
>> have some doubts (e.g "closed" "various" "as-is" "python-style" ...)
>>
>> BTW: I've no plans to clean this up. I've been there in another world,
>> and it is boring like hell (and in that world I was at least paid for
>> it)
>> Just want to pass the results.
>
> Frans,
>
> I've done a similar exercise some time ago and collected this list for my
> personal use, when I was fixing licenses for the recipes/packages I'm
> interested in. I did fix a number of them already, as well as my fellow
> co-workers[1]. I also see you recently took care of many perl-related recipes
> yourself.
>
> So far it was in the "scratch the itch" mode - when we see some packages
> reporting incorrect or unspecific licenses, we fix them. Hopefully, this way
> we can correct the majority of recipes and leave the remainder as a janitorial
> work, as Chris suggested...
>
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/log/?qt=grep&q=LICENSE&ofs=25
>
Actually I think I need to revisit the perl recipes, as it might well
be Artistic | GPLv1+ instead of Artistic | GPL

BUt my major concerns is that there is not really a decent way to
define the remainder. They are not easily identifiable as such.
This makes a janitor having to start from scratch.

Frans.


