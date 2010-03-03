Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NmqPd-0001wU-8n
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 16:23:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o23FKAaG019042
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Mar 2010 15:20:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18936-02 for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Mar 2010 15:19:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o23FJqNN019022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Mar 2010 15:19:53 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11003030628n357a820elede742097eafee42@mail.gmail.com>
References: <1267616149.2259.4.camel@rex>
	<ac9c93b11003030459h499fa3ban6f6884910ef785a@mail.gmail.com>
	<1267624062.2259.58.camel@rex>
	<ac9c93b11003030628n357a820elede742097eafee42@mail.gmail.com>
Date: Wed, 03 Mar 2010 15:19:50 +0000
Message-ID: <1267629590.2259.92.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meeting 2010/03/02
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
X-List-Received-Date: Wed, 03 Mar 2010 15:23:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-03-03 at 15:28 +0100, Frans Meulenbroeks wrote:
> For the wording above I agree.
> The message in the pango thread, I felt as a snide remark directed
> directly to me (as I initiated the discussions).

I haven't looked at that thread so I'm not going to comment on that.

> I have not too much problems with the variable name as is.
> My intention was sincere and I felt that I was just following the procedure.
> Then someone started to claim that as author of the recipe he was not
> consulted and claimed he had the final say in it.
> Fine with me, but then please make clear what recipes you "own" and
> move them out of the common area.

Following the procedure includes listening to feedback and acting on it.
In the case I suspect we're talking about the commit was premature and a
consensus was not reached. If it had been the problems introduced by the
commit would not have happened. The revert then had its own issues. But
I'd suggest we call that one dealt with as I don't see what going over
it again will achieve.

"ownership" in OE is nowhere near as simple as you make out. There is a
file which lists areas which people take some responsibility for.

> I fully agree.
> However this is a community project so I find statements like
> "If you're touching a recipe at least make sure the creator/maintainer
> agrees with your changes"
> like happened in a recent commit somewhat against the open source policy.

No, its not. People have areas of expertise and areas they look
after/maintain. We all need to be considerate to that in our commits.
This is true of many open source projects.

> And *if* we feel that creators/maintainers have a final say here, then
> I'd suggest to list the name in the recipe.

We've done that before and it was a disaster after a while. The
maintainers file came into being instead.

> Git log is only partially accurate due to the move from mtn to git and
> the rename from packages to recipes.

By combining common sense, the output from git log (which can probably
be told to track renames) and the maintainers file, there is already
plenty of information out there.

> I am also all in favour of the suggestion from Otavio. The dev head
> should use the latest version where possible. If you need stability
> use the stable branch.

That is a decision for the distro ultimately but yes, I'd generally
agree.

> > Ultimately its desirable to convert everything.
> 
> I beg to disagree. Converting legacy recipes seems pointless, and
> converting recipes that are not touched for ages and that do not
> appear in any image also might be less useful. But that is my opinion.

Either convert or remove. My point is the end result of no legacy
staging.

> > There are ways of handling this (RFC the patches, delay the commit for a
> > few days. If no answer, then make the changes).
> 
> Agree (but on the other hand that makes it even more work).
> I feel we should also have some mutual respect, and assume people do
> things in good faith.

The whole commit policy relies on mutual respect and in general works
well. It just breaks down on some corner cases :(.

> > Document where? How? Do you document the outcome of every email
> > discussion you have on the OE list? It was a "decision" that came about
> > as the result of an email discussion on this mailing list, nothing more,
> > nothing less. Volunteers doing this would be very welcome...
> 
> I guess some of the things (like our way of working) could be
> documented in the wiki.
> And before you ask: sorry, no volunteer here. There are just too many
> conflicting opinions outside & I feel I've opened enough cans of worms
> recently.

There lies the problem. People have limited time and/or a limited amount
of patience in dealing with disagreements. The end result is compromise,
we do the best we can...

Cheers,

Richard




