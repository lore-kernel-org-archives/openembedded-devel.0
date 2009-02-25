Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LcFmp-0006XX-GW
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 10:10:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n1P97Tii028827
	for <openembedded-devel@openembedded.org>; Wed, 25 Feb 2009 09:07:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26692-06 for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 09:07:22 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n1P97IJK028813
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 25 Feb 2009 09:07:18 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1235514594.4890.525.camel@lenovo.internal.reciva.com>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda> <49A4203E.3060202@balister.org>
	<59251.AFRWVFwAXS0=.1235513405.squirrel@webmail.no-log.org>
	<1235514594.4890.525.camel@lenovo.internal.reciva.com>
Date: Wed, 25 Feb 2009 09:09:40 +0000
Message-Id: <1235552980.5399.10.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Wed, 25 Feb 2009 09:10:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-02-24 at 22:29 +0000, Phil Blundell wrote:
> I think Tom Rini's point, which is a good one, was that the existing
> checksums.ini workflow doesn't actually do anything to protect against
> those threats, since there isn't any validation of the checksum against
> an authoritative source.  Right now, the checksum that you get in
> checksums.ini is just what was computed by the first person to build the
> corresponding .bb file: if the file had been compromised before that, we
> would never know.
> 
> Even in the case where the upstream tarball changes unexpectedly, I
> wouldn't be at all surprised if some or other developer just decided
> that the checksums.ini entry was wrong and quietly checked in a
> "correction" for it.  So I tend to agree with Tom, the checksums in
> their current form do not really buy much.

I think checksums.ini even in its current form is useful. If the
checksum matches it tells us that your build configuration at least
matches the configuration the original recipe submitter had. It also
spots corrupted downloads and cases where upstream changes and we have
seen those cases. People shouldn't be silently checking in those changes
and if they do, would most likely get spotted by people with the old
version in DL_DIR.

So to say it does buy much isn't really fair although I agree if you
want verification of the sources at every level, its not good enough. If
we want to do better, all it takes is someone to do the work. We could
have a "verified-checksums.ini" file with some policy attached to it
which is used instead of or supplements checksums.ini...

For overlays, I'd suggest just scanning the overlay directories (BBPATH)
for more checksum.ini files like we do with conf/class files...

-- 
RP



