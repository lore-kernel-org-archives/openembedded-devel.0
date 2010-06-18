Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nikunjbadjatya@gmail.com>) id 1OPTK9-0002Ga-FU
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jun 2010 06:37:16 +0200
Received: by vws19 with SMTP id 19so1132057vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 21:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=NWMmdKqu+8Y7wY6/KcdslUKCdccfl3ZCOViEgzYVCrI=;
	b=dYxJLb4Vgfel4ZV19GqkowXVkiBs20yvtwTrMF0nDgvpbcc8IyHr0bwIifc+JKrtPO
	TQvY0Dju30N5sC84azgPTwteUdhAS+8dghGZ2NbGAx0eSbn3svB5ZIM9ocbFHMRSrr2s
	85vRZw2CqziTkWwcJoID5fPCKYfrB30CgnvVY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=SuQnLmiP6Yz+aciSVeucyGKr9e9JXXpqwu+2P3OwMGwmMRcP8E8XR2D9O6PN6OuFR/
	GzfcoQ4RqM2gTEznvn2rHmBlnTlLup/K7u6dhSILg5EN9hNt2ll9Oeo9EWtS2rilNyJx
	QLxLBafWgYZqi2YzxZ7fVYPp1xxJwzBORtMLg=
Received: by 10.224.53.91 with SMTP id l27mr279568qag.352.1276835550128; Thu, 
	17 Jun 2010 21:32:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.191.12 with HTTP; Thu, 17 Jun 2010 21:32:10 -0700 (PDT)
In-Reply-To: <20100617193846.GC14941@mx.loc>
References: <AANLkTilQUwinqS2HGJJzP3t_UTmXtH9daLEiN_fek-6i@mail.gmail.com> 
	<AANLkTikBqtzPB0rBp1DQ4Ekzo40HeAJcX1q7i1mLFaWy@mail.gmail.com> 
	<AANLkTim1FUHwT6lBvu2yoUUM8rvYRSaw-9e4VE_olNoa@mail.gmail.com> 
	<AANLkTilzhsHsHj4f-bd4FcB7Ka7fRspYX0iUsMxxzVuz@mail.gmail.com> 
	<AANLkTikK720KNmNjRKr6x12-kSben4t42KlmgHsSGEpS@mail.gmail.com> 
	<20100617193846.GC14941@mx.loc>
From: nikunj badjatya <nikunjbadjatya@gmail.com>
Date: Fri, 18 Jun 2010 10:02:10 +0530
Message-ID: <AANLkTikt8uUURjI56tmIEH0dCwtSJtwk0wre9oxNHEwF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: nikunjbadjatya@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: OSError: [Errno 2] No such file or directory
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
X-List-Received-Date: Fri, 18 Jun 2010 04:37:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Bernhard,

*echo $BBPATH
/home/nikunj/ope/build:/home/nikunj/ope/openembedded*

Is that wrong.?





On Fri, Jun 18, 2010 at 1:08 AM, Bernhard Reutner-Fischer <
rep.dot.nop@gmail.com> wrote:

> On Thu, Jun 17, 2010 at 12:11:52PM -0700, Khem Raj wrote:
> >On Thu, Jun 17, 2010 at 5:39 AM, nikunj badjatya
> ><nikunjbadjatya@gmail.com> wrote:
> >> /home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb
> ,
> >> do_populate_sysroot)
> >> NOTE: Testing
> >>
> /home/nikunj/ope/build/tmp/work/i686-linux/coreutils-native-8.5-r0/sysroot-destdir///home/nikunj/ope/build/tmp/sysroots/i686-linux/usr/bin/sleep
> >> for relocatability
>
> >Does
>  /home/nikunj/ope/build/tmp/work/i686-linux/coreutils-native-8.5-r0/sysroot-destdir///home/nikunj/ope/build/tmp/sysroots/i686-linux/usr/bin/sleep
> >exist ?
>
> huh? How would that supposed to be ok?
> Looks like home is leaking into some prefix, no?
> We should have a sanity for that one i suppose..
>
> Feb 14 22:25:04 <me> does anybody else see /home in their staging dir or
> did i goof up somehow?
> Feb 14 22:26:24 <me> would be nice if sanity would yell at /root and /home
> in the staging dir..
>
> where /home == something in BBPATH, without looking into details.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

