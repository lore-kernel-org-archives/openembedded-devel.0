Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NAuk7-0005BB-9q
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 01:19:26 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAJ0ElJD007989 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 00:14:47 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6RWQf2yxLlTH
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 00:14:47 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAJ0EeXH007978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 00:14:42 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258586470.3071.10.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1258311783.18820.149.camel@mattotaupa.wohnung.familie-menzel.net>
	<1258537305.3021.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<1258586470.3071.10.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Thu, 19 Nov 2009 00:17:30 +0000
Message-Id: <1258589851.5229.17.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake base-image: gmp-native: ERROR: function	do_configure failed: configure: error: Oops, mp_limb_t is 32 bits, but the	assembler code
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
X-List-Received-Date: Thu, 19 Nov 2009 00:19:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-11-19 at 00:21 +0100, Paul Menzel wrote:
[...]
> well, unfortunately my search results did not include any hits from the
> OE bug tracker. I looked there a moment ago and found bug #3470 which
> seems to be related to my problem [5].
> 
> I will try to update it with the information from my messages to the
> list in the next days.
[...]
> > > [2] oe/angstrom-dev/work/x86_64-linux/gmp-native-4.2.4-r0/temp$ less log.do_configure.29183

I saw this recently, I wish I could remember how I fixed it :/.

I looked back at the above log and it says:

checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking for ld used by g++... ld -m elf_i386
checking if the linker (ld -m elf_i386) is GNU ld... yes
checking whether the g++ linker (ld -m elf_i386) supports shared libraries... yes
checking for g++ option to produce PIC... -fPIC -DPIC
checking if g++ PIC flag -fPIC -DPIC works... yes

and the i386 references above show configure is off the rails before it
hits the fatal error.

Do you have the config.log file from the broken builds?

Cheers,

Richard




