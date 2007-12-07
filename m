Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1J0gGE-0005em-UI
	for openembedded-devel@openembedded.org; Fri, 07 Dec 2007 17:41:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lB7GbLpu008908
	for <openembedded-devel@openembedded.org>; Fri, 7 Dec 2007 16:37:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08641-08 for <openembedded-devel@openembedded.org>;
	Fri,  7 Dec 2007 16:37:17 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lB7GbBff008885
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 7 Dec 2007 16:37:11 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <475947C7.6040904@student.utwente.nl>
References: <E1J0bLW-00033w-Bc@linuxtogo.org>
	<475947C7.6040904@student.utwente.nl>
Date: Fri, 07 Dec 2007 16:37:10 +0000
Message-Id: <1197045430.4661.119.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev sanity.conf: bump bitbake to	1.8.9 for lockfile changes
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
X-List-Received-Date: Fri, 07 Dec 2007 16:41:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-12-07 at 14:16 +0100, Koen Kooi wrote:
> koen commit schreef:
> > sanity.conf: bump bitbake to 1.8.9 for lockfile changes
> 
> > -BB_MIN_VERSION = "1.8.8"
> > +BB_MIN_VERSION = "1.8.9"
> 
> It turns out bitbake-1.8.9 doesn't have a tag in svn, and requires
> people to use the stable bitbake-1.8 branch or trunk.

Right, 1.8.odd are the unstable svn versions.

> The bump was needed after merging fixes from poky, which I realised
> require features not present in bitbake 1.8.8.
> I'm not to keen on backing out the package_ipk fix, since it fixes a lot
> of problems.
> 
> So, how do we proceed from here?

The only difference between the lockfile function I added in trunk and
the one used in the class is that lock files which are finished with
aren't removed. 

I'd therefore suggest removing the "bb.utils." prefixes and add the
lockfile and unlockfile function definitions back along with the import
fcntl. That should work just fine.

Cheers,

Richard



