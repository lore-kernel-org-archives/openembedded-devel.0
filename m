Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Kq2EZ-0007VK-Bs
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 11:00:00 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Kq29U-0000ss-63
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 09:54:44 +0100
Received: from mill.internal.reciva.com ([192.168.106.87])
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1Kq29S-0008Q1-2C
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 09:54:42 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200810151022.38477.zecke@selfish.org>
References: <200810151022.38477.zecke@selfish.org>
Date: Wed, 15 Oct 2008 09:54:41 +0100
Message-Id: <1224060881.30790.15.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Wed, 15 Oct 2008 09:00:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-10-15 at 10:22 +0200, Holger Freyther wrote:
> I would start linking everything with -Wl,--hash-style=both as this is said to 
> speed up the loading of shared libraries by about 50% (google is your 
> friend). This is an option for binutils and was introduced with binutils 
> 2.17. Now there are two ways to achieve this:

If you are using a modern GNU runtime then I think it should be safe to
just select --hash-style=gnu.  This will give you the speed improvement
without the space penalty of two hashes.

> Change TARGET_LDFLAGS in e.g. the distro config (as this knows if binutils has 
> this option available) or to change the "specs" of gcc to enable this by 
> default. There is a patch from debian for gcc4.3 but it is leaving 
> arm/armeabi out. What do you guys prefer?

I guess you might as well put it in TARGET_LDFLAGS.  That's the less
intrusive change and there are already plenty of other flags there.

> Again there are two ways. Use force and bump PE 
> on each package but we should avoid this. I propose to rename PR to FILE_PR 
> and change PR  to "${FILE_PR}${DISTRO_PR}" so everytime a distro is changing 
> something that effects every package we can bump (e.g. Setting DISTRO_PR 
> to .1 for Openmoko).

I think this is an excellent plan.  As you say, PE changes are not
something to be done frivolously.

p.




