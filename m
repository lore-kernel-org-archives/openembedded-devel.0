Received: from qw-out-1920.google.com ([74.125.92.146])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NzB6C-00076x-JV
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Apr 2010 17:54:03 +0200
Received: by qw-out-1920.google.com with SMTP id 4so2697qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Apr 2010 08:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:received:message-id
	:subject:to:content-type;
	bh=lpAb3QRV5BcF1cRBLv9zQNW2tgx0edfaxoWJZLfkuy8=;
	b=pBBGi+W/Fw60B+nkcP+WoDk5ffs5CmATRCRVOqiNzMoP3cqPwhy9eTl1s11WRuHrOa
	QcZXg5rMrCccsbumAbtzQGAmqVXLYui1cz2lJtSTgSD1KA5lPJoL2DTrpBd470vbw1dP
	koMF2sXUDwu0tlbUutp1UWOU7nEy+BbxboSiI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=GILloulAXMDXRZmxPxUI2XSYSY5CxUHk1syZhGxyOw7jQt+I1nY45cvFojk7ATdEA6
	5t+TxLqfhCKUqNDrRvbQTvYAWUbEZTqYSP/tdBznIciMhYdAPJGyS23wOh0FLKNU5UZY
	Tfol2fqvyIKmNIUH6TyUqBk00Ce7PI3L8AUpE=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.232.131 with HTTP; Tue, 6 Apr 2010 08:26:54 -0700 (PDT)
In-Reply-To: <4BBB3C39.5070002@mwester.net>
References: <4BBB3C39.5070002@mwester.net>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 6 Apr 2010 08:26:54 -0700
X-Google-Sender-Auth: 506dfc11b6bd043d
Received: by 10.229.99.77 with SMTP id t13mr11976390qcn.80.1270567634565; Tue, 
	06 Apr 2010 08:27:14 -0700 (PDT)
Message-ID: <q2mb6ebd0a51004060826wb048ffa2ge1fbcfb1892a9bac@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.146
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: SRCREV defined too late -how to fix?
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
X-List-Received-Date: Tue, 06 Apr 2010 15:54:05 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 6, 2010 at 6:50 AM, Mike Westerhof <mike@mwester.net> wrote:

> After a recent commit that rearranged where (and how) SRCREVs are defined,
> building results in:
>
> NOTE: preferred version 2.6.27.8+svnr1 of linux-ixp4xx not available (for
> item kernel)
> NOTE: preferred version 2.6.27.8+svnr1 of linux-ixp4xx not available (for
> item kernel-module-ext2)
> NOTE: preferred version 2.6.27.8+svnr1 of linux-ixp4xx not available (for
> item kernel-module-jbd)
> (etc.)
>
> Note the bogus "svnr1" on the end -- I think this has happened because
> someone changed OE to define SRCREVs in each package.  So now, deep in
> recipes/linux/linux-ixp4xx.inc, we find:
>
> SRCREV = "1089"
>
> I think that's wrong.
>
> It *does* (sort of) work -- it actually results in that SRCREV (1089) being
> built, despite the messages (above) telling you that it can't find the
> PREFERRED_VERSION with SRCREV == 1.
>
> But what that line does is not really what we (the ixp4xx kernel
> maintainers) had in mind.
>
> The idea is that the SRCREV, along with the kernel version, would be
> defined as a preferred version, like this line which is in
> machine/include/ixp4xx.inc:
>
> PREFERRED_VERSION_linux-ixp4xx ?= "2.6.24.7+svnr${SRCREV}"
>
> Of course, SlugOS overrides that because that distro prefers a more recent
> kerrnel:
>
> PREFERRED_VERSION_linux-ixp4xx = "2.6.27.8+svnr${SRCREV}"
>
> That's not really a "recent" kernel, of course -- my local.conf file has a
> more recent one that I've not yet committed.  The point is that the way it
> *USED* to work, one could use the normal means to set both PREFERRED_VERSION
> and SRCREV.  With the recent commit, we can't do that anymore.
>
> Apparently SRCREV isn't defined soon enough with this new structure, so we
> get the messages about svnr1 not being available.  And, of course, one
> cannot override the preferred version anymore due to the use of "=" instead
> of "=?" for the assignment.  (At the very least, when all the SRCREVs were
> moved into the recipes, shouldn't the weak assignments have been preserved?)
>
> At any rate, I wish to remove the bogus messages about svnr1, and I want to
> restore the behavior that would allow me to provide the SRCREV in my
> local.conf.  What is the correct way to do this with the new "world order"
> as it relates to SRCREVs?   To what config file do I move that
> SRCREV="1089"?  Who would I anger if I just put it back to the way it was?


From what RP was saying on IRC the other day, you can utilize "%" in version
preferences for versions that include srcrev, as a marker.  2.6.27.8+svnr%.
 I haven't looked at that code, though, so I may be completely out in left
field here :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

