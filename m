Received: from [201.35.65.91] (helo=freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1K8EY9-0006Ea-CX
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jun 2008 15:15:11 +0200
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id E29301E847D;
	Mon, 16 Jun 2008 10:14:26 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 34D1A1E8467;
	Mon, 16 Jun 2008 10:14:26 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 16 Jun 2008 10:14:25 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 8E527C1F9;
	Mon, 16 Jun 2008 07:15:36 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 5DBAD610052; Mon, 16 Jun 2008 10:16:18 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<g2ubb9$a55$1@ger.gmane.org>
	<87od65rxi8.fsf@neumann.lab.ossystems.com.br>
	<200806132137.51103.zecke@selfish.org>
	<87mylpqccr.fsf@neumann.lab.ossystems.com.br>
	<g35hnj$k46$1@ger.gmane.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Mon, 16 Jun 2008 10:16:18 -0300
In-Reply-To: <g35hnj$k46$1@ger.gmane.org> (Rolf Leggewie's message of "Mon\,
	16 Jun 2008 13\:10\:42 +0200")
Message-ID: <87zlplldul.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Mon, 16 Jun 2008 13:15:14 -0000
Content-Type: text/plain; charset=us-ascii

Rolf Leggewie <no2spam@nospam.arcornews.de> writes:

> Otavio Salvador wrote:
>>  - an oe-next tree could be done that grabs from usual contributors
>>    and merge daily to check for conflicts and warn the developers
>>    (mostly the same concept of linux-next)
>
> This is an extension of an idea from Florian Boor, which at first I was
> sceptical about, but which I'd like to put out here in the open because
> I can start to see how it might work.  It also has the potential to
> reconcile "no human intervention/automation" with "maximum review possible".
>
> We have a stable tree which remains as is.  We create an unstable tree
> which is where stuff is being committed to.  There is a review period of
> say 2 days after which changes from .unstable are automatically moved to
> .dev unless there is an objection from a developper.  NACK'ed changesets
> need to be flagged as such to prevent them from moving from .unstable to
>  .dev
>
> This is very similar and inspired by the Debian release process
> (unstable -> testing -> stable).  The big difference is that we are
> dealing with code changesets where debian's objects are released binary
> packages.
>
> Would that be feasible and helpful?

In my opinion it will not work fine. I see following prolems:

 - the tree will be a moving target, without stable revision numbers
   and difficult to merge, base work in and like

 - most of the pros can be done using the oe-next tree. Doing a full
   compilation of changed modules before and after each merge gives a
   nice feedback for trivial problems

 - Being available on unstable doesn't mean it'll be tested

 - 2 days is a too short testing window

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


