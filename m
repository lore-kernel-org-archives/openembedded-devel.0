Received: from mail-px0-f178.google.com ([209.85.216.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NmEF0-0007Jz-TB
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 23:37:31 +0100
Received: by pxi8 with SMTP id 8so795806pxi.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 14:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=rBy3S6Z8WJfB0lZWSDYeByI8WaMv9dPDTUXEiFtgJv4=;
	b=YhnJlHUQ09ov4ur9ery0BqD1kBuYil8uJyoY+JM83fjU6fXswIWmSUwxedY2EPr2pq
	4yaUiTk47GhOqzBIvX+MfVrWmXQs+vx2OEvLTce32hX9sl0wotzo0dvc8blFyKY4JdOb
	B+ZxAzxfWZNTfozu6QRdFJCi+NIU5lW0daq/Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=XrbUOdfx6UnXckqQVqINfoK5e8v6qw8j4fN9rXJCjCUChIxiTiXCBRsQ0SrFt4S/5s
	rtdRX7kY6qDOrz3oqwgMzE8oqlrUrQZJhdIergIvGG7f4jt0JirvDIiCAxEJjzfP3aCt
	w/SUKwHZkoBHPT5Bcssl2UfJECkSwhLsfDx2Q=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.196.20 with SMTP id t20mr2972760wff.88.1267482879908; Mon, 
	01 Mar 2010 14:34:39 -0800 (PST)
In-Reply-To: <20100301223055.GF15391@denix.org>
References: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com> 
	<1267392928.13054.1.camel@andromeda>
	<19c1b8a91003011411p420a449dw3c03d03c6f5cec9a@mail.gmail.com> 
	<20100301223055.GF15391@denix.org>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 1 Mar 2010 15:34:19 -0700
X-Google-Sender-Auth: d6d08740b07ed045
Message-ID: <b6ebd0a51003011434j12eeb427u9dd959f23795b642@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.178
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC} glib-2.0 cleanup
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
X-List-Received-Date: Mon, 01 Mar 2010 22:37:32 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 1, 2010 at 3:30 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Mon, Mar 01, 2010 at 02:11:54PM -0800, Khem Raj wrote:
> > On Sun, Feb 28, 2010 at 1:35 PM, Michael 'Mickey' Lauer
> > <mickey@vanille-media.de> wrote:
> > > Am Sonntag, den 28.02.2010, 20:39 +0100 schrieb Frans Meulenbroeks:
> > >> We have 26 glib-2.0 recipes (and 8 native ones). (see ls below)
> > >> Only a few versions are used (see also the grep below)
> > >>
> > >> for glib-2.0:
> > >> "2.12.12"
> > >> "2.16.4"
> > >> "2.18.3"
> > >> "2.20.3"
> > >> "2.22.1"
> > >> "2.22.4"
> > >> "2.6.4"
> > >> "2.8.6"
> > >>
> > >> for glib-2.0-native:
> > >> "2.16.1"
> > >> "2.18.0"
> > >> "2.22.1"
> > >> "2.22.4"
> > >>
> > >> Both include the last two versions
> > >> Proposal is to remove all versions that are not used.
> > >>
> > >> How do people feel about this?
> > >
> > > Sounds good to me, althoug I'd recommend not removing them but just
> > > moving them out of sight, i.e. in an 'old' folder. That way we could
> > > please both the lets-keep-everything-no-matter-how-rotten and also the
> > > lets-strive-for-few-high-quality recipes.
> > >
> >
> > FWIW I like the idea of having 'obsolete' recipes so moving them to
> > recipes/obsolete may not be so bad.
>
> +1 on this one, since we already have recipes/obsolete in BBMASK by default
> and it will reduce parse time for obsoleted recipes. And git-mv does a nice
> enough job of preserving commit history...


To clarify, git-mv is no different than a git rm + git add.  It's the
analysis tools like git diff-tree/log that know how to identify a copy/move
in a commit.  :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

