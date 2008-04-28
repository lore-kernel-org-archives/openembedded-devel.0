Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JqUVv-0002Of-2d
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Apr 2008 16:39:31 +0200
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=abughraib.localdomain) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JqUVW-00027W-RN
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Apr 2008 16:39:07 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Apr 2008 16:39:04 +0200
User-Agent: KMail/1.9.9
References: <200804281344.32507.zecke@selfish.org>
In-Reply-To: <200804281344.32507.zecke@selfish.org>
MIME-Version: 1.0
Message-Id: <200804281639.04704.zecke@selfish.org>
Subject: Re: Summary of an unwanted merge and what I did
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
X-List-Received-Date: Mon, 28 Apr 2008 14:39:31 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 28 April 2008 13:44:32 Holger Freyther wrote:
> Hey,

> ideas? I'm tempted to say sorry but I think I'm not the one to blame (a
> tool is) :)

I went with a "mtn diff -r merge -r good head | 
patch -p0 -R --remove-empty-files; mtn drop --missing; mtn ci" and ask 
everyone helping to fix the fallout, e.g., this removed new versions of 
gnash, multitab-pad and other things, don't blame me.


mtn disapprove and mtn suspend are pretty cool concepts but they come with 
shortcomings I don't see fixed within the next year or two:

	- mtn disapprove does not work on merges
	- mtn suspend and other certs only work with if all people on this planet 
have a mtn >= the introduction of this cert. Some sort of flag day (talks are 
ongoing on this) or some sort of semantic to don't use this rev if you don't 
understand the 'systems' certs is needed.

I don't think these issues, a working graphical front end, new features are 
getting finished within a year or two and instead of entering the SCM 
development I would prefer to go with the best one.

it is about time to switch and I'm tempted to say to not contribute to OE as 
long as we use mtn, I'm not sure on this though. I will make up my mind on 
it.

z.


