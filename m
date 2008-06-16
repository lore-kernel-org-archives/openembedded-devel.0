Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K8CcZ-0002Pz-PS
	for openembedded-devel@openembedded.org; Mon, 16 Jun 2008 13:11:36 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K8Cbu-0007Gv-2d
	for openembedded-devel@openembedded.org; Mon, 16 Jun 2008 11:10:54 +0000
Received: from ip-62-143-23-251.hsi.ish.de ([62.143.23.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 16 Jun 2008 11:10:54 +0000
Received: from no2spam by ip-62-143-23-251.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 16 Jun 2008 11:10:54 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Mon, 16 Jun 2008 13:10:42 +0200
Message-ID: <g35hnj$k46$1@ger.gmane.org>
References: <1213345201.13942.3.camel@dax.rpnet.com>	<g2ubb9$a55$1@ger.gmane.org>	<87od65rxi8.fsf@neumann.lab.ossystems.com.br>	<200806132137.51103.zecke@selfish.org>
	<87mylpqccr.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-23-251.hsi.ish.de
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
In-Reply-To: <87mylpqccr.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 16 Jun 2008 11:11:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Otavio Salvador wrote:
>  - an oe-next tree could be done that grabs from usual contributors
>    and merge daily to check for conflicts and warn the developers
>    (mostly the same concept of linux-next)

This is an extension of an idea from Florian Boor, which at first I was
sceptical about, but which I'd like to put out here in the open because
I can start to see how it might work.  It also has the potential to
reconcile "no human intervention/automation" with "maximum review possible".

We have a stable tree which remains as is.  We create an unstable tree
which is where stuff is being committed to.  There is a review period of
say 2 days after which changes from .unstable are automatically moved to
.dev unless there is an objection from a developper.  NACK'ed changesets
need to be flagged as such to prevent them from moving from .unstable to
 .dev

This is very similar and inspired by the Debian release process
(unstable -> testing -> stable).  The big difference is that we are
dealing with code changesets where debian's objects are released binary
packages.

Would that be feasible and helpful?



