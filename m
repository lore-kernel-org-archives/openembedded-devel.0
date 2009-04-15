Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu4N6-0008Cy-JH
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 14:38:00 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.115])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1Lu4JO-0003hL-Ly
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 16:33:54 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@openembedded.org
Date: Wed, 15 Apr 2009 16:33:48 +0400
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200904151633.49146.khimov@altell.ru>
X-SA-Exim-Connect-IP: 83.222.23.61
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] AMD64 and multilib support
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
X-List-Received-Date: Wed, 15 Apr 2009 12:38:14 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all.

This patch series (will follow in replies) tries to bring in AMD64/x86_64 
support into OE. This required some intrusive toolchain fixes that I want to 
post here for review and feedback as I think (or rather know ;)) I might have 
broken something along the way.

I've tried to generalize my approach so that later we could add some more 
64-bit goodies. So I've added 'multilib' OVERRIDE that I think we can set in 
future in bitbake.conf by intersection of MACHINE_FEATURES and 
DISTRO_FEATURES (now you can just add it to OVERRIDES in distro or 
local.conf). Well, from what I see this FEATURES/OVERRIDES games can be 
controversial but then please tell me how to do it better for toolchain.

What I've also tried to achieve is ability to build non-multilib toolchain, 
although from what I see that will require passing "--disable-multilib" by 
default for gcc-cross and that is a bit scary for now.

Then there is some directory naming things like 'lib' vs 'lib64' Given that we 
have some places assuming 'lib' to be 'lib' that is solved in Debian style 
(actually, stolen patches from Debian) where there is 'lib' for 64-bit arch 
and 'lib32' for 32-bit arch.

Next thing is 'libexec' dir. I propose to set it to point to libdir and be 
done with that (again, Debian does exactly this). For now, I've done that 
just for glibc-multilib.

Well, that's it in general, please see patches for details and feel free to 
bash it.


