Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GMYWG-0001XO-Jw
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Sep 2006 01:15:21 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id F2AC34E4C5;
	Mon, 11 Sep 2006 09:12:02 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10250-09; Mon, 11 Sep 2006 09:11:59 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 32FDF253DF;
	Mon, 11 Sep 2006 09:11:59 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 2AF75E67448; Mon, 11 Sep 2006 09:11:59 +1000 (EST)
Date: Mon, 11 Sep 2006 09:11:59 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Paul Sokolovsky <pmiscml@gmail.com>
Message-ID: <20060910231158.GA9915@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	Paul Sokolovsky <pmiscml@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <E1GGZOX-0002WU-1s@linuxtogo.org>
	<20060827233927.GA9807@twibble.org>
	<200608281147.01329.openembedded@hrw.one.pl>
	<20060829011415.GA31668@twibble.org>
	<20060829011808.GB31668@twibble.org>
	<45028D5D.4020906@dominion.kabel.utwente.nl>
	<597749586.20060909152031@gmail.com>
Mime-Version: 1.0
In-Reply-To: <597749586.20060909152031@gmail.com>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Section list
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Sep 2006 23:15:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 09, 2006 at 03:20:31PM +0300, Paul Sokolovsky wrote:
[...]
> it's better to let it stay for some time as RFC before adding to
> the documentation? Organizing a good taxonomy is not an easy task,
> would need some testing on existing package base, and even after that,
> it's probably good idea to be prepared to refactors of it.

I've changed in the documentation just now to note that it's a
recomendation only and that new additions/changes should be be
discussed cia OE mailing list.

The list was actually done by myself when trying to decide what
sections to put stuff in. I generated the list from the existing OE
packages and then noticed various things such as the use of "net" and
"networking" and the like. So the list is really just what was there
with some of these things removed, plus a few other changes from
other peoples comments.

So I think it's useful to have a documented list... the document can
always be changed!

[...]
>   Last week, I myself went thru few recipes to add/tweak SECTIONs for
> them, and there already were few questions.

Only two ;) I went round and round on dozens of them before sending
out my original list!

>   One good example, is that ignorant user part of me is a bit
> concerned with x11 section being so broard, with an SDL game, ye olde
> MOTIF app and contemporary GNOME/GTK+ app would go into it. That
> loses a bit deal of descreptivism. I know, that such taxonomy is
> (wonder if there will be chance to say "was") pretty common, and I'm
> afraid I don't have elegant proposal for split up. But my ignorant
> user part, not concerned with formal correctness, but rather
> with pragmatic convenience, says, that there might be possible to have
> a "gnome" section (warning: do not mix with GNOME/Gnome ;-) ) for apps
> written using contemporary GUI toolkit, like (and mostly) GTK+.
> 
>   So, is there any rational idea in that or should my ignorant user
> part just shut up?

That's definitely a question I had as well. Do you care if an
application is a gnome app, or a kde app or a motif app? Or do you
just want an "X app" that does what you want? I checked a few distros
and then didn't appear to distinguish between gnome/kde/motif etc. On
the other hand maybe we do care in OE since installing a gnome app
may pull in a huge number of gnome libraries?

[...]
>   Either way, as mood permits, I'm going to continue monkey's job of
> applying SECTIONs, based on the list proposed. Just in case, I in
> advance apoligize if my selections won't be every time 100% perfect -
> as I told, we just should accept this as an iterative process. The
> initial aim would be to offload default "base" section off stuff which
> easily can be put elsewhere.

That sound fine. I don't think you can make things worse by fixing up
the current section lists ;) And if you think other things you want
changed in the list please do send an email - preferably with a
propsed change (since finding a good solution is usually the most
difficult part!)

Thanks.

-- 
 Jamie Lenehan <lenehan@twibble.org>


