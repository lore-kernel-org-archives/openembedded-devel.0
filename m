Received: from us194mx009.tycoelectronics.net ([198.175.154.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay.snyder@tycoelectronics.com>) id 1Og0EA-0001Uu-Gu
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 20:59:11 +0200
Received: from [163.241.71.52] (163.241.71.52) by
	us194mx009.tycoelectronics.net (163.241.185.250) with Microsoft SMTP
	Server id 8.1.393.1; Mon, 2 Aug 2010 14:58:42 -0400
Message-ID: <4C571568.4040400@tycoelectronics.com>
Date: Mon, 2 Aug 2010 14:58:48 -0400
From: Jay Snyder <jay.snyder@tycoelectronics.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <mailman.306.1280575532.17151.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.306.1280575532.17151.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 198.175.154.211
X-SA-Exim-Mail-From: jay.snyder@tycoelectronics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: how to NOT include xserver-kdrive in an OE build?
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
X-List-Received-Date: Mon, 02 Aug 2010 18:59:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I am trying to use xorg-xserver 1.7.4 in my build for an Intel Atom Z510 
system.
I want to build xf86-video-intel, but get the following error:

    *| checking for XORG... configure: error: Package requirements
    (xorg-server >= 1.6 xproto fontsproto  randrproto renderproto
    xextproto x11 xextproto) were not met:
    |
    | Requested 'xorg-server >= 1.6' but version of xorg-server is 1.4.0.90
    |
    | Consider adjusting the PKG_CONFIG_PATH environment variable if you
    | installed software in a non-standard prefix.
    |
    | Alternatively, you may set the environment variables XORG_CFLAGS
    | and XORG_LIBS to avoid the need to call pkg-config.
    | See the pkg-config man page for more details.
    *

|

I checked the deply/glibc/ipk/i686 directory, and there are packages for 
BOTH xserver-kdrive, and xserver-xorg built.

The xorg-xserver version being returned by pkg-config is the one for the 
kdrive serer.
Since I'm not using the kdrive server, I'd like to prevent it from being 
built at all, so that the pkg-config in my staging directories reflects 
the actual version of xorg-xerver that I have built.

Thanks,
Jay


