Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JRtrI-0000Fa-RU
	for openembedded-devel@openembedded.org; Wed, 20 Feb 2008 19:39:58 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JRtqG-0001pZ-SH
	for openembedded-devel@openembedded.org; Wed, 20 Feb 2008 18:38:52 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 20 Feb 2008 18:38:52 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 20 Feb 2008 18:38:52 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Wed, 20 Feb 2008 19:38:40 +0100
Message-ID: <fphs3l$jcj$1@ger.gmane.org>
References: <E1JRbhB-0000nu-DN@linuxtogo.org>	<20080220015817.1e33f547@widy.localdomain>	<20080220020418.1e4dda5a@widy.localdomain>	<1203502545.6860.13.camel@hammer.suse.cz>
	<20080220155339.67aed5d4@widy.localdomain>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <20080220155339.67aed5d4@widy.localdomain>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: what is a fixed bug? (was: [oe-commits] org.oe.dev - Ignore false toggle signals (work-around for OE#3390).)
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
X-List-Received-Date: Wed, 20 Feb 2008 18:39:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> feeds. So, if bug is fixed in source, but corresponding package hasn't
> made to feeds, then per above idea (hopefully pretty obvious and
> no-nonsense), the bug should not be closed.

I disagree (see mail about Angstrom usurping bugs.oe.org).

I have yet to come up with a complete plan how things should work (one
idea fell apart because a partner had to retract their offer).  But
let's discuss this piece since it came up: when to consider a normal bug
closed.

The above are really two or more issues.

a) fix the problem itself
b) propagate the fix to A*
c) propagate the fix to PS Distro

IMO, any bug fixed in .dev ought to be closed.  If it needs to be
backported or released to A*, then a separate ticket should be opened
(one issue, one bug, remember!).  The cloning function from bugzilla can
easily be used for that.

We just face the problem that - unlike launchpad - bugzilla is incapable
of tracking the status according to project for the same issue (open for
ubuntu, closed in debian for example)



