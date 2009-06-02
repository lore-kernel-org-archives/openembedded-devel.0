Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MBYCo-0002Fp-8A
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jun 2009 19:55:22 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MBY4D-0008QG-59
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jun 2009 18:46:29 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <C62896630644CE43BF64B0FF0AC27F0E05B52C@mail.ad.skymv.com>
References: <C62896630644CE43BF64B0FF0AC27F0E05B4D2@mail.ad.skymv.com>
	<1243929198.5049.45.camel@lenovo.internal.reciva.com>
	<C62896630644CE43BF64B0FF0AC27F0E05B514@mail.ad.skymv.com>
	<1243956322.2611.11.camel@mill.internal.reciva.com>
	<C62896630644CE43BF64B0FF0AC27F0E05B52C@mail.ad.skymv.com>
Date: Tue, 02 Jun 2009 18:46:27 +0100
Message-Id: <1243964788.5049.48.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: bitbake virtual/kernel -c menuconfig
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
X-List-Received-Date: Tue, 02 Jun 2009 17:55:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-06-02 at 10:05 -0700, Chuck Kamas wrote:
> > I just did "bitbake -c menuconfig
> > -b ../org.openembedded.dev/recipes/linux/linux_2.6.28.bb" 
> > using DISTRO=minimal, MACHINE=at91sam9263ek and it seemed to 
> > apply the patches
> > correctly:
> > 
> 
> Interesting.  I must have something configured incorrectly (no
> kidding!).  
> Are you working on the STABLE/2009 branch? 
> Did you remove the tmp directory between builds?

Ah, no, I'm on the org.openembedded.dev branch.  That might be the
difference.

I didn't remove the whole of tmp/ between builds but I did clean the
linux-2.6.28 package.

p.




