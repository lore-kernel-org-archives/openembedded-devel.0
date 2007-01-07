Received: from [64.233.182.188] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1H3hCa-0000JJ-6U
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jan 2007 00:13:20 +0100
Received: by nf-out-0910.google.com with SMTP id l24so8480495nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jan 2007 15:11:45 -0800 (PST)
Received: by 10.78.170.17 with SMTP id s17mr5291970hue.1168211504898;
	Sun, 07 Jan 2007 15:11:44 -0800 (PST)
Received: by 10.78.39.8 with HTTP; Sun, 7 Jan 2007 15:11:44 -0800 (PST)
Message-ID: <432beae0701071511r2e68974al3dc622cdae4ec479@mail.gmail.com>
Date: Sun, 7 Jan 2007 15:11:44 -0800
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20070107225607.GA8793@hezmatt.org>
MIME-Version: 1.0
References: <1167506369.5626.46.camel@localhost.localdomain>
	<4596E33D.306@dominion.kabel.utwente.nl>
	<20061230235938.GC16490@hezmatt.org>
	<1167523571.5626.59.camel@localhost.localdomain>
	<459786C7.70000@dominion.kabel.utwente.nl>
	<1168200264.15021.54.camel@ip6-localhost>
	<1662139633.20070107231632@gmail.com>
	<20070107220333.GC6625@hezmatt.org>
	<432beae0701071446p377665c8x810644467cf7f234@mail.gmail.com>
	<20070107225607.GA8793@hezmatt.org>
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
X-List-Received-Date: Sun, 07 Jan 2007 23:13:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 1/7/07, Matthew Palmer <mpalmer@hezmatt.org> wrote:
> On Sun, Jan 07, 2007 at 02:46:38PM -0800, Justin Patrin wrote:
> > You know, instead of adding extra branches and making the workflow mor
> > complicated for core devs you, as an external contributor, could
> > follow your patch as it makes it into OE and update your local version
> > accordingly. That way you also have no conflicts when you propagate or
> > merge.
>
> Or I could just not submit the patch to OE.  That way I would also have no
> conflicts.  Not so good for OE, but the same end result for me.  Keeping
> track of a large number of patches in any particular state wouldn't be a
> whole load of fun, either, especially when there's a tool which, in theory,
> should be doing that work for me.
>

Then don't keep track of them. Here's another perfectly valid idea.
You submit patches and, as you submit more and listen to the list you
come to understand how your patches should be contributed. Your
patches get better and better and you have less and less merge
conflicts. Be glad we're using such a great system and you have these
possibilities. We could still be using CVS like so many other
projects. We don't try to create conflicts. We want your patches to be
able to be just dropped in.

> > One thing I could see us doing is possibly comitting a patch as-is and
> > then making changes and comitting that. (Of course, we wouldn't push
> > until it's all finished) but I don't know how well that will merge.
> > Monotone uses the revision graph to deal with merging and your local
> > commit still wouldn't likely be the same revision as what the dev
> > comitted.
>
> Or you could merge the patch directly from the user's tree, which keeps all
> the metadata intact.  Monotone seems particularly poor in this regard,
> requiring you to be running your own mtnserve, though.

How would you suggest we do this? The only way to get your revision
*directly* into our DB is for you to push it or for us to pull it.

It is also possible to get the same revision using a patch as I
outlined in my previous mail, which you seem to have left out of this
reply. That is the only possible way I can think of right now for
monotone and OE to somewhat easily deal with this so that you don't
have to do as much work keeping up to date with patches. Of course, it
puts constraints on both the contributor and the OE developers, but it
would work.

-- 
Justin Patrin


