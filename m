Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <Patrick.Ohly@gmx.de>) id 1H42SC-0002Yn-Mz
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jan 2007 22:54:52 +0100
Received: (qmail invoked by alias); 08 Jan 2007 21:53:12 -0000
Received: from c-134-230-227.f.dsl.de.ignite.net (EHLO ip6-localhost)
	[62.134.230.227]
	by mail.gmx.net (mp017) with SMTP; 08 Jan 2007 22:53:12 +0100
X-Authenticated: #489940
Received: from patrick by ip6-localhost with local (Exim 3.36 #1 (Debian))
	id 1H42HS-0002XZ-00; Mon, 08 Jan 2007 22:43:46 +0100
From: Patrick Ohly <Patrick.Ohly@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45A2B3EA.2070502@dominion.kabel.utwente.nl>
References: <20061230051641.GA30225@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
	<20061230235938.GC16490@hezmatt.org>
	<1167523571.5626.59.camel@localhost.localdomain>
	<459786C7.70000@dominion.kabel.utwente.nl>
	<1168200264.15021.54.camel@ip6-localhost>
	<1662139633.20070107231632@gmail.com>	<20070107220333.GC6625@hezmatt.org>
	<432beae0701071446p377665c8x810644467cf7f234@mail.gmail.com>
	<1168280937.4526.32.camel@ip6-localhost>
	<432beae0701081111n490d67e2oebcaf44f4fe45e04@mail.gmail.com>
	<1168290172.4526.66.camel@ip6-localhost>
	<45A2B3EA.2070502@dominion.kabel.utwente.nl>
Date: Mon, 08 Jan 2007 22:43:45 +0100
Message-Id: <1168292626.4526.75.camel@ip6-localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
Sender: Patrick Ohly <patrick@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: A question of workflow
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
X-List-Received-Date: Mon, 08 Jan 2007 21:54:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-01-08 at 22:13 +0100, Koen Kooi wrote:
> So after every first commmit the tree is in a broken state, where-as if a developers
> applied a fixed patch in one go it wouldn't be.

That's exactly why I had suggested that a developer should commit on a
branch, fix the patch there and then propagate all changes from the
branch. As I learned since then this does not work with monotone because
monotone only propagates the final revision.

What do you think about commiting the original patch, fixing it,
commiting again, and then pushing all these changes? This is the model
suggested by Justin.

>  Sounds like your concept is badly broken.

So what do you suggest should be done instead?

Ignore anything that a revision control system might be able to do and
let external contributors sort it out manually or with quilt/patcher?
Sorry, that doesn't sound very encouraging.

-- 
Bye, Patrick Ohly
--  
Patrick.Ohly@gmx.de
http://www.estamos.de/


