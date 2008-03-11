Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JZ5Hf-0002bF-S1
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 15:17:10 +0100
Received: from firewall.tw.openmoko.org ([124.219.5.210] helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JZ5Fl-0002Zf-Lo
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 15:14:54 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Mar 2008 15:14:49 +0100
User-Agent: KMail/1.9.9
References: <200803110807.11368.zecke@selfish.org>
	<20080311120056.748ec358@widy.localdomain>
	<20080311101433.77a09fd2@cimmeria>
In-Reply-To: <20080311101433.77a09fd2@cimmeria>
MIME-Version: 1.0
Message-Id: <200803111514.49573.zecke@selfish.org>
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
X-List-Received-Date: Tue, 11 Mar 2008 14:17:25 -0000
X-List-Received-Date: Tue, 11 Mar 2008 14:17:25 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 11 March 2008 11:14:33 Graeme Gregory wrote:
> > Nice, your argumentation is pretty convincing. I just guess that we're
> > going to have lots of "I'd love to see branches in OE" votes in this
> > thread, and I'd just love to see them treated separately from "I need
> > branches", "I'm ok with using branches for my changes", "Branches are
> > going to complicate my work, but I might try", and "I hate branches -
> > I already barely have time to do real work" votes.
>
> I need branches.

The way I would do it with git:


- Upstream has a git repository
	- master is what org.openembedded.dev is currently

- Openmoko has a git repository
	- (moko-)master for Openmoko


OpenEmbedded =>  Openmoko
	a) cherry-pick (git-fetch openembedded && git-cherry-pick rev)
	b) merge/pull (git-merge openembedded)

none-automergable conflicts are resolvable with git-mergetool and then use 
kdiff3, meld, whatever and you can ignore that git is playing with the files, 
none of these changes automatically end in your index.


Openmoko => OpenEmbedded
	# Create a short lived submit branch
	git-checkout -b submit-branch origin/master

	# Rebase your changes to sit on top of OpenEmbedded
	git-rebase openembedded/master

	# Now throw away non ready recipes or edit some hunks
	git-rebase -i openembedded/master

	# Check what changed from this branch to the master of openembedded
	git-rev-list openmebedded/master..

	# Or use gitk to browse your changes
	gitk

	# Publish your branch
	git-push origin submit-branch

	# Ask people to review and do changes/rebase

	# Push your branch to OpenEmbedded
	git-push openembedded submit-branch:master

	# Delete your submit-branch (you are done)
	git-push origin :submit-branch

	# Delete your branch locally
	git-checkout master
	git-branch -D submit-branch

	# Merge the upstream into your dev tree. With mtn you would get non content 
	# conflicts here, with git you might need to fire up git-mergetool while 
	# doing the merge but both kdiff3 and meld are clever enough to automatically
	# merge these files.
	git-pull openembedded

Such a work flow helps to make bugfixes immediately available, allows long 
lived branches and is working. And I know this can not be done with mtn, and 
I have no hope this will work within the next two or three month and I know 
git can do the job and that corporate users of OE want that and I want it as 
well (my main motivation).

z.

PS: git-add -i and git-rebase -i really won me over


