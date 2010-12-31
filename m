Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PYVku-0000fZ-Kl
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 04:34:16 +0100
Received: by ywi6 with SMTP id 6so4913621ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 19:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=ZAbe4vJjOA3hupUmgvN8yv34toAql8IVxogrn87KQYY=;
	b=vqpeI+DLjdl9KNrdhTN0LJwpffKuYJIspIFvb64dhjqMfnc02CIKRfdhoerYR5Y4EE
	vZk62g/P1GzcZePsuEwbcBNfpE7+1N5QC9o4omarMDmd+37pnzTL8kVPuhtndkvVj7cs
	j+Dnl/6lTooVsiJO43B4wfB1vmHuL6SsNgj9c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=NdsIu+cE4Z9DDFMk+xhSnljit7JN8wWf01UnZxjP8w7nLIxs0SnIwk+e+B1RPwk8eM
	AGn+cKHiX9PDoWQJ4XCLu9N0Ik7aIr8NsWVfSs9t9XdqEULoxf8ctMYY7KjZVwrMw63k
	piov+b8GpWiqvR4Rhm4FZefr173+St7yXolFE=
Received: by 10.90.72.2 with SMTP id u2mr8115307aga.4.1293766433719; Thu, 30
	Dec 2010 19:33:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Thu, 30 Dec 2010 19:33:33 -0800 (PST)
In-Reply-To: <1293763348.17519.11220.camel@rex>
References: <1293763348.17519.11220.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Dec 2010 19:33:33 -0800
Message-ID: <AANLkTini-srA6N3PkfdtcJL9bUW0Aqj+=t4j6WUm_-sc@mail.gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [Bitbake-dev] Bitbake Architecture, Roadmap, Maintainers and the future
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
X-List-Received-Date: Fri, 31 Dec 2010 03:34:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 30, 2010 at 6:42 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> There is a little friction around bitbake at the moment. I think after a
> discussion I had with Chris earlier on some things are clearer and its
> probably good to summarise how things stand.
>
> I should make it clear I've not abandoned bitbake. Anyone who has
> attended any OEDEM or other Yocto/Poky discussions will know that I
> still think/talk a lot about it. I send RFC type emails about major
> feature changes before implementation. I've also been actively
> developing new bitbake features (checksums and sstate) which just
> haven't been ready IMO for bitbake upstream until recently. People have
> yet to see the real power of these but they're *very* close to being
> useful in the real world now as anyone watching Poky will have seen.
>
> Poky and bitbake upstream were in sync earlier this year. Unfortunately
> a bad combination of circumstances have conspired to mean they've
> diverged and I've not had a chance to sync between the two. Now I've
> come to do so I've found some features I rely on as part of the roadmap
> for bitbake have been removed, thus complicating the sync up and further
> delaying it.
>
> As a quick summary, the Poky bitbake has the checksum code and next
> generation packaged-staging (sstate) whilst bitbake upstream has
> parallel parsing and a number of other significant cleanups and features
> such as the logging overhaul. For a while Poky's bitbake used a
> different execution model to bitbake upstream but we've ended up backing
> those changes out due to performance which took a long time and
> complicated things as it wasn't desired (or particularly practical to
> have that history in bitbake master).
>
> Rightly or wrongly, maintainership of a project like bitbake is as much
> about socialising changes and getting discussion and agreement on them
> as it is about developing code. It eats a lot of time, you don't get
> much thanks for it but it does make life smoother in the long run. I
> tend to focus on this a lot having had bad experiences in the past where
> ideas don't get socialised properly as it creates friction. I know
> others much prefer just to share patches, request review and push, its a
> different way of working. This is fine if you know one or the other is
> going to happen but if one happens and you expect the other it causes
> friction in itself. Discussion first can have benefits as "review" of
> code already considered finished is hard as changes are unwelcome.
>
> I consider myself a maintainer of bitbake as I've a long track record of
> looking after the architecture of the project long term and ignoring the
> past few =C2=A0months, a strong record of improving the code base, certai=
nly
> not making it worse. I don't claim to write perfect code, far from it. I
> do intend to continue to work steadily on improving bitbake as per the
> roadmaps I've published over the past few years (taking on board input
> from others as always as these aren't set in stone).
>
> At present I don't know what role Chris wants to claim with regard to
> bitbake, I have assumed now he's back working on it he wanted a
> maintainership type role but that brings responsibility for roadmaps and
> architecture discussion which I'm not sure he wants. I believe the
> nature of bitbake needs these though.
>
> So, bitbake in the future? At present it has bits on berlios (releases,
> mailing list and a web manpage) and the git source SCM on
> git.openembedded.org. Are we happy with those locations? I find it a bit
> confusing...
>
> There are a bunch of people who can commit to bitbake, some inactive,
> some active in different areas with different priorities. I think mine
> are clear above, I'd appreciate others to make their objectives clear so
> everyone understand people's positions and what people plan and don't
> plan to do.
>
> Some things bitbake does need are more regular releases and a decent
> website and manual overhaul. I know Chris has helped the regular
> releases and I appreciate that. I also appreciate the work Chris has
> done on bitbake over the past while in general. I have mentioned this
> before but people often forget to say thanks so I'll mention it again.
> This email isn't meant in any negative way against Chris btw, I just
> want to work out what we can do better in future.
>
> For releases, I know the berlios interface isn't ideal and it might be
> possible to automate things more which the investment might be worth it
> into for more regular releases.
>
> There is also the possibility Yocto could help in some way,
> infrastructure wise, manpower to undertake certain tasks (release
> automation) and maybe others. What I don't want is for any assistance
> offered to be seen as "takeover" or other "interference" from Yocto as
> that isn't the intention and I'd rather stay clear than have that
> happen.
>
> Thoughts/Comments?
>

it would be good to improve the manual or have some sort of testsuite.
For release I think Chris is doing a regular
releases recently. The release tars hosting could be moved from
berlios.de to where ever
bitbake is hosted right now its git it on openembedded.org and it
should be doable
to have a openemebedded.org/downloads/bitbake ... something like that.

Chris has been spending a lot of effort to merge poky/yocto changes
upstream lately and I sincerely applaud his efforts. Eventually I
think it would be good that yocto could use upstream bitbake instead
of having its own fork as it has now.


> Cheers,
>
> Richard
>
>
> _______________________________________________
> Bitbake-dev mailing list
> Bitbake-dev@lists.berlios.de
> https://lists.berlios.de/mailman/listinfo/bitbake-dev
>


