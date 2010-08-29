Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Opdcy-0000r6-UV
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 10:52:37 +0200
Received: by iwn2 with SMTP id 2so3862968iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 01:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=gqwyLcuFEisMq+jwJaoq1s89GrnnucvIZ7ioddkPK9I=;
	b=TQ04HYGZ1xiQjdkfVApyFiCVQdCREexp+98zMZqcobZFNV/9C1iAwGOTAD35lU0wuD
	wAo0bwTFdH0Kym5IUl4oNy7n13lf26pfaTbe8aQNL+rT/plUY/WRUT/6+QpxeAoWNmHf
	wT7VvstUFHVlhyTFG95Ehco+XqSn0F8wSTH4U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=TsfU/AdQciOWdekH2/G5QOPpI2B+aaA5G7rfW0BfYCdam81t/1+c5v8UzYix7WPE8/
	yZo7k56k20+RAB/pDRFqi4T75CIgxsmEaXRbkemwMFO7QLX9ty2qNvOWMAlZ/UP77aMg
	zxlyQ+mrG1lUSehi9IQVIkH3IH0aF/QOOUDXM=
MIME-Version: 1.0
Received: by 10.231.149.12 with SMTP id r12mr3487592ibv.185.1283071927662;
	Sun, 29 Aug 2010 01:52:07 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 01:52:07 -0700 (PDT)
In-Reply-To: <AANLkTimqhCWD0Y0Mn0SZ8ZmCdiz4VXCofNWZrub=AzbW@mail.gmail.com>
References: <AANLkTinFXpPdAkd79h94z70m_8MbamLd48pzR4sLQs34@mail.gmail.com>
	<i5b7mm$iso$1@dough.gmane.org>
	<AANLkTimui4vCRmhufXA9MGyjWWstr7C=O9tAErBsa-uv@mail.gmail.com>
	<i5b9ni$qra$1@dough.gmane.org>
	<AANLkTimqhCWD0Y0Mn0SZ8ZmCdiz4VXCofNWZrub=AzbW@mail.gmail.com>
Date: Sun, 29 Aug 2010 10:52:07 +0200
Message-ID: <AANLkTima-RkK3Ak4Cyi=3u2+HU=WGcUvzKjzbTZgGft=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFD] increased dependency checking
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
X-List-Received-Date: Sun, 29 Aug 2010 08:52:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

I will not go into the accusations and incorrectnesses in the posts above.
The only thing I'll say about it on this nice sunday morning is:

Let him who is without sin cast the first stone (Gospel of John
chapter 8 verse 7)

There is another thread on the removal of recipes. Please take your
gripes there and do not hijack all kind of topics by bringing this up.

And back to the original topic:
Actually despite what some people may think I do understand the openssl issue.

The reason I raised it was to actually get to rebuild of the recipes
that are affected by a change within a recipe that would break
requiring packages.
This can be done by a PR bump of all users, but our depends are far
from complete and (apart from grep xyz recipes/*/*) there is not
really a way to find out who uses a recipe.
(and that grep is quite cumbersome if e.g. you want to find out who
depends on popular or short names).

I was unaware of the BB_STAMP_POLICY (and haven't found docs about it
yet). That seems to resolve the openssl issue (at least in a local
build). An alternative could be a flag in a bb file that indicates it
as vulnerable so we could have a different policy behaviour for those
recipes.

I am quite aware that packet management brings additional complications.
If you rebuild the package then at least the new package depends on
the new lib so everyone getting the new version gets the new lib.
And the package installer could just keep the old lib adjacent to the new lib.
That is not so strange. On the system I am typing this I have e.g.
/lib/libreadline.so.5
/lib/libreadline.so.5.2
/lib/libreadline.so.6
/lib/libreadline.so.6.0
That way I feel a migration from one lib to another could go quite smoothly.

An alternative solution could be to not only look at the version but
also at the time a package is created (so if a version shows up with a
newer timestamp it is upgraded). With the above rebuild strategy that
could also work.
(and yes: I know this also has some con's).
Or we could explictly give recipes that produce libraries with a
different SONAME in a differently named recipe (e.g. with the soname
in the PN part and not in PV. (and yes, that most likely has some
package manager impact too).

I have no idea on what the best solution is. That is also why i
started this thread (to deal with the first step in it).
The only thing I am sure of is that the current solution has some
weaknesses (as clearly indicated by the openssl issue), and we should
try to improve that.
One way to achieve that is to have an open and constructive discussion
on it. In such a discussion there will always be bright ideas and
less-than-bright ideas, but at least such a discussion may separate
the wheat from the chaff and lead to improvement.

Have a nice day!
Frans.


