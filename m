Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JZ3aG-0003AL-HO
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 13:28:02 +0100
Received: from firewall.tw.openmoko.org ([124.219.5.210] helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JZ3YM-0000BU-Rs
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 13:25:59 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Mar 2008 13:25:55 +0100
User-Agent: KMail/1.9.9
References: <200803110807.11368.zecke@selfish.org>
	<200803111156.55481.zecke@selfish.org> <fr5puv$tsr$1@ger.gmane.org>
In-Reply-To: <fr5puv$tsr$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200803111325.56068.zecke@selfish.org>
X-SA-Exim-Connect-IP: 81.169.183.159
X-SA-Exim-Mail-From: zecke@selfish.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
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
X-List-Received-Date: Tue, 11 Mar 2008 12:28:03 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 11 March 2008 12:21:03 Koen Kooi wrote:
> Holger Freyther schreef:
> | On Tuesday 11 March 2008 11:38:07 Koen Kooi wrote:
> |> Graeme Gregory schreef:
> |>
> |>
> |> * track .dev: mtn propagate org.openembedded.dev
> |> org.openmoko.needmorebru
> |
> | Non content conflict. ugh! What to do now?
>
> Since the delta between the two branches is not more than a few
> days/revisions it's easy to find out what happened and move conflict out
> of the way in your branch, finish the merge and if needed reapply a diff
> needed.

You can not make this assumption of few days/revs and even in a few days/revs 
one can create many non content conflicts.
Move the conflict out means:
	-Finding the file with mtn au
	-Moving it on one side of the branch
	-Comitting it
	-Merge again and then are done or back to the first item for each non content 
conflict. This adds artificial history, is complicated and stupid and all my 
monkeys are busy doing stuff so I would have to do this...

I want something were this is easy to do. With git I know it is possible (if 
you know to use git-mergetool....). With mtn it is not hard, it is 
impossible, so I can not use branches with mtn nor encourage anyone to do so. 
Specially with my webkit development in a git you start to love cheap, short 
lived feature branches.


> The non-content conflict handling is absolutely atrocious in monotone,
> and the monotone devs aren't doing anything to make it easier (they
> changed the error message to offer some more test) because they never
> have such conflicts. Which stinks, because we *do* have them.


Small excercise: try to merge .dev with .dreambox with mtn and git, see which 
one is barfing out with non obvious error messages (hint: in this case it is 
mtn)


> But what I'm trying to get at, and doesn't seem to be getting through,
> is that our problems are being caused by people not knowing (and not
> wanting to know!) the limitations (quirks/bugs/etc) of the tools they
> are using. With monotone we are relatively safe, since short of using
> the sqlite3 tool we can't loose data or history when there is a cock-up.
> I fear that with other tools that weren't written with data retention in
> mind (git) we will lose a big chunk of history every now and then
> because someone typed git-quxl instead of git-qux1.

With QtWebKit we had a machine with bad memory, on checkouts certain errors 
started to happen. Know what? They were catched on checkout, we had the 
objects distributed anyway, so the checksums (even if not for crypto) are 
pretty good.


