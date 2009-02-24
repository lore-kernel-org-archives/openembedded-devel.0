Received: from [80.67.172.39] (helo=webmail.no-log.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Lc623-0001OK-D7
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 23:45:43 +0100
Received: by webmail.no-log.org (Postfix, from userid 33)
	id 3F6B44BD0A; Tue, 24 Feb 2009 23:42:39 +0100 (CET)
X-Squirrel-UserHash: c3wyGAAN
X-Squirrel-FromHash: AFRWVFwAXS0=
Message-ID: <55475.AFRWVFwAXS0=.1235515359.squirrel@webmail.no-log.org>
In-Reply-To: <1235514594.4890.525.camel@lenovo.internal.reciva.com>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda> <49A4203E.3060202@balister.org>
	<59251.AFRWVFwAXS0=.1235513405.squirrel@webmail.no-log.org>
	<1235514594.4890.525.camel@lenovo.internal.reciva.com>
Date: Tue, 24 Feb 2009 23:42:39 +0100 (CET)
From: "GNUtoo" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.9a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: Re: checksums situation
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
X-List-Received-Date: Tue, 24 Feb 2009 22:45:43 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> On Tue, 2009-02-24 at 23:10 +0100, GNUtoo wrote:
>> *security: that is also very important as threats are growing:
>> **nasty threats are growing(at least that's what I heard in the press)
>> such as computer infections(malware etc..)
>> **intrusion into citizen's computer by the state is legal in some
>> countries:
>> http://yro.slashdot.org/article.pl?sid=3D09/01/04/2042242
>> **sometimes distributions repository get compromised
>> http://www.vnunet.com/vnunet/news/2224622/red-hat-admits-getting-hacke=
d
>
> I think Tom Rini's point, which is a good one, was that the existing
> checksums.ini workflow doesn't actually do anything to protect against
> those threats, since there isn't any validation of the checksum against
> an authoritative source.  Right now, the checksum that you get in
> checksums.ini is just what was computed by the first person to build th=
e
> corresponding .bb file: if the file had been compromised before that, w=
e
> would never know.
>
> Even in the case where the upstream tarball changes unexpectedly, I
> wouldn't be at all surprised if some or other developer just decided
> that the checksums.ini entry was wrong and quietly checked in a
> "correction" for it.  So I tend to agree with Tom, the checksums in
> their current form do not really buy much.
>
> If you want true source code verification then there needs to be some
> cross-check against a trusted fingerprint from upstream.  The obvious
> way to do that would be for upstreams to start GPG-signing the release
> tarballs and then we could just verify that the signatures matched.
>
> Some upstream developers do mention the md5sum of the distribution
> tarballs in their release announcements, and in those cases it would
> already be possible to verify that the archives are good with a
> reasonable degree of confidence.  (Of course, it's possible that all
> accessible copies of the release announcement might also have been
> compromised, but the likelihood of this being the case diminishes if
> they are obtained by a different route to the tarball itself.)  However=
,
> it doesn't seem like even this level of checking is currently being
> applied to checksums.ini's contents.
Sorry I misunderstood his point...
so I think that Generating the url in a way or in another is a good idea
Denis.


