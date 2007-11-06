Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <zecke@selfish.org>) id 1IpQxp-0007QB-FJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Nov 2007 17:07:41 +0100
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=[192.168.1.23]) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1IpQx4-0003nY-Re
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Nov 2007 17:06:54 +0100
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <deb87fbca36a04509dc0b6893bca86ec@127.0.0.1>
References: <deb87fbca36a04509dc0b6893bca86ec@127.0.0.1>
Message-Id: <1EF150F3-338E-469F-8AA4-7816799D3F55@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Tue, 6 Nov 2007 17:06:48 +0100
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
Subject: Re: Why not use config.guess in conf/bitbake.conf ?
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
X-List-Received-Date: Tue, 06 Nov 2007 16:07:41 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 06.11.2007 um 12:19 schrieb Esben Haabendal:

>
> What is the reason that conf/bitbake.conf is relying directly on  
> the 'uname' output for generating the BUILD_SYS string?
>
> I am trying to get OE building on Cygwin, and on my machine  
> bitbake.conf generates a BUILD_SYS that is not supported by  
> config.sub, which breaks a autotools packages.
>
> $ uname -a
> CYGWIN_NT-5.1 PC_K_EHA 1.5.24(0.156/4/2) 2007-01-31 10:57 i686 Cygwin
>
> As bitbake.conf takes the first field as BUILD_OS, and the 5th  
> field as BUILD_ARCH and then set BUILD_SYS to ${BUILD_ARCH}-$ 
> {BUILD_OS} I end up with
> i686-cygwin_nt-5.1
> which breaks config.sub due to the '-' in the os string.
>
> Using a current config.guess on this system, I get
> i686-pc-cygwin
> which is fine.
> On my laptop (running gutsy) it would give me a BUILD_SYS
> i686-pc-linux-gnu

A sane OS does return something sane on uname. But e.g. check  build/ 
Power\ Macintosh-darwin.conf on what can be done for none sane  
operating systems... So create your file for cygwin and send a patch ;)

z.

  


