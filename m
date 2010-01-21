Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1NY55v-0003H4-6c
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 23:01:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 612C2140973E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 23:01:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vq9H1WoOFgCi
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 23:01:50 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 31694140973B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 23:01:50 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hj9giu$mfp$1@ger.gmane.org>
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<201001211102.11252.holger+oe@freyther.de>
	<883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
	<hj9giu$mfp$1@ger.gmane.org>
Date: Thu, 21 Jan 2010 23:00:23 +0100
Message-Id: <1264111223.7697.31.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting patches committed
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
X-List-Received-Date: Thu, 21 Jan 2010 22:01:42 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Rolf Leggewie wrote:

> 2) although generally not a good idea, would it be possible to rebase
>    this branch frequently so that the unapplied patches always come
>    up first in "git log"?

Just a rough idea:


mailing list

Anybody can send a mail with:

[DRAFT] ... controversial patch that needs discussion

[REVIEW] ... core patch or patch that needs review or ACK

[RFC] ... request for comments for large change before starting to do
anything.

[PATCH] ... patch from people that afraid of submitting to git or first
attempts. If no one complies, script auto-moves the patch to
org.openembedded.open


org.openembedded.open (or .staging or .public)

Tree for changes expected to be safe (by the submitter).

Anybody can submit to org.openembedded.open tree.

Anybody can veto (bad approach), amend (fix added to the commit) or
postpone (needs fix) any change in org.openembedded.open. Email will be
generated to discuss and learn submitter.

Changes that did not get veto or postponed will be pushed to
org.openembedded.dev (in most cases with a defined delay, in specific
cases (bug fixes) manually).

Is there any git expert that can comment, whether git makes something
like this possible?


org.openembedded.dev

Users with commit access can commit directly patches expected to be
save.

Everything other goes through .open.

> OE needs a stronger community culture.  Too many devs are just contempt
> with "my stuff works fine for me".

Not as easy as it sounds. OE is a heterogeneous environment. Knowing
that things may break on some platform need non-trivial knowledge.



________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



