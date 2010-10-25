Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PAAcz-0002bA-O9
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 02:09:30 +0200
Received: by iwn41 with SMTP id 41so11416iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 17:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type;
	bh=dLBWHGJ2IxM7DypeV61YnKi84tS41KJobh/KNjYaJRY=;
	b=xio/IIw+QWmP0CoqCMBcmRk5kA+IzTvkysQWKP5Ngd4kF4kyMLLEqqqmHN8nzggkwj
	KkMALCtMm08qNziWFlqG+mo/8rdWhINOsQAsWm1MbSS351TsNg89HhhGifn3kNieAKmY
	eoUoumt81opgBf24stu09hyzQesLvo+VKUK/Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=gtWpHQJ8hk43T4ZhpIYWCO/4F5U98xoM4qBwmyCs/0KIIluS5ytziWSaMfXtdf6YtW
	hByEpstBRZAwbKkRQCQnFB+EQBOH7wXNVu5sR8lnVr1bwn2NHwEuAwn20HFFDnZTFyyK
	bv6h3oZa4wDb20RCNeLpN6WbBlT2UzS4MfWQY=
Received: by 10.42.208.75 with SMTP id gb11mr1221196icb.290.1287965327914;
	Sun, 24 Oct 2010 17:08:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Sun, 24 Oct 2010 17:08:27 -0700 (PDT)
In-Reply-To: <4CC48F7C.2000403@freyther.de>
References: <1285368419-12062-1-git-send-email-raj.khem@gmail.com>
	<AANLkTimhhvUqQZSicuDE7qEHFdxUJjJJSv=ZioFwwdR8@mail.gmail.com>
	<AANLkTikvA4DOf7uwKUq2myNZMdOPZiOf_B73Kr=USOjZ@mail.gmail.com>
	<AANLkTi=8ZBZmU68NYZO3HkkLVJ09y+jhr0pWrd=bt=32@mail.gmail.com>
	<AANLkTimjYwr6vn5Makva7yciDA2_4KoiM=K7EtQQkYCf@mail.gmail.com>
	<4CC48F7C.2000403@freyther.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Oct 2010 17:08:27 -0700
Message-ID: <AANLkTi=AG42rQ+HwEZdKSmx3GALEikSuJetHiL4TMxW0@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: bitbake-dev@lists.berlios.de
Subject: Re: [Bitbake-dev] [PATCH] fetchers: Use tar --exclude pattern to remove SCM files
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
X-List-Received-Date: Mon, 25 Oct 2010 00:09:30 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 24, 2010 at 12:56 PM, Holger Freyther <holger+oe@freyther.de> wrote:
> On 10/24/2010 08:35 PM, Khem Raj wrote:
>
>>>
>>> this is used in all efl recipes and I've noticed it in elementary only
>>> because python-elementary depends on such new version.
>>
>> Do you have a list of recipes which use this ? I am sure with git it
>> will be hard to use such a thing
>> as the git revs are random and simlarily many other SCMs
>
>
> Speaking as upstream co-author of OpenBSC. We are using something like this to
> get the revision from the last tag of the repository. If someone is doing a
> make dist(check) we will copy a special version file into the tar.gz and use
> that instead.
>
> From an upstream point of view I think it is acceptable to say that the ones
> that build stuff from a SCM (in contrast to a tarball) should have the files
> of the SCM around...


well what if some used svn export <rev> to generate a tarball so it
will break for him too.
so distributors should package the SCM metadata and the user needs to
have SCM tools to
get the configure through. I would have added a script to update a
constant var in src
which would denote this incremental version like what gcc does with dates.
>
> PS: I liked the --exclude patch a lot too...
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


