Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1NUOa3-0006vt-HJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 19:01:35 +0100
Received: by pwi18 with SMTP id 18so1528018pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 09:59:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.143.20.7 with SMTP id x7mr3927973wfi.53.1263232762034; Mon, 11 
	Jan 2010 09:59:22 -0800 (PST)
Date: Mon, 11 Jan 2010 09:59:22 -0800
Message-ID: <18e217241001110959k4d346f05j7e00c36dfd18021d@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: msundius@sundius.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: dependencies between packages
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
X-List-Received-Date: Mon, 11 Jan 2010 18:01:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

Some of our developers have been running into this problem and I'm wondering
how others deal with it.

It seems if we have a recipe, (A) that depends upon header files staged by
another recipe (B) then:

1) if the source for recipe (B) is modified and recompiled with:

    bitbake -f -c compile B
    bitbake B,

I would expect that when recipe A is run:

   bitbake A

It too would be recompiled, however that does not seem to be the case. In
fact even if recipe B is cleaned up:

    bitbake -c clean B

and then we run recipe A

    bitbake A

only recipe B is run and recipe A is NOT rerun! the dependency is satisfied
by rerunning recipe B and then bitbake stops..

is this expected behaviour? Is there away to force rerunning of recipes that
would be "out of date" due to one of its dependent recipes being return and
re-staging (potentially) new headers and libraries?

Any help of suggestions would be greatly appreciated.

Mike

