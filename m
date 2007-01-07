Received: from [70.85.129.92] (helo=sasquatch.hezmatt.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mpalmer@hezmatt.org>) id 1H3gxV-0008VG-5a
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jan 2007 23:57:45 +0100
Received: from [10.6.66.6] (helo=hezmatt.org)
	by sasquatch.hezmatt.org with esmtp (Exim 3.35 #1 (Debian))
	id 1H3gvx-0005JM-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jan 2007 09:56:09 +1100
Received: by hezmatt.org (Postfix, from userid 1000)
	id C7E8F4C220; Mon,  8 Jan 2007 09:56:07 +1100 (EST)
Date: Mon, 8 Jan 2007 09:56:07 +1100
From: Matthew Palmer <mpalmer@hezmatt.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070107225607.GA8793@hezmatt.org>
References: <1167506369.5626.46.camel@localhost.localdomain>
	<20061230214326.GE15188@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
	<20061230235938.GC16490@hezmatt.org>
	<1167523571.5626.59.camel@localhost.localdomain>
	<459786C7.70000@dominion.kabel.utwente.nl>
	<1168200264.15021.54.camel@ip6-localhost>
	<1662139633.20070107231632@gmail.com>
	<20070107220333.GC6625@hezmatt.org>
	<432beae0701071446p377665c8x810644467cf7f234@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <432beae0701071446p377665c8x810644467cf7f234@mail.gmail.com>
User-Agent: Mutt/1.5.11
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
X-List-Received-Date: Sun, 07 Jan 2007 22:57:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 07, 2007 at 02:46:38PM -0800, Justin Patrin wrote:
> You know, instead of adding extra branches and making the workflow mor
> complicated for core devs you, as an external contributor, could
> follow your patch as it makes it into OE and update your local version
> accordingly. That way you also have no conflicts when you propagate or
> merge.

Or I could just not submit the patch to OE.  That way I would also have no
conflicts.  Not so good for OE, but the same end result for me.  Keeping
track of a large number of patches in any particular state wouldn't be a
whole load of fun, either, especially when there's a tool which, in theory,
should be doing that work for me.

> One thing I could see us doing is possibly comitting a patch as-is and
> then making changes and comitting that. (Of course, we wouldn't push
> until it's all finished) but I don't know how well that will merge.
> Monotone uses the revision graph to deal with merging and your local
> commit still wouldn't likely be the same revision as what the dev
> comitted.

Or you could merge the patch directly from the user's tree, which keeps all
the metadata intact.  Monotone seems particularly poor in this regard,
requiring you to be running your own mtnserve, though.

> It should also be noted that it doesn't take too much to get to be an
> OE dev yourself. You can keep your own branch and deal with a few
> merge conflicts, then get commit access to OE and commit/push
> directly.

That shouldn't be necessary.

- Matt

-- 
If Alan Turing was alive today, the homosexuality would be OK but he'd be in    
trouble for codebreaking.
		-- Martin Bacon


