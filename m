Received: from [201.35.65.91] (helo=freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KOFZa-0003mD-AT
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jul 2008 19:34:51 +0200
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 00FD38BD498;
	Wed, 30 Jul 2008 14:33:07 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 638368B76BE;
	Wed, 30 Jul 2008 14:33:06 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 30 Jul 2008 14:33:06 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id E1578C0D4;
	Wed, 30 Jul 2008 11:33:11 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 9FC0861006A; Wed, 30 Jul 2008 14:32:21 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <1217340989.5482.10.camel@dax.rpnet.com>
	<488FAE77.7050107@whitby.id.au>
	<200807300920.37221.openembedded@haerwu.biz>
	<f96d234e0807300429j2fff8df0oc494e4a5beb9f8ff@mail.gmail.com>
	<87myjz34uv.fsf@neumann.lab.ossystems.com.br>
	<4890678A.5040005@balister.org>
	<1217428116.5510.26.camel@dax.rpnet.com>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Wed, 30 Jul 2008 14:32:21 -0300
In-Reply-To: <1217428116.5510.26.camel@dax.rpnet.com> (Richard Purdie's
	message of "Wed\, 30 Jul 2008 15\:28\:36 +0100")
Message-ID: <8763qn1dne.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: Git Migration Status
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
X-List-Received-Date: Wed, 30 Jul 2008 17:34:51 -0000
Content-Type: text/plain; charset=us-ascii

Richard Purdie <rpurdie@rpsys.net> writes:

> On Wed, 2008-07-30 at 09:07 -0400, Philip Balister wrote:
>> Otavio Salvador wrote:
>> > "Cliff Brake" <cliff.brake@gmail.com> writes:
>> > 
>> >> Using real email addresses would also simplify server admin and be one
>> >> less load on the server.  When the spam starts flowing, this can
>> >> require a significant amount of network bandwidth.  Where I host my
>> >> main web site and domain, the owner claims spam to email accounts is
>> >> by far the greatest use of bandwidth, and he spends a lot of time
>> >> implementing anti-spam measures.  With limited resources, simple is
>> >> good!
>> > 
>> > +1
>> > 
>> 
>> I also agree. I would prefer to commit with my own address. I own all 
>> the domains, so they should last as long as I do.
>
> Before we all start jumping on this wagon let me explain some of the
> background to what I proposed. I was trying to keep that announcement
> brief and it assumes some understanding of git so let me explain
> further:
>
> Git commit IDs are a totally free form fields. There is nothing stopping
> me making commit A as "Richard <rp@localhost>", commit B as "rpurdie
> rurdie@laptop" and then commit C as "Joe <someone@somewhere>". Commit A
> was my desktop, commit B was my laptop, commit C was on some account I
> borrowed.
>
> One problem with git is that its all too easy to screw up setting the
> author/commit IDs. I've done it before, I suspect I will again next time
> I change machine and I'm sure others will too intentionally or
> otherwise.
>
> Going back in time, we had the same problem with bitkeeper. Anyone
> looking through the bkcvs commit ids will see exactly what I mean -
> there are some entries in there that are totally untraceable now, e.g.
> account@1.2.3.4

I fully understand and I share this POV. It will happen, indeed.

> Why does it matter? I'd like to be able to go to the SCM and *know* who
> made a commit (knowing who authored the patch is different). I'd like to
> be able to view all commits for a given "identity".

This will be a task for the commiters. Who is going to merge others
tree will need to be careful.

> Also note that git makes a distinction between git commit IDs and git
> author IDs. It makes sense to standardise the commit IDs and these are
> the ones I'm suggesting match a pattern like "Foo
> <id@dev.openembedded.org>". Note I'm not too bothered about the author
> IDs as long as they're valid email addresses (i.e. not localhost) and
> I'm also not bothered about the name used against the commit address
> (Foo in the above example).  That could be "Foo (@Work)" or anything
> else anyone desires as long as the id@ is valid which is what I care
> about and allows us to obtain meaningful information from our metadata.

I still think that standardise it will be a problem from adminstration
side and bothering for the developers. Even it is a small group that
will end up being the push rights, they can forget it and like. 

> Gitweb and cgit usually show the author ID, and you have to look harder
> for the commit IDs.
>
> Also, "the kernel does this, why can't we" is a totally bogus argument:
>
> 1. If the kernel jumped off a cliff, would you too?
> 2. The kernel uses a pull model for development and people check IDs for
> some sanity before pulling. With the push model we're going for we don't
> have that luxury.
>
> Hope that clears some of this up.

It does but the push model will not be for everyone. Those with push
rights could have their mails in a whitelist in the update hook and
those be checked. If this person pulls from someone else, we trust
this person to check for those stupid mail/settings mistakes before
pushing it.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


