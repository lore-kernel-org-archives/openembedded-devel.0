Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1L7xm4-0006VG-6I
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Dec 2008 20:52:40 +0100
Received: by rv-out-0708.google.com with SMTP id f25so4313379rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Dec 2008 11:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=EwTzGfct47RFJYagI/97utzjnq4IiboMJ5tJ9u1WVeY=;
	b=s6+1By6pJaSYJUgLu2lY4opeceQJbpTKzFutcpyqJ83YEt2ydNeA4jWqcxqVslXhte
	X2nqSN0YnxMoNCjkZgdS3GVtrk7JrkIg8wgStjSo0mSyo/977Q8OHP2+rC20Ni1+rqZJ
	g+8tvvMVIKgdY9lrU14ZR5IIFIWH6RKXL53KA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=QGSD6M3VE+jiHhEH78su1yEtuO9L6EqLJl+OnWv+09ZO7+jMaw4lKL0AYM3X6f9ILF
	RL3evT5DtEfLT+ixg+q7fGma7m4GVnu5LY/E89HAkbJVlxwfh6fI0EuMfeKcU8Rl/sFQ
	BMafhDXQGQ8+cfymH7xFJlpAstj+bZ8vsXF0M=
Received: by 10.140.202.21 with SMTP id z21mr6462997rvf.260.1228333748239;
	Wed, 03 Dec 2008 11:49:08 -0800 (PST)
Received: by 10.141.86.3 with HTTP; Wed, 3 Dec 2008 11:49:08 -0800 (PST)
Message-ID: <19c1b8a90812031149ud04ececta2b74e804961df58@mail.gmail.com>
Date: Wed, 3 Dec 2008 11:49:08 -0800
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081203175143.GK16628@smtp.west.cox.net>
MIME-Version: 1.0
References: <c384c5ea0812030846n604eccf0pe47d15f7122f0435@mail.gmail.com>
	<b6ebd0a50812030900r593d6bb0me3a35316907b21ab@mail.gmail.com>
	<20081203175143.GK16628@smtp.west.cox.net>
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC Wild Ideas Department] create soft-links from <pkg>/<src>/patches/some_local.patch to <oe.git>/packages/<pkg>/files/some_local.patch
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
X-List-Received-Date: Wed, 03 Dec 2008 19:52:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Dec 3, 2008 at 9:51 AM, Tom Rini <trini@kernel.crashing.org> wrote:
> On Wed, Dec 03, 2008 at 10:00:13AM -0700, Chris Larson wrote:
>> On Wed, Dec 3, 2008 at 9:46 AM, Leon Woestenberg
>> <leon.woestenberg@gmail.com> wrote:
>> > Hello,
>> >
>> > during maintenance of our local set of OE patches, it would be handy
>> > not having to copy patches back into the repository.
>> >
>> > i.e. the patch fetcher could instead of copy the patch to the work
>> > directory, soft-link from the repo.
>>
>> I can see why you want it.   The file:// fetcher copies everything,
>> not just patches, they aren't fetched differently currently.  You
>> could introduce regressions if it were to affect anything but patches,
>> so you'd have to add a special case for uris with patch=1 in the
>> file:// fetcher to link instead of copy, and possibly make it optional
>> via a variable.  I take it you do a lot of patch alterations in the
>> workdir to fix problems?
>
> A lot? No.  But for everyone working from a fixed OE snapshot, this
> would be a nice timesaver.  Heck, soft-linking all of the file URIs
> would be nice here.  Perhaps a variable to control doing it always
> (default to off) ?

We use quilt to manage (push/pop) patches. We could use
QUILT_PATCHES=<dir where patches are found> in .quiltrc file.One
problem I see is that sometimes we use patches  from more than one
location. Sometimes we develop patches on top and how do we decide
where this patch is put if we have more
than one locations for the patches.

>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


