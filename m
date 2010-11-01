Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1PD0Cf-0007zs-3l
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 20:38:01 +0100
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LB8006A2154GKG1@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	01 Nov 2010 14:36:46 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 74F0914AF6A; Mon,
	01 Nov 2010 15:36:40 -0400 (EDT)
Date: Mon, 01 Nov 2010 15:36:40 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101101193640.GE11514@denix.org>
References: <1288342969.18134.5.camel@mattotaupa>
	<iajftl$ek9$1@dough.gmane.org>
MIME-version: 1.0
In-reply-to: <iajftl$ek9$1@dough.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OEDEM 2010: [RFC] useful commit message
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
X-List-Received-Date: Mon, 01 Nov 2010 19:38:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Oct 31, 2010 at 11:20:36AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 29-10-10 11:02, Paul Menzel wrote:
> > Dear OE folks,
> > 
> > 
> > could you please discuss the following proposal.
> > 
> > I would very much like more elaborate commit messages. This is in my
> > opinion already demanded by the commit policy [1], but often patch
> > submitters, especially those not sending changes to review to the list,
> > since they have direct access to the repository, fail to adhere to the
> > policy.
> > 
> > The reason is, quite often I do not understand why a change was
> > necessary. It would very much help me, if at least the error message was
> > pasted to be able to compare with one???s own error messages and what
> > distribution and machine was used to test the recipe.
> 
> We discussed this at OEDEM and AIUI the TSC will make a recommendation
> about it later, but in the meantime you can expand existing commit
> messages with git notes:

While git-notes is relatively new (1.6.6+), it's a very useful feature. Some 
more details here:

http://progit.org/2010/08/25/notes.html

-- 
Denys

> 
> - -----------------
> GIT-NOTES(1)
> 
> NAME
>        git-notes - Add/inspect commit notes
> 
> SYNOPSIS
>        git notes (edit [-F <file> | -m <msg>] | show) [commit]
> 
> DESCRIPTION
>        This command allows you to add notes to commit messages, without
> changing the commit. To discern these notes from the message stored in
> the commit object, the notes
>        are indented like the message, after an unindented line saying
> "Notes:".
> 
>        To disable commit notes, you have to set the config variable
> core.notesRef to the empty string. Alternatively, you can set it to a
> different ref, something like
>        "refs/notes/bugzilla". This setting can be overridden by the
> environment variable "GIT_NOTES_REF".
> 
> SUBCOMMANDS
>        edit
>            Edit the notes for a given commit (defaults to HEAD).
> 
>        show
>            Show the notes for a given commit (defaults to HEAD).
> 
> OPTIONS
>        -m <msg>
>            Use the given note message (instead of prompting). If
> multiple -m (or -F) options are given, their values are concatenated as
> separate paragraphs.
> 
>        -F <file>
>            Take the note message from the given file. Use - to read the
> note message from the standard input. If multiple -F (or -m) options are
> given, their values are
>            concatenated as separate paragraphs.
> - -----------------
> 
> It would of course be better to get it right the first time :)
> 
> regards,
> 
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFMzUL0MkyGM64RGpERAlfMAJsGBzO3oZ68BEvCK0QehPsvbnB4hQCgpp4d
> sj+pB/5JTY1O7NJtuyMvsyU=
> =DiG8
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


