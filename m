Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kprib-00007m-9a
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Oct 2008 23:46:17 +0200
Received: from [92.117.17.189] (helo=[10.161.17.189])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kprdd-0003kg-Ly
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Oct 2008 23:41:11 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Oct 2008 23:41:06 +0200
User-Agent: KMail/1.9.9
References: <200810080751.15817.zecke@selfish.org>
In-Reply-To: <200810080751.15817.zecke@selfish.org>
MIME-Version: 1.0
Message-Id: <200810142341.06945.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.117.17.189
Subject: Re: ETA on git conversion
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
X-List-Received-Date: Tue, 14 Oct 2008 21:46:17 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 08 October 2008 07:51:15 Holger Freyther wrote:

> Wednesday:
> 	- Be back up with git and use that as primary system.
> 	- Disable monotone completely

1.) git user account created
2.) gitosis setup
3.) keys added and permissions added (see the end of the mail)
4.) populated the repository with content
5.) git-daemon is serving data
6.) push/pull with git ssh works
7.) notifications should work too
8.) the GitPhraseBook got updated with the final git location
9.) gitweb is nice and even tells you which URL to use
10.) mail almost sent

I think the conversion is complete and we can disable the mtn servers now or 
leave them readonly for a while.


Notes to people with commit access:
git clone git@git.openembedded.net:openembedded to get the tree

Notes to people:
	DO NOT MERGE the old trial history and this history. We have no commit hook 
yet to prevent this and solely depend on common sense...


Notes to people using the trial git:
  git-remote add new-origin git://git.openembedded.net/openembedded
  git-fetch new-origin
  git-rebase --onto new-origin/org.openembedded.dev 
origin/org.openembedded.dev org.openembedded.dev (if i got this right from 
the manpage)



Thins for the near future:
Remove the nslu2 branches once nslu2 folks have migrated to git as well and 
created repositories for them.

Consider renaming the branches, I kind of like the names though




People with push access:
	cbrake.pub
	crofton.pub
	daniel_willman.pub
	dirk_opfer.pub
	felix_domke.pub
	florian_boor.txt
	henning_heinold.pub
	hrw.pub
	jan_luebbe.pub
	john_lee.pub
	khem_raj1.pub
	khem_raj2.pub
	koen.pub
	leon_woestenberg.pub
	mickeyl.pub
	mustafa_yuecel.pub
	mwester.pub
	otavio_salvador.pub
	paul_eggleton.pub
	phillip_zabel.pub
	robert_schuster.pub
	rodrigo_vivi.pub
	rolf.pub
	rpurdie.pub
	rwhitby.pub
	shane_volpe.pub
	stanislav_brabec.pub
	thomas_kunze.pub
	xora.pub
	zecke.pub


