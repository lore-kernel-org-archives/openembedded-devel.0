Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1NUP33-00051C-Po
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 19:31:32 +0100
Received: by pxi13 with SMTP id 13so12338099pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 10:29:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.143.20.7 with SMTP id x7mr3950437wfi.53.1263234560112; Mon, 11 
	Jan 2010 10:29:20 -0800 (PST)
In-Reply-To: <ac9c93b11001111014o4711d391kbdc1663f8f3beb59@mail.gmail.com>
References: <18e217241001110959k4d346f05j7e00c36dfd18021d@mail.gmail.com>
	<ac9c93b11001111014o4711d391kbdc1663f8f3beb59@mail.gmail.com>
Date: Mon, 11 Jan 2010 10:29:20 -0800
Message-ID: <18e217241001111029u49679367w92a08fdb961c2623@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: msundius@sundius.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: dependencies between packages
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
X-List-Received-Date: Mon, 11 Jan 2010 18:31:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

>

> . In
> > fact even if recipe B is cleaned up:
> >
> >    bitbake -c clean B
> >
> > and then we run recipe A
> >
> >    bitbake A
> >
> > only recipe B is run and recipe A is NOT rerun! the dependency is
> satisfied
> > by rerunning recipe B and then bitbake stops..
> >
> > is this expected behaviour? Is there away to force rerunning of recipes
> that
> > would be "out of date" due to one of its dependent recipes being return
> and
> > re-staging (potentially) new headers and libraries?
> >
> > Any help of suggestions would be greatly appreciated.
> >
> > Mike
>
> If you change a recipe you should bump PR. in the recipe of B. That
> will cause that bitbake A will resuilt in a rebuild.
>
> Hmmm. nope... I bumped PR of B, then rebuilt A

vi B.bb    # change PR from r1 to r2
bitbake A

only caused B to be rebuilt. even though B may have staged completely
different headers or libraries.

