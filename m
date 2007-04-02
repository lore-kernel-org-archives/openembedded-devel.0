Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <zecke@selfish.org>) id 1HYTQB-0007qm-R9
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2007 22:46:36 +0200
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=[192.168.1.23]) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1HYTQB-0005xI-Cq
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2007 22:46:35 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <D5F22F8D-AEDD-40E9-9F15-4BFA190D19BB@selfish.org>
References: <4610C901.2010306@openhardware.net>
	<D5F22F8D-AEDD-40E9-9F15-4BFA190D19BB@selfish.org>
Message-Id: <C5DE7A7D-701C-443E-A0DE-1382487B9453@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Mon, 2 Apr 2007 22:46:27 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
Subject: Re: patch: shasum vs. sha256sum
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
X-List-Received-Date: Mon, 02 Apr 2007 20:46:37 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I think this issue is almost resolved:

	-OE now has a oe_sha256sum binary which is used to verify checksums
	-quilt-native and all other packages depend on this version
	-oe-shasum has no dependencies itself
	-This works with BitBake-1.6
	-Currently it works with BitBake-1.8 but quilt-native fetches before  
the utility is staged and this needs fixing. This will break once  
auto* or quilt* start to use md5/sha sums. We need to look into  
bitbake-1.8 why this dependency is not correctly handled.



kind regards
	holger


