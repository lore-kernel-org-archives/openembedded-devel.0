Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MHcXG-0000Cn-L5
	for openembedded-devel@openembedded.org; Fri, 19 Jun 2009 13:45:34 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5JBYTMC021657; Fri, 19 Jun 2009 12:34:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HGFESVdrZa4H; Fri, 19 Jun 2009 12:34:29 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5JBYMn8021637
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 19 Jun 2009 12:34:24 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org,
	bitbake mailing list <Bitbake-dev@lists.berlios.de>
Date: Fri, 19 Jun 2009 12:33:18 +0100
Message-Id: <1245411198.6057.6.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: bitbake-trunk python version dependency
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
X-List-Received-Date: Fri, 19 Jun 2009 11:45:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I just looked at bitbake trunk again and it appears to be broken with
python 2.6. The reason is we made some nasty hacks to the SocketServer
to enable idle callbacks and these have predictably broken on us.

The nice thing is in 2.6 a feature was added which lets us do what we
need as standard rather than hacking it in.

The question is therefore whether we make 2.6 the minimum version and
have no hacks or have some horrible workarounds for 2.5.

Unless anyone seriously objects I'm going to go with 2.6 as the minimum
version for bitbake trunk. By the time trunk is usable, 2.6 should be
pretty widespread.

Note this does not affect the 1.8 series which still has python 2.4 as
its minimum version and will continue to do so.

Cheers,

Richard



