Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JKGLP-0000uc-Ec
	for openembedded-devel@openembedded.org; Wed, 30 Jan 2008 18:03:28 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JKGLR-000423-Me
	for openembedded-devel@openembedded.org; Wed, 30 Jan 2008 17:03:29 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 30 Jan 2008 17:03:29 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 30 Jan 2008 17:03:29 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Wed, 30 Jan 2008 18:03:23 +0100
Message-ID: <fnqakr$ffa$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
Sender: news <news@ger.gmane.org>
Subject: RFC: aggressive usurpation of bugs.oe.net by Angstrom
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
X-List-Received-Date: Wed, 30 Jan 2008 17:03:29 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hello,

I have witnessed some aggressive usurpation of the bug-tracker by
Angstrom devs recently, especially concerning meta-bugs.  This has to
some extent brought back the bickering we all try to avoid.

I want to discuss this with you but cannot offer an immediate solution.
 I think the whole structure needs some reconsideration to make sure
that different distributions don't step on each other's toes or one
distribution claims the BTS all for itself.  The information in the bug
tracker is there for all to share and make OE better.

The problem - which I have been considering for almost a year now -
stems from the fact that OE vs. distribution vs. on-device is not
clearly distinguished.  bugzilla also does not allow marking two entries
for field X.

* there are issues at time of compilation, but they can be
  distro-specific, host-specific, foo-specific or generic
* there are issues on-device and they can be device-specific,
  distro-specific, foo-specific or generic
* It is also possible that one bug exists in A* 2007 and Sharp ROM,
  but not in A* 2008.  Currently, this is impossible to mark correctly.

We don't clearly distinguish and our field labels reflect that, making
it hard for people to carve out the bugs that affect them as well as not
step on one another when trying to resolve the problem for their
specific distro.  launchpad for example does this much better, but
generally sucks even more with regards to fields and searchability.

The problem partly stems from the fact that bugzilla is usually not used
in a cross-compile environment (what does the Hardware field mean?, what
does OS mean?).  We have tried to work around this with meta-bugs in the
past but it becomes increasingly difficult.

So much for the status quo.  I think we eventually will need to rework
the labels and fields and communicate their meaning more clearly, but I
cannot present "the" solution yet.  Suggestions and discussion welcome.

Regards

Rolf



