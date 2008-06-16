Received: from [201.35.65.91] (helo=freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1K8Gvo-0004Pe-6m
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jun 2008 17:47:45 +0200
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 347ED8B059B;
	Mon, 16 Jun 2008 12:47:02 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id E219B8B0588;
	Mon, 16 Jun 2008 12:47:01 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 16 Jun 2008 12:47:01 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 78B65C1F9;
	Mon, 16 Jun 2008 09:48:12 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id B04E7610052; Mon, 16 Jun 2008 12:48:54 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<g2ubb9$a55$1@ger.gmane.org>
	<87od65rxi8.fsf@neumann.lab.ossystems.com.br>
	<200806132137.51103.zecke@selfish.org>
	<87mylpqccr.fsf@neumann.lab.ossystems.com.br>
	<g35hnj$k46$1@ger.gmane.org>
	<87zlplldul.fsf@neumann.lab.ossystems.com.br>
	<g35tdc$upb$1@ger.gmane.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Mon, 16 Jun 2008 12:48:54 -0300
In-Reply-To: <g35tdc$upb$1@ger.gmane.org> (Rolf Leggewie's message of "Mon\,
	16 Jun 2008 16\:30\:06 +0200")
Message-ID: <87myllz8gp.fsf@neumann.lab.ossystems.com.br>
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
X-List-Received-Date: Mon, 16 Jun 2008 15:47:45 -0000
Content-Type: text/plain; charset=us-ascii

Rolf Leggewie <no2spam@nospam.arcornews.de> writes:

> Otavio Salvador wrote:
>>  - the tree will be a moving target, without stable revision numbers
>>    and difficult to merge, base work in and like
>
> OE is always a moving target.  I don't see how the policy would change that.

The revisions will be a moving target. To tag a commit as "not-ok"
you'd need to amend it and  them change it rev number.

>>  - most of the pros can be done using the oe-next tree. Doing a full
>>    compilation of changed modules before and after each merge gives a
>>    nice feedback for trivial problems
>
> Modules?  Are you talking kernel?  Or are you using modules as a synonym
> for recipe?

recipe, sorry.

>>  - Being available on unstable doesn't mean it'll be tested
>
> Neither does any of the other proposals ensure that.  "tested" sounds
> like 0 or 1, but in fact it is a continuum.  I can at least think of the
> following
>
> - compiles fine
> - compiles fine from scratch
> - compiles fine from scratch for MACHINE/DISTRO X and Y
> - tested to run on MACHINE X
> - tested to run on all supported MACHINEs
> - does not interfere with another package
>
> What do you mean by "tested"?  How will other processes and policies
> ensure that?

We can't ensure that also because most of tests need to be done by an
human. I think that a sort of compile tests are enough to kill most of
problems.

We can also think about make a specific distro that is need to be
booted, using qemu or whatever, that ensures that basic stuff isn't
break due the change.

>>  - 2 days is a too short testing window
>
> well, that is of course just a proposal and thus easy to fix if necessary.
>
> PS: This is not a rebuttal or a claim that the proposed policy is even a
> desirable one.  But I feel there is more need for clarification.

Sure. I also believe this all need more discussion and
clarification. Mostly because I'm a begginer at OE world and then I
can miss understand a lot of things, sure.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


