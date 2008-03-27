Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JerHl-0006yp-9z
	for openembedded-devel@openembedded.org; Thu, 27 Mar 2008 13:32:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2RCWnqx027021
	for <openembedded-devel@openembedded.org>; Thu, 27 Mar 2008 12:32:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26761-08 for <openembedded-devel@openembedded.org>;
	Thu, 27 Mar 2008 12:32:44 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2RCWeMj027010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 27 Mar 2008 12:32:40 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Thu, 27 Mar 2008 12:32:41 +0000
Message-Id: <1206621161.4514.19.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Monotone server issues?
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
X-List-Received-Date: Thu, 27 Mar 2008 12:32:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Guys,

Can someone who knows what they're doing see what the various monotone
servers are doing?

I spent all of yesterday trying to find a window to push some changes
and failed since the connection kept stalling. This morning I pulled
from the wolfson and nslu2 mirrors, merged and pushed back. Something
like 400 revisions flowed from me to nslu2 which now won't speak to me
with:

mtn: connecting to monotone.nslu2-linux.org
mtn: finding items to synchronize:
mtn: certificates | keys | revisions
mtn:       69,681 |   72 |    22,954
mtn: warning: protocol error while processing peer monotone.nslu2-linux.org: 'received network error: not serving branch 'org.openembedded.angstrom-2007.12-stable''
mtn:  bytes in | bytes out | certs in | revs in
mtn:        85 |       251 |        0 |       0
mtn: error: processing failure while talking to peer monotone.nslu2-linux.org, disconnecting

so its not carrying the stable branch which is fine but I don't know
where the 401 revisions came from or why it used to communicate with me
and now won't.

Just to try and clear things up I've also pushed to the wolfson mirror
has taken 221 revisions and is currently "hanging"...

Is this related to the Openmoko branching or something else? Something
feels very wrong :/

Cheers,

Richard




