Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NjXdV-0004CB-RH
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 13:43:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1MCevlJ030919
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 12:40:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30792-03 for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 12:40:54 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1MCeqJi030913
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 12:40:53 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100221164048.GU30265@mx.loc>
References: <20100221164048.GU30265@mx.loc>
Date: Mon, 22 Feb 2010 12:40:51 +0000
Message-ID: <1266842451.1714.8.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [BBCLASSEXTEND BUG?] Not taking virtual:native provider into account?
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
X-List-Received-Date: Mon, 22 Feb 2010 12:43:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-02-21 at 17:40 +0100, Bernhard Reutner-Fischer wrote:
> Hi,
> 
> I'm using bitbake 641e6cf3ec3ab4d26929cf4d2a3704ff07eed4d6 (current
> HEAD) on HEAD of oe.
> 
> I'm adding:
> $ cat recipes/git/git_1.7.0.bb 
> require git.inc
> SRC_URI[git.md5sum] = "c7553b73e2156d187ece6ba936ae30ab"
> SRC_URI[git.sha256sum] = "a61e863944381c4f8231841f678f41f56b634bebca486a61005b35e5bcbb7c79"
> DEPENDS = "openssl curl zlib expat"
> RDEPENDS = "perl perl-module-file-path cpio findutils sed"
> PR = "r0"
> FILES_${PN}-dbg += "${libexecdir}/git-core/.debug"
> BBCLASSEXTEND = "native"
> 
> (and add ";name=git" to the .tar in git.inc's SRC_URI)
> and bake git-native and see:
> DEBUG: adding .../recipes/git/git-native_1.6.0.4.bb to satisfy git-native
> instead of
> DEBUG: adding virtual:native:.../recipes/git/git_1.7.0.bb to satisfy git-native
> which i get if i rm git-native_*
> 
> Assuming that the aboce recipe is correct in principle, this somehow
> sounds like BBCLASSEXTEND'ed virtual:native never make it into
> providers. What am i doing wrong?

If a real git-native_xyz.bb exists it will be preferred to the
BBCLASSEXTEND version.

I'm not sure why you'd want two versions?

Cheers,

Richard





