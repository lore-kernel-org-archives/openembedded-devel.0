Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1RGzzV-00005P-H3
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Oct 2011 23:17:29 +0200
Received: by ywf9 with SMTP id 9so776913ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2011 14:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Ov2MqX1NdENvR3Iyy07YuKStCiCmy+sjfQHtmH2J+i0=;
	b=FGtw1ubItPWXiD1RYthIJHCPqyzP9Cz0ipIpvDyvrLFGjwp8UrgYxIChqmtCIowEEB
	JrqeBquvRqaUgzUHc2hQS+/hOHiL5sZiUweTVtkaH7h27vD0JUWcC7C/qwScG2y3C53I
	Uix1/r2sQ7Jen7o6m/OQCzTLuNwuqrah6CNqk=
MIME-Version: 1.0
Received: by 10.150.253.15 with SMTP id a15mr11876083ybi.5.1319145093819; Thu,
	20 Oct 2011 14:11:33 -0700 (PDT)
Received: by 10.151.112.10 with HTTP; Thu, 20 Oct 2011 14:11:33 -0700 (PDT)
In-Reply-To: <20111020205523.GT26170@denix.org>
References: <CAFu+nvF2BM344-+5wHCobJshpU=TtuaxD0_WR2CPisNSev0pnQ@mail.gmail.com>
	<20111020205523.GT26170@denix.org>
Date: Thu, 20 Oct 2011 17:11:33 -0400
Message-ID: <CAFu+nvFu_Mz1MoXuFW3YZM8L_6u3F2mwGjwGK8Xm7vKmjLpyRQ@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: DEPLOY_DIR and package_stagefile_shell
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
X-List-Received-Date: Thu, 20 Oct 2011 21:17:29 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 20, 2011 at 4:55 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Wed, Oct 19, 2011 at 05:39:45PM -0400, George C. Huntington, III wrote:
> > It appears that if you override DEPLOY_DIR to make the DEPLOY directory
> > outside of TMPDIR, then recipes that call package_stagefile_shell fail.
> the
> > sed magic in package_stagefile_shell assumes that the path will be in
> > TMPDIR.  Should the package_stagefile_shell be fixed, or should the
> recipes
> > that call it with ${DEPLOY_DIR_IMAGE} be changed.  the u-boot.inc and the
> > linux.inc have this problem.
>
> Well, it's an old issue - I first faced it over 3 years ago[1]. I had it
> "fixed" or worked around, by modifying the sed magic. Then it got broken
> again
> and there wasn't any good fixes available since then. That's the way
> packaged
> staging works, as pstage had to be relative to deploy dir, which both
> reside
> in TMPDIR by default.
>
> At one point I even disabled packaged staging in Arago in order to allow
> re-defining DEPLOY_DIR, but later on it got mandated and I just gave in to
> not
> being able to move DEPLOY_DIR outside of TMPDIR. :)
>
> Either way it's a moot point now with oe-core and shared state...
>
> [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/19300
>
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

That kind of sucks for people who have to use the 2011.03-maintenance branch

