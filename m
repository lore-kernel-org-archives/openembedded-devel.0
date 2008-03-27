Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Jehaw-0002Fo-Qo
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 03:11:58 +0100
Received: from [212.23.103.98] (helo=[10.161.140.254])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1Jehaw-0004p1-A6
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 03:11:58 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Mar 2008 03:11:47 +0100
User-Agent: KMail/1.9.9
References: <47EAEB1D.9060004@xora.org.uk>
	<200803270150.46085.mickey@vanille-media.de>
	<47EAF1E0.8090401@xora.org.uk>
In-Reply-To: <47EAF1E0.8090401@xora.org.uk>
MIME-Version: 1.0
Message-Id: <200803270311.47461.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 212.23.103.98
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
X-List-Received-Date: Thu, 27 Mar 2008 02:11:58 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 27 March 2008 02:01:20 Graeme Gregory wrote:

> Yes, mtn is designed to have many repos which are mirrors. From my
> looks at git it is designed to always end up with one central repo.
>
> The methods of syncing two git trees seem to be hacks or alter
> data. master becomes origin/master for example.

repo.or.cz supports a mirror mode so it can't be too hard. My approach would 
consist out of two shell commands:

	1. git-fetch remote to fetch everything from the remote
	2. git-reset to update the branches to the version of the newly fetched 
	    files.

but then we can ask the provider of repo.or.cz where you can ask it to mirror 
any other git tree how he is implementing it.



>
> And because you always have to pull before push, people cant
> use upstreams in parrallel and the tool just works.

I don't follow here. Creating a branch is the first exception, you push before 
you pull there. If you mean that currently I can push to wolfson and it will 
end up on mtn.oe.org automatically then yes, mtn can do the syncing in a 
fantastic way. And yes with mtn it is more easy due multiple heads. I think 
it is doable with git as well.



