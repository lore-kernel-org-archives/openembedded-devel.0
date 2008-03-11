Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZ1u5-0007Ui-JG
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 11:40:23 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JZ1sC-0007JO-87
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 10:38:20 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 10:38:20 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 10:38:20 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 11 Mar 2008 11:38:07 +0100
Message-ID: <fr5neg$l26$1@ger.gmane.org>
References: <200803110807.11368.zecke@selfish.org>
	<47D64717.3050804@gmail.com>	<20080311113256.461ad5d1@widy.localdomain>	<200803111045.12166.zecke@selfish.org>	<20080311120056.748ec358@widy.localdomain>
	<20080311101433.77a09fd2@cimmeria>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <20080311101433.77a09fd2@cimmeria>
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
X-List-Received-Date: Tue, 11 Mar 2008 10:40:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Graeme Gregory schreef:
|> Nice, your argumentation is pretty convincing. I just guess that we're
|> going to have lots of "I'd love to see branches in OE" votes in this
|> thread, and I'd just love to see them treated separately from "I need
|> branches", "I'm ok with using branches for my changes", "Branches are
|> going to complicate my work, but I might try", and "I hate branches -
|> I already barely have time to do real work" votes.
|>
|
| I need branches.

Heh, I feel an "told you so" moment coming. The 'frozen revision'
approach could have more easily been a branch with no changes (except
for the branchpoint) that you or John only update (mtn propagate
org.openembedde.dev org.openmoko.lag) when you think .dev is buildable.
And it would also have been a natural place to stash things like your
qtopia stuff.

| I need to be able to have an openmoko branch which follows .dev closely
| but has some stuff that hasnt reached QA level required to allow in
| .dev yet.
|
| I probably need the openmoko branch to be only served by the openmoko
| servers.
|
| What I don't know is how this works with monotone, and I haven't had
| time to sit down with the manual and trial it.

The q&d way:

* create a local diff by editing or adding a file
* commit -b org.openmoko.needmorebru
* checkout the branch into a new dir: mtn co -b org.openmoko.needmorebru
* go wild in that branch
* track .dev: mtn propagate org.openembedded.dev org.openmoko.needmorebru

and once the stuff reached a good QA point:

mtn propagate org.openmoko.needmorebru org.openembedded.dev

That what stelios and I did with the avr32 branch and it works great.
The thing that stops the branch from being unmergable is the regular
propagate from .dev to org.openmoko.needmorebru.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH1mEPMkyGM64RGpERAkaDAJ0ZptVecmhKw+yLg3/j7I7I9YVo4ACfSpkB
aCJd/THz7BPIHwcH/5Ns2SI=
=m7A8
-----END PGP SIGNATURE-----



