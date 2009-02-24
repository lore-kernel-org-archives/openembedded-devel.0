Received: from [80.67.172.39] (helo=webmail.no-log.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Lc5WX-0003Of-KK
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 23:13:09 +0100
Received: by webmail.no-log.org (Postfix, from userid 33)
	id 5CE744BBB4; Tue, 24 Feb 2009 23:10:05 +0100 (CET)
X-Squirrel-UserHash: c3wyGAAN
X-Squirrel-FromHash: AFRWVFwAXS0=
Message-ID: <59251.AFRWVFwAXS0=.1235513405.squirrel@webmail.no-log.org>
In-Reply-To: <49A4203E.3060202@balister.org>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda> <49A4203E.3060202@balister.org>
Date: Tue, 24 Feb 2009 23:10:05 +0100 (CET)
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
X-List-Received-Date: Tue, 24 Feb 2009 22:13:09 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> Michael 'Mickey' Lauer wrote:
>> Am Montag, den 23.02.2009, 23:46 -0700 schrieb Tom Rini:
>>> I'm going to make a different suggestion.  Lets just drop it.
>>
>> I'm in favour of this. I don't think they give us the safety we want a=
nd
>> they introduce more inconvenience.
>
> Drop checksum checking? I am not in favour of this. The check does
> provide valuable reassurance that the source's are not changing in
> "funny" ways. This is valuable data for many people.
>
> We have ways of disabling the checks for people who are less concerned
> with image integrity.
>
> I agree the current implementation is not perfect, but it is a good
> compromise.
I totally agree with keeping the checksums for 2 reasons:
*to be shure that the package stays the same over time: upstream could
have the bad idea of changing the tarball to put a fix into it without
changing the tarball's name
*security: that is also very important as threats are growing:
**nasty threats are growing(at least that's what I heard in the press)
such as computer infections(malware etc..)
**intrusion into citizen's computer by the state is legal in some countri=
es:
http://yro.slashdot.org/article.pl?sid=3D09/01/04/2042242
**sometimes distributions repository get compromised
http://www.vnunet.com/vnunet/news/2224622/red-hat-admits-getting-hacked
And theses people could be interested in tampering some repositories...
I don't know every possible uses of openembedded but some people could:
*run ssh client on it
*have sensitive things on it(such as phones,pdas)
*run services(such as networking on hardware) where the availability is
important
*run industrial/military applications on it
etc...
Denis.


