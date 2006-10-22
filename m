Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <freyther@inf.fu-berlin.de>) id 1GbiV5-0004v5-Au
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Oct 2006 20:56:47 +0200
Received: from [88.134.98.23] (helo=[192.168.1.103])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <freyther@inf.fu-berlin.de>) id 1GbiNx-0000rb-6d
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Oct 2006 20:49:25 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <453BB676.1020100@dominion.kabel.utwente.nl>
References: <453AA01B.5040300@dominion.kabel.utwente.nl>	<453AA142.4070002@dominion.kabel.utwente.nl>
	<1161538687.5545.5.camel@localhost.localdomain>
	<453BB676.1020100@dominion.kabel.utwente.nl>
X-Gpgmail-State: !signed
Message-Id: <E40B9975-E36D-4C14-B6B4-7B245A3FF7DB@inf.fu-berlin.de>
From: Holger Freyther <freyther@inf.fu-berlin.de>
Date: Sun, 22 Oct 2006 20:47:34 +0200
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.752.3)
X-Broken-Reverse-DNS: no host name found for IP address 88.134.98.23
Subject: Re: [Fwd: [oe-commits] org.oe.dev package.bbclass:	Fix	split_locales to	remove spurious references to -dbg packages.
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
X-List-Received-Date: Sun, 22 Oct 2006 18:56:47 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 22.10.2006 um 20:20 schrieb Koen Kooi:


>
> It would be quite easy to write a script that looks for .debug/  
> entries in packages, and
> file bugs against the offending packages.

Could you check if INHERIT += insane detects these packages? I think  
line 56 needs to be changed to path.contains('.debug')


regards
	h.


