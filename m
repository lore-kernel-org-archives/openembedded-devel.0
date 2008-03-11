Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZ1h9-00075V-IA
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 11:26:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2BAOuaY008193
	for <openembedded-devel@openembedded.org>; Tue, 11 Mar 2008 10:24:56 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07969-05 for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 10:24:52 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2BAOmox008181
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 11 Mar 2008 10:24:48 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <fr5l5o$cmg$1@ger.gmane.org>
References: <200803110807.11368.zecke@selfish.org>
	<fr5egp$jbl$1@ger.gmane.org> <200803111042.39028.zecke@selfish.org>
	<fr5l5o$cmg$1@ger.gmane.org>
Date: Tue, 11 Mar 2008 10:24:48 +0000
Message-Id: <1205231088.4521.7.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Tue, 11 Mar 2008 10:26:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-03-11 at 10:59 +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Holger Freyther schreef:
> 
> | Also you have witnessed the issue with suspending branches and the
> automerger
> | making them live again... there is enough evidence...
> 
> That was because the automerger was running an mtn version that didn't
> have suspend cert support (0.30, it now is running 0.39). Also, as
> maintainer of said automerger I haven't heard *anything* about suspend
> certs being used by OE nor about them not working for OE. So I think you
> should blame bad communication for this, not the tool. I would have
> happily upgraded the automerger if someone had bothered to tell me[1].

We had a situation where some bad changes propagated into OE.dev
accidentally and I took steps to try and revert them. On advice from the
monotone devs, I suspended the current head and tried to move us back to
an older one. As the automerger didn't support them it just resurrected
the suspended branch. It was something that needed to be sorted ASAP
since anyone making a checkout during the "bad head" time would have to
manually change their head. In the end I just merged the heads and
corrupted our history since the damage wasn't as bad as originally
thought.

> [1] Or sent a mail to the mailinglist!

I did, Subject:[oe] Monotone issues, Thu, 31 Jan 2008 23:51:39 +0000

Cheers,

Richard




