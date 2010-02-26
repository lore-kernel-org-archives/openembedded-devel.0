Received: from mail-pz0-f194.google.com ([209.85.222.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1Nl6jt-0000q1-0k
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 21:24:45 +0100
Received: by pzk32 with SMTP id 32so335189pzk.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 12:21:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.142.59.6 with SMTP id h6mr478622wfa.330.1267215716788; Fri, 26 
	Feb 2010 12:21:56 -0800 (PST)
In-Reply-To: <hm93de$tnt$1@dough.gmane.org>
References: <1266951776.18176.47.camel@trini-m4400>
	<4B87EC32.6030807@mwester.net> <hm93de$tnt$1@dough.gmane.org>
Date: Fri, 26 Feb 2010 12:21:56 -0800
Message-ID: <18e217241002261221u5f43eaebn19a52e6b86a22c00@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.194
X-SA-Exim-Mail-From: msundius@sundius.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Fix busybox SUID support
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
X-List-Received-Date: Fri, 26 Feb 2010 20:24:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 26, 2010 at 10:20 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 26-02-10 16:43, Mike Westerhof wrote:
> > Tom Rini wrote:
> >> I was about to just push this and I noticed that a number of
> >> distributions (SlugOS, Angstrom, Kaelios, micro) currently set
> >> FEATURE_SUID=y, but it's not actually install SUID.  And since I recall
> >> some way-back-when's of "busybox SUID is dangerous / crap!", I thought
> >> it best to post the patch first and let folks speak up / ask me to drop
> >> FEATURE_SUID=y when I do this.  So, here's the patch:
> >
> > In the case of SlugOS, this was deliberate -- the thinking was that we
> > would let the user decide if they wanted to run busybox SUID after
> > installation.  In retrospect, that actually led to more problems than
> > good, so this change gets an ACK from me (albeit late - sorry for the
> > delay!)
>
> The same logic was applied to angstrom "let users sort it out", but I
> think this patch is a better way to go.
>
>
just to give you a heads up, we're currently working on a patch to busybox
(and well have an OE recipe for it too) which will allow us to currently
create two busybox executables: busybox-suid and busybox-nsuid. this way we
can have the best of both worlds. maintain suid for programs that really
require it while keeping the likes of ls and cat safe for the masses...

once its through our internal review, we'll send it out.

mike

