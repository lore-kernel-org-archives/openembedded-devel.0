Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KrGXY-0002m3-E6
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 20:28:40 +0200
Received: from port-92-195-108-15.dynamic.qsc.de ([92.195.108.15]
	helo=[10.2.1.108]) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KrGXO-0006Zz-SR
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 20:28:30 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Oct 2008 20:28:52 +0200
User-Agent: KMail/1.9.9
References: <1224320609.5215.15.camel@dax.rpnet.com>
	<1224340544.3140.98.camel@mill.internal.reciva.com>
	<1224350337.5215.58.camel@dax.rpnet.com>
In-Reply-To: <1224350337.5215.58.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200810182028.53385.zecke@selfish.org>
Subject: Re: FILE_PR and my requirements Re: Some open issues
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
X-List-Received-Date: Sat, 18 Oct 2008 18:28:40 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 18 October 2008 19:18:57 Richard Purdie wrote:

> I talked with Holger on irc about this. The need is primarily to have a
> way of regenerating a full set of packages after some package abi
> change. I raised the idea of using DISTRO_PR in a somewhat similar way
> to SANITY_ABI where if it changes the user is warned about it and then
> can handle as they see fit. DISTRO_PR is appended to the PR values at
> package generation time if set. For autobuilders this wouldn't be good
> so for those cases I'm suggesting they incorporate DISTRO_PR into the
> TMPDIR value their autobuilder uses.

There are some things we agree on and some things that we need to find 
agreement on. But with the proposed changes we get to a point where we can 
discuss. My fast commit was clearly against the policies and I try to do 
better.


>
> Yes, this kind of change may break some scripts out there. That is
> unfortunate but we should use this opportunity to improve the scripts to
> use commands like "bitbake -e | grep ^DEPLOY_DIR_IMAGES" and similar to
> find things rather than making assumptions about path layout.

Yes, autobuilders and script writers are encouraged to use bitbake to get the 
paths instead of guessing where files are located.


z.


