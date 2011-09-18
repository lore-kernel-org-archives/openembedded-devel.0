Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R5Ig2-0000Jy-IG
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 16:49:03 +0200
Received: (qmail invoked by alias); 18 Sep 2011 14:43:47 -0000
Received: from p5B0A25AC.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.37.172]
	by mail.gmx.net (mp026) with SMTP; 18 Sep 2011 16:43:47 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+3Zd4GHm63Ed1k+OFxMyV/nD7QNhFTQCqFfbUL0b
	w5rETKvv8H0jpW
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 16:47:20 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-95.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201109181647.20828.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe] xserver: default xorg.conf
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
X-List-Received-Date: Sun, 18 Sep 2011 14:49:03 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

the last image for overo failed starting X. I checked xorg.conf and saw that 
ther was intel driver selected - hmm.

So I copied manually the removerd xorg.conf which belongs to overo from the 
patch

commit 44c7cdefee88e22532dcc1269d3c148a20899b6a
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Wed Sep 7 15:21:38 2011 +0200

    xserver-xorg: drop 1.9.4 and git version
    
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

and everything works fine.

Now my question: Where is the intended place (where exactly in BSP) to put 
xorg.conf now?

Thanks in advance

Andreas


