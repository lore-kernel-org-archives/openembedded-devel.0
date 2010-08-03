Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OgIFZ-00067Z-Gj
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 16:13:50 +0200
Received: by wyb38 with SMTP id 38so4580472wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 07:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=rlIQ4vfifHkmK8xwShkdMhb2TvX8ntNqcl+ArOzA5M8=;
	b=Mn4Z++Kj08H+wSBmQ8inpcZhy/acbegfSHEBq+Z4lvrQqfIx+rp3G2It6oLuNezjXi
	MxVfmI9QbmNWtEB5nLkCHG5uHpeszStOkcGNa0zF39gTxWUNPv6UhxM61FA8Tin9216Z
	5T+v+UaV4SuXc02dKcrPBXQqXsv3wPAtEmc30=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=ccT4GxlkMbkdAJV7NUDWgRDjS7f/W9q4xA6NtHhqiJ99+d07hOTXa4OdYdJRv98D1P
	Xp5n/3Cj5jOUtEkCOKjvQXOv0ZTQ5t+Wp0fcaG5GdmTywRtDk9nY7+qliGxGZ3i93pEr
	jRm1P33Xt9Cp5QPhEELRYguAXIKaq5HTj3xlg=
Received: by 10.216.50.73 with SMTP id y51mr6366848web.85.1280844824361; Tue, 
	03 Aug 2010 07:13:44 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.16.204 with HTTP; Tue, 3 Aug 2010 07:13:23 -0700 (PDT)
In-Reply-To: <1280842002.16235.83.camel@rex>
References: <1279290319.10837.1747.camel@rex> <1280842002.16235.83.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 3 Aug 2010 07:13:23 -0700
X-Google-Sender-Auth: Q2OmHSL8KY2v44e1Df8dfsFtDMo
Message-ID: <AANLkTi=yp8ZMgBqx61BWus+G9p28iJcpKMXASdw_hDr8@mail.gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [Bitbake-dev] A new bitbake extension: .bbappend files
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
X-List-Received-Date: Tue, 03 Aug 2010 14:13:50 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 3, 2010 at 6:26 AM, Richard Purdie <rpurdie@rpsys.net> wrote:

> On Fri, 2010-07-16 at 15:25 +0100, Richard Purdie wrote:
> > Whilst our layers mechanism, is great it does have a drawback which has
> > bugged me for a while. If you have a recipe like pointercal which has
> > machine specific information in it and you have your new machine code in
> > a layer, how do you add a pointercal file for your machine?
> >
> > Answer is you copy the whole pointercal recipe and files into your
> > layer, then add the single file for your machine. To me this is ugly,
> > ugly, ugly. We hate code duplication and as soon as you create two
> > copies of the same information, we've failed.
> >
> > So how could we do this better? Somehow we need to say that a given
> > directory X has some information which should be merged with the
> > original recipe. I've thought through several different ways of doing
> > this and the best solution I found was "bbappend".
> >
> > The idea is that if bitbake finds any X.bbappend files, when it loads
> > X.bb, it will also include these files after it parses the base .bb file
> > (but before finalise and the anonymous methods run). This means that
> > the .bbappend file can poke around and do whatever it might want to the
> > recipe to customise it.
> >
> > I went ahead and tried it out as its quite simple to code this in
> > bitbake. I liked the result enough I've already merged this into Poky:
> >
> >
> http://git.pokylinux.org/cgit.cgi/poky/commit/?id=63e6ba85677b8aa9f4cf9942a1fccbb8a8c72660
> >
> > I'm proposing to push it to bitbake master if there are no serious
> > objections.
>
> Whilst I think there were some initial concerns the consensus seemed to
> be that this was a good thing to have in bitbake, its something that has
> been on the feature wishlist since day one so I've merged the patch into
> bitbake master.
>

Glad to hear it, nice work putting it together.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

