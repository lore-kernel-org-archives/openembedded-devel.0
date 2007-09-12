Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IVbGT-0005u5-Ky
	for openembedded-devel@openembedded.org; Thu, 13 Sep 2007 01:04:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8CN1kiR028726;
	Thu, 13 Sep 2007 00:01:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28693-01; Thu, 13 Sep 2007 00:01:42 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8CN1ccf028719
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Thu, 13 Sep 2007 00:01:38 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Thu, 13 Sep 2007 00:01:37 +0100
Message-Id: <1189638097.6480.132.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Michael 'Mickey' Lauer <mickey@openmoko.org>
Subject: The ongoing SRCREV saga
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
X-List-Received-Date: Wed, 12 Sep 2007 23:04:58 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

[This was meant for the OE list and autocomplete didn't quite do what
I'd intended with the recipients originally, sorry :/]

There is a certain amount of friction in the community regarding the
recent SRCREV additions of which I've received my share.

The concerns are really about how we're using SRCREV in OE rather than
about the bitbake implementation itself which is an important
distinction.

The basic problem is that people view the change as making parsing
dependent on network access which was never the intent. If people added
a revision to sane-srcrevs.inc every time they added a SRCREV based .bb
file we wouldn't have a problem and parsing never would depend on
network access. I'm living on another planet if I expect that to happen
in reality though so this approach simply isn't going to work though.

I'm therefore proposing we change bitbake.conf to read:

SRCREV = "1"

This puts an end to network access when a SRCREV hasn't been set in
sane-srcrevs.inc. Anyone wishing to default to svn head in these cases
can add this to local.conf (or their distro):

SRCREV = "${AUTOREV}"

I propose keeping sane-srcrevs.inc for distros to include to have
meaningful revisions for srcrev based packages.

If a distro like openmoko wants to make cutting edge development
possible I suggest creating a .inc file which sets

SRCREV-pn-whatever = "${AUTOREV}"

for the packages they want to make floating.

I firmly believe that floating SRCREVs should be opt in and these
changes allow that whilst still letting distros or users make use of
floating versions. I'd also advise openmoko against making SRCREV =
"${AUTOREV}" the default and to only make the packages they need
floating but thats not my call to make :).

Are there any objections to the above? I'll probably commit this fairly
quickly if the openmoko devs are agreeable.

Cheers

Richard




