Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Jeqz7-0001fN-Vv
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 13:13:33 +0100
Received: from [212.23.103.62] (helo=[10.129.250.21])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1Jeqz3-0007sW-BP
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 13:13:33 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Mar 2008 03:26:14 +0100
User-Agent: KMail/1.9.9
References: <47EAEB1D.9060004@xora.org.uk>
	<200803270150.46085.mickey@vanille-media.de>
In-Reply-To: <200803270150.46085.mickey@vanille-media.de>
MIME-Version: 1.0
Message-Id: <200803270326.15080.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 212.23.103.62
Subject: Re: SCM scorecards
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
X-List-Received-Date: Thu, 27 Mar 2008 12:13:34 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 27 March 2008 01:50:46 Michael 'Mickey' Lauer wrote:
> Let me add up on that and slightly change:
> > Ease of Branch Merging Git 4 Monotone 3
>
> Holger?
That is probably me?

Merging: As Linus pointed out branching is not the problem, merging is:

1.) mtn and git are equally good in doing conflict free merges
2.) merges with conflicts:
	Both git and mtn allow you to use kdiff3, meld.. to do the merge.

	Git is changing files in the workdir but this doesn't matter as you
	resolve the conflict with git-mergetool anyway.

	Git has the concept of the index, which is really cool and makes
	things easy. You can set the file state to anything you want during
	the merge and once you are happy continue.

	Also git is a content tracker, so if I got this right. If I have the same
	bb file (content hash the same, path the same) in two branches mtn
	would go to NCC and refuse to work, git will not have a merge conflict at 
	all.

3.) Things related to merging:
	git-reset HEAD^1 to undo your merge if you didn't like the result (in cases 
where you know you made an accident and disapprove makes little sense)

	git-cherry-pick to pick a change and then pull/rebase without getting a NCC
	conflict.

	git-rebase to change your patchset after some of the patches have been merged
	upstream (effectively what Openmoko is doing on OE).


with git there is little more I could ask for, with mtn I have two unmergable 
things right now. git-rebase is the best thing since sliced bread. So it is 
either a 5:3 or 4:2.


PS: I talk about recent versions of git, with git-mergetool and such...
PPS: I recognize that mtn has served us well, the pace of development is IMHO 
just too slow.


