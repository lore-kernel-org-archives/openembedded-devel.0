Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Jfcww-0004AK-2q
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Mar 2008 16:26:30 +0100
Received: from [212.23.103.27] (helo=[10.129.109.43])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1Jfcwv-0005Qi-4r
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Mar 2008 16:26:29 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Mar 2008 16:26:09 +0100
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200803291626.09506.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 212.23.103.27
Subject: Request for help on daggy fixes and NCC
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
X-List-Received-Date: Sat, 29 Mar 2008 15:26:30 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,

I need some help. Due NCC conflicts in the tree Openmoko we had to rename 
packages/openmoko-projects to packages/openmoko-projects.merge to be able to 
sync (this obviously loses history and defeats the purpose of a SCM but this 
is another story). Then we were able to "merge" (??), this left the above 
directory to be manually merged. On this manual merge a minor mistake 
happened.

As we all know about the concept of Daggy fixes, this minor mistake is best 
fixed by checking out the revision with the mistake, applying a fix and then 
merging. I think the mtn selectors are pretty cool, so checking things out 
was not a issue, fixing the manual merge was done manually, by getting the 
parent revision (p:revid), copying the dir to some other position, then doing 
the manual merge, comitting to my working branch (don't want to risk the 
stability of the main branch before mass production is starting). And now all 
I would need to do is to type mtn merge (or MTN_MERGE=kdiff3 mtn merge due a 
minor bug in mtn 0.37).


Sadly this merge triggers another NCC and I think the danger of breaking 
something in manually fixing the NCC is higher than the use of a daggy fix. 
So what is your opinion on this? Would you do daggy fixes? Would you avoid 
them? Would you first try and see if the result is mergable?

Thankfully I could use mtn db to kill the daggy fix rev manually and now need 
to apply the fix on top. And I love the concept of the daggy fix :(


comments, help, a mtn NCC merger would be highly appreciated
	z.



Output of mtn (note the lack of a path):
mtn: 2 heads on branch 'org.openmoko.zecke.april-update'
mtn: [left]  526e34f764c9f16783073bc97e3a0a3d8ed0cabb
mtn: [right] d28e95f2bb1dccbcc74a3abd7c95739c217367a5
mtn: warning: orphaned node conflict on node 24181, dead parent 22904, name 
gsmhandset.state
mtn: warning: rename target conflict: nodes 27576, 27203, both want parent 
13846, name openmoko-minimal-image.bb
mtn: warning: rename target conflict: nodes 27577, 24165, both want parent 
23067, name make_linux-fix.patch
mtn: warning: rename target conflict: nodes 27578, 27269, both want parent 
761, name intltool-native_0.37.1.bb
mtn: warning: rename target conflict: nodes 27579, 27270, both want parent 
761, name intltool_0.37.1.bb
mtn: warning: rename target conflict: nodes 27969, 24185, both want parent 10, 
name qtopia-phone
mtn: warning: rename target conflict: nodes 27976, 24197, both want parent 
13846, name openmoko-qtopia-image.bb
mtn: warning: rename target conflict: nodes 27977, 27263, both want parent 
13846, name openmoko-qtopia-x11-image.bb
mtn: warning: rename target conflict: nodes 27978, 27271, both want parent 
17185, name pty-forward-native.bb
mtn: warning: rename target conflict: nodes 27979, 27272, both want parent 
17185, name serial-forward.bb
mtn: warning: rename target conflict: nodes 27993, 27264, both want parent 
13847, name task-openmoko-qtopia-x11.bb
mtn: warning: rename target conflict: nodes 27994, 24198, both want parent 
13847, name task-openmoko-qtopia.bb
mtn: warning: resolve non-content conflicts and then try 


