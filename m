Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@openmoko.org>) id 1JJ1fh-0002c2-TO
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2008 08:11:17 +0100
Received: from [192.168.1.105] (e180145175.adsl.alicedsl.de [85.180.145.175])
	by drlauer-research.com (Postfix) with ESMTP id AC096584BFF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2008 08:14:52 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@openmoko.org>
Organization: OpenMoko, Inc.
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Jan 2008 08:11:23 +0100
User-Agent: KMail/1.9.7
References: <fnchem$8v4$1@ger.gmane.org>
	<1201355021.4717.16.camel@localhost.localdomain>
	<1201393407.4717.30.camel@localhost.localdomain>
In-Reply-To: <1201393407.4717.30.camel@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <200801270811.23766.mickey@openmoko.org>
Subject: Re: RFC: strip "-native" from $S for native	packages	automatically (bug 1856)
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
X-List-Received-Date: Sun, 27 Jan 2008 07:11:18 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 27 January 2008 01:23:27 Richard Purdie wrote:
> On Sat, 2008-01-26 at 13:43 +0000, Richard Purdie wrote:
> > On Sat, 2008-01-26 at 01:51 +0100, Michael 'Mickey' Lauer wrote:
> > > If we really want to have that (I'm -0 on that), I would rather propose
> > >
> > > S = ${@"%s/%s" % ( bb.data.getVar("WORKDIR", d, 1), bb.data.getVar("P",
> > > d, 1).replace( "-native", "" ) ) }
> >
> > Would it be worth adding syntax to bitbake for this kind of operation,
> > something like:
> >
> > S *= "${S}-native"
> >
> > ?
>
> This syntax doesn't solve the original problem of course.
>
> People have requested -= and I've been wondering if we should add that
> as a search and remove operator. To match the existing language that
> would have to work on space delimited lists though so its of no use to
> this use case. We could pair this with a *= or operator which worked the
> same way without the space delimiter like .= does...

Aah, finally you're getting sane :D

>
> S *= "-native"
>
> ?
>
> maybe ~= would be a better pairing with -=?

Yes, I would it prefer that way.

We should be very careful with that though feature though, so it doesn't get 
overused.



