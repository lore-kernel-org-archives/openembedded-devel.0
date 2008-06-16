Received: from [201.35.65.91] (helo=freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1K8I6N-000385-8u
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jun 2008 19:02:44 +0200
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 28D8D8AE87D;
	Mon, 16 Jun 2008 14:02:00 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id D78C31C60D2;
	Mon, 16 Jun 2008 14:01:59 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 16 Jun 2008 14:01:59 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 2FD3DC1F9;
	Mon, 16 Jun 2008 11:03:10 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id DBCC9610052; Mon, 16 Jun 2008 14:03:52 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<g2ubb9$a55$1@ger.gmane.org>
	<87od65rxi8.fsf@neumann.lab.ossystems.com.br>
	<200806132137.51103.zecke@selfish.org>
	<87mylpqccr.fsf@neumann.lab.ossystems.com.br>
	<g35hnj$k46$1@ger.gmane.org>
	<87zlplldul.fsf@neumann.lab.ossystems.com.br>
	<g35tdc$upb$1@ger.gmane.org>
	<87myllz8gp.fsf@neumann.lab.ossystems.com.br>
	<g3649g$qnj$1@ger.gmane.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Mon, 16 Jun 2008 14:03:52 -0300
In-Reply-To: <g3649g$qnj$1@ger.gmane.org> (Rolf Leggewie's message of "Mon\,
	16 Jun 2008 18\:27\:30 +0200")
Message-ID: <87r6axxqfb.fsf@neumann.lab.ossystems.com.br>
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
X-List-Received-Date: Mon, 16 Jun 2008 17:02:44 -0000
Content-Type: text/plain; charset=us-ascii

Rolf Leggewie <no2spam@nospam.arcornews.de> writes:

> Otavio,
>
> thank you for clarifying.
>
> Otavio Salvador wrote:
>> The revisions will be a moving target. To tag a commit as "not-ok"
>> you'd need to amend it and  them change it rev number.
>
> I was talking about a possible workflow with absolute disregard as to
> how it is supported by tools out there, git in particular.  I think, at
> this point in time it is OK to build your castle in the sky and worry
> about how to implement that with tools later (and possibly make
> necessary adjustments, then)

I don't think so. What's the point in thinking a perfect solution that
will be problematic with the available tools?

>>> Modules?  Are you talking kernel?  Or are you using modules as a synonym
>>> for recipe?
>> 
>> recipe, sorry.
>
> Well, that is certainly nice, but not sufficient.  bitbake will not
> necessarily rebuild an app if a lib changes IIRC.

Sure but will rebuild the lib ... and a from scratch build when all
trees are merged in oe-next can be an nice way to find those problems
out too.

>> human. I think that a sort of compile tests are enough to kill most of
>> problems.
>
> NACK.  I don't agree.  They are necessary and good to be done.  They are
> still insufficient.  Otherwise, we could fully automate the review
> process and have a compile firm to automatically reject changesets that
> lead to compile failures.

Well, this is the most important part of my proposal. oe-next would be
an auto-nack process. If it fails to compile, nack and notify the
commiter.

Any other test will be need to be done case by case. Obviously that
something that touches a class is much more important to be carefully
tested then another patch that includes a new version of package
foobar used by a single user.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


