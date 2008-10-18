Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kqztk-0000h8-KI
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 02:42:28 +0200
Received: from [92.116.202.107] (helo=[10.129.202.107])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kqztd-0001QC-1t
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 02:42:22 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Oct 2008 02:42:31 +0200
User-Agent: KMail/1.9.9
References: <1224271803.4235.182.camel@lenovo.internal.reciva.com>
	<19c1b8a90810171248n4c8bc46ax954a17e40caa812f@mail.gmail.com>
	<1224273480.4235.186.camel@lenovo.internal.reciva.com>
In-Reply-To: <1224273480.4235.186.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200810180242.31716.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.116.202.107
Subject: Re: remove ld.so.conf from glibc?
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
X-List-Received-Date: Sat, 18 Oct 2008 00:42:28 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 17 October 2008 21:58:00 Phil Blundell wrote:

> That sounds like it would be overkill for most embedded DISTROs.  Making
> a separate package to ship those bits seems like it would be a fine
> idea, but I am not convinced we want them as standard fitment in libc6
> itself.  Do you know of any existing package/DISTRO combinations in oe
> that would actually benefit from this feature?

I have done this for Openmoko. We install Qtopia into /opt/Qtopia and I didn't 
want to play with fixed RPATHs inside the binary.

This means I can add Qtopia path's if Qtopia is installed and don't punish 
people not having it.

z.


