Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LyNP6-00073f-5A
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 11:45:40 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LyNKB-0000Ml-VY
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 13:40:32 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@openembedded.org
Date: Mon, 27 Apr 2009 13:40:27 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
Organization: Altell Ltd.
MIME-Version: 1.0
Message-Id: <200904271340.28227.khimov@altell.ru>
Subject: [RFC] install-native
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
X-List-Received-Date: Mon, 27 Apr 2009 09:45:55 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all.

Once again I've stumbled upon broken install stage for various packages. And 
the reason is again 'install-native' thing bringing in some dusty shelly 
version of 'install' that doesn't work with things like "-m0755" and others.

So, I wanted to ask is there any reason for 'install-native' to exist in OE?

We do require 'install' program to be present on the system and I think that 
any other version is saner than the one we have in 'install-native'. Also, 
almost every package really depends on 'install' while only 7 in OE currently 
declare 'install-native' in DEPENDS. And my experience with two of that seven 
is that adding those in the build breaks things because of 'install-native'. 
I've overlaid both with versions not depending on 'install-native' and 
everything works fine.

But maybe we can just remove 'install-native' completely?


