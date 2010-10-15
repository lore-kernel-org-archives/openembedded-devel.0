Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1P6fpM-0003aw-RX
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 10:39:52 +0200
Received: (qmail 4519 invoked by uid 813007); 15 Oct 2010 08:39:18 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 15 Oct 2010 08:39:18 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Oct 2010 10:39:05 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.35-22-generic; KDE/4.5.2; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201010151039.08619.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: RFC: remove old kernels
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
X-List-Received-Date: Fri, 15 Oct 2010 08:39:52 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi

recipes/linux/ contains 235 recipes. I would like to propose cleaning:

1. drop 2.4 kernels - if someone still needs them then .oz354x and .stable
   branches have them.

This may affect:

- zauruses (which have 2.6 kernel)
- ipaq h36/38/39/54/55 - some have 2.6 kernel
- ipod - but does someone really uses 2.4.24 on own ipod?
- ramses - but this is maintained out of tree
- wrt54 - OpenWRT distro works better there and lets keep that way
- xxs1500, mtx, sun4cdm - if someone maintain it at all then please raise your
  hand
- colinux - no one will cry
- geodegx - 2.6 mainline works on it


2. Drop kernels older then 2.6.20 - it was over 3 years ago so if someone uses 
   older one then probably also uses 3 years old OE. 

This may affect (checked recipes):

- ep93xx - machines with this cpu are mainline supported, patches from ts72xx
  and sim.one works
- chumby
- compulab-pxa270
- devkitidp-pxa255
- fsg3
- gumstix
- amsdelta
- bd-neon
- colinux
- epia
- geodelx
- h1940
- h6300
- ks8695
- magicbox
- mtx-3
- neuros
- sun4cdm
- tornado-omap2
- wrap-geode
- x86
- acern30
- logicpd-pxa270
- mainstone
- mx21ads
- netbook-pro
- triton
- blueangel
- universal

Some of those machines are not maintained anymore, many of them should work 
with current mainline kernels. If someone cares about anything on a list - 
raise your hand.

Why 2.6.20? Because NHK-15 uses it and does not work with mainline kernel.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




