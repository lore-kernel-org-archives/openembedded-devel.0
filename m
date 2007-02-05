Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1HE5nj-0001s1-RI
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Feb 2007 16:30:45 +0100
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 6B6934120F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2007 09:30:42 -0600 (CST)
Message-ID: <059601c7493a$835d2940$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <45C6E906.9090602@whitby.id.au>
Date: Mon, 5 Feb 2007 09:30:00 -0600
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: Re: How will OE handle the US timezone change?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Feb 2007 15:30:50 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

> Are there any OE developers in the US who know enough and care enough to
>  fix it properly?  Our someone else who is gracious enough to help our
> US friends out of their timezone mess?

Yes, there is.  I raised the issue originally, based on questions from
concerned users.

I've made a proposal on the NSLU2 lists.  I understand it annoyed koen.  As
the proposal suggested, constructive feedback on what should be done to
improve it would be appreciated, and gratefully accepted.  (Being annoyed is
an indication of concern, but I'm having difficulty converting that to
constructive feedback :)

The proposal was to fix the problem specifically for OpenSlug (hence posted
originally only on the NSLU2 lists), as I cannot pretend to know about the
needs of every other potential OE user.  And given the nature of timezones
themselves (regional with a smattering of politics), it seems doubtful to me
that there is any solution that is not also regional, and smelling of
politics.

> At the moment, there seems to be a timezones package which downloads
> binary files from some OPIE site.  I've heard that timezone data is
> endian specific, so it seems that some better solution might be required.

The existing package downloads very old data.  It is packaged in a somewhat
arbitrary manner.  It is also binary, thus cannot be updated by just
pointing to updated source data.

Going into a small bit of specifics, the proposal suggests that we create a
new package (as the newer timezone data does not match the structure of the
existing package).  The obvious critisism of this approach doesn't need to
be mentioned.  The hard part is to figure out what would be a reasonable way
to split the package, given the structure.  Take a look at
/usr/share/zoneinfo on any recent Linux system for a quick glimpse -- there
are very clear and obvious ways to split the data for some items ("africa",
"northamerica", "europe", etc), but what to do with all the links?

Empirical testing indicates that endian issues are not present, but if
anyone has more certain knowlege one way or another, that would be good
information to have.  It would change how the data needs to be generated for
the package.

Thanks,
Mike (mwester)




