Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1S9fTO-0004F6-Ss
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 17:30:19 +0100
Received: by dado14 with SMTP id o14so10452790dad.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 09:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5SiVQnBYjRkmCf+JXsoB0YvrKawHws99v7HxEFM78H0=;
	b=iymPPS5957lxsFLhb9to5nktizm1NI/8asPByg5bqVyqEL8io9tzCHq40evxuN4ciY
	hAhrlbhrrI2ndWzIzB1RyRjEbwKGEjxHuFtUqbCl15OqoSsfOIQ2+TjDSlDBctPJoETd
	oEyAwJgzdRyL5sf9I3sEr+/AKlqtX1L58SqX6Ge9teZjQhCRS+sQFEf7uql4hA4tszqW
	zxHuMm10ctgHH43uT1DR+Rj6HRjrCBe4Rj3CdBnn8hgM+OtWW5li/tRLfl+SiReFLRIu
	1H9rFfj11AkkpojkVFHIC03r0UIsFsTbYXcSmqYGYrhDonljeNBy0nj+pHklpFn/XKP8
	YffQ==
Received: by 10.68.130.72 with SMTP id oc8mr41014802pbb.115.1332174086287;
	Mon, 19 Mar 2012 09:21:26 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id e7sm1780923pbs.21.2012.03.19.09.21.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 09:21:25 -0700 (PDT)
Date: Mon, 19 Mar 2012 09:21:22 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120319162122.GA19810@bill-the-cat>
References: <4F61C54B.1000609@dresearch-fe.de>
	<4F66E4F2.2000909@dresearch-fe.de>
	<CA+M6bXmpiegfSspYOwybxKSLf4Ukg5tjRL4VR1aq8T4EFyaaRg@mail.gmail.com>
	<CACW_hTbMZ5R6VB_BChH+3rxx-tqV3jqxioX8Q5ZWsoiHJWZ=7w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACW_hTbMZ5R6VB_BChH+3rxx-tqV3jqxioX8Q5ZWsoiHJWZ=7w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: libmatthew-java-0.7.1.tar.gz not fetchable
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
X-List-Received-Date: Mon, 19 Mar 2012 16:30:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 19, 2012 at 04:44:10PM +0100, Frans Meulenbroeks wrote:
> 2012/3/19 Tom Rini <tom.rini@gmail.com>:
> > On Mon, Mar 19, 2012 at 12:49 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> >> On 15.03.2012 11:32, Steffen Sledz wrote:
> >>> libmatthew-java-0.7.1.tar.gz (used in 2011.03-maintenance branch) is no longer fetchable from it's original location (the maintainer provides the latests version only). And i did not found another reliable source.
> >>>
> >>> Can someone put the tarball into the OE and/or Angstrom mirrors?
> >>
> >> Ping!
> >
> > If someone points Khem at a copy, this can happen...
> >
> > --
> google is your friend
> 
> http://pkgs.fedoraproject.org/repo/pkgs/libmatthew-java/libmatthew-java-0.7.1.tar.gz/6a4db221129f230c64a0f937d00bb703/libmatthew-java-0.7.1.tar.gz
> 
> It might be useful to update the recipe itself as well.
> Furthermore we might consider running a fetchall and put all fetched
> on the mirror.

Does pkgs.fedoraproject.org have a policy about forever, ala
snapshot.debian.org?  Otherwise, we're just making a problem for
ourselves in the future.  WRT an everything mirror, I think bandwidth
usage is a concern there, ala what I think happened with the angstrom
everything mirror.

-- 
Tom


