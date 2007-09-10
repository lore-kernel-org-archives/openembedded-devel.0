Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IUmHl-0007vr-Pt
	for openembedded-devel@openembedded.org; Mon, 10 Sep 2007 18:38:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8AGZuQX017440
	for <openembedded-devel@openembedded.org>;
	Mon, 10 Sep 2007 17:35:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16988-10 for <openembedded-devel@openembedded.org>;
	Mon, 10 Sep 2007 17:35:49 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8AGZlwN017428
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 10 Sep 2007 17:35:47 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46E3F898.6090607@student.utwente.nl>
References: <46E3F898.6090607@student.utwente.nl>
Date: Mon, 10 Sep 2007 17:35:46 +0100
Message-Id: <1189442146.6153.42.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: sane-srcrevs.inc content and update policy
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
X-List-Received-Date: Mon, 10 Sep 2007 16:38:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-09-09 at 15:43 +0200, Koen Kooi wrote:
> I want to start using sane-srcrevs.inc in angstrom soon, but I heard some sounds from
> angstrom-derivatives about needing some bleeding-edge bits.
> 
> So I have a few questions:
> 
> * how can a SRC_REV-pn-${PN} be overriden in a clean way (e.g. SRC_REV-pn-foo = "now")?

SRCREV_pn-foo = "${AUTOREV}"

(AUTOREV is a variable specifically created for this purpose and was
already checked into bitbake.conf)

> * what goes into sane-srcrevs.inc (everything with positive def_pref?)?

That would seem appropriate (anything srcrev based would be appropriate
regardless of def_pref really).

> * what policy will be set for updating it?

Latest bleeding edge? We could even automate this...

> Having a complete sane-srcrevs.inc should fix the "can't build because berlios is down"
> type of problems.

Agreed as commented/discussed in the bugzilla.

Cheers,

Richard



