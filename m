Received: from [201.35.65.91] (helo=freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1K7GMK-0007wd-1o
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jun 2008 22:59:03 +0200
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id F3ED21C2063
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2008 17:58:41 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id C562C19274A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2008 17:58:41 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 13 Jun 2008 17:58:41 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id A1F73C1F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2008 14:59:38 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id E9A39C4857A; Fri, 13 Jun 2008 18:00:36 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<g2ubb9$a55$1@ger.gmane.org>
	<87od65rxi8.fsf@neumann.lab.ossystems.com.br>
	<200806132137.51103.zecke@selfish.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Fri, 13 Jun 2008 18:00:36 -0300
In-Reply-To: <200806132137.51103.zecke@selfish.org> (Holger Freyther's message
	of "Fri\, 13 Jun 2008 21\:37\:50 +0200")
Message-ID: <87mylpqccr.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 13 Jun 2008 20:59:20 -0000
Content-Type: text/plain; charset=us-ascii

Holger Freyther <zecke@selfish.org> writes:

> On Friday 13 June 2008 20:38:23 Otavio Salvador wrote:
>
>> I don't know how kernel people do to amend the patch to add the
>> acked-by/whatever data into each patch. It can be a big amount of work
>> to do an iteractive rebase for every ack given on ml for each patch
>> and with a high risk of human mistake while doing it.
>
> For (qt)webkit we have a script to merge a git branch. It is amending the 
> commit with such a line. To grab patches from the ML one could use 
> git-am/git-apply and then use the script to merge/cherry-pick the changes.

Yes, if it's done using maintainers, it works fine. Since you can add
the --signoff but if we don't have this kind of workflow it'll be a
big hassle to be done.

In linux I guess most maintainers grab the patches from ml and use
git-am -s to apply them. This makes easy for them ... in our case, if
we don't communicate thought ml, add sign-of-by can be difficult since
we'd need to do it patch by patch.

From my POV, the policy could be:

 - individual patches / small patchsets should go throught ml; someone
   at OE core team could apply them and use git-am -s for it

 - big changes should be done using external trees; people discuss the
   patches using ml but a pull request should be done and merged by
   someone at OE core team

 - an oe-next tree could be done that grabs from usual contributors
   and merge daily to check for conflicts and warn the developers
   (mostly the same concept of linux-next)

What people think about that?

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


