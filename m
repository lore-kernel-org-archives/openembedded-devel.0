Received: from edison.awellconnected.net ([83.167.180.132])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas@htc-linux.org>) id 1PykDP-0007rX-J5
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 13:16:07 +0100
Received: from localhost.awellconnected.net ([127.0.0.1] helo=localhost)
	by edison.awellconnected.net with esmtpa (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1Pyhwv-0001VA-L6
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 09:50:57 +0000
Received: from ip-80-226-0-1.vodafone-net.de (ip-80-226-0-1.vodafone-net.de
	[80.226.0.1]) by webmail.htc-linux.org (Horde Framework) with HTTP;
	Sun, 13 Mar 2011 09:50:57 +0000
Message-ID: <20110313095057.784247e3zeezu8w0@webmail.htc-linux.org>
Date: Sun, 13 Mar 2011 09:50:57 +0000
From: Lukas-David Gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.3.9)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - edison.awellconnected.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - htc-linux.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: fennec build problem
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
X-List-Received-Date: Sun, 13 Mar 2011 12:16:07 -0000
Content-Type: text/plain;
 charset=ISO-8859-1;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Denis wrote:

> Here is the build error:
> | make[5]: *** No rule to make target `-lgconf-2', needed by
> `libmozgnome.so'.  Stop.
> | make[5]: *** Waiting for unfinished jobs....
> [...]
> | make[5]: Leaving directory
>
`/home/gnutoo/embedded/oe/oetmps/nokia900/work/armv7a-oe-linux-gnueabi/fennec-1_2.0+4.0b3pre-r0/mozilla-central/objdir/xulrunner/toolkit/system/gnome'
> | make[4]: *** [libs_tier_platform] Error 2
>

After building some implicit dependencies manually, I am stuck with the
following error. Not sure if I got past the stuff that fails for Denis
above yet.
Differences might occur due to me using the autoconf213 supplied by my
host distro, and not autoconf213-native from OE as that is broken.

| make[5]: *** No rule to make target `-lnotify', needed by
`libmozgnome.so'.  Stop.


Problem: I built recipes/libnotify/libnotify_0.4.5.bb before.


Before investigating further, would it make sense to bump the SRCREV
like in following commit ?

commit 6780b399ccc4a7eef43b71162250106e7f98ba7b
Author: Koen Kooi <koen@openembedded.org>
Date:   Sat Nov 27 17:09:36 2010 +0100

     fennec: update to 4.0b3pre

     Signed-off-by: Koen Kooi <koen@openembedded.org>


Best,

Lukas




