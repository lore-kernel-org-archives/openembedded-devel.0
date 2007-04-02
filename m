Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <zecke@selfish.org>) id 1HYJDK-0002Wn-PJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2007 11:52:38 +0200
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=[192.168.1.23]) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1HYJDK-0005HU-8K
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2007 11:52:38 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <4610C901.2010306@openhardware.net>
References: <4610C901.2010306@openhardware.net>
Message-Id: <D5F22F8D-AEDD-40E9-9F15-4BFA190D19BB@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Mon, 2 Apr 2007 11:52:31 +0200
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
X-List-Received-Date: Mon, 02 Apr 2007 09:52:40 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 02.04.2007 um 11:12 schrieb Tom Walsh:

> Just noticed that the sha256sum has been added to the classes/ 
> sanity.bbclass and bitbake balked at running.   This morning I had  
> installed perl-Digest::SHA to satisfy the need for 'shasum'.
>
> I haven't found any package on Mandriva that provides 'sha256sum',   
> however, adding '-a 256' sets the sha256 algorithm for shasum?   
> With these two changes, bitbake seems to build the project ok, or,  
> am I missing something here?

Philipp changed this line from shasum to sha256sum as he/we thought  
sha256sum is more commonly available. If that is not the case I would  
propose to disapprove the change as it is more easy to get the  
required binary from cpan than to recompile coreutils-native.
As a last resort we could add sha256sum code to base.bbclass...


z.

>
> Regards,
>
>
> -        shapipe = os.popen('shasum -a 2 -b ' + localpath)
> +        shapipe = os.popen('shasum -a 256 -b ' + localpath)

Where is shasum -a2 coming from? This must be a local change at your  
side.





