Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KqB2G-00050l-0N
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 20:23:52 +0200
Received: from [92.116.122.37] (helo=[10.129.122.37])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KqAxC-0002b4-Ru
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 20:18:43 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2008 20:18:41 +0200
User-Agent: KMail/1.9.9
References: <200810151022.38477.zecke@selfish.org>
	<1224060881.30790.15.camel@mill.internal.reciva.com>
In-Reply-To: <1224060881.30790.15.camel@mill.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200810152018.41691.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.116.122.37
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
X-List-Received-Date: Wed, 15 Oct 2008 18:23:52 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 15 October 2008 10:54:41 Phil Blundell wrote:
> On Wed, 2008-10-15 at 10:22 +0200, Holger Freyther wrote:
> > I would start linking everything with -Wl,--hash-style=both as this is
> > said to speed up the loading of shared libraries by about 50% (google is
> > your friend). This is an option for binutils and was introduced with
> > binutils 2.17. Now there are two ways to achieve this:
>
> If you are using a modern GNU runtime then I think it should be safe to
> just select --hash-style=gnu.  This will give you the speed improvement
> without the space penalty of two hashes.

Modern as in glibc 2.5? I think we could strip the .hash away. I'm waiting for 
my build to finish to get some numbers about the actual size difference. But 
I guess on (e)glibc 2.5 and above gnu would be good enough.


z.


