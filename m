Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IFfXY-0004g0-51
	for openembedded-devel@openembedded.org; Tue, 31 Jul 2007 02:24:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6V0Mpqx008090;
	Tue, 31 Jul 2007 01:22:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08020-02; Tue, 31 Jul 2007 01:22:47 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6V0Mhf8008080
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 31 Jul 2007 01:22:43 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
In-Reply-To: <1185839805.7719.103.camel@localhost.localdomain>
References: <1185839805.7719.103.camel@localhost.localdomain>
Date: Tue, 31 Jul 2007 01:22:42 +0100
Message-Id: <1185841362.7719.116.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: [Bitbake-dev] The future of "svnnow"
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
X-List-Received-Date: Tue, 31 Jul 2007 00:24:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I should also add, the changes so far are in bitbake trunk and in the
bitbake 1.8 svn branch. I've added the definition of SRCREV to
bitbake.conf in OE.dev so anyone wishing to experiment with this can do
so just by changing the PV as discussed in a .bb file...

Please don't check in such changes yet though.

I guess we could have a "I-use-bitbake-1.8-trunk.conf" that does

PV_pn-somepackage1 = "x.y.z+svnr${SRCREV}"
PV_pn-somepackage2 = "x.y.z+svnr${SRCREV}"

but thats probably insane and a sign I should sleep :)

Richard



