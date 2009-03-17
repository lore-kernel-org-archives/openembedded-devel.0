Received: from [74.125.46.156] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LjeoV-0001p4-UK
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 20:19:15 +0100
Received: by yw-out-1718.google.com with SMTP id 9so100851ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 12:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mtoS5j2EO5AdlDuzWiTFxk9SKmXF2utc9NJ6v1XcP/k=;
	b=I7CDaY2ZKNkV427rX6RmyE0xaU1DBGuHc1sfZXX7hXT17YB5h7Tsff85Utro3r6s/B
	o1lJJEIkZHOV/NRa5/hkHc81cFeSzMHenLCek3WTTwF8NWziuQaRP0X1qTwEEN/JnJxr
	6eQpPhKI1sUmV+AzlUyVFuwh8HN29e63miO/E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=ItLorrkGf5mI219idOcuCQphgRUaz2cZeO8cb3ZTFZ0R5BcZRIkVOZDJUDdbIgNEgI
	r1r94FUkgKdRY8V3EG0WhulvpcEqrXVnCZ91I/IcxH8rySksXojPUNdGocQ9tE4hsg4X
	EirQBeCKERm7VBowC76V7GFfrbmB3EVW1Rd0w=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.151.141.16 with SMTP id t16mr671849ybn.69.1237317493898; Tue, 
	17 Mar 2009 12:18:13 -0700 (PDT)
Date: Tue, 17 Mar 2009 12:18:13 -0700
X-Google-Sender-Auth: aed146453d0637b2
Message-ID: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.46.156
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Package Maintenance
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
X-List-Received-Date: Tue, 17 Mar 2009 19:19:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I'd like to propose re-establishing MAINTAINER, set per package, to
individuals, or left as default for packages which aren't directly
maintained.

Doing this would:
- Facilitate dumping a list of unmaintained packages to give to new
users wanting to volunteer to help us, but not knowing how to
contribute.
- Return some individual responsibility to the project, giving one
person the blame for brokenness for that package, as well as giving
responsibility for pushing patches upstream to that person.  In my
opinion, a number of the recent issues in the project are due, in
part, to a lack of that individual responsibility.  Everything is
fuzzy, determined by a group, instead.
- Allow us to physically separate, in the repository, those packages
which get the most attention (are maintained) from those which get the
least (maintained by the entire team).  We could finally be *honest*
with our users about what we work on, telling them that the packages
which are maintained by the team are in need of an individual
maintainer, and get less attention, so bugs there will be fixed more
slowly, and there are no guarantees on functionality there.  I think
it'd be better to have a core set of *functional* recipes than have a
huge set of "might work, might not" recipes as things stand today.  In
my opinion, this would be more likely to give new users stability than
creating a stable branch, while making better use of our limited
manpower, rather than increasing the load drastically.

Opinions?
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


