Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JIvJ0-0001TX-Vz
	for openembedded-devel@openembedded.org; Sun, 27 Jan 2008 01:23:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0R0NWL2013512
	for <openembedded-devel@openembedded.org>; Sun, 27 Jan 2008 00:23:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13098-07 for <openembedded-devel@openembedded.org>;
	Sun, 27 Jan 2008 00:23:28 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0R0NSXD013506
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 27 Jan 2008 00:23:28 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1201355021.4717.16.camel@localhost.localdomain>
References: <fnchem$8v4$1@ger.gmane.org>
	<200801260151.13034.mickey@vanille-media.de>
	<1201355021.4717.16.camel@localhost.localdomain>
Date: Sun, 27 Jan 2008 00:23:27 +0000
Message-Id: <1201393407.4717.30.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Sun, 27 Jan 2008 00:23:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-01-26 at 13:43 +0000, Richard Purdie wrote:
> On Sat, 2008-01-26 at 01:51 +0100, Michael 'Mickey' Lauer wrote:
> > If we really want to have that (I'm -0 on that), I would rather propose
> > 
> > S = ${@"%s/%s" % ( bb.data.getVar("WORKDIR", d, 1), bb.data.getVar("P", d, 1).replace( "-native", "" ) ) }
> 
> Would it be worth adding syntax to bitbake for this kind of operation,
> something like:
> 
> S *= "${S}-native"
> 
> ?

This syntax doesn't solve the original problem of course.

People have requested -= and I've been wondering if we should add that
as a search and remove operator. To match the existing language that
would have to work on space delimited lists though so its of no use to
this use case. We could pair this with a *= or operator which worked the
same way without the space delimiter like .= does...

S *= "-native"

?

maybe ~= would be a better pairing with -=?

Having syntax which allowed variable reuse like the original example
above could also be useful:

S = "foo"
S *= "${S}-native"
print bb.data.getVar("S", d, 1)
    foo-native

Does anyone have any other language enhancement requests for bitbake
while I'm thinking about it (or any thoughts on the above)?

Cheers,

Richard




