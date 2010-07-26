Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OdWPU-0002Ga-Bi
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 00:44:37 +0200
Received: by qwg8 with SMTP id 8so418938qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 15:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=Ks9idGEmvlyz6KewJTiEpAwaI0QA1T2YnYIcw7sXppo=;
	b=A+WbwoOf8ek752z0bf4wgsdKSUJIcNkYAcrDL+dGSw9mgQsTMllTpMo5L+sE8ZI9GI
	HSkaIIey2iZIso7N0kyeSuSB8uEBxBVBVnUzP+PGim7iIYxsB6zS4vrxe0q0WCOkJvgz
	cBjrmpZpfntklx6iL9aGZB4nkJVNxcYTgXoT4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=fZ+Jb7zyrCH3SJpq/e65uN2HSruQnAPzRD8hGjC5ABMcatUGmsep7eYRf1qx2PwYXh
	cbSOTkrEZo6Iv58tpfpZJ2l3I0bt8xRJL1pPRNriYWF6tFjuEKPA+wioDSZ9SpLbJEr6
	bZVGb1WMfxpDD8bbt3gNyt6PYg1K90jWrfCZc=
Received: by 10.224.74.21 with SMTP id s21mr2053964qaj.192.1280184259105; Mon, 
	26 Jul 2010 15:44:19 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.236.80 with HTTP; Mon, 26 Jul 2010 15:43:59 -0700 (PDT)
In-Reply-To: <AANLkTikScKEs23iguKscKuNckEAhCzfCpnHUbU8SL5m0@mail.gmail.com>
References: <AANLkTikScKEs23iguKscKuNckEAhCzfCpnHUbU8SL5m0@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 26 Jul 2010 15:43:59 -0700
X-Google-Sender-Auth: AOyP9P1_PZQ7D_sdAEaNsVxccFc
Message-ID: <AANLkTimgz4ehVeFn-t7Eq9p4qAak+q6mPvxCr5KxZmAX@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] scalability
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
X-List-Received-Date: Mon, 26 Jul 2010 22:44:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 26, 2010 at 3:32 PM, C Michael Sundius <msundius@sundius.com>wrote:

> On Mon, Jul 26, 2010 at 2:39 PM, Chris Larson <clarson@kergoth.com> wrote:
>
> > The way bitbake works today, it can't build *anything* unless it's parsed
> > *everything*, because anything could have PROVIDES / RPROVIDES what
> you're
> > wanting to build.  If you want to shift things to a server, which I agree
> > would be nice, you'd have to have a daemon running there to make
> available
> > the full dependency information.
> >
> > Well, I suppose I could think of several other ways to do it. but yes, in
> a
> sense some external way of gaining the list of providers before you parse
> the recipe is the idea. for a big portion of the recipes that is simply
> done
> from looking at the name of the recipe, for the rest is grep-ing for
> "PROVIDES" in the file... .inc files makes it more complicated.
>

No.  Naming goes by the PN variable, which *happens* to default to based on
the filename, but isn't required.  There are recipes in the repository today
which override it, iirc.  You can't get the information you want without
parsing all the recipes, as I said before.

It seems to me that parsing the recipes == creating a database that provides
> info to bitbake. are you saying that this database is kept on a server for
> all to use? could parsing a single recipe mean creating a (partial)
> database
> who's contents could be added to another? or do they depend upon a
> context... my point is: could recipes be "pre-compiled" into ity-bity
> databses of sorts and then selected by a client and pulled in by a list
> (contained in your -local- distro conf file). Could these recipes once
> pulled in, be amended by local description?
>

You can already amend recipes with what we have today, in *multiple* ways.
 As I said before, you can't determine what you're going to build without
parsing all the recipes which are available.  What I'd personally like to
see is a tool which parses the world, then *imports* the metadata and
associated files of the recipe you want to build and all of its dependencies
into your local "project", which your bitbake then parses alone for
subsequent executions.  The problem with this, of course, is dealing with
local modifications to those files, and ensuring  there's an update
mechanism.  Maybe if I get bored I'll try throwing something like that
together -- it's quite like the 'newcollection' bbclass which already exists
in OE.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

