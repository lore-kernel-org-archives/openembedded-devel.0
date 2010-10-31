Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PCV2e-0002Tp-Jb for openembedded-devel@lists.openembedded.org;
	Sun, 31 Oct 2010 11:22:36 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PCV1s-0007mf-Hq for openembedded-devel@lists.openembedded.org;
	Sun, 31 Oct 2010 11:20:48 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Oct 2010 11:20:48 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Oct 2010 11:20:48 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 31 Oct 2010 11:20:36 +0100
Message-ID: <iajftl$ek9$1@dough.gmane.org>
References: <1288342969.18134.5.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <1288342969.18134.5.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
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
X-List-Received-Date: Sun, 31 Oct 2010 10:23:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-10-10 11:02, Paul Menzel wrote:
> Dear OE folks,
> 
> 
> could you please discuss the following proposal.
> 
> I would very much like more elaborate commit messages. This is in my
> opinion already demanded by the commit policy [1], but often patch
> submitters, especially those not sending changes to review to the list,
> since they have direct access to the repository, fail to adhere to the
> policy.
> 
> The reason is, quite often I do not understand why a change was
> necessary. It would very much help me, if at least the error message was
> pasted to be able to compare with one’s own error messages and what
> distribution and machine was used to test the recipe.

We discussed this at OEDEM and AIUI the TSC will make a recommendation
about it later, but in the meantime you can expand existing commit
messages with git notes:

- -----------------
GIT-NOTES(1)

NAME
       git-notes - Add/inspect commit notes

SYNOPSIS
       git notes (edit [-F <file> | -m <msg>] | show) [commit]

DESCRIPTION
       This command allows you to add notes to commit messages, without
changing the commit. To discern these notes from the message stored in
the commit object, the notes
       are indented like the message, after an unindented line saying
"Notes:".

       To disable commit notes, you have to set the config variable
core.notesRef to the empty string. Alternatively, you can set it to a
different ref, something like
       "refs/notes/bugzilla". This setting can be overridden by the
environment variable "GIT_NOTES_REF".

SUBCOMMANDS
       edit
           Edit the notes for a given commit (defaults to HEAD).

       show
           Show the notes for a given commit (defaults to HEAD).

OPTIONS
       -m <msg>
           Use the given note message (instead of prompting). If
multiple -m (or -F) options are given, their values are concatenated as
separate paragraphs.

       -F <file>
           Take the note message from the given file. Use - to read the
note message from the standard input. If multiple -F (or -m) options are
given, their values are
           concatenated as separate paragraphs.
- -----------------

It would of course be better to get it right the first time :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMzUL0MkyGM64RGpERAlfMAJsGBzO3oZ68BEvCK0QehPsvbnB4hQCgpp4d
sj+pB/5JTY1O7NJtuyMvsyU=
=DiG8
-----END PGP SIGNATURE-----



