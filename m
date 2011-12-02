Received: from smtp204.alice.it ([82.57.200.100])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1RWX0Y-0008MT-9o
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 18:34:46 +0100
Received: from trisquel.localnet (80.116.58.40) by smtp204.alice.it
	(8.6.023.02) (authenticated as editempo@alice.it)
	id 4ECA5ECD005DCEF7; Fri, 2 Dec 2011 18:28:03 +0100
From: "Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 2 Dec 2011 18:27:55 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-12-generic; KDE/4.6.5; x86_64; ; )
References: <4ED8307F.2060306@googlemail.com> <4ED8DBC7.6080708@googlemail.com>
	<20111202145256.GD3770@jama.jama.net>
In-Reply-To: <20111202145256.GD3770@jama.jama.net>
MIME-Version: 1.0
Message-Id: <201112021827.55821.GNUtoo@no-log.org>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: fso-console-image problems
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
X-List-Received-Date: Fri, 02 Dec 2011 17:34:46 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

>I'm not familiar with htcdream, but this looks like some problem with kernel 
fb 
>driver, you can try to boot shr-image, setup ssh access and then
>shutdown xserver (with /etc/init.d/xserver-nodm stop) to see if you get
>console login (check inittab if it's starting getty there) and also try
>other vts with chvt.
The framebuffer console was disabled in the kernel because it could make the 
phone freeze when Xorg stopped...

Denis.


