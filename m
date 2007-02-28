Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HMM2b-0003tG-1T
	for openembedded-devel@openembedded.org; Wed, 28 Feb 2007 11:28:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1SAS83O032431
	for <openembedded-devel@openembedded.org>; Wed, 28 Feb 2007 10:28:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32025-04 for <openembedded-devel@openembedded.org>;
	Wed, 28 Feb 2007 10:28:06 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1SAS3gV032423
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 28 Feb 2007 10:28:03 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200702281109.25161.ranaldo@unina.it>
References: <200702281109.25161.ranaldo@unina.it>
Date: Wed, 28 Feb 2007 10:28:03 +0000
Message-Id: <1172658483.16062.23.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: OE and the developing host
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
X-List-Received-Date: Wed, 28 Feb 2007 10:28:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-02-28 at 11:09 +0100, Nicola Ranaldo wrote:
> I use OE on a gentoo box. This morning i updated the system, and the new 
> linux-headers package removed /usr/include/asm/page.h. So when building my 
> angstrom image it failed with perl asking to include that file. This problem 
> was discussed on the gentoo bug and after applying a simple workaround i was 
> able to emerge perl on the gentoo box and perl native on OE.
> After a while the oe build stopped on esound, this was caused by a malfunction 
> of /usr/lib/libosp.so.5 on gentoo, i reemerged it and solved the problem. Now 
> the armstrong-gpe-image is complete. But this introduced a doubt. OE build 
> some tools directly, and use other directly from the build host, so it could 
> be teoretically possible to produce different images on different host. Is 
> there a way or a plan to avoid it and make OE build host independant 
> (supposing i was correct)? If not, what's the most used/supported distro by 
> OE developers?

*-native packages can touch things on the system, any other packages
shouldn't and if they were found to be, it would be a bug and should be
fixed.

Its never going to be possible to make make OE build everything it needs
itself since you always need some prerequisites (e.g. a initial
toolchain).

Personally, I use OE/Poky on Ubuntu and Slackware. There are others
using Gentoo and other systems. Ideally it should work on most systems,
you might see problems with -native packages, you shouldn't see problems
with non -native ones.

Cheers,

Richard



