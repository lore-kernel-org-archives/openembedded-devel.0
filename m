Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N8VLn-0001M1-Ft
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 09:48:22 +0100
Received: by ywh7 with SMTP id 7so1835570ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 00:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=SPzSzoISmai2RJtJYd7IO40/m7wn3w/pUJv2GxIg4Rc=;
	b=xcXUbKCTdfntIQcffgQg86OA0sTBJRQWJTe+lAtyMQ5PTFEuImIX5mgx3LW7CIiTlx
	mcAC+shZgKzWgHbkLonekNTJhGw5DvfaSQjipJX2qX+TjvvVbwj4q131RqjRgKGT2wU9
	Dan2nOM9UCZjccfGvMyzvlo3TBNG2wO7p817U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gKmyS0VhcAT9uH/kH2/A7c0hVixQjJURSpb5YDC8dd/Oz1opvo5Q2YtGgU0MuEoRk7
	xbvbm1goshZJdnwtcHgzV8XwWCYgryk2ra56H57f17VAby1eKHlINmSTxeT9QuxxJzGG
	wRexQep7SctRZe5fdY5fU47TkEunSObmU7DVM=
MIME-Version: 1.0
Received: by 10.100.235.1 with SMTP id i1mr2232480anh.97.1258015133375; Thu, 
	12 Nov 2009 00:38:53 -0800 (PST)
In-Reply-To: <1258014540.6879.18.camel@opal>
References: <1258014540.6879.18.camel@opal>
Date: Thu, 12 Nov 2009 09:38:53 +0100
Message-ID: <ac9c93b10911120038l67476671pe223e41233fc9bc6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM: Summary of the 'Splitting the tree' session
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
X-List-Received-Date: Thu, 12 Nov 2009 08:48:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/11/12 Michael 'Mickey' Lauer <mickey@vanille-media.de>:
> Hi guys,
>
> here's the summary of the 'splitting the tree' session:
>
> Nobody seems to disagree with splitting the metadata tree into more
> managable chunks. The expected goals are:
>
> 1. Making it easier to find things,
> 2. Being able to mask whole groups out for improved parsing
> 3. Identifying core code which needs to always work, hence improving the
> observed quality of OE.
>
> Several criteria for splitting were discussed and there was a consensus
> for splitting by functional complex. A tentative list of directories to
> be used is:
>
> base (10% underlying recipes)
> toolchain
> x11
> framebuffer
> gtk (includes gnome apps)
> qte (includes opie and kde)
> efl
>
> The attendendees were well aware of all the inherent problems with
> taxonomy and its different meaning to anybody in the first place as well
> as that some recipes will always be difficult to categorize since they
> are very flexible to configure. This did not prevent the consensus that
> splitting up will be necessary to improve quality.
>
> It was noted that oestats should be enhanced to be able to report a
> subset of stats to start developing a test matrix of things which should
> always work.
>
> More discussion shall be carried on on this list and after the TSC has
> been elected, it will make a final decision.
>
> Cheers,
>

I think a split is a good idea, but I am not too keen on the name "base"
This suggests that it is kinda basic/core functionality. For a lot of
recipes this is not true. E.g. I am currently working on xmltv, not
really base functionality

As the split proposal is more along the graphics axe, I suggest that
instead of "base" we use something like "cmdline" or so (trying to
avoid the word "terminal" here).
Btw before someone proposes this: I'm also not too keen on a directory
"other" as it will become a junkyard of things.

Frans


