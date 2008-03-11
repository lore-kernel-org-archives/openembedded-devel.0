Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZ3ml-0003d5-R6
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 13:41:01 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JZ3kp-00058c-5i
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 12:38:51 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 12:38:51 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 12:38:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 11 Mar 2008 13:38:45 +0100
Message-ID: <fr5ugl$dc2$1@ger.gmane.org>
References: <200803110807.11368.zecke@selfish.org>	<200803111156.55481.zecke@selfish.org>
	<fr5puv$tsr$1@ger.gmane.org> <200803111325.56068.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <200803111325.56068.zecke@selfish.org>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Mar 2008 12:41:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:
| On Tuesday 11 March 2008 12:21:03 Koen Kooi wrote:
|> Holger Freyther schreef:
|> | On Tuesday 11 March 2008 11:38:07 Koen Kooi wrote:
|> |> Graeme Gregory schreef:
|> |>
|> |>
|> |> * track .dev: mtn propagate org.openembedded.dev
|> |> org.openmoko.needmorebru
|> |
|> | Non content conflict. ugh! What to do now?
|>
|> Since the delta between the two branches is not more than a few
|> days/revisions it's easy to find out what happened and move conflict out
|> of the way in your branch, finish the merge and if needed reapply a diff
|> needed.
|
| You can not make this assumption of few days/revs and even in a few
days/revs
| one can create many non content conflicts.
| Move the conflict out means:
| 	-Finding the file with mtn au
| 	-Moving it on one side of the branch
| 	-Comitting it
| 	-Merge again and then are done or back to the first item for each non
content
| conflict. This adds artificial history, is complicated and stupid and
all my
| monkeys are busy doing stuff so I would have to do this...
|
| I want something were this is easy to do. With git I know it is
possible (if
| you know to use git-mergetool....). With mtn it is not hard, it is
| impossible, so I can not use branches with mtn nor encourage anyone to
do so.
| Specially with my webkit development in a git you start to love cheap,
short
| lived feature branches.
|
|
|> The non-content conflict handling is absolutely atrocious in monotone,
|> and the monotone devs aren't doing anything to make it easier (they
|> changed the error message to offer some more test) because they never
|> have such conflicts. Which stinks, because we *do* have them.
|
|
| Small excercise: try to merge .dev with .dreambox with mtn and git,
see which
| one is barfing out with non obvious error messages (hint: in this case
it is
| mtn)

Actually, it's git, since you can't store empty directories, and we have
those in OE :)

I see your point and I think we should switch scm, but I also want you
to be aware of the 'cvs idiots' we have in our developer group, that
will break stuff with any DSCM we choose.

And I still for for hg, which every developer has installed already,
since we all tested it in the previous round of SCM discussion, haven't we?

regards,

Koen


|
|
|> But what I'm trying to get at, and doesn't seem to be getting through,
|> is that our problems are being caused by people not knowing (and not
|> wanting to know!) the limitations (quirks/bugs/etc) of the tools they
|> are using. With monotone we are relatively safe, since short of using
|> the sqlite3 tool we can't loose data or history when there is a cock-up.
|> I fear that with other tools that weren't written with data retention in
|> mind (git) we will lose a big chunk of history every now and then
|> because someone typed git-quxl instead of git-qux1.
|
| With QtWebKit we had a machine with bad memory, on checkouts certain
errors
| started to happen. Know what? They were catched on checkout, we had the
| objects distributed anyway, so the checksums (even if not for crypto) are
| pretty good.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH1n1VMkyGM64RGpERAuH4AKCuWvMNTroBxYhK4rNc0/nkY89pmACeOwz1
fTx9mkqgBzQk5kIMvv8Hg1M=
=0xvv
-----END PGP SIGNATURE-----



