Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <oe@hentges.net>) id 1HKkPl-0000KM-B6
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Feb 2007 01:05:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id A3EA63081E8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Feb 2007 01:05:24 +0100 (CET)
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 08779-04 for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Feb 2007 01:05:21 +0100 (CET)
Received: from mhcln04.hentges.priv (xdsl-213-196-246-16.netcologne.de
	[213.196.246.16]) (using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 936BB3081E6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Feb 2007 01:05:00 +0100 (CET)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45DEA03E.8070903@dominion.kabel.utwente.nl>
References: <45D98799.1080309@dominion.kabel.utwente.nl>
	<200702191259.25200.openembedded@hrw.one.pl>
	<45D9984C.6090705@dominion.kabel.utwente.nl>
	<45DAAEF4.50701@dominion.kabel.utwente.nl>
	<45DAFC38.40000@dominion.kabel.utwente.nl>
	<1172197564.5203.11.camel@localhost.localdomain>
	<45DEA03E.8070903@dominion.kabel.utwente.nl>
Date: Sat, 24 Feb 2007 01:03:53 +0100
Message-Id: <1172275433.5203.17.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at hentges.net
Subject: Re: RFC: splitting deploy/ipk into subarchs
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
X-List-Received-Date: Sat, 24 Feb 2007 00:05:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Freitag, den 23.02.2007, 09:05 +0100 schrieb Koen Kooi:

> Matthias Hentges schreef:
> > Am Dienstag, den 20.02.2007, 14:48 +0100 schrieb Koen Kooi:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> Koen Kooi schreef:
> >> 
> > Why not make this change optional via a variable 
> > (ie: SPLIT_DEPLOYDIR_IPK = -1 to turn it off) ?
> > 
> > The current version breaks local OE feeds
> 
> People's feeds are outside the scope of OE. Repeat after me: deploy never was, isn't and
> never will be a feed.

It worked just fine as a feed before the change and people were using
it as such, deal with it.

> > and requires needless post-processing.
> 
> As I pointed out before, you needed postprocessing anyway due to bugs in ipkg and
> ipkg-utils, so your point is moot.

You may have needed post-processing, I personally never did. Not even
when I was building for 4 machines.... As I said, the old deploy
directory worked just fine as a feed out of the box. If people weren't
using it as a feed, please explain the existence of
meta/package-index.bb.

> 
> > A slugos deploy dir looks like this now:
> > 
> > all
> > armv5te
> > i686
> > ixp4xxle
> > 
> > I honestly don't see any advantage to the previous mode of operation.
> 
> Go read the openembedded-devel list some time.

Well, If I wouldn't read it from time to time, I wouldn't have
responded to this thread in the first place.
Sounds logical, now, doesn't it?

> 
> > If
> > it is needed for unique situations 
> 
> No

Oh yes.

> > like the rare case of a multi-machine build
> 
> Apart from that now being the point, 

Yes, that's exactly the point. A change benefiting very few people
affecting basically every one in a mostly negative way.

> it actually isn't rare, the majority of the
> (maintained) distros in OE use it (celinux. generic, angstrom, openmoko, openzaurus,
> slugos and jline).

Oh right, because the majority of OE users are distribution maintainers,
right!
And every maintainer always builds every machine in existance. Sorry, I
forgot!
</sarcasm>

Your SlugOS exsample is pretty braindead as I had already shown you in
my previous email that slugos builds _suffer_ from the change, they
don't benefit from it. You do actually _read_ the emails you are
"responding" to, right?

SlugOS doesn't even use multi-machine magic to build images for
multiple supported machines (it may or may not use it for LE/BE
builds). You might wanna check with reality from time to time before
spouting nonsense.

> > it should be off by default and - by all means - optional.
> 
> No it should not. Next time respond to the RFCs instead of starting some uninformed rant
> afterward.

a) Not even 24 hours passed between the first email and the resulting
commit. What kind of RFC is that? How are people supposed to actually
comment on it (you know, the C part of RFC? ) if the commit is out
before most subscribers even noticed what was going on?

b) I do have other things on my mind than to read this mailinglist on
a daily basis. I only do so from time to time and respond to matters
of my concern and / or interest.

c) It wasn't a "rant", I was stating facts, even if you are too
close-minded to see it.

d) It was in no way uninformed. You may remember me maintaining my own
bloody distribution for multiple machines in the past? How much more
informed about this matter do you want me to get? I even gave a very
informed short example ( in the form of SlugOS ) of why I think the
change should be optional. If anyone is posting uninformed "rants", it
is you.

e) If you do not want any comments, then by all means, don't request
them! But if you actually _do_ care what other people think about a
certain matter, please stop responding like a know-all-be-all impolite
smart-ass that puts down other people for not thinking 100% alike.




