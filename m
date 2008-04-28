Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JqRn2-00080E-Jc
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Apr 2008 13:45:00 +0200
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=abughraib.localdomain) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JqRme-0006av-K8
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Apr 2008 13:44:36 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Apr 2008 13:44:32 +0200
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200804281344.32507.zecke@selfish.org>
Subject: Summary of an unwanted merge and what I did
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 28 Apr 2008 11:45:00 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,

I love countries where they block the SMTP port and somehow even if I did sent 
two mails on this.

So here my summary:
	I had both Openembedded and Openmoko in the same database and innocently 
typed mtn merge, got annoyed with the ncc on gsmhandset.state files, 
completed the merge, pushed. I only had a look at the last rev of the two 
heads and it was a DEPENDS fixlet to neod which looked about right, so 
decided to do the merge. Only afterwards I saw I just merged the qtopia-phone 
crap.


So what did I learn about mtn:
	- You can not disapprove a merge!
	- So I decided to suspend the merge, the ncc preparation and the head of OM. 
This lead to a tree without any heads. :)
	- Then I used the last not OM head I had (one ancestor of the merge) and did 
a change and created a new head.


I assumed this situation was fixed, we have OM history in the OE.db which is 
not bad, but still the Qtopia phone recipes are not within OE. Everything 
looked fine until I got poked on irc.

It looks like someone is using a mtn without the support for the suspend cert, 
and he did the merge again.

I could suspend the merge, create a new head without the merge but then 
someone without a mtn with the suspend cert support will do a merge... and I 
could suspend the merge, create a new head wihtout the merge but then someone 
without a mtn with the suspend will do a merge... I love infinite recursion.

I have no idea how to fix this situation without ditching monotone. E.g. If 
mtn would transfer the client version number and we could reject this with a 
lua hook we would be set, but I don't remember seing such thing.


ideas? I'm tempted to say sorry but I think I'm not the one to blame (a tool 
is) :)

	z.


