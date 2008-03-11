Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZ11C-0001FE-BV
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 10:43:40 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JZ0zH-0004FJ-1b
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 09:41:35 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 09:41:35 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 09:41:35 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 11 Mar 2008 10:41:28 +0100
Message-ID: <fr5k49$8o0$1@ger.gmane.org>
References: <200803110807.11368.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <200803110807.11368.zecke@selfish.org>
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
X-List-Received-Date: Tue, 11 Mar 2008 09:43:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:
| Hey,
|
| I'm anything but happy with the way we work with our repository. We
have a
| dreambox branch that is not mergable due issues with our SCM system, the
| OpenMoko guys have to go back to diffing and applying the diff and
merging by
| hand, we just commit fundamental changes like sysroot,
packaged-staging, RFCs
| in one go and then do weeks of fixing. And I can continue with this list.
|
| What: I think we should use more branches
| 	- As many shortlived and medium lived branches as developers want
| 	- Shared branches for stuff like packaged staging, RFCs, sysroot.
Were you
| 	  start the development, add features, other people will compile
their stuff,
| 	  other compile and then you rebase and merge!
| 	- Basicly you develop a feature in a branch until it is ready and not
| 	  impacting other things, then you rebase/cleanup, propose it for
inclusion
| 	  and wait for feedback, then merge.
| 	- Stable distributions and vendors get their own branch, they can merge,
| 	  cherry-pick what ever they want.
|
|
| The issue:
| 	- mtn can not merge. Forcing me to manually delete files in one copy
to do a
| 	  merge is not acceptable.
| 	- mtn has not the concept of short-lived branches (e.g. deleting their
| 	  existence once done), mtn suspend does not work as witnessed by our
| 	  automerger.
| 	- mtn pluck is not making me happy
| 	- I lack a GUI to easily browse the repository
| 	- I can not clean up changes before I push them!
|
|
| I want that we use more branches for development, apply review on them,
| land/merge/push these branches after review, pull peoples changes from
other
| hosts, work on perfetch patch series before landing patches. I believe we
| need to deploy this kind of development in OE again and as mtn is the
| obstacle to this kind of development I propose to switch to another SCM
| system that allows us to develop OpenEmbedded the way it should be
developed.
|
| My criteria:
| 	- Should have branches, easy merging, easy merging of merges
| 	- Branches and merging should be cheap
| 	- Make it easy to put the OE tree into another SCM and still be able
| 	  to merge (git-svn and such)
| 	- A good graphical tool to browse the repository
| 	- A good and maintained web frontend
| 	- A good set of builtin tools (e.g. like git-add -i and git-rebase -i)
|
| I think the two options are hg and git, I tend to favor git due the
size of
| its community. I want to switch OE to one of these systems by the end
of this
| month and start using more branches and creating perfect patch series
again.

If we switch, my vote would be for hg.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH1lPIMkyGM64RGpERAutoAJ44F/prApfsKU+QcHzCV5fuGunv/wCgmeg5
HVUPl5aPPXoA62PzychJLJA=
=jz3J
-----END PGP SIGNATURE-----



